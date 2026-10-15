#!/bin/sh

if [ -z "$3" ]
then
    echo "$(basename $0): bad arguments" > /dev/stderr
    exit 1
fi

# bitbake expects this process to run until the user closes the
# terminal. So we use a temp file as a flag for Emacs to signal when
# the terminal buffer has been killed.
flag=$(mktemp)
if cat > "$BUILDDIR/emacs-bitbake-fifo" <<EOF
$flag
$1
$2
$3
EOF
then
    while [ -e "$flag" ]; do sleep 1; done
else
    echo "writing to emacs failed; aborting" > /dev/stderr
    rm -f "$flag"
    exit 1
fi
