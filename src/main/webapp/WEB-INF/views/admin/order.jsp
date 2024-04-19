<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="container">
	<div class="row  mt-5 mb-5">
		<div class="col-md-12 m-auto">
			<div class="card">
				<div class="card-header">
					<h1 class="card-title">List Order</h1>
				</div>
				<table class="table table-striped projects">
					<thead>
						<tr>
							<th>OrderId</th>
							<th >Customer Name</th>
							<th >Status</th>
							<th >PaymentMethod</th>				
							<th></th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${orders }" var="o">
							<tr>
								<td>${o.orderId }</td>
								<td>${o.account.fullname }</td>

								<td>
								<c:choose>
									<c:when test="${o.status==1 }">
										<span class="badge badge-secondary">Verify order</span>
									</c:when>
									<c:when test="${o.status==2 }">
										<span class="badge badge-primary">In delivery</span>
									</c:when>
									<c:when test="${o.status==3 }">
										<span class="badge badge-success">Success</span>
									</c:when>
									<c:when test="${o.status==4 }">
										<span class="badge badge-danger">Cancel order</span>
									</c:when>
								</c:choose>
								
								
								</td>
								</td>
								<td>${o.paymentMethod==1 ? "Cash":"Credit transfer"  }</td>
								<td class="project-actions	">
								<c:choose>
									<c:when test="${o.status==4 }">
									<a class="btn btn-none btn-dark btn-sm"> <i
										class="fas fa-pencil-alt"> </i> Edit
									</a>
									</c:when>	
									<c:when test="${o.status==3 }">
									<a class="btn btn-none btn-dark btn-sm"> <i
										class="fas fa-pencil-alt"> </i> Edit
									</a>
									</c:when>																	
									<c:otherwise>
									<a class="btn btn-info btn-sm"
									href="${contextPath}/admin/editorder/${o.orderId}"> <i
										class="fas fa-pencil-alt"> </i> Edit
								</a>
									</c:otherwise>
								</c:choose> 
								
								<a class="btn btn-secondary btn-sm"
									href="${contextPath}/admin/orderdetail/${o.orderId}"
									> Detail
								</a></td>
							</tr>

						</c:forEach>

					</tbody>
				</table>
				<ul class="pagination mr-2 ml-3">
					<c:choose>
						<c:when test="${currentpage > 1 }">
							<li class="page-item"><a
								href="${contextPath}/admin/product?pageno=${currentpage-1}"
								class="page-link"> &lt; </a></li>
						</c:when>
						<c:otherwise>

						</c:otherwise>
					</c:choose>
					<c:forEach var="i" begin="1" end="${totalpage}">
						<c:choose>
							<c:when test="${i==currentpage}">
								<li class="page-item active"><a class="page-link"
									href="${contextPath}/admin/product?pageno=${i}"> ${i} </a></li>
							</c:when>
							<c:otherwise>
								<li class="page-item "><a class="page-link"
									href="${contextPath}/admin/product?pageno=${i}"> ${i} </a></li>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<c:choose>
						<c:when test="${currentpage < totalpage }">
							<li class="page-item"><a
								href="${contextPath}/admin/product?pageno=${currentpage+1}"
								class="page-link"> > </a></li>
						</c:when>
						<c:otherwise>

						</c:otherwise>
					</c:choose>
				</ul>
			</div>
		</div>
	</div>
</div>