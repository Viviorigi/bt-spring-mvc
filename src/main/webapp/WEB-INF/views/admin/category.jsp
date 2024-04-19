<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="container">
	<div class="row  mt-5">
		<div class="col-md-12 m-auto">
			<div class="card">
				<div class="card-header">
					<h1 class="card-title">List Category</h1>
					<a href="${contextPath}/admin/addcategory"
						class="btn btn-success float-right">Add new Category</a>
						
				</div>	
				<table class="table table-striped projects">
					<thead>
						<tr>
							<th style="width: 5%">Id</th>
							<th style="width: 30%">Category Name</th>
							<th style="width: 15%" class="text-center">Status</th>
							<th style="width: 25%">Created Date</th>
							<th style="width: 20%"></th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${categories }" var="c">
							<tr>
								<td>${c.id }</td>
								<td>${c.categoryName }</td>
								<td class="project-state"><span class="badge  ${c.status?"badge-success":"badge-danger" }">${c.status?"Active":"InActive" }
								</span></td>
								<td><fmt:formatDate type="date" pattern="dd/MM/yyyy"
										value="${c.createDate }" /></td>
								<td class="project-actions text-right"><a
									class="btn btn-info btn-sm"
									href="${contextPath}/admin/editcategory/${c.id}"> <i
										class="fas fa-pencil-alt"> </i> Edit
								</a> <a class="btn btn-danger btn-sm"
									href="${contextPath}/admin/deleteCategory/${c.id}"
									onclick="return confirm('Do you want to delete?')"> <i
										class="fas fa-trash"> </i> Delete
								</a></td>
							</tr>
						</c:forEach>

					</tbody>
				</table>
				<p>Page:</p>
				<ul class="pagination mr-2 ml-3">
					<c:choose>
						<c:when test="${currentpage > 1 }">
							<li class="page-item"><a
								href="${contextPath}/admin/category?pageno=${currentpage-1}"
								class="page-link"> &lt; </a></li>
						</c:when>
						<c:otherwise>

						</c:otherwise>
					</c:choose>
					<c:forEach var="i" begin="1" end="${totalpage}">
						<c:choose>

							<c:when test="${i==currentpage}">
								<li class="page-item active"><a class="page-link"
									href="${contextPath}/admin/category?pageno=${i}"> ${i} </a></li>
							</c:when>
							<c:otherwise>
								<li class="page-item"><a class="page-link"
									href="${contextPath}/admin/category?pageno=${i}"> ${i} </a></li>
							</c:otherwise>
						</c:choose>
					</c:forEach>

					<c:choose>
						<c:when test="${currentpage < totalpage }">
							<li class="page-item"><a
								href="${contextPath}/admin/category?pageno=${currentpage+1}"
								class="page-link"> &gt; </a></li>
						</c:when>
						<c:otherwise>

						</c:otherwise>
					</c:choose>
				</ul>
			</div>
		</div>
	</div>
</div>