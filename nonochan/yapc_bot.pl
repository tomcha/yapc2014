#!/usr/bin/env perl

use strict;
use warnings;
use utf8;

binmode STDIN,":encoding(UTF8)";
binmode STDOUT,":utf8";

use feature ':5.10';
use Data::Dumper;
use WebService::Livedoor::Weather;
use Nonomura;

my $lwws = WebService::Livedoor::Weather->new;

while(1){
  print ">>>";
  chomp( my $input = <STDIN> );
  my $n = Nonomura->new;
  my $nono_text = $n->goukyu($input);
  if( $input eq 'exit'){
    last;
  }elsif( $input eq 'こんにちは'){
    say 'こんにちは！';
  }elsif( $input eq 'ごはん'){
    my @kuji = ( 'らすた', 'マクド', '学食', 'Hub' );
#    my $i = int(rand(5)) + 1;
#    say $kuji[$i];
    my $i = int rand(scalar @kuji);
    my $j;
    do {
       $j = int rand(scalar @kuji);
    }while($i == $j);

    say "$kuji[$i]か、$kuji[$j]";
  }elsif( $input eq '天気'){
    my $weather = $lwws->get('130010');
    my $today = $weather->{forecasts}->[0]->{telop};
    say "今日の天気は".$today."です。";

  }elsif($input ne $nono_text){
    say $nono_text;
  }
}
