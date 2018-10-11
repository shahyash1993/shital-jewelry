use CGI;
use CGI::Session;
use CGI::Carp qw (fatalsToBrowser);
use Crypt::Password;

##---------------------------- MAIN ---------------------------------------
print "Content-type: text/html\n\n";

my $q = new CGI;
my $user = "";

my $cookie_sid = $q->cookie('jadrn038SID');
my $session = new CGI::Session(undef, $cookie_sid, {Directory=>'/tmp'});
my $sid = $session->id;

if(authenticate_user() || $cookie_sid eq $sid) {
    send_to_main();   
    }
else {
    send_to_login_error();
    }    
###########################################################################

###########################################################################
sub authenticate_user {
    $q = new CGI;
    my $user = $q->param("user");
    my $password = $q->param("password");    
    open DATA, "</srv/www/cgi-bin/jadrn038/passwords.dat" 
        or die "Cannot open file.";
    @file_lines = <DATA>;
    close DATA;

    $OK = 0; #not authorized

    foreach $line (@file_lines) {
        chomp $line;
        ($stored_user, $stored_pass) = split /=/, $line;    
    if($stored_user eq $user && check_password($stored_pass, $password)) {
        $OK = 1;
        last;
        }
    }
    return $OK;
    }
###########################################################################

###########################################################################
sub send_to_login_error {
    print <<END;
Content-type: text/html \n\n
<html>
<head>
    <meta http-equiv="refresh" content="0; url=http://jadran.sdsu.edu/~jadrn038/proj1/error.html" />
</head><body></body>
</html>

END
    } 
    
###########################################################################
      
