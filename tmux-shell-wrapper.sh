#!/bin/sh
set -euf

shellname="${SHELL##*/}"

case "$(uname)" in
    [dD]arwin)
        if [ -f /usr/local/bin/reattach-to-user-namespace ]; then
            exec /usr/local/bin/reattach-to-user-namespace -l "$shellname"
        else
            exit 1
        fi
        ;;
    *)
        exec "$shellname"
        ;;
esac
