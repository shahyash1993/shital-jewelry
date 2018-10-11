use CGI;
use CGI::Session;
use CGI::Carp qw (fatalsToBrowser);

my $q = new CGI;
my $sid = $q->cookie("jadrn038SID") || undef;
$session = new CGI::Session(undef, $sid, {Directory => '/tmp'});
$session->delete();
my $cookie = $q->cookie(jadrn038SID => '');
print $q->header( -cookie=>$cookie ); #send cookie with session ID to browser  

print $q->redirect('http://jadran.sdsu.edu/~jadrn038/proj1/logout.html');