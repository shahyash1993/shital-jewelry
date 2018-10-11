use CGI;
use DBI;

my $q = new CGI;
my $sku = $q->param('sku');

my $host = 'opatija.sdsu.edu';
my $port = '3306';
my $database = 'jadrn038';
my $username = 'jadrn038';
my $password = 'widget';

my $database_source = "dbi:mysql:$database:$host:$port";
my $dbh = DBI->connect($database_source, $username, $password)
	or die "Cannot connect to DB";
	
my $sth = $dbh->prepare("SELECT sku FROM product where sku='$sku'");
$sth->execute();
my $number_of_rows = $sth->rows;
$sth->finish();
$dbh->disconnect();
print "content-type: text/html\n\n";
if($number_of_rows == 0) {
	print "OK";
	}
else {
	print "DUPLICATE";
	}


