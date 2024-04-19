<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="container">
	<div class="row  mt-5 mb-5">
		<div class="col-md-12 m-auto">
			<div class="card">
				<div class="card-header">
					<h1 class="card-title">List Product</h1>
					<a href="${contextPath}/admin/addproduct"
						class="btn btn-success float-right">Add new product</a>
				</div>
				<table class="table table-striped projects">
					<thead>
						<tr>
							<th style="width: 3%">id</th>
							<th style="width: 7%">Name</th>
							<th style="width: 20%">Price</th>
							<th style="width: 5%">Status</th>
							<th style="width: 22%">Image</th>
							<th style="width: 10%">CateName</th>
							<th style="width: 13%">Created Date</th>
							<th></th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${products }" var="p">
							<tr>
								<td>${p.proId }</td>
								<td>${p.proName }</td>
								<td><del>
										<fmt:formatNumber value="${p.oldPrice}" type="currency"></fmt:formatNumber>
									</del>/ <fmt:formatNumber value="${p.price }" type="currency"></fmt:formatNumber>
								</td>
								<td><span class="badge  ${p.status?"badge-success":"badge-danger" }">${p.status?"InStock":"OutOfStock" }
								</span></td>
								</td>
								<td><img src="${contextPath }/images/${ p.image}"
									width="100%"></td>
								<td>${p.category.categoryName }</td>
								<td><fmt:formatDate type="date" pattern="dd/MM/yyyy"
										value="${p.createDate }" /></td>

								<td class="project-actions	"><a class="btn btn-info btn-sm"
									href="${contextPath}/admin/editproduct/${p.proId}"> <i
										class="fas fa-pencil-alt"> </i> Edit
								</a> <a class="btn btn-danger btn-sm"
									href="${contextPath}/admin/deleteproduct/${p.proId}"
									onclick="return confirm('Do you want to delete?')"> <i
										class="fas fa-trash"> </i> Delete
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