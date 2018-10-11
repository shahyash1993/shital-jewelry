#!/usr/bin/perl

use DBI;
use CGI;

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
}

sub db_retrieve{
	my $sql = shift @_;
	my $dbh = get_db_handler();
  
	my $sth = $dbh->prepare($sql);	
	$sth->execute();
	
	$response = '[';
	while (my @row = $sth->fetchrow_array)
    {
    	$response .= '[ ';
    		
    		foreach $item (@row) {
        		$item =~ s/\'/\\'/g;
        		$response .= "'$item',";
    		}
    		
    	$response = substr $response, 0, (length($response)-1);
    	$response .= '],';
    }
    	$response = substr $response, 0, (length($response)-1);
    	$response .= ' ]';
$dbh->disconnect();
#$sth->finish();

}

}
1;

sub db_delete{
    my $sql = shift @_;
    print $sql;
    my $dbh = get_db_handler();
    my $num_rows_affected = $dbh->do($sql);

	if($num_rows_affected){
		print "PASS";
	}
	else{
		print "FAIL<br/>$DBI::errstr";
	}
}
1;

sub db_edit{
    my $sql = shift @_;
    my $dbh = get_db_handler();
    my $num_rows_affected = $dbh->do($sql);

	print "sql: ".$sql;
    print "RowsAffected: ".$num_rows_affected;

	$dbh->disconnect();

	if($num_rows_affected){
		print "PASS";
	}
	else{
		print "FAIL<br/>$DBI::errstr";
	}
}}
1;

sub db_insert {
    my $sql = shift @_;
    my $dbh = get_db_handler();
    my $num_rows_affected = $dbh->do($sql);

	print "sql: ".$sql;
    print "RowsAffected: ".$num_rows_affected;
	$dbh->disconnect();

	if($num_rows_affected){
		print "PASS";
	}
	else{
		print "FAIL<br/>$DBI::errstr";
	}
}}
1;

