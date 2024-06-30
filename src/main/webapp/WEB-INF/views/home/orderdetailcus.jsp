<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="f" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<section class="breadcrumb-section set-bg"
	data-setbg="{{ asset('Customer-assets') }}/img/banner.png">
	<div class="container">
		<div class="row">
			<div class="col-lg-12 text-center">
				<div class="breadcrumb__text">
					<h2>Customer Detail</h2>

				</div>
			</div>
		</div>
	</div>
</section>
<!-- Breadcrumb Section End -->
<section style="background-color: #eee;">
	<div class="container py-5">
		<div class="row">
			<div class="col">
				<nav aria-label="breadcrumb" class="bg-light rounded-3 p-3 mb-4">
					<ol class="breadcrumb mb-0">
						<li class="breadcrumb-item"><a href="${contextPath}/">Home</a></li>
						<li class="breadcrumb-item"><a
							href="${contextPath}/userprofile">Customer</a></li>
						<li class="breadcrumb-item" aria-current="page"><a
							href="${contextPath}/userprofile">${user.fullname }</a></li>
						<li class="breadcrumb-item active" aria-current="page">Order
							Detail</li>
					</ol>
				</nav>
			</div>
		</div>

		<div class="row">
			<div class="col-lg-4">
				<div class="card mb-4">
					<div class="card-body text-center">
						<c:choose>
							<c:when test="${!empty user.picture  }">
								<img id='img' src="${contextPath}/images/${user.picture }"
									alt="avatar" class=" img-fluid mb-2" style="width: 150px;height: 180px;">
							</c:when>
							<c:otherwise>
								<img id='img'
									src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-chat/ava3.webp"
									alt="avatar" class=" img-fluid mb-2" style="width: 150px;height: 180px;">
							</c:otherwise>
						</c:choose>
						<div class="mb-2 mt-2">
							<label for="photo">Customer </label>
							<h4>${ user.fullname }</h4>
						</div>
					</div>
				</div>
			</div>
			<div class="col-lg-8">
				<div class="card mb-4">
					<h4 class="text-center p-2">Customer Detail</h4>
					<div class="card-body">
						<div class="row">
							<div class="col-sm-3">
								<p class="mb-0">Full Name</p>
							</div>
							<div class="col-sm-9">
								<p class="text-muted mb-0">${ user.fullname }</p>
							</div>
						</div>
						<hr>

						<div class="row">
							<div class="col-sm-3">
								<p class="mb-0">Address</p>
							</div>
							<div class="col-sm-9">
								<p class="text-muted mb-0">${ user.address }</p>
							</div>
						</div>
						<hr>
						<div class="row">
							<div class="col-sm-3">
								<p class="mb-0">Phone</p>
							</div>
							<div class="col-sm-9">
								<p class="text-muted mb-0">${ user.phone }</p>
							</div>
						</div>
						<hr>
					</div>
				</div>
			</div>
			<div class="col-lg-12">
				<div class="row px-3">
					<div class="bg-white w-100">
						<h2 class="text-center p-3">
							<strong>Order Detail</strong>
						</h2>
						<table class="table table-hover table-responsive-md">
							<thead class="thead-dark">
								<tr>
									<th scope="col">OrderID</th>
									<th scope="col">Product</th>
									<th scope="col">Image</th>
									<th scope="col">Price</th>
									<th scope="col">Quantity</th>
									<th scope="col">SubTotal</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${orderdetails }" var="od">
									<tr>
										<td style="line-height: 120px">${od.orderId }</td>
										<td style="line-height: 120px">${od.product.proName }</td>
										<td><img src="${contextPath}/images/${od.product.image }"
											style="width: 100px !important; height: 120px !important"></td>
										<td style="line-height: 120px"><fmt:formatNumber
												value="${od.price} " type="currency" currencyCode="USD"></fmt:formatNumber></td>
										<td style="line-height: 120px">${od.quantity }</td>
										<td style="line-height: 120px"><fmt:formatNumber
												value="${od.price *od.quantity }" type="currency" currencyCode="USD"></fmt:formatNumber></td>
										<c:set var="total" value="${total+od.price*od.quantity}" />
									</tr>
								</c:forEach>
							</tbody>
						</table>

						<div class="d-flex justify-content-between">
							<c:choose>
								<c:when test="${order.status==1 }">
									<div>
										<h4 class="p-5">
											Order Status: <strong class="text-secondary">Wait
												Verify</strong>
										</h4>
										<button type="button" class="btn btn-danger ml-5 mb-5"
											data-toggle="modal" data-target="#exampleModal">Cancel Order</button>
									</div>
								</c:when>
								<c:when test="${order.status==2 }">
									<h4 class="p-5">
										Order Status: <strong class="text-primary">In
											delivery</strong>
									</h4>
								</c:when>
								<c:when test="${order.status==3 }">
									<h4 class="p-5">
										Order Status: <strong class="text-warning">Order
											Success</strong>
									</h4>
								</c:when>
								<c:when test="${order.status==4 }">
									<h4 class="p-5">
										Order Status: <strong class="text-danger">Order
											Canceled</strong>
									</h4>
								</c:when>
							</c:choose>
							<div>
								<h5 class="pt-5 pr-5 pl-5">
									Ship:
									<fmt:formatNumber value="${2}" type="currency" currencyCode="USD"></fmt:formatNumber>
								</h5>
								<h4 class="pr-5 pl-5 pb-5">
									<strong>TotalPrice: <fmt:formatNumber
											value="${total+2 }" type="currency" currencyCode="USD"></fmt:formatNumber></strong>
								</h4>
							</div>

						</div>

					</div>
					<div class="modal fade" id="exampleModal" tabindex="-1"
						role="dialog" aria-labelledby="exampleModalLabel"
						aria-hidden="true">
						<div class="modal-dialog" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="exampleModalLabel">Cancel Order</h5>
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
								</div>
								<div class="modal-body">Are you want to cancel order?</div>
								<div class="modal-footer">
									<a href="${contextPath}/cancelorder/${order.orderId}"
										class="btn btn-danger">Yes</a>
									<button type="button" class="btn btn-secondary"
										data-dismiss="modal">No</button>
									
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

</section>