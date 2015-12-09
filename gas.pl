#!/usr/bin/perl -w

use 5.10.0;
no warnings 'experimental::smartmatch';
use WWW::Mechanize;

my $num_args = $#ARGV + 1;
#if ($num_args != 2)
#{
	#print "\nUsage: get.pl gear\n";
	#exit;
#}

my $category = $ARGV[0];
my $what = $ARGV[1];
my $pages = $ARGV[2];

if (!$pages)
{
	$pages = "1";
}

given($category)
{
	when (/^amp/) { $sourceUrl = "http://www.thegearpage.net/board/index.php?forums/amps-and-cabs-emporium.6/page-".$pages; }
	when (/^pedal/) { $sourceUrl = "http://www.thegearpage.net/board/index.php?forums/pedal-effects-gear-emporium.33/page-".$pages; }
	when (/^guitar/) { $sourceUrl = "http://www.thegearpage.net/board/index.php?forums/guitar-emporium.22/page-".$pages; }
}

my $prefix = "http://www.thegearpage.net/board/";
my $mechUrl = WWW::Mechanize->new();
$mechUrl->get($sourceUrl);

my @links = $mechUrl->links();

foreach my $link (@links)
{
	$results = $link->url();
	
	if (($results =~ m/$what/i) && ($results =~ m/thread/))
	{
		print $prefix.$results . "\n";
	}

}

#print $html;
