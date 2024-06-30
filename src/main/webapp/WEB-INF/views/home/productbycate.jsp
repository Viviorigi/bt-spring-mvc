<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="contextPath"
	value="${pageContext.servletContext.contextPath}" scope="session" />
<div class="container">
	<div class="row">
		<div class="col-xl-3 col-lg-4 col-md-5">
			<div class="sidebar-categories">
				<div class="head">Browse Categories</div>
				<ul class="main-categories">
					<c:forEach items="${category}" var="c">
						<li class="main-nav-list"><a
							href="${contextPath }/productbycate?cateid=${c.id}"
							aria-controls="fruitsVegetable"><span
								class="lnr lnr-arrow-right"></span>${c.categoryName }</span></a></li>
					</c:forEach>
				</ul>
			</div>
			<form action="" method="get">
				<div class="sidebar-filter mt-50">
					<div class="top-filter-head">Product Filters</div>
					<div class="common-filter">
						<div class="price-range-area">
							<input type="hidden" name="cateid" value="${cateid}">
							<div class="value-wrapper ">
								<div class="price">Price:</div>
								<%
								if (request.getParameter("searchName") != null) {
								%>
								<input type="hidden" name="searchName"
									value="<%=request.getParameter("searchName")%>">
								<%
								}
								%>
								<div>
									<%
									if (request.getParameter("pricefrom") != null) {
									%>
									<input type="number" name="pricefrom"
										value="<%=request.getParameter("pricefrom")%>">
									<%
									} else {
									%>
									<input type="number" name="pricefrom" value="0">
									<%
									}
									%>
								</div>
								<div class="to">to</div>
								<div>
									<%
									if (request.getParameter("priceto") != null) {
									%>
									<input type="number" name="priceto"
										value="<%=request.getParameter("priceto")%>">
									<%
									} else {
									%>
									<input type="number" name="priceto" value="500">
									<%
									}
									%>
									<%
									if (request.getParameter("sort") != null) {
									%>
									<input type="hidden" name="sort"
										value="<%=request.getParameter("sort")%>">
									<%
									}
									%>
								</div>
								<div class="head">
									<button class="btn btn-primary" type="submit">Filter</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</form>
		</div>
		<div class="col-xl-9 col-lg-8 col-md-7">
			<!-- Start Filter Bar -->
			<div class="filter-bar d-flex  justify-content-between">
				<div class="sorting">
					<%-- Sap xep khi co khoang gia va co teim kiem  --%>
					<%
					if (request.getParameter("pricefrom") != null && request.getParameter("searchName") == null) {
					%>
					<select onchange="location = this.value;">
						<option
							value="${contextPath }/productbycate?&cateid=${cateid}&pricefrom=<%= request.getParameter("pricefrom") %>&priceto=<%= request.getParameter("priceto") %>&sort=">Default</option>
						<option
							value="${contextPath }/productbycate?&cateid=${cateid}&pricefrom=<%= request.getParameter("pricefrom") %>&priceto=<%= request.getParameter("priceto") %>&sort=A-Z">Sort
							A-Z</option>
						<option
							value="${contextPath }/productbycate?cateid=${cateid}&pricefrom=<%= request.getParameter("pricefrom") %>&priceto=<%= request.getParameter("priceto") %>&sort=Z-A"">Sort
							Z-A</option>
						<option
							value="${contextPath }/productbycate?cateid=${cateid}&pricefrom=<%= request.getParameter("pricefrom") %>&priceto=<%= request.getParameter("priceto") %>&sort=priceasc">Price
							ASC</option>
						<option
							value="${contextPath }/productbycate?cateid=${cateid}&pricefrom=<%= request.getParameter("pricefrom") %>&priceto=<%= request.getParameter("priceto") %>&sort=pricedesc">Price
							DESC</option>
					</select>
					<%-- Sap xep khi co tim kiem theo ten ket hop voi khoang gia --%>
					<%
					} else if (request.getParameter("pricefrom") != null && request.getParameter("searchName") != null) {
					%>
					<select onchange="location = this.value;">
						<option
							value="${contextPath }/productbycate?cateid=${cateid}&searchName=<%= request.getParameter("searchName") %>&pricefrom=<%= request.getParameter("pricefrom") %>&priceto=<%= request.getParameter("priceto") %>&sort=">Default</option>
						<option
							value="${contextPath }/productbycate?cateid=${cateid}&searchName=<%= request.getParameter("searchName") %>&pricefrom=<%= request.getParameter("pricefrom") %>&priceto=<%= request.getParameter("priceto") %>&sort=A-Z">Sort
							A-Z</option>
						<option
							value="${contextPath }/productbycate?cateid=${cateid}&searchName=<%= request.getParameter("searchName") %>&pricefrom=<%= request.getParameter("pricefrom") %>&priceto=<%= request.getParameter("priceto") %>&sort=Z-A"">Sort
							Z-A</option>
						<option
							value="${contextPath }/productbycate?cateid=${cateid}&searchName=<%= request.getParameter("searchName") %>&pricefrom=<%= request.getParameter("pricefrom") %>&priceto=<%= request.getParameter("priceto") %>&sort=priceasc">Price
							ASC</option>
						<option
							value="${contextPath }/productbycate?cateid=${cateid}&searchName=<%= request.getParameter("searchName") %>&pricefrom=<%= request.getParameter("pricefrom") %>&priceto=<%= request.getParameter("priceto") %>&sort=pricedesc">Price
							DESC</option>
					</select>
					<%-- Sap xep khi co tim kiem theo ten --%>
					<%
					} else if (request.getParameter("searchName") != null) {
					%>
					<select onchange="location = this.value;">
						<option
							value="${contextPath }/productbycate?cateid=${cateid}&searchName=<%= request.getParameter("searchName") %>&sort=">Default</option>
						<option
							value="${contextPath }/productbycate?cateid=${cateid}&searchName=<%= request.getParameter("searchName") %>&sort=A-Z">Sort
							A-Z</option>
						<option
							value="${contextPath }/productbycate?cateid=${cateid}&searchName=<%= request.getParameter("searchName") %>&sort=Z-A"">Sort
							Z-A</option>
						<option
							value="${contextPath }/productbycate?cateid=${cateid}&searchName=<%= request.getParameter("searchName") %>&sort=priceasc">Price
							ASC</option>
						<option
							value="${contextPath }/productbycate?cateid=${cateid}&searchName=<%= request.getParameter("searchName") %>&sort=pricedesc">Price
							DESC</option>
					</select>
					<%-- Sap xep mac dinh  --%>
					<%
					} else {
					%>
					<select onchange="location = this.value;">
						<option
							value="${contextPath }/productbycate?cateid=${cateid}&sort=">Default</option>
						<option
							value="${contextPath }/productbycate?cateid=${cateid}&sort=A-Z">Sort
							A-Z</option>
						<option
							value="${contextPath }/productbycate?cateid=${cateid}&sort=Z-A"">Sort
							Z-A</option>
						<option
							value="${contextPath }/productbycate?cateid=${cateid}&sort=priceasc">Price
							ASC</option>
						<option
							value="${contextPath }/productbycate?cateid=${cateid}&sort=pricedesc">Price
							DESC</option>
					</select>
					<%
					}
					%>
				</div>

				<div class="find mt-3">
					<form action="">
						<div class="input-group rounded">
							<input type="hidden" name="cateid" value="${cateid }"> <input
								type="search" name="searchName" class="form-control rounded"
								placeholder="SearchName" aria-label="Search"
								aria-describedby="search-addon" />
							<button class="input-group-text border-0" id="search-addon">
								<i class="lnr lnr-magnifier"></i>
							</button>
							<%
							if (request.getParameter("pricefrom") != null) {
							%>
							<input type="hidden" name=pricefrom
								value="<%=request.getParameter("pricefrom")%>">
							<%
							}
							%>
							<%
							if (request.getParameter("priceto") != null) {
							%>
							<input type="hidden" name="priceto"
								value="<%=request.getParameter("priceto")%>">
							<%
							}
							%>
							<%
							if (request.getParameter("sort") != null) {
							%>
							<input type="hidden" name="sort"
								value="<%=request.getParameter("sort")%>">
							<%
							}
							%>
						</div>
					</form>
				</div>

				<div class="pagination">

					<c:choose>
						<c:when test="${currentpage > 1 }">
							<%
							if (request.getParameter("pricefrom") != null && request.getParameter("sort") != null
									&& request.getParameter("searchName") != null) {
							%>
							<a
								href="${contextPath}/productbycate?cateid=${cateid}&searchName=<%= request.getParameter("searchName") %>&pricefrom=<%= request.getParameter("pricefrom") %>&priceto=<%= request.getParameter("priceto") %>&sort=<%=request.getParameter("sort")%>&page=${currentpage-1}"
								class="prev-arrow"><i class="fa fa-long-arrow-left"
								aria-hidden="true"></i></a>
							<%
							} else if (request.getParameter("searchName") != null && request.getParameter("sort") != null
									&& request.getParameter("pricefrom") == null) {
							%>
							<a
								href="${contextPath}/productbycate?cateid=${cateid}&searchName=<%= request.getParameter("searchName") %>&sort=<%=request.getParameter("sort")%>&page=${currentpage-1}"
								class="prev-arrow"><i class="fa fa-long-arrow-left"
								aria-hidden="true"></i></a>
							<%
							} else if (request.getParameter("searchName") != null && request.getParameter("pricefrom") != null
									&& request.getParameter("sort") == null) {
							%>
							<a
								href="${contextPath}/productbycate?cateid=${cateid}&searchName=<%= request.getParameter("searchName") %>&pricefrom=<%= request.getParameter("pricefrom") %>&priceto=<%= request.getParameter("priceto") %>&page=${currentpage-1}"
								class="prev-arrow"><i class="fa fa-long-arrow-left"
								aria-hidden="true"></i></a>
							<%
							} else if (request.getParameter("pricefrom") != null && request.getParameter("sort") != null) {
							%>
							<a
								href="${contextPath}/productbycate?cateid=${cateid}&pricefrom=<%= request.getParameter("pricefrom") %>&priceto=<%= request.getParameter("priceto") %>&sort=<%=request.getParameter("sort")%>&page=${currentpage-1}"
								class="prev-arrow"><i class="fa fa-long-arrow-left"
								aria-hidden="true"></i></a>
							<%
							} else if (request.getParameter("pricefrom") != null) {
							%>
							<a class=""
								href="${contextPath}/productbycate?cateid=${cateid}&pricefrom=<%= request.getParameter("pricefrom") %>&priceto=<%= request.getParameter("priceto") %>&page=${currentpage-1}">
								<i class="fa fa-long-arrow-left" aria-hidden="true"></i>
							</a>
							<%
							} else if (request.getParameter("searchName") != null) {
							%>
							<a class=""
								href="${contextPath}/productbycate?cateid=${cateid}&searchName=<%=request.getParameter("searchName")%>&page=${currentpage-1}">
								<i class="fa fa-long-arrow-left" aria-hidden="true"></i>
							</a>
							<%
							} else if (request.getParameter("sort") != null) {
							%>
							<a class=""
								href="${contextPath}/productbycate?cateid=${cateid}&sort=<%=request.getParameter("sort")%>&page=${currentpage-1}">
								<i class="fa fa-long-arrow-left" aria-hidden="true"></i>
							</a>
							<%
							} else {
							%>
							<a
								href="${contextPath}/productbycate?cateid=${cateid}&page=${currentpage-1}"
								class="prev-arrow"><i class="fa fa-long-arrow-left"
								aria-hidden="true"></i></a>
							<%
							}
							%>
						</c:when>
						<c:otherwise>

						</c:otherwise>
					</c:choose>
					<c:forEach var="i" begin="1" end="${totalpage}">
						<c:choose>
							<c:when test="${i==currentpage}">
								<%
								if (request.getParameter("pricefrom") != null && request.getParameter("sort") != null
										&& request.getParameter("searchName") != null) {
								%>
								<a class="active"
									href="${contextPath}/productbycate?cateid=${cateid}&searchName=<%= request.getParameter("searchName") %>&pricefrom=<%= request.getParameter("pricefrom") %>&priceto=<%= request.getParameter("priceto") %>&sort=<%=request.getParameter("sort")%>&page=${i}">
									${i} </a>
								<%
								} else if (request.getParameter("searchName") != null && request.getParameter("sort") != null
										&& request.getParameter("pricefrom") == null) {
								%>
								<a class="active"
									href="${contextPath}/productbycate?cateid=${cateid}&searchName=<%= request.getParameter("searchName") %>&sort=<%=request.getParameter("sort")%>&page=${i}">
									${i} </a>
								<%
								} else if (request.getParameter("searchName") != null && request.getParameter("pricefrom") != null
										&& request.getParameter("sort") == null) {
								%>
								<a class="active"
									href="${contextPath}/productbycate?cateid=${cateid}&searchName=<%= request.getParameter("searchName") %>&pricefrom=<%= request.getParameter("pricefrom") %>&priceto=<%= request.getParameter("priceto") %>&page=${i}">
									${i} </a>
								<%
								} else if (request.getParameter("pricefrom") != null && request.getParameter("sort") != null) {
								%>
								<a class="active"
									href="${contextPath}/productbycate?cateid=${cateid}&pricefrom=<%= request.getParameter("pricefrom") %>&priceto=<%= request.getParameter("priceto") %>&sort=<%=request.getParameter("sort")%>&page=${i}">
									${i} </a>
								<%
								} else if (request.getParameter("pricefrom") != null) {
								%>
								<a class="active"
									href="${contextPath}/productbycate?cateid=${cateid}&pricefrom=<%= request.getParameter("pricefrom") %>&priceto=<%= request.getParameter("priceto") %>&page=${i}">
									${i} </a>
								<%
								} else if (request.getParameter("searchName") != null) {
								%>
								<a class="active"
									href="${contextPath}/productbycate?cateid=${cateid}&ssearchName=<%=request.getParameter("searchName")%>&page=${i}">
									${i} </a>
								<%
								} else if (request.getParameter("sort") != null) {
								%>
								<a class="active"
									href="${contextPath}/productbycate?cateid=${cateid}&sort=<%=request.getParameter("sort")%>&page=${i}">
									${i} </a>
								<%
								} else {
								%>
								<a class="active"
									href="${contextPath}/productbycate?cateid=${cateid}&&page=${i}">
									${i} </a>
								<%
								}
								%>


							</c:when>
							<c:otherwise>
								<%
								if (request.getParameter("pricefrom") != null && request.getParameter("sort") != null
										&& request.getParameter("searchName") != null) {
								%>
								<a class=""
									href="${contextPath}/productbycate?cateid=${cateid}&searchName=<%= request.getParameter("searchName") %>&pricefrom=<%= request.getParameter("pricefrom") %>&priceto=<%= request.getParameter("priceto") %>&sort=<%=request.getParameter("sort")%>&page=${i}">
									${i} </a>
								<%
								} else if (request.getParameter("searchName") != null && request.getParameter("sort") != null
										&& request.getParameter("pricefrom") == null) {
								%>
								<a class=""
									href="${contextPath}/productbycate?cateid=${cateid}&searchName=<%= request.getParameter("searchName") %>&sort=<%=request.getParameter("sort")%>&page=${i}">
									${i} </a>
								<%
								} else if (request.getParameter("searchName") != null && request.getParameter("pricefrom") != null
										&& request.getParameter("sort") == null) {
								%>
								<a class=""
									href="${contextPath}/productbycate?cateid=${cateid}&searchName=<%= request.getParameter("searchName") %>&pricefrom=<%= request.getParameter("pricefrom") %>&priceto=<%= request.getParameter("priceto") %>&page=${i}">
									${i} </a>
								<%
								} else if (request.getParameter("pricefrom") != null && request.getParameter("sort") != null) {
								%>
								<a class=""
									href="${contextPath}/productbycate?cateid=${cateid}&pricefrom=<%= request.getParameter("pricefrom") %>&priceto=<%= request.getParameter("priceto") %>&sort=<%=request.getParameter("sort")%>&page=${i}">
									${i} </a>
								<%
								} else if (request.getParameter("pricefrom") != null) {
								%>
								<a class=""
									href="${contextPath}/productbycate?cateid=${cateid}&pricefrom=<%= request.getParameter("pricefrom") %>&priceto=<%= request.getParameter("priceto") %>&page=${i}">
									${i} </a>
								<%
								} else if (request.getParameter("searchName") != null) {
								%>
								<a class=""
									href="${contextPath}/productbycate?cateid=${cateid}&searchName=<%=request.getParameter("searchName")%>&page=${i}">
									${i} </a>
								<%
								} else if (request.getParameter("sort") != null) {
								%>
								<a class=""
									href="${contextPath}/productbycate?cateid=${cateid}&sort=<%=request.getParameter("sort")%>&page=${i}">
									${i} </a>
								<%
								} else {
								%>
								<a class=""
									href="${contextPath}/productbycate?cateid=${cateid}&page=${i}">
									${i} </a>
								<%
								}
								%>


							</c:otherwise>
						</c:choose>
					</c:forEach>

					<c:choose>
						<c:when test="${currentpage < totalpage }">
							<%
							if (request.getParameter("pricefrom") != null && request.getParameter("sort") != null
									&& request.getParameter("searchName") != null) {
							%>
							<a
								href="${contextPath}/productbycate?cateid=${cateid}&searchName=<%= request.getParameter("searchName") %>&pricefrom=<%= request.getParameter("pricefrom") %>&priceto=<%= request.getParameter("priceto") %>&sort=<%=request.getParameter("sort")%>&page=${currentpage+1}"
								class="next-arrow"><i class="fa fa-long-arrow-right"
								aria-hidden="true"></i></a>
							<%
							} else if (request.getParameter("searchName") != null && request.getParameter("sort") != null
									&& request.getParameter("pricefrom") == null) {
							%>
							<a
								href="${contextPath}/productbycate?cateid=${cateid}&searchName=<%= request.getParameter("searchName") %>&sort=<%=request.getParameter("sort")%>&page=${currentpage+1}"
								class="next-arrow"><i class="fa fa-long-arrow-right"
								aria-hidden="true"></i></a>
							<%
							} else if (request.getParameter("searchName") != null && request.getParameter("pricefrom") != null
									&& request.getParameter("sort") == null) {
							%>
							<a
								href="${contextPath}/productbycate?cateid=${cateid}&searchName=<%= request.getParameter("searchName") %>&pricefrom=<%= request.getParameter("pricefrom") %>&priceto=<%= request.getParameter("priceto") %>&page=${currentpage+1}"
								class="next-arrow"><i class="fa fa-long-arrow-right"
								aria-hidden="true"></i></a>
							<%
							} else if (request.getParameter("pricefrom") != null && request.getParameter("sort") != null) {
							%>
							<a
								href="${contextPath}/productbycate?cateid=${cateid}&pricefrom=<%= request.getParameter("pricefrom") %>&priceto=<%= request.getParameter("priceto") %>&sort=<%=request.getParameter("sort")%>&page=${currentpage+1}"
								class="next-arrow"><i class="fa fa-long-arrow-right"
								aria-hidden="true"></i></a>
							<%
							} else if (request.getParameter("pricefrom") != null) {
							%>
							<a class=""
								href="${contextPath}/productbycate?cateid=${cateid}&pricefrom=<%= request.getParameter("pricefrom") %>&priceto=<%= request.getParameter("priceto") %>&page=${currentpage+1}">
								<i class="fa fa-long-arrow-right" aria-hidden="true"></i>
							</a>
							<%
							} else if (request.getParameter("searchName") != null) {
							%>
							<a class=""
								href="${contextPath}/productbycate?cateid=${cateid}&searchName=<%=request.getParameter("searchName")%>&page=${currentpage+1}">
								<i class="fa fa-long-arrow-right" aria-hidden="true"></i>
							</a>
							<%
							} else if (request.getParameter("sort") != null) {
							%>
							<a class=""
								href="${contextPath}/productbycate?cateid=${cateid}&sort=<%=request.getParameter("sort")%>&page=${currentpage+1}">
								<i class="fa fa-long-arrow-right" aria-hidden="true"></i>
							</a>
							<%
							} else {
							%>
							<a
								href="${contextPath}/productbycate?cateid=${cateid}&page=${currentpage+1}"
								class="next-arrow"><i class="fa fa-long-arrow-right"
								aria-hidden="true"></i></a>
							<%
							}
							%>
						</c:when>
						<c:otherwise>

						</c:otherwise>
					</c:choose>

				</div>
			</div>
			<!-- End Filter Bar -->
			<!-- Start Best Seller -->
			<section class="lattest-product-area pb-40 category-list">
				<div class="row">
					<!-- single product -->
					<c:if test="${fn:length(products) == 0}">
						<div class="col-lg-10 col-md-10">
							<h2 class="m-5 p-5">Không có sản phẩm</h2>
						</div>
					</c:if>
					<c:forEach items="${products }" var="p">
						<div class="col-lg-3 col-md-6">
							<div class="single-product">
								<a href="${contextPath }/product-detail/${p.slug}"><img
									class="img-fluid" src="${contextPath }/images/${p.image}"
									alt=""></a>
								<div class="product-details">
									<h6>${p.proName }</h6>
									<div class="price">
										<h6>
											<fmt:formatNumber value="${p.price}" type="currency"
												currencyCode="USD"></fmt:formatNumber>
										</h6>
										<h6 class="l-through">
											<fmt:formatNumber value="${p.oldPrice}" type="currency"
												currencyCode="USD"></fmt:formatNumber>
										</h6>
									</div>

									<div class="prd-bottom">

										<a href="javascript:void(0)" onclick="addBasket('${p.proId}')"
											class="social-info"> <span class="ti-bag"></span>
											<p class="hover-text">add to bag</p>
										</a> <a href="${contextPath }/product-detail/${p.slug}"
											class="social-info"> <span class="lnr lnr-move"></span>
											<p class="hover-text">view more</p>
										</a>
									</div>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</section>
			<!-- End Best Seller -->
			<!-- Start Filter Bar -->
			<div class="filter-bar d-flex flex-wrap align-items-center">
				<div class="pagination ml-auto">
					<c:choose>
						<c:when test="${currentpage > 1 }">
							<%
							if (request.getParameter("pricefrom") != null && request.getParameter("sort") != null
									&& request.getParameter("searchName") != null) {
							%>
							<a
								href="${contextPath}/productbycate?cateid=${cateid}&searchName=<%= request.getParameter("searchName") %>&pricefrom=<%= request.getParameter("pricefrom") %>&priceto=<%= request.getParameter("priceto") %>&sort=<%=request.getParameter("sort")%>&page=${currentpage-1}"
								class="prev-arrow"><i class="fa fa-long-arrow-left"
								aria-hidden="true"></i></a>
							<%
							} else if (request.getParameter("searchName") != null && request.getParameter("sort") != null
									&& request.getParameter("pricefrom") == null) {
							%>
							<a
								href="${contextPath}/productbycate?cateid=${cateid}&searchName=<%= request.getParameter("searchName") %>&sort=<%=request.getParameter("sort")%>&page=${currentpage-1}"
								class="prev-arrow"><i class="fa fa-long-arrow-left"
								aria-hidden="true"></i></a>
							<%
							} else if (request.getParameter("searchName") != null && request.getParameter("pricefrom") != null
									&& request.getParameter("sort") == null) {
							%>
							<a
								href="${contextPath}/productbycate?cateid=${cateid}&searchName=<%= request.getParameter("searchName") %>&pricefrom=<%= request.getParameter("pricefrom") %>&priceto=<%= request.getParameter("priceto") %>&page=${currentpage-1}"
								class="prev-arrow"><i class="fa fa-long-arrow-left"
								aria-hidden="true"></i></a>
							<%
							} else if (request.getParameter("pricefrom") != null && request.getParameter("sort") != null) {
							%>
							<a
								href="${contextPath}/productbycate?cateid=${cateid}&pricefrom=<%= request.getParameter("pricefrom") %>&priceto=<%= request.getParameter("priceto") %>&sort=<%=request.getParameter("sort")%>&page=${currentpage-1}"
								class="prev-arrow"><i class="fa fa-long-arrow-left"
								aria-hidden="true"></i></a>
							<%
							} else if (request.getParameter("pricefrom") != null) {
							%>
							<a class=""
								href="${contextPath}/productbycate?cateid=${cateid}&pricefrom=<%= request.getParameter("pricefrom") %>&priceto=<%= request.getParameter("priceto") %>&page=${currentpage-1}">
								<i class="fa fa-long-arrow-left" aria-hidden="true"></i>
							</a>
							<%
							} else if (request.getParameter("searchName") != null) {
							%>
							<a class=""
								href="${contextPath}/productbycate?cateid=${cateid}&searchName=<%=request.getParameter("searchName")%>&page=${currentpage-1}">
								<i class="fa fa-long-arrow-left" aria-hidden="true"></i>
							</a>
							<%
							} else if (request.getParameter("sort") != null) {
							%>
							<a class=""
								href="${contextPath}/productbycate?cateid=${cateid}&sort=<%=request.getParameter("sort")%>&page=${currentpage-1}">
								<i class="fa fa-long-arrow-left" aria-hidden="true"></i>
							</a>
							<%
							} else {
							%>
							<a
								href="${contextPath}/productbycate?cateid=${cateid}&page=${currentpage-1}"
								class="prev-arrow"><i class="fa fa-long-arrow-left"
								aria-hidden="true"></i></a>
							<%
							}
							%>
						</c:when>
						<c:otherwise>

						</c:otherwise>
					</c:choose>
					<c:forEach var="i" begin="1" end="${totalpage}">
						<c:choose>
							<c:when test="${i==currentpage}">
								<%
								if (request.getParameter("pricefrom") != null && request.getParameter("sort") != null
										&& request.getParameter("searchName") != null) {
								%>
								<a class="active"
									href="${contextPath}/productbycate?cateid=${cateid}&searchName=<%= request.getParameter("searchName") %>&pricefrom=<%= request.getParameter("pricefrom") %>&priceto=<%= request.getParameter("priceto") %>&sort=<%=request.getParameter("sort")%>&page=${i}">
									${i} </a>
								<%
								} else if (request.getParameter("searchName") != null && request.getParameter("sort") != null
										&& request.getParameter("pricefrom") == null) {
								%>
								<a class="active"
									href="${contextPath}/productbycate?cateid=${cateid}&searchName=<%= request.getParameter("searchName") %>&sort=<%=request.getParameter("sort")%>&page=${i}">
									${i} </a>
								<%
								} else if (request.getParameter("searchName") != null && request.getParameter("pricefrom") != null
										&& request.getParameter("sort") == null) {
								%>
								<a class="active"
									href="${contextPath}/productbycate?cateid=${cateid}&searchName=<%= request.getParameter("searchName") %>&pricefrom=<%= request.getParameter("pricefrom") %>&priceto=<%= request.getParameter("priceto") %>&page=${i}">
									${i} </a>
								<%
								} else if (request.getParameter("pricefrom") != null && request.getParameter("sort") != null) {
								%>
								<a class="active"
									href="${contextPath}/productbycate?cateid=${cateid}&pricefrom=<%= request.getParameter("pricefrom") %>&priceto=<%= request.getParameter("priceto") %>&sort=<%=request.getParameter("sort")%>&page=${i}">
									${i} </a>
								<%
								} else if (request.getParameter("pricefrom") != null) {
								%>
								<a class="active"
									href="${contextPath}/productbycate?cateid=${cateid}&pricefrom=<%= request.getParameter("pricefrom") %>&priceto=<%= request.getParameter("priceto") %>&page=${i}">
									${i} </a>
								<%
								} else if (request.getParameter("searchName") != null) {
								%>
								<a class="active"
									href="${contextPath}/productbycate?cateid=${cateid}&ssearchName=<%=request.getParameter("searchName")%>&page=${i}">
									${i} </a>
								<%
								} else if (request.getParameter("sort") != null) {
								%>
								<a class="active"
									href="${contextPath}/productbycate?cateid=${cateid}&sort=<%=request.getParameter("sort")%>&page=${i}">
									${i} </a>
								<%
								} else {
								%>
								<a class="active"
									href="${contextPath}/productbycate?cateid=${cateid}&&page=${i}">
									${i} </a>
								<%
								}
								%>


							</c:when>
							<c:otherwise>
								<%
								if (request.getParameter("pricefrom") != null && request.getParameter("sort") != null
										&& request.getParameter("searchName") != null) {
								%>
								<a class=""
									href="${contextPath}/productbycate?cateid=${cateid}&searchName=<%= request.getParameter("searchName") %>&pricefrom=<%= request.getParameter("pricefrom") %>&priceto=<%= request.getParameter("priceto") %>&sort=<%=request.getParameter("sort")%>&page=${i}">
									${i} </a>
								<%
								} else if (request.getParameter("searchName") != null && request.getParameter("sort") != null
										&& request.getParameter("pricefrom") == null) {
								%>
								<a class=""
									href="${contextPath}/productbycate?cateid=${cateid}&searchName=<%= request.getParameter("searchName") %>&sort=<%=request.getParameter("sort")%>&page=${i}">
									${i} </a>
								<%
								} else if (request.getParameter("searchName") != null && request.getParameter("pricefrom") != null
										&& request.getParameter("sort") == null) {
								%>
								<a class=""
									href="${contextPath}/productbycate?cateid=${cateid}&searchName=<%= request.getParameter("searchName") %>&pricefrom=<%= request.getParameter("pricefrom") %>&priceto=<%= request.getParameter("priceto") %>&page=${i}">
									${i} </a>
								<%
								} else if (request.getParameter("pricefrom") != null && request.getParameter("sort") != null) {
								%>
								<a class=""
									href="${contextPath}/productbycate?cateid=${cateid}&pricefrom=<%= request.getParameter("pricefrom") %>&priceto=<%= request.getParameter("priceto") %>&sort=<%=request.getParameter("sort")%>&page=${i}">
									${i} </a>
								<%
								} else if (request.getParameter("pricefrom") != null) {
								%>
								<a class=""
									href="${contextPath}/productbycate?cateid=${cateid}&pricefrom=<%= request.getParameter("pricefrom") %>&priceto=<%= request.getParameter("priceto") %>&page=${i}">
									${i} </a>
								<%
								} else if (request.getParameter("searchName") != null) {
								%>
								<a class=""
									href="${contextPath}/productbycate?cateid=${cateid}&searchName=<%=request.getParameter("searchName")%>&page=${i}">
									${i} </a>
								<%
								} else if (request.getParameter("sort") != null) {
								%>
								<a class=""
									href="${contextPath}/productbycate?cateid=${cateid}&sort=<%=request.getParameter("sort")%>&page=${i}">
									${i} </a>
								<%
								} else {
								%>
								<a class=""
									href="${contextPath}/productbycate?cateid=${cateid}&page=${i}">
									${i} </a>
								<%
								}
								%>


							</c:otherwise>
						</c:choose>
					</c:forEach>

					<c:choose>
						<c:when test="${currentpage < totalpage }">
							<%
							if (request.getParameter("pricefrom") != null && request.getParameter("sort") != null
									&& request.getParameter("searchName") != null) {
							%>
							<a
								href="${contextPath}/productbycate?cateid=${cateid}&searchName=<%= request.getParameter("searchName") %>&pricefrom=<%= request.getParameter("pricefrom") %>&priceto=<%= request.getParameter("priceto") %>&sort=<%=request.getParameter("sort")%>&page=${currentpage+1}"
								class="next-arrow"><i class="fa fa-long-arrow-right"
								aria-hidden="true"></i></a>
							<%
							} else if (request.getParameter("searchName") != null && request.getParameter("sort") != null
									&& request.getParameter("pricefrom") == null) {
							%>
							<a
								href="${contextPath}/productbycate?cateid=${cateid}&searchName=<%= request.getParameter("searchName") %>&sort=<%=request.getParameter("sort")%>&page=${currentpage+1}"
								class="next-arrow"><i class="fa fa-long-arrow-right"
								aria-hidden="true"></i></a>
							<%
							} else if (request.getParameter("searchName") != null && request.getParameter("pricefrom") != null
									&& request.getParameter("sort") == null) {
							%>
							<a
								href="${contextPath}/productbycate?cateid=${cateid}&searchName=<%= request.getParameter("searchName") %>&pricefrom=<%= request.getParameter("pricefrom") %>&priceto=<%= request.getParameter("priceto") %>&page=${currentpage+1}"
								class="next-arrow"><i class="fa fa-long-arrow-right"
								aria-hidden="true"></i></a>
							<%
							} else if (request.getParameter("pricefrom") != null && request.getParameter("sort") != null) {
							%>
							<a
								href="${contextPath}/productbycate?cateid=${cateid}&pricefrom=<%= request.getParameter("pricefrom") %>&priceto=<%= request.getParameter("priceto") %>&sort=<%=request.getParameter("sort")%>&page=${currentpage+1}"
								class="next-arrow"><i class="fa fa-long-arrow-right"
								aria-hidden="true"></i></a>
							<%
							} else if (request.getParameter("pricefrom") != null) {
							%>
							<a class=""
								href="${contextPath}/productbycate?cateid=${cateid}&pricefrom=<%= request.getParameter("pricefrom") %>&priceto=<%= request.getParameter("priceto") %>&page=${currentpage+1}">
								<i class="fa fa-long-arrow-right" aria-hidden="true"></i>
							</a>
							<%
							} else if (request.getParameter("searchName") != null) {
							%>
							<a class=""
								href="${contextPath}/productbycate?cateid=${cateid}&searchName=<%=request.getParameter("searchName")%>&page=${currentpage+1}">
								<i class="fa fa-long-arrow-right" aria-hidden="true"></i>
							</a>
							<%
							} else if (request.getParameter("sort") != null) {
							%>
							<a class=""
								href="${contextPath}/productbycate?cateid=${cateid}&sort=<%=request.getParameter("sort")%>&page=${currentpage+1}">
								<i class="fa fa-long-arrow-right" aria-hidden="true"></i>
							</a>
							<%
							} else {
							%>
							<a
								href="${contextPath}/productbycate?cateid=${cateid}&page=${currentpage+1}"
								class="next-arrow"><i class="fa fa-long-arrow-right"
								aria-hidden="true"></i></a>
							<%
							}
							%>
						</c:when>
						<c:otherwise>

						</c:otherwise>
					</c:choose>

				</div>
			</div>
			<!-- End Filter Bar -->
		</div>
	</div>
</div>
