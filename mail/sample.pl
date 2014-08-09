#!/usr/bin/env perl

use strict;
use warnings;
use utf8;

use Data::Dumper;
use Send_email;

my $mail = Send_email->new;
$mail->set_gmail_config;
$mail->make_email("sample\ntext\n");
$mail->make_sender;
$mail->send_mail;

__END__
