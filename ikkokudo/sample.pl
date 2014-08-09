#!/usr/bin/env perl

use strict;
use warnings;

use Data::Dumper;
use Ikkokudo;

my $i= Ikkokudo->new;

my @speach_text = ('あれ', '言葉が', '遅れて', '返って', 'くるぞ？');
for my $word (@speach_text){
  print $i->ikkokudo($word)."\n";
}
print $i->ikkokudo('...')."\n";

__END__
