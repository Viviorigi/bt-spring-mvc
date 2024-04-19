<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="container">
	<div class="col-lg-12">
		<div class="invoice p-3 mb-3 mt-5">
			<!-- info row -->
			<div class="row invoice-info">
				<div class="col-sm-4 invoice-col">
					From
					<address>
						<strong>Admin, Inc.</strong><br> 795 Folsom Ave, Suite 600<br>
						San Francisco, CA 94107<br> Phone: (804) 123-5432<br>
						Email: info@almasaeedstudio.com
					</address>
				</div>
				<!-- /.col -->
				<div class="col-sm-4 invoice-col">
					To
					<address>
						<strong>${order.account.fullname }</strong><br> ${order.account.address }<br>
						 Phone: ${order.account.phone }
					</address>
				</div>
				<!-- /.col -->
				<div class="col-sm-4 invoice-col">
				<br>
					<b>Order ID:</b> ${order.orderId }
				</div>
				<!-- /.col -->
			</div>
			<!-- /.row -->

			<!-- Table row -->
			<div class="row">
				<div class="col-12 table-responsive">
					<table class="table table-striped">
						<thead>
							<tr>
								<th>Qty</th>
								<th>Product</th>
								<th>Price</th>
								<th>Subtotal</th>
							</tr>
						</thead>
						<tbody>
						<c:forEach items="${orderdetails }" var="od">
							<tr>
								<td>${od.quantity }</td>
								<td>${od.product.proName }</td>
								<td><fmt:formatNumber value="${od.price}" type="currency"></fmt:formatNumber></td>
								<td><fmt:formatNumber value="${od.price * od.quantity}" type="currency"></fmt:formatNumber></td>
								  <c:set var="total" value="${total+od.price*od.quantity}" />
							</tr>
						</c:forEach>
							
						</tbody>
					</table>
				</div>
				<!-- /.col -->
			</div>
			<!-- /.row -->

			<div class="row">
				<!-- accepted payments column -->
				<div class="col-6">
					<p class="lead">Payment Methods:</p>
					<p>${order.paymentMethod==1 ?"Cash":"Credit Transfer" }</p>
				</div>
				<!-- /.col -->
				<div class="col-6">
					<div class="table-responsive">
						<table class="table">
							<tr>
								<th style="width: 50%">Subtotal:</th>
								<td><fmt:formatNumber value="${total}" type="currency"></fmt:formatNumber></td>
							</tr>
							<tr>
								<th>Shipping:</th>
								<td><fmt:formatNumber value="50000" type="currency"></fmt:formatNumber></td>
							</tr>
							<tr>
								<th>Total:</th>
								<td><fmt:formatNumber value="${total+50000}" type="currency"></fmt:formatNumber></td>
							</tr>
						</table>
					</div>
				</div>
				<!-- /.col -->
			</div>
			<!-- /.row -->

		</div>
	</div>
</div>
