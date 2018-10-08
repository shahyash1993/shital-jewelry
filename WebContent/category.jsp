<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
    
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
              <h1 class="h2">High Jewellery</h1>
            </div>
          </div>
        </div>
      </div>
<!-- /Category Title -->

<!-- Content -->
<div id="content">
        <div class="container">
          <section class="bar">
            <div class="row">
              <div class="col-md-12">
                <div class="heading">
                  <h2>${catName}</h2>
                </div>
              </div>
            </div>
            <div class="row portfolio text-center">
              
              <c:forEach items="${catSpecificProd_list}" var="prod_item" varStatus="counter">
              <div class="col-md-4">
                <div class="box-image">
                  <div class="image"><img src="${prod_item.getImagePath()}" alt="" class="img-fluid">
                    <div class="overlay d-flex align-items-center justify-content-center">
                      <div class="content">
                        <div class="name mb-small">
                          <h3><a href="ProductServlet?flag=search_skuSpecificProd&sku=${prod_item.getSku()}" class="color-white">${prod_item.getDesc()}</a></h3>
                        </div>
                        <div class="text">
                          <p class="">${prod_item.getFeatures()}</p>
                          <p class="buttons">
                          <a href="ProductServlet?flag=search_skuSpecificProd&sku=${prod_item.getSku()}" class="btn btn-template-outlined-white">View</a>
                          <a href="CartServlet?flag=addToCart&sku=${prod_item.getSku()}&redirect=cart.jsp" class="btn btn-template-outlined-white">Add to Cart</a></p>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              </c:forEach>
            </div>
          </section>
        </div>
            </div>
<!-- /Content -->

<!-- Footer -->
<jsp:include page="footer.jsp"></jsp:include>
<!-- /Footer -->
</body>

<script type="text/javascript">
/* 		$("[name='data-sku']").on(
				'click',
				function(event) {
					console.log('event: '+event.target);
					console.log('event: '+event.srcElement);
					console.log('event: '+event.relatedTarget);
					console.log('event: '+event.originalTarget);
					
					var index = $("[name='data-sku']")[1].getAttribute('data-counter');
					var sku = $("[name='data-sku']")[index].id;
					
					console.log('$(#addToCart_a).val(): '+ $('#addToCart_a').val());

					$.ajax({
						url : 'CartServlet?flag=addToCart&sku=' + sku,
						success : function(result) {
							alert("Result: "+result);
						}
					}).done(function() {
						alert("success");
					}).fail(function() {
						alert("error");
					});
				}); */
	</script>
	
</html>