###########################################################################
sub send_to_main {
# args are DRIVER, CGI OBJECT, SESSION LOCATION
# default for undef is FILE, NEW SESSION, /TMP 
# for login.html, don't look for any existing session.
# Always start a new one.  Send a cookie to the browser.
# Default expiration is when the browser is closed.
# WATCH YOUR COOKIE NAMES! USE JADRNXXX_SID  
    my $session = new CGI::Session(undef, undef, {Directory=>'/tmp'});
    $session->expires('+1d');
    my $cookie = $q->cookie(jadrn038SID => $session->id);
    print $q->header( -cookie=>$cookie ); #send cookie with session ID to browser    
    my $sid = $session->id;
  

#print $q->redirect('/~jadrn038/proj1/mainPage.html');
print <<END;

<html>
<head>
<meta charset="utf-8">
<title>Shital Jewellery</title>
<link rel="stylesheet" href="/~jadrn038/proj1/css/bootstrap.min.css"
	id="theme-stylesheet">
<link rel="stylesheet"
	href="/~jadrn038/proj1/css/tab_example.css">
<link rel="stylesheet" href="/~jadrn038/proj1/css/style.default.css"
	id="theme-stylesheet">

<script src="/jquery/jquery.js"></script>
<script src="/jquery/jQueryUI.js"></script>
<script src="/~jadrn038/proj1/js/tab_example.js"></script>
<script src="/~jadrn038/proj1/js/stopBackButton.js">
	stop();
</script>
<script>
	/* $(function(){
	 $("#tabs-1").load("add.html"); 
	 $("#tabs-2").load("edit.html"); 
	 $("#tabs-3").load("delete.html"); 
	}); */
</script>
</head>
<body>

	<h2>Add/ Edit/ Delete Item</h2>
	<div class="right">
		<a href="/perl/jadrn038/logout.cgi">Logout</a>
	</div>
	<div id="tabs">
		<ul>
			<li id="add_span"><a href="#tabs-1"><span>Add Item</span></a></li>
			<li id="edit_span"><a href="#tabs-2"><span>Edit Item</span></a></li>
			<li id="delete_span"><a href="#tabs-3"><span>Delete
						Item</span></a></li>
		</ul>

		<!------ ---- ------>
		<!------ ---- ------>
		<!------ ADD ------->
		<!------ ---- ------>
		<!------ ---- ------>
		<div id="tabs-1">
			<form enctype="multipart/form-data" action="" method="post" id="add_form">
				<div class="heading">
					<h3 id="add_title" class="text-uppercase">Add Item</h3>
				</div>
				<div>
					<div class="col-md-6">
						<div class="form-group">
							<label for="sku">SKU</label> <input id="add_sku" type="text" pattern="[A-Z]{3}[-][0-9]{3}"
								class="form-control" required> <label id="status"></label>
						</div>
					</div>
					<div class="col-md-6">
						<div class="form-group">
							<label for="category">Category</label> <select id="add_category"
								class="form-control">
								<option selected="selected" value="-1">---Select
									Category---</option>
								<option value="1">Rings</option>
								<option value="2">Necklaces</option>
								<option value="3">Bracelets</option>
								<option value="4">Earrings</option>
								<option value="5">Pendants</option>
							</select>
						</div>
					</div>
				</div>
				<div>
					<div class="col-md-6">
						<div class="form-group">
							<label for="vendor">Vendor</label> <select id="add_vendor"
								class="form-control">
								<option value="-1" selected="selected">---Select
									Vendor---</option>
								<option value="1">Shital Jewellery</option>
								<option value="2">Harry Winston</option>
								<option value="3">Van Cleef & Arpels</option>
								<option value="4">Buccellati</option>
								<option value="5">Tiffany</option>
								<option value="6">Graff</option>
								<option value="7">Piaget</option>
								<option value="8">Bvlgari</option>
								<option value="9">Mikimoto</option>
							</select>
						</div>
					</div>
					<div class="col-md-6">
						<div class="form-group">
							<label for="mfr_id">Manufacturer's ID</label> <input
								id="add_mfr_id" type="text" class="form-control" required>
						</div>
					</div>
				</div>
				<div>
					<div class="col-md-6">
						<div class="form-group">
							<label for="desc">Description</label> <input id="add_desc"
								type="text" class="form-control" required>
						</div>
					</div>
					<div class="col-md-6">
						<div class="form-group">
							<label for="features">Features</label>
							<textarea id="add_features" class="form-control"></textarea>
						</div>
					</div>
					<div class="col-md-6">
						<div class="form-group">
							<label for="cost">Cost</label> <input id="add_cost" type="text"
								class="form-control" required>
						</div>
					</div>
					<div class="col-md-6">
						<div class="form-group">
							<label for="retail">Retail</label> <input id="add_retail"
								type="text" class="form-control" required>
						</div>
					</div>
					<div class="col-md-6">
						<div class="form-group">
							<label for="qty">Quantity</label> <input id="add_qty" type="text" min="0"
								class="form-control" required>
						</div>
					</div>
					<div class="col-md-6">
						<div class="form-group">
							<label for="product_img">Product Image</label>
							<div class="form-group">
								<input id="add_product_img" type="file" class="form-control" required>
								
							</div>
						</div>
					</div>
					<div class="col-md-12 text-center">
						<input name="add_submit_button" id="add_submit_button" type="submit"
							class="btn btn-template-outlined" value="Add"/>
					</div>
				</div>
			</form>
			<div class="col-md-6" id="add_product_actual_img"></div>
		</div>
		<!------ ---- ------>
		<!------ ---- ------>
		<!------ EDIT ------>
		<!------ ---- ------>
		<!------ ---- ------>
		<div id="tabs-2">
			<form method="post" id="edit_form">
				<div class="heading">
					<h3 id="edit_title" class="text-uppercase">Edit Item</h3>
				</div>
				<div class="col-md-6">
					<div class="form-group">
						<label for="sku">SKU</label> <input id="edit_sku" type="text" pattern="[A-Z]{3}[-][0-9]{3}"
							class="form-control" required>
					</div>
				</div>
				<div id="edit_fieldsAfterSKU" hidden="hidden">
					<div class="col-md-6">
						<div class="form-group">
							<label for="category">Category</label> <select id="edit_category"
								class="form-control">
								<option value="-1" selected="selected">---Select
									Category---</option>
								<option value="1">Rings</option>
								<option value="2">Necklaces</option>
								<option value="3">Bracelets</option>
								<option value="4">Earrings</option>
								<option value="5">Pendants</option>
							</select>
						</div>
					</div>
					<div>
						<div class="col-md-6">
							<div class="form-group">
								<label for="vendor">Vendor</label> <select id="edit_vendor"
									class="form-control">
									<option value="-1" selected="selected">---Select
										Vendor---</option>
									<option value="1">Shital Jewellery</option>
									<option value="2">Harry Winston</option>
									<option value="3">Van Cleef & Arpels</option>
									<option value="4">Buccellati</option>
									<option value="5">Tiffany</option>
									<option value="6">Graff</option>
									<option value="7">Piaget</option>
									<option value="8">Bvlgari</option>
									<option value="9">Mikimoto</option>
								</select>
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<label for="mfr_id">Manufacturer's ID</label> <input
									id="edit_mfr_id" type="text" class="form-control" required>
							</div>
						</div>
					</div>
					<div>
						<div class="col-md-6">
							<div class="form-group">
								<label for="desc">Description</label> <input id="edit_desc"
									type="text" class="form-control" required>
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<label for="features">Features</label>
								<textarea id="edit_features" class="form-control"></textarea>
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<label for="cost">Cost</label> <input id="edit_cost" type="text"
									class="form-control" required>
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<label for="retail">Retail</label> <input id="edit_retail"
									type="text" class="form-control" required>
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<label for="qty">Quantity</label> <input id="edit_qty" min="0"
									type="text" class="form-control" required>
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group"></div>
							<div class="form-group">
								<label for="product_img">Change Product Image</label> <img
									id="edit_actual_product_img"
									style="width: 100px; height: 100px" /> <input
									id="add_product_img" type="file" class="form-control" required>
							
							</div>
						</div>
						<div class="col-md-12 text-center">
							<button id="edit_submit_button" type="submit"
								class="btn btn-template-outlined">Save change</button>
						</div>
					</div>
				</div>
			</form>
		</div>
		<!------ ---- ------>
		<!------ ---- ------>
		<!------ DELETE ---->
		<!------ ---- ------>
		<!------ ---- ------>

		<div id="tabs-3">
			<form method="post" id="delete_form">
				<div class="heading">
					<h3 id="delete_title" class="text-uppercase">Delete Item</h3>
				</div>

				<div class="col-md-6">
					<div class="form-group">
						<label for="sku">SKU</label> <input id="delete_sku" type="text"
							class="form-control">
					</div>
				</div>
				<div id="delete_fieldsAfterSKU" hidden="hidden">
					<div class="col-md-6">
						<div class="form-group">
							<label for="category">Category</label> <select
								id="delete_category" class="form-control">
								<option value="-1" selected="selected">---Select
									Category---</option>
								<option value="1">Rings</option>
								<option value="2">Necklaces</option>
								<option value="3">Bracelets</option>
								<option value="4">Earrings</option>
								<option value="5">Pendants</option>
							</select>
						</div>
					</div>

					<div>
						<div class="col-md-6">
							<div class="form-group">
								<label for="vendor">Vendor</label> <select id="delete_vendor"
									class="form-control">
									<option value="-1" selected="selected">---Select
										Vendor---</option>
									<option value="1">Shital Jewellery</option>
									<option value="2">Harry Winston</option>
									<option value="3">Van Cleef & Arpels</option>
									<option value="4">Buccellati</option>
									<option value="5">Tiffany</option>
									<option value="6">Graff</option>
									<option value="7">Piaget</option>
									<option value="8">Bvlgari</option>
									<option value="9">Mikimoto</option>
								</select>
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<label for="mfr_id">Manufacturer's ID</label> <input
									id="delete_mfr_id" type="text" class="form-control">
							</div>
						</div>
					</div>
					<div>
						<div class="col-md-6">
							<div class="form-group">
								<label for="desc">Description</label> <input id="delete_desc"
									type="text" class="form-control">
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<label for="features">Features</label>
								<textarea id="delete_features" class="form-control"></textarea>
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<label for="cost">Cost</label> <input id="delete_cost"
									type="text" class="form-control">
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<label for="retail">Retail</label> <input id="delete_retail"
									type="text" class="form-control">
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<label for="qty">Quantity</label> <input id="delete_qty"
									type="text" class="form-control">
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<label for="product_img">Product Image</label>
								
								<img id="delete_actual_product_img"
									style="width: 100px; height: 100px" />
							</div>
						</div>
						<div class="col-md-12 text-center">
							<button id="delete_submit_button" type="submit"
								class="btn btn-template-outlined">Delete</button>
						</div>
					</div>
				</div>
			</form>
		</div>

Status: <h4 id="process_status"></h4>
	</div>
	<br />
	<br />
</body>
</html>

END

}
###########################################################################    
    





