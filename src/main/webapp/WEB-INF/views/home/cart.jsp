<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
      <c:set var="contextPath"  value="${pageContext.servletContext.contextPath}" scope="session" />
      
 <!--================Cart Area =================-->
    <section class="cart_area">
        <div class="container">
            <div class="cart_inner">
                <div class="table-responsive">
                    <table class="table">
                        <thead>
                            <tr>
                                <th scope="col">Product</th>
                                <th scope="col">Price</th>
                                <th scope="col">Quantity</th>
                                <th scope="col">Total</th>
                            </tr>
                        </thead>
                        <tbody>
                       <c:if test="${fn:length(cart) == 0}">
						<div class="col-lg-10 col-md-10">
						    <tr>
                                <td>
                                    <div class="media">
                                        <div class="d-flex">
                                           <h2 class="m-5 p-5">Không có sản phẩm</h2>
                                        </div>
                                        <div class="media-body">
                                           
                                        </div>
                                    </div>
                                </td>
                                <td>
                                    <h5><fmt:formatNumber value="${c.price}" type="currency"></fmt:formatNumber></h5>
                                </td>
                                <td>
                                    <div class="product_count">
                                        
                                       
                                    </div>
                                </td>
                                <td >
                                   
                                </td>
                                <td>
                                	
                                </td>
                            </tr>
						</div>
						</c:if>
                        <c:forEach items="${cart}" var="c">
                            <tr>
                                <td>
                                    <div class="media">
                                        <div class="d-flex">
                                            <img  src="${contextPath }/images/${c.image}" width="150px" height="150px" alt="">
                                        </div>
                                        <div class="media-body">
                                            <p>${c.proName }</p>
                                        </div>
                                    </div>
                                </td>
                                <td>
                                    <h5><fmt:formatNumber value="${c.price}" type="currency"></fmt:formatNumber></h5>
                                </td>
                                <td>
                                    <div class="product_count">
                                        <input type="number" name="qty" id="sst" maxlength="12" value="${c.quantity}" title="Quantity:"
                                            class="input-text qty" onchange="updateCart('${c.proId}',this.value)" >
                                       
                                    </div>
                                </td>
                                <td >
                                    <h5><fmt:formatNumber value="${c.price * c.quantity }" type="currency"></fmt:formatNumber></h5>
                                   <c:set var="total" value="${total+c.price*c.quantity}" />
                                </td>
                                <td>
                                	 <button class="btn btn-danger" onclick="removeItem('${c.proId}')">X</button>
                                </td>
                            </tr>
                          </c:forEach>
                          
                           
                            <tr class="bottom_button">
                                <td>
                                    <a class="gray_btn" href="${contextPath }/cart">Update Cart</a>
                                </td>
                                <td>

                                </td>
                                <td>

                                </td>
                                 <td >
                                 
                                </td>
                            </tr>
                            <tr>
                                <td>

                                </td>
                                <td>

                                </td>
                                <td>
                                    <h5>Subtotal</h5>
                                </td>
                                <td>
                                    <h5><fmt:formatNumber value="${total}" type="currency"></fmt:formatNumber></h5>
                                </td>
                            </tr>
                            <tr class="out_button_area">
                                <td>

                                </td>
                                <td>

                                </td>
                                <td>

                                </td>
                                <td>
                                    <div class="checkout_btn_inner d-flex align-items-center">
                                        <a class="gray_btn" href="${contextPath }/product-category">Continue Shopping</a>
                                          <c:if test="${fn:length(cart) != 0}">
                                        <a class="primary-btn" href="${contextPath }/checkout">Proceed to checkout</a>
                                        </c:if>
                                    </div>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </section>