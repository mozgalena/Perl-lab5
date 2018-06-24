use strict;
use warnings;

my @overlap;
my $doc = "access.log";
my %IPtable;

open(my $item, "<", $doc) or die "doesn't work< $doc!";

while ( my $var = <$item> ) {
	chomp($var);
	push @overlap,($var =~ m/(\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3})/);
	$IPtable{$overlap[-1]}=0
}
close $item;

foreach my $i (@overlap){
$IPtable{$i}=$IPtable{$i}+1
}

my @topIP=sort {$IPtable{$a} < $IPtable{$b}} keys %IPtable;

for (my $i=0; $i<10; $i++){
	my $ip=@topIP[$i];
	print $ip, " : ", $IPtable{$ip},"\n";
}