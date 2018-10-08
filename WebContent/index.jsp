<!-------------------------------------------------
---		Advance Web Application Development		---
---				Yash Paragkumar Shah			---
---					820859111 					---
---												---
---					Project 2					---
--------------------------------------------------->
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="vo.CategoryVO"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Shital Jewellery</title>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<br />
	<!-- Home Page Main Content -->
	<div class="container">
		<div id="post-content">
			<div class="">
				<div style="overflow: hidden" class="form-group">
					<form method="get" action="IndexServlet">
						<input name="search_query"
							placeholder="Enter Product Description to search..."
							style="width: 90%; float: left; border: 1px solid #4FBFA8;"
							type="text" class="form-control col-md-11" required="required" />
						<input type="hidden" name="flag" value="search_userQuery">



						<button type="submit" style="margin-left: 8px; float: right"
							class="btn btn-template-outlined ">
							<i class="fas fa-search"></i> Search
						</button>

						<!-- 				<button type="submit">
						<i
						style="float: left; height:1.8em; width:1.8em; margin-left: 8px; margin-top: 5px" class="fas fa-search">
						</i>
						</button> -->

					</form>
				</div>
			</div>
			<p>
				<img src="img/home-1.jpg" alt="HomeImage" class="img-fluid">
			</p>

			<!-- Seperator -->
			<br />
			<hr>
			<br />

			<!-- All best products from each category -->
			<!-- High Jewellery 2 Items -->
			<c:forEach items="${allCat_list}" var="catItem" varStatus="status">
				<div>
					<c:if test="${bestTwoList_list.get(status.index).size() >= 2}">
						<p class="div-center amitaFont fontSize42">

							${catItem.getCatName()}<br>
						</p>
						<div class="row portfolio">
							<div class="col-md-6">
								<div class="box-image">
									<div class="image">
										<img
											src="${bestTwoList_list.get(status.index).get(0).getImagePath()}"
											alt="" class="img-fluid">
										<div
											class="overlay d-flex align-items-center justify-content-center">
											<div class="content">
												<div class="name">
													<h3>
														<a
															href="ProductServlet?flag=search_skuSpecificProd&sku=${bestTwoList_list.get(status.index).get(0).getSku()}"
															class="color-white">
															${bestTwoList_list.get(status.index).get(0).getDesc()}</a>
													</h3>
												</div>
												<div class="text">
													<p class="d-none d-sm-block">${bestTwoList_list.get(status.index).get(0).getFeatures()}</p>
													<p class="buttons">
														<a
															href="ProductServlet?flag=search_skuSpecificProd&sku=${bestTwoList_list.get(status.index).get(0).getSku()}"
															class="btn btn-template-outlined-white">View</a><a
															href="CartServlet?flag=addToCart&sku=${bestTwoList_list.get(status.index).get(0).getSku()}&redirect=cart.jsp"
															class="btn btn-template-outlined-white">Add to Cart</a>
													</p>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="col-md-6">
								<div class="box-image">
									<div class="image">
										<img
											src="${bestTwoList_list.get(status.index).get(1).getImagePath()}"
											alt="" class="img-fluid">
										<div
											class="overlay d-flex align-items-center justify-content-center">
											<div class="content">
												<div class="name">
													<h3>
														<a
															href="ProductServlet?flag=search_skuSpecificProd&sku=${bestTwoList_list.get(status.index).get(1).getSku()}"
															class="color-white">
															${bestTwoList_list.get(status.index).get(1).getDesc()}</a>
													</h3>
												</div>
												<div class="text">
													<p class="d-none d-sm-block">${bestTwoList_list.get(status.index).get(1).getFeatures()}</p>
													<p class="buttons">
														<a
															href="ProductServlet?flag=search_skuSpecificProd&sku=${bestTwoList_list.get(status.index).get(1).getSku()}"
															class="btn btn-template-outlined-white">View</a><a
															href="CartServlet?flag=addToCart&sku=${bestTwoList_list.get(status.index).get(1).getSku()}&redirect=cart.jsp"
															class="btn btn-template-outlined-white">Add to Cart</a>
													</p>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<!-- Seperator -->
						<br />
						<br />
					</c:if>
				</div>
			</c:forEach>

		</div>
		<!-- /Content  -->
	</div>
	<!-- /Container -->
	<!-- /Home Page Main Content -->

	<jsp:include page="footer.jsp"></jsp:include>
</body>
<!-- ------- -->
<!-- The End -->
<!-- ------- -->
</html>