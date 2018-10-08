<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Product</title>
</head>
<body>

	<!-- Header -->
	<jsp:include page="header.jsp"></jsp:include>
	<!-- /Header-->

	<!-- Category Title -->
	<div id="heading-breadcrumbs">
		<div class="container">
			<div class="row d-flex align-items-center flex-wrap">
				<div class="col-md-7">
					<h1 id="titleText" class="h2">High Jewellery</h1>
				</div>

			</div>
		</div>
	</div>
	<!-- /Category Title -->

	<!-- From Search -->
	<c:choose>
		<c:when test="${userQuery_list.size()>0}">
			<c:set var="prodList" value="${userQuery_list}"></c:set>
		</c:when>

		<c:when test="${skuSpecificProd_list.size()>0}">
			<c:set var="prodList" value="${skuSpecificProd_list}"></c:set>
		</c:when>

		<c:otherwise>
			<script type="text/javascript">
				document.getElementById('content').display = 'none';
			</script>
			<div style="text-align: center" class="col-md-12">

				<br />
				<h4 id="titleText" class="h2">No Results Found...</h4>
				<br />
			</div>
		</c:otherwise>

	</c:choose>

	<!-- Content -->
	<c:forEach items="${prodList}" var="prod">
		<div id="content">
			<div class="container">
				<div class="row bar">
					<div class="col-lg-12">
						<div id="productMain" class="row">
							<div class="col-sm-6">
								<div class="box">
									<img src="${prod.getImagePath()}" alt="" class="img-fluid">
								</div>
							</div>

							<div class="col-sm-6">

								<div class="box">
									<form>
										<div class="price">
											<h3>${prod.getDesc()}</h3>
										</div>
										<br />
										<p class="price">$${prod.getRetail()}</p>

										<c:set var="isInCart" value="false"> </c:set>
										<c:forEach var="cart_product" items="${cartAllProduct_list}">
											<c:if test="${cart_product.getSku() == prod.getSku() }">
												<c:set var="isInCart" value="true"> </c:set>
											</c:if>
										</c:forEach>

										<p class="price">
											<c:choose>
												<c:when test="${prod.getQty() > 0}">
													
													<c:choose>
														<c:when test="${isInCart == true}">
																<div class="sizes">
																	<button disabled="disabled" type="submit" id="addToCart_btn"
																		value='${prod.getSku()}'
																		class="btn btn-template-outlined">
																		<i class="fa fa-shopping-cart"></i> Already Added to cart
																	</button>
																</div>
														</c:when>
														<c:otherwise>
																<div class="sizes">
																	<button type="submit" id="addToCart_btn"
																		value='${prod.getSku()}'
																		class="btn btn-template-outlined">
																		<i class="fa fa-shopping-cart"></i> Add to cart
																	</button>
																</div>
																<div class="sizes">
																	<i>(In Stock)</i>
																</div>
														</c:otherwise>
													</c:choose>
													
												</c:when>
												<c:otherwise>
													<div class="sizes">
														<button disabled="disabled" type="submit"
															class="text-center btn">
															<i class="fa fa-shopping-cart"></i> Add to cart
														</button>
													</div>
													<div class="sizes" style="text-align: center">
														<i>(Coming Soon)</i>
													</div>

												</c:otherwise>
											</c:choose>

										</p>
									</form>
								</div>
							</div>
						</div>
						<div id="details" class="box mb-4 mt-4">

							<div class="">
								<h3>Vendor Model</h3>
							</div>
							<p class="price">${prod.getVendorModel()}</p>

							<div class="">
								<h3>Features</h3>
							</div>
							<blockquote class="">
								<p class="price">
									${prod.getFeatures()}
								</p>
							</blockquote>
						</div>



					</div>

				</div>
			</div>
		</div>
	</c:forEach>
	<!-- /Content -->

	<!-- Footer -->
	<jsp:include page="footer.jsp"></jsp:include>
	<!-- /Footer -->
	<script type="text/javascript">
		$('#addToCart_btn').on(
				'click',
				function() {
					var sku = $('#addToCart_btn').val();
					console.log('$(#addToCart_btn).val(): '
							+ $('#addToCart_btn').val());

					$.ajax({
						url : 'CartServlet?flag=addToCart&sku=' + sku,
						success : function(result) {
							alert('Successfully Added to the Cart.');
							$('#addToCart_btn').attr('disabled', 'disabled');
							$('#addToCart_btn').val('Added to Cart!');
						}
					}).done(function() {

					}).fail(function() {
						alert("error");
					});
				});
	</script>
</body>
</html>