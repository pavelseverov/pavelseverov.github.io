if (!defined $ARGV[1]) {
  print "���饭��: MakeNews.pl <蠡��� ���쬠> <ᯨ᮪ ����७権>\n";
  exit};

$lett=1;

open (LIST,"<$ARGV[1]") || die "ERROR";
while (<LIST>) {
  chomp;
  $conf=$_;
  open (PATT,"<$ARGV[0]") || die "ERROR";
  open (LETT,">$conf.nws") || die "ERROR";
  ++$lett;
  while (<PATT>) {
    last if $_ EQ "\n";
    print LETT;
    };
  #while (<PATT>) {
  #  last if $_ EQ "\n";
  #  print LETT;
  #  };

  print LETT "Newsgroups: $conf\n";
  print "$conf\n";

  print LETT;
  while (<PATT>) {
    print LETT;
    };
  
  close (PATT);
  close (LETT);
  };


