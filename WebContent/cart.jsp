<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Cart</title>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>

	<!-- Cart -->
	<div id="heading-breadcrumbs">
		<div class="container">
			<div class="row d-flex align-items-center flex-wrap">
				<div class="col-md-7">
					<h1 class="h2">Shopping Cart</h1>
				</div>

			</div>
		</div>
	</div>
	<!-- /Cart -->

	<!-- Content -->
	<div id="content">
		<div class="container">
			<div class="row bar">
				<div class="col-lg-12">
					<p class="text-muted lead">You currently have
						${cartAllProduct_list.size()} item(s) in your cart.</p>
				</div>
				<div id="basket" class="col-lg-9">
					<div class="box mt-0 pb-0 no-horizontal-padding">
						<form action="payment.jsp">
							<div class="table-responsive">
								<table class="table">
									<thead>
										<tr>
											<th colspan="2">Product</th>
											<th>Quantity</th>
											<th>Unit price</th>

											<th colspan="">Total</th>
										</tr>
									</thead>
									<tbody>

										<c:forEach items="${cartAllProduct_list}" var="cartProd"
											varStatus="counter">
											<tr>
												<td><a class="halfWidth verticalMiddle" href="#"><img
														src="${cartProd.getImagePath()}" class="img-fluid"></a></td>
												<td style="vertical-align:middle" class="verticalMiddle"><a>${cartProd.getDesc()}</a></td>
												<td style="vertical-align:middle" class="verticalMiddle"><input class="qty_input" type="text"
													id="${cartProd.getSku()}" value="1"
													data-max="${cartProd.getQty()}"
													data-unitPrice='${cartProd.getRetail()}'></td>
												<td style="vertical-align:middle" class="unitPrice verticalMiddle">${cartProd.getRetail()}</td>
												<td style="vertical-align:middle" class="price_allQty verticalMiddle" id="total_${cartProd.getSku()}">0</td>
												<td style="vertical-align:middle"><a
													href="CartServlet?flag=delete_cartProduct&sku=${cartProd.getSku()}"><i
														class="fas fa-trash-alt verticalMiddle"></i></a></td>
											</tr>
										</c:forEach>
									</tbody>
									<tfoot>
										<tr>
											<th colspan="4">Total</th>
											<th colspan="2" id="gTotal_leftPane"></th>
										</tr>
									</tfoot>
								</table>
							</div>
							<div
								class="box-footer d-flex justify-content-between align-items-center">
								
								<div class="right-col">

									<button type="submit" class="btn btn-template-outlined">
										Proceed to checkout <i class="fa fa-chevron-right"></i>
									</button>
								</div>
							</div>
						</form>
					</div>

				</div>
				<div class="col-lg-3">
					<div id="order-summary" class="box mt-0 mb-4 p-0">
						<div class="box-header mt-0">
							<h3>Order summary</h3>
						</div>
						<p class="text-muted">Shipping and additional costs are
							calculated based on the values you have entered.</p>
						<div class="table-responsive">
							<table class="table">
								<tbody>
									<tr>
										<td>Order subtotal</td>
										<th id="gTotal_rightPane"></th>
									</tr>
									<tr>
										<td>Shipping and handling</td>
										<th id="shipping">$5.00</th>
									</tr>
									<tr>
										<td>Tax</td>
										<th id="tax"></th>
									</tr>
									<tr class="total">
										<td>Total</td>
										<th id="final_total"></th>
									</tr>
								</tbody>
							</table>
						</div>
					</div>

				</div>
			</div>
		</div>
	</div>

	<!-- Content -->

	<jsp:include page="footer.jsp"></jsp:include>
</body>
<script type="text/javascript">
	function count_grandTotal() {
		//grandTotal
		var total_products = $('.unitPrice').length;
		
		var gTotal = 0;
		for (var i = 0; i < total_products; i++) {
			var total = $('.price_allQty')[i].innerHTML;
			gTotal = gTotal + parseInt(total);
		}

		console.log('gtotal: ' + gTotal);
		$('#gTotal_leftPane')[0].innerHTML = '$' + gTotal;
		$('#gTotal_rightPane')[0].innerHTML = '$' + gTotal;
		
		changeTax(gTotal);
	}
	
	function changeTax(gTotal){
		var tax = gTotal * 0.0775;
		
		$('#tax')[0].innerHTML = '$' + tax;
		
		changeFinalTotal(gTotal,tax);
	}
	
	function changeFinalTotal(gTotal,tax){
		var shipping = 5;
		var finalTotal = gTotal+tax+shipping;
		$('#final_total')[0].innerHTML = '$'+finalTotal;
		console.log("final: "+gTotal+tax+shipping);
	}

	$(function() {
		console.log('Page Loaded: ');

		var total_products = $('.unitPrice').length;
		//Change total
		for (var i = 0; i < total_products; i++) {
			var qty = $('.qty_input')[i].value;
			var unitPrice = $('.unitPrice')[i].innerHTML;

			$('.price_allQty')[i].innerHTML = unitPrice * qty;
		}

		count_grandTotal();

		//on qty change
		$('.qty_input')
				.on(
						'change',
						function(event) {
							console.log("target: " + event.target.value);
							console.log("target id: " + event.target.id);
							console.log("target: "
									+ event.target.getAttribute('data-max'));
							console.log("target parent: "
									+ event.target.parentElement.innerHTML);
							console.log("target unit: "
									+ event.target
											.getAttribute('data-unitPrice'));

							var sku = event.target.id;
							var newQty = event.target.value;
							var maxQty = event.target.getAttribute('data-max');
							var unitPrice = event.target
									.getAttribute('data-unitPrice');

							$('#total_' + sku)[0].innerHTML = newQty
									* unitPrice;
							
							count_grandTotal();
						});
	});
</script>
</html>