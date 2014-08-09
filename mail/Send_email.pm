package Send_email;

use strict;
use warnings;
use utf8;

use Data::Dumper;
use Config::PL;
use Email::Sender::Simple qw(sendmail);
use Email::Simple;
use Email::Simple::Creator;
use Data::Recursive::Encode;
use Encode;
use Email::Sender::Transport::SMTP::TLS;

binmode STDIN,":encoding(UTF8)";
binmode STDOUT,":utf8";
binmode STDERR,":utf8";

sub new{
  my $class = shift;
  my $self = {
    config_data  => '',
    email        => '',
    sender       => '',
  };
  return bless $self, $class;
}

sub set_gmail_config{
  my $self = shift;
  my $senttext = shift;
  $self->{config_data} = config_do 'config.pl';
}

sub make_email{
  my $self = shift;
  my $body_text = shift;
  $self->{email} = Email::Simple->create(
    header => Data::Recursive::Encode->encode(
      'MIME-Header-ISO_2022_JP' => [
        To      =>  '"Gmail" <'.$self->{config_data}->{my_gmail_address}.'>',
        From    =>  '"Gmail" <'.$self->{config_data}->{my_gmail_address}.'>',
        subject =>  'データ送信テスト',
      ]
    ),
    body => encode('iso-2022-jp',$body_text),
    attributes => {
      content_type  => 'text/plain',
      charset       => 'iso-2022-jp',
      encoding      => '7bit',
    }
  );
}

sub make_sender{
  my $self = shift;
  $self->{sender} = Email::Sender::Transport::SMTP::TLS->new(
    host      => 'smtp.gmail.com',
    port      => 587,
    username  => $self->{config_data}->{username},
    password  => $self->{config_data}->{password},
    helo      => 'example.com',
  );
}

sub send_mail{
  my $self = shift;
#  print Dumper $self->{email};
#  print Dumper $self->{sender};
  my $return = sendmail($self->{email},{transport => $self->{sender}});
}
1;
