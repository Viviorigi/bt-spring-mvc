<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"
	value="${pageContext.servletContext.contextPath}" scope="session" />
<!DOCTYPE html>
<html lang="zxx" class="no-js">

<head>
<!-- Mobile Specific Meta -->
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- Favicon-->
<link rel="shortcut icon" href="img/fav.png">
<!-- Author Meta -->
<meta name="author" content="CodePixar">
<!-- Meta Description -->
<meta name="description" content="">
<!-- Meta Keyword -->
<meta name="keywords" content="">
<!-- meta character set -->
<meta charset="UTF-8">
<!-- Site Title -->
<title>Karma Shop</title>
<!--
		CSS
		============================================= -->
<link rel="stylesheet" href="${contextPath }/home/css/linearicons.css">
<link rel="stylesheet"
	href="${contextPath }/home/css/font-awesome.min.css">
<link rel="stylesheet" href="${contextPath }/home/css/themify-icons.css">
<link rel="stylesheet" href="${contextPath }/home/css/bootstrap.css">
<link rel="stylesheet" href="${contextPath }/home/css/owl.carousel.css">
<link rel="stylesheet" href="${contextPath }/home/css/nice-select.css">
<link rel="stylesheet"
	href="${contextPath }/home/css/nouislider.min.css">
<link rel="stylesheet"
	href="${contextPath }/home/css/ion.rangeSlider.css" />
<link rel="stylesheet"
	href="${contextPath }/home/css/ion.rangeSlider.skinFlat.css" />
<link rel="stylesheet"
	href="${contextPath }/home/css/magnific-popup.css">
<link rel="stylesheet" href="${contextPath }/home/css/main.css">
  <link href="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css" rel="stylesheet" />
</head>

