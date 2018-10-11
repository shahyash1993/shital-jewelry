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

#my $edit_sku = qwe;
my $edit_sku = $q->param('edit_sku');
 
print "Content-type: text/html\n\n";
my $dbh = get_db_handler();
  
   my $retrieve_query = "SELECT * from product where sku='$edit_sku'";
   
   	my $sth = $dbh->prepare($retrieve_query);	
	$sth->execute();
	
	$response = '[';
	while (my @row = $sth->fetchrow_array)
    {
    		foreach $item (@row) {
        		$item =~ s/\'/\\'/g;
        		$response .= "'$item',";
    		}
    		
    	$response = substr $response, 0, (length($response)-1);
    }
    	$response = substr $response, 0, (length($response));
    	$response .= ']';
    	
    	print $response;
$dbh->disconnect();
$sth->finish();