<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Payment</title>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>

	<!-- Cart -->
	<div id="heading-breadcrumbs">
		<div class="">
			<div class="row d-flex align-items-center flex-wrap">
				<div class="container ">

					<div class="col-md-7">
						<h1 class="h2">Payment</h1>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="content">
		<div class="container padding30">

			<h3>Shipping Information</h3>
			<div class="row">
				<div class="col-sm-6">
					Name <input id="ship_name" class="form-control" type="text">
				</div>
				<div class="col-sm-6">
					Contact<input id="ship_contact" class="form-control" type="number">
				</div>
			</div>
			<br />

			<div class="row">
				<div class="col-sm-6">
					Address Line#1 <input id="ship_addr_1" class="form-control"
						type="text">
				</div>
				<div class="col-sm-6">
					Address Line#2<input id="ship_addr_2" class="form-control"
						type="text">
				</div>
			</div>
			<br />

			<div class="row">
				<div class="col-sm-6">
					City <input id="ship_city" class="form-control" type="text">
				</div>
				<div class="col-sm-3">
					State<input id="ship_state" class="form-control" maxlength="2"
						type="text">
				</div>
				<div class="col-sm-3">
					ZIP<input id="ship_zip" class="form-control" maxlength="5"
						type="text">
				</div>
			</div>
			<br />

			<h3>Billing Information</h3>

			<div class="row">
				<div class="col-sm-6">
					Name <input id="bill_name" class="form-control" type="text">
				</div>
				<div class="col-sm-6">
					Contact<input id="bill_contact" class="form-control" type="number">
				</div>
			</div>
			<br />

			<div class="row">
				<div class="col-sm-6">
					Address Line#1 <input id="bill_addr_1" class="form-control"
						type="text">
				</div>
				<div class="col-sm-6">
					Address Line#2<input id="bill_addr_2" class="form-control"
						type="text">
				</div>
			</div>
			<br />

			<div class="row">
				<div class="col-sm-6">
					City <input id="bill_city" class="form-control" type="text">
				</div>
				<div class="col-sm-3">
					State<input id="bill_state" maxlength="2" class="form-control"
						type="text">
				</div>
				<div class="col-sm-3">
					ZIP<input id="bill_zip" maxlength="5" class="form-control"
						type="text">
				</div>
			</div>
			<br />

			<div class="row">
				<div class="col-sm-3">
					Credit Card Type <input id="bill_cc_type" class="form-control"
						type="text">
				</div>
				<div class="col-sm-5">
					Credit Number<input id="bill_cardNo" class="form-control"
						type="text">
				</div>
				<div class="col-sm-2">
					Expiration<input id="bill_exp" maxlength="5" class="form-control"
						type="text">
				</div>
				<div class="col-sm-2">
					Security Code<input id="bill_securityCode" maxlength="3"
						class="form-control" type="text">
				</div>
			</div>
			<br />

			<div class="row sizes">
				<div class="col-sm-2">
					<input type="button" id="cancel_btn" value="cancel"
						class="btn btn-template-outlined">
				</div>
				<div class="col-sm-2">
					<input type="button" id="placeOrder_btn" 
						value="Place Order" class="btn btn-template-outlined">
				</div>
			</div>
		</div>
	</div>
	<!-- Content -->

	<jsp:include page="footer.jsp"></jsp:include>
</body>
<script type="text/javascript">
		$('#cancel_btn').on('click',function(){
			window.location = "IndexServlet?flag=search_allCat";
		})

		$('#placeOrder_btn').on('click',function(){
			$.get("CartServlet?flag=removeCart",function(data,status){
				alert('Placed Order Successfully');
				console.log("Remove Cart: "+data+" / status: "+status);
				window.location = "IndexServlet?flag=search_allCat";
			});			
		});

	$('#ship_name').on('keyup', function() {
		$('#bill_name').val(event.target.value);
	});

	$('#ship_contact').on('keyup', function() {
		$('#bill_contact').val(event.target.value);
	});

	$('#ship_addr_1').on('keyup', function() {
		$('#bill_addr_1').val(event.target.value);
	});

	$('#ship_addr_2').on('keyup', function() {
		$('#bill_addr_2').val(event.target.value);
	});

	$('#ship_city').on('keyup', function() {
		$('#bill_city').val(event.target.value);
	});

	$('#ship_state').on('keyup', function() {
		$('#bill_state').val(event.target.value);
	});

	$('#ship_zip').on('keyup', function() {
		$('#bill_zip').val(event.target.value);
	});
</script>
</html>