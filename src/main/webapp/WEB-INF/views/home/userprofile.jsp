<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="f" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- Breadcrumb Section Begin -->
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
						<li class="breadcrumb-item"><a href="${contextPath}/userprofile">Customer</a></li>
						<li class="breadcrumb-item active" aria-current="page">${user.fullname }</li>
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
	                        	<img id='img' src="${contextPath}/images/${user.picture }" alt="avatar"
	                          class=" img-fluid mb-2" style="width: 150px;height: 180px;">
                        	</c:when>
                        	<c:otherwise>
                        	<img id='img' src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-chat/ava3.webp" alt="avatar"
	                          class=" img-fluid mb-2" style="width: 150px;;height: 180px;">
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
						<div class="row justify-content-center">

							<a href="${contextPath }/edituserprofile" class="btn btn-success btn-lg"> Update Account
							</a>
							<!-- Modal -->
						</div>
					</div>
				</div>

			</div>
			<div class="col-lg-12">
				<div class="row px-3">
					<div class="bg-white w-100">
						<table class="table">
							<thead class="thead-dark">
								<tr>
									<th scope="col">OrderId</th>
									<th scope="col">Full Name</th>
									<th scope="col">Payment Method</th>
									<th scope="col">Status</th>
									<th scope="col">Info</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${order }" var="o">
                                    <tr>
                                        <td >${o.orderId }</td>
                                        <td>${user.fullname}</td>
                                      	<td>${o.paymentMethod==1?"Cash":"Credit Transfer"}</td>
                                      	<c:choose>
                                      		<c:when test="${o.status==1 }">
                                      			<td class="text-secondary">Verify </td>
                                      		</c:when>
                                      		<c:when test="${o.status==2 }">
                                      			<td class="text-primary">In delivery</td>
                                      		</c:when>
                                      		<c:when test="${o.status==3 }">
                                      			<td class="text-success">Success </td>
                                      		</c:when>
                                      		<c:when test="${o.status==4 }">
                                      			<td class="text-danger">Canceled </td>
                                      		</c:when>
                                      	</c:choose>
                                        <td><a href="${contextPath}/customer-orderdetail/${o.orderId}" class="btn btn-success">Detail</a></td>
                                    </tr>
                           	</c:forEach>
							</tbody>
						</table>
					</div>

				</div>
			</div>
		</div>
	</div>
</section>