use strict;

use Test::More tests => 1;

use Test::NoWarnings;

# if it's working properly, only the parent will conduct a warnings test

my $pid = fork;
die "Forked failed, $!" unless defined $pid;
