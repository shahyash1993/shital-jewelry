<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
              <p class="text-muted lead">You currently have 3 item(s) in your cart.</p>
            </div>
            <div id="basket" class="col-lg-9">
              <div class="box mt-0 pb-0 no-horizontal-padding">
                <form method="post" action="shop-checkout1.html">
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
                        <tr>
                          <td><a href="#"><img src="img/hj.jpg" alt="White Blouse Armani" class="img-fluid"></a></td>
                          <td><a href="#">White Blouse Armani</a></td>
                          <td>
                            <input type="number" value="2" class="form-control">
                          </td>
                          <td>$123.00</td>
                          
                          <td>$246.00</td>
                          <td><a href="#"><i class="fas fa-trash-alt"></i></a></td>
                        </tr>
                        <tr class="ml-auto mr-auto">
                          <td class="ml-auto"><a href="#"><img src="img/hj.jpg" alt="Black Blouse Armani" class="img-fluid"></a></td>
                          <td><a href="#">Black Blouse Armani</a></td>
                          <td>
                            <input type="number" value="1" class="form-control">
                          </td>
                          <td>$200.00</td>
                          
                          <td>$200.00</td>
                          <td><a href="#"><i class="fas fa-trash-alt"></i></a></td>
                        </tr>
                      </tbody>
                      <tfoot>
                        <tr>
                          <th colspan="4">Total</th>
                          <th colspan="2">$446.00</th>
                        </tr>
                      </tfoot>
                    </table>
                  </div>
                  <div class="box-footer d-flex justify-content-between align-items-center">
                    <div class="left-col"><a href="shop-category.html" class="btn btn-secondary mt-0"><i class="fa fa-chevron-left"></i> Continue shopping</a></div>
                    <div class="right-col">
                      
                      <button type="submit" class="btn btn-template-outlined">Proceed to checkout <i class="fa fa-chevron-right"></i></button>
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
                <p class="text-muted">Shipping and additional costs are calculated based on the values you have entered.</p>
                <div class="table-responsive">
                  <table class="table">
                    <tbody>
                      <tr>
                        <td>Order subtotal</td>
                        <th>$446.00</th>
                      </tr>
                      <tr>
                        <td>Shipping and handling</td>
                        <th>$10.00</th>
                      </tr>
                      <tr>
                        <td>Tax</td>
                        <th>$0.00</th>
                      </tr>
                      <tr class="total">
                        <td>Total</td>
                        <th>$456.00</th>
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
</html>