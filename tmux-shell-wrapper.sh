#!/bin/sh
set -euf

case "$(uname)" in
    [dD]arwin)
        if [ -f /usr/local/bin/reattach-to-user-namespace ]; then
            exec /usr/local/bin/reattach-to-user-namespace -l tcsh
        else
            exit 1
        fi
        ;;
    *)
        exec tcsh
        ;;
esac
