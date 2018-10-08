<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Category</title>
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
					<h1 class="h2">Ring No.1</h1>
				</div>

			</div>
		</div>
	</div>
	<!-- /Category Title -->

	<!-- Content -->

	<div id="content">
		<div class="container">
			<div class="row bar">
				<div class="col-lg-12">
					<div id="productMain" class="row">
						<div class="col-sm-6">
							<div>
								<img src="img/hj.jpg" alt="" class="img-fluid">
							</div>
						</div>
						<div class="col-sm-6">
							<div class="box">
								<form>
									<div class="sizes">
										<h3>Available sizes</h3>
										<div class="btn-group bootstrap-select bs-select">

											<div class="dropdown-menu open" role="combobox">
												<ul class="dropdown-menu inner" role="listbox"
													aria-expanded="false">
													<li data-original-index="0" class="selected"><a
														tabindex="0" class="" data-tokens="null" role="option"
														aria-disabled="false" aria-selected="true"><span
															class="text">Small</span><span
															class="glyphicon glyphicon-ok check-mark"></span></a></li>
													<li data-original-index="1"><a tabindex="0" class=""
														data-tokens="null" role="option" aria-disabled="false"
														aria-selected="false"><span class="text">Medium</span><span
															class="glyphicon glyphicon-ok check-mark"></span></a></li>
													<li data-original-index="2"><a tabindex="0" class=""
														data-tokens="null" role="option" aria-disabled="false"
														aria-selected="false"><span class="text">Large</span><span
															class="glyphicon glyphicon-ok check-mark"></span></a></li>
													<li data-original-index="3"><a tabindex="0" class=""
														data-tokens="null" role="option" aria-disabled="false"
														aria-selected="false"><span class="text">X
																Large</span><span class="glyphicon glyphicon-ok check-mark"></span></a></li>
												</ul>
											</div>
											<select class="bs-select" tabindex="-98">
												<option value="small">Small</option>
												<option value="medium">Medium</option>
												<option value="large">Large</option>
												<option value="x-large">X Large</option>
											</select>
										</div>
									</div>
									<p class="price">$124.00</p>
									<p class="text-center">
										<button type="submit" class="btn btn-template-outlined">
											<i class="fa fa-shopping-cart"></i> Add to cart
										</button>

									</p>
								</form>
							</div>

						</div>
					</div>
					<div id="details" class="box mb-4 mt-4">
						<p></p>
						<h4>Product details</h4>
						<p>White lace top, woven, has a round neck, short sleeves, has
							knitted lining attached</p>
						<h4>Material &amp; care</h4>
						<ul>
							<li>Polyester</li>
							<li>Machine wash</li>
						</ul>
						<h4>Size &amp; Fit</h4>
						<ul>
							<li>Regular fit</li>
							<li>The model (height 5'8 "and chest 33") is wearing a size
								S</li>
						</ul>
						<blockquote class="blockquote">
							<p class="mb-0">
								<em>Define style this season with Armani's new range of
									trendy tops, crafted with intricate details. Create a chic
									statement look by teaming this lace number with skinny jeans
									and pumps.</em>
							</p>
						</blockquote>
					</div>



				</div>

			</div>
		</div>
	</div>

	<!-- /Content -->

	<!-- Footer -->
	<jsp:include page="footer.jsp"></jsp:include>
	<!-- /Footer -->

</body>
</html>