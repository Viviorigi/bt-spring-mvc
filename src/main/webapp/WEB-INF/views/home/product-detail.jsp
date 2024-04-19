<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath"
	value="${pageContext.servletContext.contextPath}" scope="session" />

<!--================Single Product Area =================-->
<div class="product_image_area">
	<div class="container">
		<div class="row s_product_inner">
			<div class="col-lg-6">
				<div class="s_Product_carousel">
					<c:forEach items="${product.imgProducts }" var="imgPro" >
						<div class="single-prd-item">
							<img class="img-fluid"
								src="${contextPath }/images/${ imgPro.image}" alt="">
						</div>
					</c:forEach>
				</div>
			</div>
			<div class="col-lg-5 offset-lg-1">
				<div class="s_product_text">
					<h3>${product.proName }</h3>
					<h2><fmt:formatNumber value="${product.price}" type="currency"></fmt:formatNumber> <h5><del class="text-danger"><fmt:formatNumber value="${product.oldPrice}" type="currency"></fmt:formatNumber></del></h5> </h2>
					<ul class="list">
						<li><a class="active" href="#"><span>Category</span> :
								${product.category.categoryName}</a></li>
						<li><a href="#"><span>Availibility</span> : ${product.status?"In Stock" : "Out of Stock"}</a></li>
					</ul>
					
					 <br>
					<div class="card_area d-flex align-items-center">
						<button  onclick="addBasket('${product.proId}')" class="primary-btn btn text-decoration-none">Add to Cart</button> 
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!--================End Single Product Area =================-->

<!--================Product Description Area =================-->
<section class="product_description_area">
	<div class="container">
		<ul class="nav nav-tabs" id="myTab" role="tablist">
			<li class="nav-item"><a class="nav-link active " id="home-tab"
				data-toggle="tab" href="#home" role="tab" aria-controls="home"
				aria-selected="false">Description</a></li>

		</ul>
		<div class="tab-content" id="myTabContent">
			${product.description}
						
			
			
		</div>
	</div>
</section>

