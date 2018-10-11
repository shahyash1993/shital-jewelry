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
   
my $add_sku = $q->param('add_sku');
my $add_category = $q->param('add_category');
my $add_vendor = $q->param('add_vendor');
my $add_mfr_id = $q->param('add_mfr_id');
my $add_desc = $q->param('add_desc');
my $add_features = $q->param('add_features');
my $add_cost = $q->param('add_cost');
my $add_retail = $q->param('add_retail');
my $add_qty = $q->param('add_qty');
my $add_product_img = $q->param('add_product_img');
 
print "Content-type: text/html\n\n";
my $dbh = get_db_handler();

   my $insert_query = "INSERT INTO product values(".
   "'$add_sku',$add_category,$add_vendor,'$add_mfr_id','$add_desc',".
   "'$add_features',$add_cost,$add_retail,$add_qty,'$add_product_img');";

    my $num_rows_affected = $dbh->do($insert_query);
	$dbh->disconnect();

	if($num_rows_affected){
		print "PASS";
	}
	else{
		print "FAIL<br/>$DBI::errstr";
	}
   