<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<section class="features-area section_gap">
	<div class="container">
		<div class="row features-inner">
			<!-- single features -->
			<div class="col-lg-3 col-md-6 col-sm-6">
				<div class="single-features">
					<div class="f-icon">
						<img src="${contextPath }/home/img/features/f-icon1.png" alt="">
					</div>
					<h6>Free Delivery</h6>
					<p>Free Shipping on all order</p>
				</div>
			</div>
			<!-- single features -->
			<div class="col-lg-3 col-md-6 col-sm-6">
				<div class="single-features">
					<div class="f-icon">
						<img src="${contextPath }/home/img/features/f-icon2.png" alt="">
					</div>
					<h6>Return Policy</h6>
					<p>Free Shipping on all order</p>
				</div>
			</div>
			<!-- single features -->
			<div class="col-lg-3 col-md-6 col-sm-6">
				<div class="single-features">
					<div class="f-icon">
						<img src="${contextPath }/home/img/features/f-icon3.png" alt="">
					</div>
					<h6>24/7 Support</h6>
					<p>Free Shipping on all order</p>
				</div>
			</div>
			<!-- single features -->
			<div class="col-lg-3 col-md-6 col-sm-6">
				<div class="single-features">
					<div class="f-icon">
						<img src="${contextPath }/home/img/features/f-icon4.png" alt="">
					</div>
					<h6>Secure Payment</h6>
					<p>Free Shipping on all order</p>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- end features Area -->



<!-- start product Area -->
<section class="owl-carousel active-product-area section_gap">
	<!-- single product slide -->
	<div class="single-product-slider">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-lg-6 text-center">
					<div class="section-title">
						<h1>Latest Products</h1>
						<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit,
							sed do eiusmod tempor incididunt ut labore et dolore magna
							aliqua.</p>
					</div>
				</div>
			</div>
			<div class="row">
				<!-- single product -->
				<c:forEach items="${products }" var="p">
					<div class="col-lg-3 col-md-6">
						<div class="single-product">
							<a href="${contextPath }/product-detail/${p.slug}"><img
								class="img-fluid" src="${contextPath }/images/${p.image}" style="height:200px" alt=""></a>
							<div class="product-details">
								<h6>${p.proName }</h6>
								<div class="price">
									<h6>
										<fmt:formatNumber value="${p.price }" type="currency" currencyCode="USD"></fmt:formatNumber>
									</h6>
									<h6 class="l-through">
										<fmt:formatNumber value="${p.oldPrice }" type="currency" currencyCode="USD"></fmt:formatNumber>
									</h6>
								</div>
								<div class="prd-bottom">

									<a href="javascript:void(0)" onclick="addBasket('${p.proId}')"  class="social-info"> <span  class="ti-bag"></span>
										<p  class="hover-text">add to bag</p>
										
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
		</div>
	</div>
	<!-- single product slide -->
	<div class="single-product-slider">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-lg-6 text-center">
					<div class="section-title">
						<h1>Products</h1>
						<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit,
							sed do eiusmod tempor incididunt ut labore et dolore magna
							aliqua.</p>
					</div>
				</div>
			</div>
			<div class="row">
				<!-- single product -->
				<c:forEach items="${productsComing }" var="p">
					<div class="col-lg-3 col-md-6">
						<div class="single-product">
							<img class="img-fluid" src="${contextPath }/images/${p.image}"
								alt="">
							<div class="product-details">
								<h6>${p.proName }</h6>
								<div class="price">
									<h6>
										<fmt:formatNumber value="${p.price }" type="currency"></fmt:formatNumber>
									</h6>
									<h6 class="l-through">
										<fmt:formatNumber value="${p.oldPrice }" type="currency"></fmt:formatNumber>
									</h6>
								</div>
								<div class="prd-bottom">

									<a href="" class="social-info"> <span class="ti-bag"></span>
										<p class="hover-text">add to bag</p>
									</a> <a href="" class="social-info"> <span
										class="lnr lnr-heart"></span>
										<p class="hover-text">Wishlist</p>
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
		</div>
	</div>
</section>
<!-- end product Area -->

<!-- Start exclusive deal Area -->
<div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img class="d-block w-100" src="https://keygem.com/cdn/shop/files/ALS00598_11_Edited.jpg?v=1712829770&width=1800" alt="First slide">
    </div>
    <div class="carousel-item">
      <img class="d-block w-100" src="https://keygem.com/cdn/shop/files/Photo_Dec_26_2023_20_58_24.jpg?v=1704712619&width=1800" alt="Second slide">
    </div>
    <div class="carousel-item">
      <img class="d-block w-100" src="https://keygem.com/cdn/shop/files/DSC05080_d7c53507-e54b-4c66-9aa9-6a2ca7043284.jpg?v=1718713362&width=1800" alt="Third slide">
    </div>
  </div>
  <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>
<!-- End exclusive deal Area -->

<!-- Start brand Area -->
<section class="brand-area section_gap">
	<div class="container">
		<div class="row">
			<a class="col single-img" href="#"> <img
				class="img-fluid d-block mx-auto"
				src="${contextPath }/home/img/brand/1.png" alt="">
			</a> <a class="col single-img" href="#"> <img
				class="img-fluid d-block mx-auto"
				src="${contextPath }/home/img/brand/2.png" alt="">
			</a> <a class="col single-img" href="#"> <img
				class="img-fluid d-block mx-auto"
				src="${contextPath }/home/img/brand/3.png" alt="">
			</a> <a class="col single-img" href="#"> <img
				class="img-fluid d-block mx-auto"
				src="${contextPath }/home/img/brand/4.png" alt="">
			</a> <a class="col single-img" href="#"> <img
				class="img-fluid d-block mx-auto"
				src="${contextPath }/home/img/brand/5.png" alt="">
			</a>
		</div>
	</div>
