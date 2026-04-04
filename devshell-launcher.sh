#!/bin/sh

# emacsclient returns immediately, but bitbake expects this process to
# run until the user closes the terminal. So we use a temp file as a
# flag for Emacs to signal when the terminal buffer has been killed.

flag=$(mktemp)
if emacsclient -u --eval "(bitbake-devshell \"$flag\")" "$@"
then
    while [ -e "$flag" ]; do sleep 1; done
else
    echo "emacsclient failed; aborting" > /dev/stderr
    rm -f "$flag"
    exit 1
fi
