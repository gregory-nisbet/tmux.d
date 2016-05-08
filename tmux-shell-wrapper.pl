#!/usr/bin/perl
use strict;
use warnings;
use File::Basename;

# homebrew doesn't announce where it is in an
# environment variable
# so we're going to assume that reattach-to-user-namespace
# is in /usr/local/bin
# and then assume `brew --prefix`

my $shellname = basename($ENV{SHELL});

if ($^O eq 'darwin') {
    exec '/usr/local/binreattach-to-user-namespace', '-l', $shellname;
}
exec $shellname;
