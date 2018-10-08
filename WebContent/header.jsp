<!-- Header  -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- Required JS for fontAwesome-->
<script defer src="js/all.js"
	integrity="sha384-8iPTk2s/jMVj81dnzb/iFR2sdA7u06vHJyyLlAd4snFpCl/SnyUjRrbdJsw1pGIl"
	crossorigin="anonymous"></script>


<!-- Bootstrap CSS-->
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/bootstrap-select.min.css">
<!-- Font Awesome CSS-->
<link rel="stylesheet" href="css/font-awesome.min.css">
<!-- Google fonts - Roboto-->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Roboto:300,400,700">
<!-- theme stylesheet-->
<link rel="stylesheet" href="css/style.default.css"
	id="theme-stylesheet">

<!-- Font Amita css">-->
<link rel="stylesheet" href="css/font_amita.css" rel='stylesheet'>

<!-- /Required CSS -->
<div id="stickyHeader" class="">
	<div class="nav-holder make-sticky">
		<div id="navbar" role="navigation" class="navbar navbar-expand-lg">
			<div id="navigation" class="navbar-collapse collapse">
				<ul class="nav navbar-nav ml-auto">

					<li class=""><a href="proj2.html"> 
					<i class="fas fa-home"></i> Home<b class="caret"></b></a>
					</li>

					<li class="nav-item dropdown"><a 
						data-toggle="dropdown" class="dropdown-toggle"><i
							class="fas fa-user"></i> My Account<b class="caret"></b></a>
						<ul class="dropdown-menu">
							<li class="dropdown-item"><a 
								class="nav-link">Coming soon...</a></li>
						</ul></li>

					<li class="nav-item dropdown"><a 
						data-toggle="dropdown" class="dropdown-toggle"><i class="fas fa-phone-square"></i> Contact Us<b class="caret"></b></a>
						<ul class="dropdown-menu">
							<li class="dropdown-item"><a 
								class="nav-link">Coming soon...</a></li>
						</ul></li>


<!-- 					<li class=""><a href="CartServlet?flag=cart_displayAll"> -->
					<li class=""><a href="cart.jsp">
						<i class="fas fa-shopping-cart"></i> Cart<b class="caret"></b></a>
						</li>
				</ul>
			</div>
		</div>
	</div>
	<!-- /Header  -->

	<!-- Logo -->
	<div class="div-center">
		<a href="proj2.html"> <img src="img/sj-long-logo-h500.jpg"
			alt="Shital Jewellers logo" class="d-none d-md-inline-block">
		</a>
	</div>
	<!-- /Logo -->

	<!-- Cat Bar -->
	<div style="width: 100%; text-align: center">
		<div class="div-center nav-holder make-sticky">
			<div id="navbar" role="navigation" class="navbar navbar-expand-lg">
				<div id="navigation" class="navbar-collapse collapse">
					<ul class="nav navbar-nav ml-auto mr-auto">


						<!-- 1> High Jewel-->
						<li class="categoryBar nav-item dropdown"><a
							 data-toggle="dropdown"
							class="dropdown-toggle">High Jewellery<b class="caret"></b></a>
							<ul class="dropdown-menu">
								<c:forEach items="${allCat_list}" var="catItem">
									<li class="dropdown-item"><a
										href="CategoryServlet?flag=search_catSpecificProd&catName=${catItem.getCatName()}&catID=${catItem.getCatID()}"
										class="nav-link">${catItem.getCatName()}</a></li>
								</c:forEach>
							</ul></li>

						<!-- 2> Jewellery -->
						<li class="categoryBar nav-item dropdown"><a
							 data-toggle="dropdown"
							class="dropdown-toggle">Jewellery<b class="caret"></b></a>
							<ul class="dropdown-menu">
								<li class="dropdown-item"><a 
									class="nav-link">Coming Soon...</a></li>
							</ul></li>

						<!-- 3> Bridal -->
						<li class="categoryBar nav-item dropdown"><a
							 data-toggle="dropdown"
							class="dropdown-toggle">Bridal<b class="caret"></b></a>
							<ul class="dropdown-menu">
								<li class="dropdown-item"><a 
									class="nav-link">Coming Soon...</a></li>
							</ul></li>

						<!-- 4> Watches -->
						<li class="categoryBar nav-item dropdown"><a
							 data-toggle="dropdown"
							class="dropdown-toggle">Watches<b class="caret"></b></a>
							<ul class="dropdown-menu">
								<li class="dropdown-item"><a 
									class="nav-link">Coming Soon...</a></li>
							</ul></li>

						<!-- 5> Accessories -->
						<li class="categoryBar nav-item dropdown"><a
							 data-toggle="dropdown"
							class="dropdown-toggle">Accessories<b class="caret"></b></a>
							<ul class="dropdown-menu">
								<li class="dropdown-item"><a 
									class="nav-link">Coming Soon...</a></li>
							</ul></li>

						<!-- 6> Gifts -->
						<li class="categoryBar nav-item dropdown"><a
							 data-toggle="dropdown"
							class="dropdown-toggle">Gifts<b class="caret"></b></a>
							<ul class="dropdown-menu">
								<li class="dropdown-item"><a 
									class="nav-link">Coming Soon...</a></li>
							</ul></li>
					</ul>
				</div>
				<div id="search" class="collapse clearfix">
					<form role="search" class="navbar-form">
						<div class="input-group">
							<input type="text" placeholder="Search" class="form-control"><span
								class="input-group-btn">
								<button type="submit" class="btn btn-template-main">
									<i class="fa fa-search"></i>
								</button>
							</span>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<!-- /Cat Bar-->
</div>