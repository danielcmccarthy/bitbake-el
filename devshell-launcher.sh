#!/bin/sh

# emacsclient returns immediately, but bitbake expects this process to
# run until the user closes the terminal. So we use a temp file as a
# flag for Emacs to signal when the terminal buffer has been killed.

flag=$(mktemp)
touch "$flag" && emacsclient -u --eval "(bitbake-devshell \"$flag\")" "$@" && while [ -e "$flag" ]; do sleep 1; done
# cleanup in case emacsclient failed.
rm -f "$flag"
