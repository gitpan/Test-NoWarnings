use strict;

use Test::More tests => 6;

use Test::Tester;

my $cap = Test::Tester::capture();
Test::NoWarnings::builder($cap);

END {
	my @tests = $cap->details;
	cmp_results(
		\@tests,
		[
			{
				actual_ok => 1
			},
			{
				actual_ok => 0
			}
		]
	);

	my $result = $tests[1];
	like($result->{diag}, '/^There were 1 warning\\(s\\)/', "warn diag");
	like($result->{diag}, "/Previous test 1 'fake test'/", "warn diag test num");
	like($result->{diag}, '/my special warning /s', "warn diag has warn");
}

use Test::NoWarnings;

$cap->ok(1, "fake test");
warn "my special warning";