</section>
<!-- End brand Area -->

<!-- Start related-product Area -->
<section class="related-product-area section_gap_bottom">
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-lg-6 text-center">
				<div class="section-title">
					<h1>Deals of the Week</h1>
					<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit,
						sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-12">
				<div class="row">
					<div class="col-lg-4 col-md-4 col-sm-6 mb-20">
						<div class="single-related-product d-flex">
							<a href="#"><img style="width: 200px;  height:100px"  src="https://keygem.com/cdn/shop/products/ArtNouveauBase.png?v=1645129067&width=600" alt=""></a>
							<div class="desc">
								<a href="#" class="title">Black lace Heels</a>
								<div class="price">
									<h6>$189.00</h6>
									<h6 class="l-through">$210.00</h6>
								</div>
							</div>
						</div>
					</div>
					<div class="col-lg-4 col-md-4 col-sm-6 mb-20">
						<div class="single-related-product d-flex">
							<a href="#"><img style="width: 200px;  height:100px"  src="https://keygem.com/cdn/shop/products/Coarse60_3.png?v=1633260707&width=600" alt=""></a>
							<div class="desc">
								<a href="#" class="title">Black lace Heels</a>
								<div class="price">
									<h6>$189.00</h6>
									<h6 class="l-through">$210.00</h6>
								</div>
							</div>
						</div>
					</div>
					<div class="col-lg-4 col-md-4 col-sm-6 mb-20">
						<div class="single-related-product d-flex">
							<a href="#"><img style="width: 200px;  height:100px" src="https://keygem.com/cdn/shop/files/SylphPotion-4copy.png?v=1682676087&width=600" alt=""></a>
							<div class="desc">
								<a href="#" class="title">Black lace Heels</a>
								<div class="price">
									<h6>$189.00</h6>
									<h6 class="l-through">$210.00</h6>
								</div>
							</div>
						</div>
					</div>
					<div class="col-lg-4 col-md-4 col-sm-6 mb-20">
						<div class="single-related-product d-flex">
							<a href="#"><img style="width: 200px;  height:100px"  src="https://keygem.com/cdn/shop/products/black_79c3ce44-9ff9-4e05-b3cc-4d17515e44f4.jpg?v=1704283762&width=600" alt=""></a>
							<div class="desc">
								<a href="#" class="title">Black lace Heels</a>
								<div class="price">
									<h6>$189.00</h6>
									<h6 class="l-through">$210.00</h6>
								</div>
							</div>
						</div>
					</div>
					<div class="col-lg-4 col-md-4 col-sm-6 mb-20">
						<div class="single-related-product d-flex">
							<a href="#"><img style="width: 200px;  height:100px" src="https://keygem.com/cdn/shop/products/black-black_alu_520dfa8f-0f50-41c3-a821-f1c2298282ce.jpg?v=1655842999&width=600" alt=""></a>
							<div class="desc">
								<a href="#" class="title">Black lace Heels</a>
								<div class="price">
									<h6>$189.00</h6>
									<h6 class="l-through">$210.00</h6>
								</div>
							</div>
						</div>
					</div>
					<div class="col-lg-4 col-md-4 col-sm-6 mb-20">
						<div class="single-related-product d-flex">
							<a href="#"><img  style="width: 200px;  height:100px"  src="https://keygem.com/cdn/shop/files/ZoomPad_EEBlack_PVDGold_d1d80dd1-121e-460a-b796-7743fb121f5f.jpg?v=1700039801&width=600" alt=""></a>
							<div class="desc">
								<a href="#" class="title">Black lace Heels</a>
								<div class="price">
									<h6>$189.00</h6>
									<h6 class="l-through">$210.00</h6>
								</div>
							</div>
						</div>
					</div>
					<div class="col-lg-4 col-md-4 col-sm-6">
						<div class="single-related-product d-flex">
							<a href="#"><img style="width: 200px;  height:100px"  src="https://keygem.com/cdn/shop/products/202205091927114.png?v=1658498850&width=600" alt=""></a>
							<div class="desc">
								<a href="#" class="title">Black lace Heels</a>
								<div class="price">
									<h6>$189.00</h6>
									<h6 class="l-through">$210.00</h6>
								</div>
							</div>
						</div>
					</div>
					<div class="col-lg-4 col-md-4 col-sm-6">
						<div class="single-related-product d-flex">
							<a href="#"><img style="width: 200px;  height:100px"  src="https://keygem.com/cdn/shop/files/ZoomPad_EEBlack_PVDGold_d1d80dd1-121e-460a-b796-7743fb121f5f.jpg?v=1700039801&width=600"
								alt=""></a>
							<div class="desc">
								<a href="#" class="title">Black lace Heels</a>
								<div class="price">
									<h6>$189.00</h6>
									<h6 class="l-through">$210.00</h6>
								</div>
							</div>
						</div>
					</div>
					<div class="col-lg-4 col-md-4 col-sm-6">
						<div class="single-related-product d-flex">
							<a href="#"><img style="width: 200px;  height:100px" src="https://keygem.com/cdn/shop/files/ZoomPad_EEBlack_PVDGold_d1d80dd1-121e-460a-b796-7743fb121f5f.jpg?v=1700039801&width=600"
								alt=""></a>
							<div class="desc">
								<a href="#" class="title">Black lace Heels</a>
								<div class="price">
									<h6>$189.00</h6>
									<h6 class="l-through">$210.00</h6>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

		</div>
	</div>
</section>