package Ikkokudo;

use strict;
use warnings;

sub new{
  my $class = shift;
  my $self = {
    next_text => '...',
  };
  return bless $self, $class;
}

sub ikkokudo{
  my $self = shift;
  my $return_text = $self->{next_text};
  $self->{next_text} = shift;
  return $return_text;
}
1;