<body>

	<!-- Start Header Area -->
	<header class="header_area sticky-header">
		<div class="main_menu">
			<nav class="navbar navbar-expand-lg navbar-light main_box">
				<div class="container">
					<!-- Brand and toggle get grouped for better mobile display -->
					<a class="navbar-brand logo_h" href="${contextPath }/home"><img
						src="${contextPath }/home/img/logo.png" alt=""></a>
					<button class="navbar-toggler" type="button" data-toggle="collapse"
						data-target="#navbarSupportedContent"
						aria-controls="navbarSupportedContent" aria-expanded="false"
						aria-label="Toggle navigation">
						<span class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>
					<!-- Collect the nav links, forms, and other content for toggling -->
					<div class="collapse navbar-collapse offset"
						id="navbarSupportedContent">
						<ul class="nav navbar-nav menu_nav ml-auto">
							<li class="nav-item active"><a class="nav-link"
								href="${contextPath }/home">Home</a></li>
							<li class="nav-item submenu dropdown"><a
								href="${contextPath }/product-category" class="nav-link ">Shop
							</a></li>
							<li class="nav-item submenu dropdown"><a
								href="${contextPath }/blog" class="nav-link ">Blog</a></li>
							<li class="nav-item"><a class="nav-link"
								href="${contextPath }/contact">Contact</a></li>		
							<li class="nav-item submenu dropdown"><c:choose>
									<c:when test="${sessionScope.userfullname != null}">
										<a href="${contextPath }/userprofile" class="nav-link ">Xin chào ${sessionScope.userfullname}</a>
									</c:when>
									<c:otherwise>
										<a href="${contextPath }/login" class="nav-link ">Login</a>
									</c:otherwise>
								</c:choose>
							</li>
							<c:choose>
								<c:when test="${sessionScope.userfullname != null}">
									<li class="nav-item submenu dropdown"><a class="nav-link "
										href="${contextPath }/logout"> Log out</a>
										</li>
								</c:when>
							</c:choose>
							
						</ul>
						<ul class="nav navbar-nav navbar-right">
							<li class="nav-item"><a href="${contextPath }/cart"
								class="cart"><span id="cart_total"><jsp:include page="${contextPath}/countItems"></jsp:include></span> <span class="ti-bag"></span></a></li>
							<li class="nav-item">
								<button class="search">
									<span class="lnr lnr-magnifier" id="search"></span>
								</button>
							</li>
						</ul>
					</div>
				</div>
			</nav>
		</div>
		<div class="search_input" id="search_input_box">
			<div class="container">
				<form class="d-flex justify-content-between">
					<input type="text" class="form-control" id="search_input"
						placeholder="Search Here">
					<button type="submit" class="btn"></button>
					<span class="lnr lnr-cross" id="close_search" title="Close Search"></span>
				</form>
			</div>
		</div>
	</header>
	<!-- End Header Area -->

	<!-- start banner Area -->
	<section class="banner-area">
		<div class="container">
			<div class="row fullscreen align-items-center justify-content-start">
				<div class="col-lg-12">
					<div class="active-banner-slider owl-carousel">
						<!-- single-slide -->
						<div class="row single-slide align-items-center d-flex">
							<div class="col-lg-5 col-md-6">
								<div class="banner-content">
									<h1>
										Nike New <br>Collection!
									</h1>
									<p>Lorem ipsum dolor sit amet, consectetur adipisicing
										elit, sed do eiusmod tempor incididunt ut labore et dolore
										magna aliqua. Ut enim ad minim veniam, quis nostrud
										exercitation.</p>
									<div class="add-bag d-flex align-items-center">
										<a class="add-btn" href=""><span class="lnr lnr-cross"></span></a>
										<span class="add-text text-uppercase">Add to Bag</span>
									</div>
								</div>
							</div>
							<div class="col-lg-7">
								<div class="banner-img">
									<img class="img-fluid"
										src="https://keygem.com/cdn/shop/files/ALS00598_11_Edited.jpg?v=1712829770&width=1800" alt="">
								</div>
							</div>
						</div>
						<!-- single-slide -->
						<div class="row single-slide">
							<div class="col-lg-5">
								<div class="banner-content">
									<h1>
										Nike New <br>Collection!
									</h1>
									<p>Lorem ipsum dolor sit amet, consectetur adipisicing
										elit, sed do eiusmod tempor incididunt ut labore et dolore
										magna aliqua. Ut enim ad minim veniam, quis nostrud
										exercitation.</p>
									<div class="add-bag d-flex align-items-center">
										<a class="add-btn" href=""><span class="lnr lnr-cross"></span></a>
										<span class="add-text text-uppercase">Add to Bag</span>
									</div>
								</div>
							</div>
							<div class="col-lg-7">
								<div class="banner-img">
									<img class="img-fluid"
										src="https://keygem.com/cdn/shop/files/DSC03188.jpg?v=1716803417&width=1800" alt="">
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- End banner Area -->

	<!-- main -->

	<c:if test="${!empty page }">
		<jsp:include page="home/${page}.jsp"></jsp:include>
	</c:if>

	<!-- start footer Area -->
	<footer class="footer-area section_gap">
		<div class="container">
			<div class="row">
				<div class="col-lg-3  col-md-6 col-sm-6">
					<div class="single-footer-widget">
						<h6>About Us</h6>
						<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit,
							sed do eiusmod tempor incididunt ut labore dolore magna aliqua.</p>
					</div>
				</div>
				<div class="col-lg-4  col-md-6 col-sm-6">
					<div class="single-footer-widget">
						<h6>Newsletter</h6>
						<p>Stay update with our latest</p>
						<div class="" id="mc_embed_signup">

							<form target="_blank" novalidate="true"
								action="https://keygem.com/cdn/shop/files/12_cb92261f-3469-458e-bf6d-a866abb17594.jpg?v=1713175930&width=1800"
								method="get" class="form-inline">

								<div class="d-flex flex-row">

									<input class="form-control" name="EMAIL"
										placeholder="Enter Email" onfocus="this.placeholder = ''"
										onblur="this.placeholder = 'Enter Email '" required=""
										type="email">


									<button class="click-btn btn btn-default">
										<i class="fa fa-long-arrow-right" aria-hidden="true"></i>
									</button>
									<div style="position: absolute; left: -5000px;">
										<input name="b_36c4fd991d266f23781ded980_aefe40901a"
											tabindex="-1" value="" type="text">
									</div>

									<!-- <div class="col-lg-4 col-md-4">
												<button class="bb-btn btn"><span class="lnr lnr-arrow-right"></span></button>
											</div>  -->
								</div>
								<div class="info"></div>
							</form>
						</div>
					</div>
				</div>
				<div class="col-lg-3  col-md-6 col-sm-6">
					<div class="single-footer-widget mail-chimp">
						<h6 class="mb-20">Instragram Feed</h6>
						<ul class="instafeed d-flex flex-wrap">
							<li><img src="${contextPath }/home/img/i1.jpg" alt=""></li>
							<li><img src="${contextPath }/home/img/i2.jpg" alt=""></li>
							<li><img src="${contextPath }/home/img/i3.jpg" alt=""></li>
							<li><img src="${contextPath }/home/img/i4.jpg" alt=""></li>
							<li><img src="${contextPath }/home/img/i5.jpg" alt=""></li>
							<li><img src="${contextPath }/home/img/i6.jpg" alt=""></li>
							<li><img src="${contextPath }/home/img/i7.jpg" alt=""></li>
							<li><img src="${contextPath }/home/img/i8.jpg" alt=""></li>
						</ul>
					</div>
				</div>
				<div class="col-lg-2 col-md-6 col-sm-6">
					<div class="single-footer-widget">
						<h6>Follow Us</h6>
						<p>Let us be social</p>
						<div class="footer-social d-flex align-items-center">
							<a href="#"><i class="fa fa-facebook"></i></a> <a href="#"><i
								class="fa fa-twitter"></i></a> <a href="#"><i
								class="fa fa-dribbble"></i></a> <a href="#"><i
								class="fa fa-behance"></i></a>
						</div>
					</div>
				</div>
			</div>
			<div
				class="footer-bottom d-flex justify-content-center align-items-center flex-wrap">
				<p class="footer-text m-0">
					<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
					Copyright &copy;
					<script>
						document.write(new Date().getFullYear());
					</script>
					All rights reserved | This template is made with <i
						class="fa fa-heart-o" aria-hidden="true"></i> by <a
						href="https://colorlib.com" target="_blank">Colorlib</a>
					<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
				</p>
			</div>
		</div>
	</footer>
	<!-- End footer Area -->

	<script src="${contextPath }/home/js/vendor/jquery-2.2.4.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"
		integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4"
		crossorigin="anonymous"></script>
	<script src="${contextPath }/home/js/vendor/bootstrap.min.js"></script>
	<script src="${contextPath }/home/js/jquery.ajaxchimp.min.js"></script>
	<script src="${contextPath }/home/js/jquery.nice-select.min.js"></script>
	<script src="${contextPath }/home/js/jquery.sticky.js"></script>
	<script src="${contextPath }/home/js/nouislider.min.js"></script>
	<script src="${contextPath }/home/js/countdown.js"></script>
	<script src="${contextPath }/home/js/jquery.magnific-popup.min.js"></script>
	<script src="${contextPath }/home/js/owl.carousel.min.js"></script>
	<!--gmaps Js-->
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCjCGmQ0Uq4exrzdcL6rvxywDDOvfAu6eE"></script>
	<script src="${contextPath }/home/js/gmaps.min.js"></script>
	<script src="${contextPath }/home/js/main.js"></script>
	<script type="text/javascript">
		$(".active-banner-slider")
				.owlCarousel(
						{
							items : 1,
							autoplay : false,
							autoplayTimeout : 5000,
							loop : true,
							nav : true,
							navText : [
									"<img src='${contextPath }/home/img/banner/prev.png'>",
									"<img src='${contextPath }/home/img/banner/next.png'>" ],
							dots : false
						});

		/*=================================
		Javascript for product area carousel
		==================================*/
		$(".active-product-area")
				.owlCarousel(
						{
							items : 1,
							autoplay : false,
							autoplayTimeout : 5000,
							loop : true,
							nav : true,
							navText : [
									"<img src='${contextPath }/home/img/product/prev.png'>",
									"<img src='${contextPath }/home/img/product/next.png'>" ],
							dots : false
						});
		$(".active-exclusive-product-slider")
				.owlCarousel(
						{
							items : 1,
							autoplay : false,
							autoplayTimeout : 5000,
							loop : true,
							nav : true,
							navText : [
									"<img src='${contextPath }/img/product/prev.png'>",
									"<img src='${contextPath }/img/product/next.png'>" ],
							dots : false
						});
		
	</script>
	<script src="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js"></script>
	<script>
			var path='${pageContext.servletContext.contextPath}';
			
			//Document ready thì show loại sách và số lượng trong giỏ hàng (jquery ajax)
			$(function(){
				$.get(path + "/countItems", function(data) {
					$('#cart_total').html(data);
				});
			});
			//hàm xử lý add 1 sách vào giỏ hàng (jquery ajax)
			function addBasket(proId) {
				
				$.get(path + "/addItem/" + proId, function(data) {
					toastr.success('Add to cart success!');
					$('#cart_total').html(data);
				});
			}		
			//hàm xử lý cập nhật lại số lượng trong giỏ hàng (jquery ajax)
			function updateCart(proId, value) {
				toastr.success('Update Cart!');
				$.get(path + "/updateCart/" + proId + "/" + value, function() {
					setTimeout(function() {
						window.location.reload();
						}, 1000);
				});
				
			}
			//hàm xử lý xóa 1 sách trong giỏ hàng (jquery ajax)
			function removeItem(proId) {
				if (confirm('Bạn có muốn xóa không?')) {
					$.get(path + "/removeItem/" + proId, function() {
						setTimeout(function() {
							window.location.reload();
							}, 1000);
					});
					toastr.error('Delete item in cart success!');
				}
			}
	</script>

	
</body>

</html>