use CGI;
use CGI::Carp qw (fatalsToBrowser);
use DBI;

sub get_db_handler {

my $q = new CGI;
my $host = "opatija.sdsu.edu";
my $port = "3306"; 
my $database = "jadrn038";
my $username = "jadrn038";
my $password = "widget";
my $database_source = "dbi:mysql:$database:$host:$port";
my $response = "";

my $dbh = DBI->connect($database_source, $username, $password)
or die 'Cannot connect to db';
return $dbh;
}1;

my $q = new CGI;

my $delete_sku = $q->param('delete_sku');
#my $delete_sku = 2;
 
print "Content-type: text/html\n\n";

$delete_query = "DELETE from product where sku='$delete_sku'";
	my $dbh = get_db_handler();
    my $num_rows_affected = $dbh->do($delete_query);
    $dbh->disconnect();

	if($num_rows_affected){
		print "\nPASS".$num_rows_affected;
	}
	else{
		print "FAIL<br/>$DBI::errstr";
	}
