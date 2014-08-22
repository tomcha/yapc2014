package Nonochan;

use strict;
use warnings;
use utf8;

sub new{
  my $class = shift;
  my $self = {};
  return bless $self, $class;
};
sub goukyu{
  my $self = shift;
  my $default_text = shift;
  if($default_text =~ /(高齢者|老人|年寄|兵庫県|兵庫)/){
    return '高齢ェェエエ者ッハアアアァアーー！！高齢者問題はー！我が県のみウワッハッハーーン！！我が県のッハアーーーー！我が県ノミナラズ！';
  }elsif($default_text =~ /(選挙|投票)/){
    return '俺ハネェ！ブフッフンハアァア！！誰がね゛え！誰が誰に投票ジデモ゛オンナジヤ、オンナジヤ思っでえ！';
  }elsif($default_text =~ /(世の中|世界|変える|変えたい|改革|革命)/){
    return 'この世の中を！！世の！中ガッハッハアン！！ア゛ーー世の中を！ゥ変エダイ！その一心でええ！！';
  }elsif($default_text =~ /(泣|涙|叫び|叫ぶ|ウワーン)/){
    return 'ウアアアアァーーーーーーーッハン！！アアアァーーウアン！';
  }else{
    return $default_text;
  }
};
1;
