# t/01_use.t
use strict;
use warnings;
use Test::More;

use_ok('nonochan');

my $obj = Nonochan->new;
isa_ok $obj, 'Nonochan';

done_testing;
