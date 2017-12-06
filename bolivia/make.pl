open(LIST,"<cbba.lst") || die "ERROR";

$CurrListhtml="";

@chapters=('kenning','nature','city','country','people','citynature','fences','holiday','office','caboverde','to_home');

$chaptershortname{'kenning'}='Над Боливией / Above Bolivia';
$chaptershortname{'nature'}='Природа / Nature';
$chaptershortname{'city'}='Город / City';
$chaptershortname{'country'}='Окрестности / Suburbia';
$chaptershortname{'people'}='Жители / People';
$chaptershortname{'citynature'}='Городская природа / City Nature';
$chaptershortname{'fences'}='Заборы / Fences';
$chaptershortname{'holiday'}='Праздник / Celebration';
$chaptershortname{'office'}='Nuevatel';
$chaptershortname{'caboverde'}='Туда / There';
$chaptershortname{'to_home'}='Оттуда / Back';

$chaptername{'kenning'}='Bolivia. Photos of Willy Kenning';
$chaptername{'city'}='Боливия. Город Кочабамба. 1 млн жителей';
$chaptername{'citynature'}='Боливия. Кочабамба. Городская природа';
$chaptername{'country'}='Боливия. Окрестности Кочабамбы';
$chaptername{'fences'}='Боливия. Кочабамба. Заборы';
$chaptername{'holiday'}='Боливия. Кочабамба. Праздник';
$chaptername{'nature'}='Боливия. Природа';
$chaptername{'office'}='Боливия. Кочабамба. Офис GSM-оператора Nuevatel';
$chaptername{'people'}='Боливия. Жители Кочабамбы и окрестностей';
$chaptername{'caboverde'}='Государство Кабо-Верде. Остров Сал. 500 км от Африки. Атлантический океан';
$chaptername{'to_home'}='Домой в Москву!';





$ColorMenuBG='976019';
$ColorPicBG='FFF8C9';

$ColorMenuText=$ColorPicBG;
$ColorPicText=$ColorMenuBG;

$ColorPicBorder=$ColorMenuBG;

$ColorMenu='bgcolor="#976019" text="#FFF8C9" link="#FFEB67" vlink="#E1DBB3" alink="#FFFFFF"';
$ColorPic='bgcolor="#FFF8C9" text="#714813" link="#976019" vlink="#976019" alink="#000000"';


