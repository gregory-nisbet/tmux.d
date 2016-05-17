#!/bin/csh -f

set noglob

switch ("`uname`")
case ?arwin:
    exec /usr/local/bin/reattach-to-user-namespace -l "${SHELL:t}"
    breaksw
default:
    exec "${SHELL:t}"
    breaksw
endsw
