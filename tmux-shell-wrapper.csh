#!/bin/csh -f

set shellname = "${SHELL:t}"

switch ("`uname`")
case ?arwin:
    exec /usr/local/bin/reattach-to-user-namespace -l "$shellname"
    breaksw
default:
    exec "$shellname"
    breaksw
endsw