while (<LIST>) {
  chomp;

  ## $_ =~ m/".+",0x60207db3,3,"\\muzzy\disk_d","NTFS","cbba\ready\to_home",972824346,973763001,30879,664836279,475,640,0,0,3,24,0,76,100,5,9397,"cv17_copy.jpg","Приближаясь к Шереметьево"
  #$j=join(", ",("aaa","bbb","",""));print $j;exit;

  @c=split(",");
  #print "$c[5] $c[21] $c[22] \n";

  $chapter=$c[5];
  $chapter=~tr/"//d;
  @cc = split /\\/,$chapter;
  $chapter=$cc[2];

  $image=$c[21];
  $image=~tr/"//d;
  $image =~ m/(.+)\.jpg$/;
  $imagename=$1;

  $c=$_;
  #$c=',"Hotel ""Diplomat"""';
  $c =~ s/""/·/g;
  $c =~ m/,"([^"]*)"$/;
  $comment=$1;
  $comment =~ s/·/"/g;
  #print $comment;exit;

  $fullsize="fs/$chapter/$image";
  $thumbnail="tn/$chapter/$image";
  $html="htm/$chapter/$imagename.htm";
  $listhtml="htm/$chapter/list.htm";
  $index="htm/$chapter/index.html";
  $title="htm/$chapter/title.htm";
                                 
  #print "$chapter $image $imagename $comment \n";

  ########################################################## MENU #####################################
  if ($CurrListhtml NE $listhtml) {

    if ($CurrListhtml NE "") {
      print LISTHTML '<BR><HR><TABLE>';
      foreach $c (@chapters) {
        print LISTHTML '<TR valign=top><TD><font size=-1><LI></TD><TD><font size=-1><A HREF="../'.$c.'/index.html" target=_top>'.$chaptershortname{$c}.'</A></TD>' if $c NE $chapter};
      print LISTHTML '<TR valign=top><TD><font size=-1><LI></TD><TD><font size=-1><A HREF="../../notes.htm" target=_top>Заметки</A> / Notes</TD>';
      print LISTHTML '<TR valign=top><TD><font size=-1><LI></TD><TD><font size=-1><A HREF="../../links.htm" target=_top>Ссылки / Links</A></TD>';
      print LISTHTML '<TR valign=top><TD><font size=-1><LI></TD><TD><font size=-1><A HREF="../../index.html" target=_top>Обложка / Title</A></TD>';
      print LISTHTML '</TABLE><HR><BR>';
      close(LISTHTML);
      };

    $CurrListhtml=$listhtml;

    open(LISTHTML,">$listhtml") || die "ERROR";
    print LISTHTML '<HTML><HEAD><META NAME="Author" CONTENT="Pavel Severov and Maria Kuleshova"><TITLE>'.$chaptername{$chapter}.'</TITLE></HEAD>';
    print LISTHTML '<BODY '.$ColorMenu.'><CENTER>';
    print LISTHTML '<BR><B>'.$chaptername{$chapter}.'</B><BR><BR><HR><TABLE>';

    foreach $c (@chapters) {
      print LISTHTML '<TR valign=top><TD><font size=-1><LI></TD><TD><font size=-1><A HREF="../'.$c.'/index.html" target=_top>'.$chaptershortname{$c}.'</A></TD>' if $c NE $chapter};
    print LISTHTML '<TR valign=top><TD><font size=-1><LI></TD><TD><font size=-1><A HREF="../../notes.htm" target=_top>Заметки</A> / Notes</TD>';
    print LISTHTML '<TR valign=top><TD><font size=-1><LI></TD><TD><font size=-1><A HREF="../../links.htm" target=_top>Ссылки / Links</A></TD>';
    print LISTHTML '<TR valign=top><TD><font size=-1><LI></TD><TD><font size=-1><A HREF="../../index.html" target=_top>Обложка / Title</A></TD>';
    print LISTHTML '</TABLE><HR><BR>';
      
    open(INDEX,">$index") || die "ERROR";
    print INDEX '<HTML><HEAD><META NAME="Author" CONTENT="Pavel Severov and Maria Kuleshova"><TITLE>'.$chaptername{$chapter}.'</TITLE></HEAD>';
    print INDEX '<FRAMESET cols=20%,80% frameBorder=1>';
    print INDEX '<FRAME frameBorder=1 name=left src="list.htm" scrolling="yes">';
    print INDEX '<FRAME frameBorder=1 name=right src="title.htm">';
    print INDEX '</FRAMESET></HTML>';
    close(INDEX);

    open(TITLE,">$title") || die "ERROR";
    $RRUNumber=int(rand(999999999));
    print TITLE '<HTML><HEAD><META NAME="Author" CONTENT="Pavel Severov and Maria Kuleshova"><TITLE>'.$chaptername{$chapter}.'</TITLE></HEAD>';
    print TITLE '<BODY '.$ColorPic.'><CENTER>';
    print TITLE '<br><center><a href="http://www.reklama.ru/cgi-bin/href/severov?'.$RRUNumber.'" target=_top><img src="http://www.reklama.ru/cgi-bin/banner/severov?'.$RRUNumber.'" width=468 height=60 border=0 alt="Reklama.Ru. The Banner Network." ismap></a></center><br>';
    print TITLE '<BR><BR><BR><center><table width="480"><td><center><font size=+9 color="#4D531D">'.$chaptername{$chapter};
    print TITLE '<br><br><img src="../../fs/'.$chapter.'/title.jpg">';
    close(TITLE);

    };

  ########################################################## PICTURE #####################################
  print "$chapter - $imagename\n";

  print LISTHTML '<A HREF="'.$imagename.'.htm" target="right"><IMG SRC="../../'.$thumbnail.'"></A><BR>'.$comment."<BR><BR>\n";

  open(HTML,">$html") || die "ERROR";
  $RRUNumber=int(rand(999999999));
  $CommentInTitle="";
  $CommentInTitle=$comment.". " if $comment NE "";
  print HTML '<HTML><HEAD><META NAME="Author" CONTENT="Pavel Severov and Maria Kuleshova"><TITLE>'.$CommentInTitle.$chaptername{$chapter}.'</TITLE></HEAD>';
  print HTML '<BODY '.$ColorPic.'>';
  print HTML '<CENTER><BR><table bgcolor="#'.$ColorPicBorder.'" cellpadding=5 cellspacing=0><td><IMG SRC="../../'.$fullsize.'"></table><BR><FONT SIZE=+1>'.$comment.'</FONT><BR><BR>';
  print HTML '<br><center><a href="http://www.reklama.ru/cgi-bin/href/severov?'.$RRUNumber.'" target=_top><img src="http://www.reklama.ru/cgi-bin/banner/severov?'.$RRUNumber.'" width=468 height=60 border=0 alt="Reklama.Ru. The Banner Network." ismap></a></center><br>';
  close(HTML);

  };

close(LISTHTM);


