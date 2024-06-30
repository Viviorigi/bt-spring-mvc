<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
      <c:set var="contextPath"  value="${pageContext.servletContext.contextPath}" scope="session" />
 <!--================Checkout Area =================-->
    <section class="checkout_area section_gap">
        <div class="container">
        <form method="post" action="${contextPath}/postCheckout">
            <div class="billing_details">
                <div class="row">
                    <div class="col-lg-8">
                        <h3>Billing Details</h3>
                        <div class="row contact_form">
                         <input type="text" name="username" value="${user.username}" hidden>
                        <input type="text" name="userid" value="${user.id}" hidden>
                            <div class="col-md-12 form-group">
                                <input type="text" class="form-control" id="company" name="fullname" value="${user.fullname}" placeholder="FullName">
                            </div>
                            <div class="col-md-12 form-group p_star">
                                <input type="text" class="form-control" id="city" name="address" value="${user.address}">
                            </div>
                            <div class="col-md-12 form-group">
                                <input type="text" class="form-control" id="zip" name="phone" placeholder="phone" value="${user.phone}">
                            </div>
                            <div class="col-md-12 form-group">
                                <div class="creat_account">
                                    <h3>Shipping Details</h3>
                                </div>
                                <textarea class="form-control" name="orderNote" id="message" rows="1" placeholder="Order Notes"></textarea>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4">
                    
                        <div class="order_box">
                         
                            <h2>Your Order</h2>
                           
                            <ul class="list">
                                <li><a href="#">Product <span>Total</span></a></li>
                              <c:forEach items="${cart}" var="c">
                                <li><a href="${contextPath }/product-detail/${c.slug}">${c.proName }<span class="middle">x ${c.quantity}</span> <span class="last"><fmt:formatNumber value="${c.price * c.quantity }" type="currency" currencyCode="USD"></fmt:formatNumber></span></a></li>
                              <c:set var="total" value="${total+c.price*c.quantity}" />
                              </c:forEach>
                            </ul>
                            
                            <ul class="list list_2">
                                <li><a href="#">Subtotal <span><fmt:formatNumber value="${total}" type="currency" currencyCode="USD"></fmt:formatNumber></span></a></li>      
                                <li><a href="#">Total <span><fmt:formatNumber value="${total}" type="currency" currencyCode="USD"></fmt:formatNumber></span></a></li>
                            </ul>
                            
                            <div class="payment_item ">
                     			 <label class="w-100 "><h3>Check payments :</h3></label>
                                    <select name="paymentMethod" class="mb-3 float-none">
                                    	<option value="1">Cash</option>
                                    	<option value="2">Credit transfer</option>
                                    </select>
                                      
                          
                            
                            <button class="primary-btn btn text-decoration-none w-100">Proceed to CheckOut</button>
                        </div>
                    </div>
                    
                </div>      
            </div>
            </form>
        </div>
    </section>