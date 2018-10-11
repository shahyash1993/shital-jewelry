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

#my $edit_sku = 1;
my $edit_sku = $q->param('edit_sku');

my $edit_category = $q->param('edit_category');
my $edit_vendor = $q->param('edit_vendor');
my $edit_mfr_id = $q->param('edit_mfr_id');
my $edit_desc = $q->param('edit_desc');
my $edit_features = $q->param('edit_features');
my $edit_cost = $q->param('edit_cost');
my $edit_retail = $q->param('edit_retail');
my $edit_qty = $q->param('edit_qty');
my $edit_product_img = $q->param('add_product_img');
 
print "Content-type: text/html\n\n";

	my $edit_query = "UPDATE product set catID=$edit_category, venID=$edit_vendor,".
	"vendorModel=$edit_mfr_id, description='$edit_desc', features='$edit_features', cost=$edit_cost, retail=$edit_retail,".
	"quantity=$edit_qty, image='$edit_product_img' where sku='$edit_sku';";
	
 	my $dbh = get_db_handler();
    my $num_rows_affected = $dbh->do($edit_query);

	$dbh->disconnect();
	if($num_rows_affected){
		print "PASS";
	}
	else{
		print "FAIL<br/>$DBI::errstr";
	}