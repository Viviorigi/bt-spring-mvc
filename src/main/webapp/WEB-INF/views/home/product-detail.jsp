<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="f" uri="http://www.springframework.org/tags/form"%>

<c:set var="contextPath"
	value="${pageContext.servletContext.contextPath}" scope="session" />

<!--================Single Product Area =================-->
<style>
.list .selected i {
	color: gold; /* Màu vàng cho ngôi sao đã chọn */
}
</style>
<div class="product_image_area">
	<div class="container">
		<div class="row s_product_inner">
			<div class="col-lg-6">
				<div class="s_Product_carousel">
					<c:forEach items="${product.imgProducts }" var="imgPro">
						<div class="single-prd-item">
							<img class="img-fluid" style="width: 100%; height: 300px;"
								src="${contextPath }/images/${ imgPro.image}" alt="">
						</div>
					</c:forEach>
				</div>
			</div>
			<div class="col-lg-5 offset-lg-1">
				<div class="s_product_text">
					<h3>${product.proName }</h3>
					<h2>
						<fmt:formatNumber value="${product.price}" type="currency"
							currencyCode="USD"></fmt:formatNumber>
						<h5>
							<del class="text-danger">
								<fmt:formatNumber value="${product.oldPrice}" type="currency"
									currencyCode="USD"></fmt:formatNumber>
							</del>
						</h5>
					</h2>

					<ul class="list">
						<li><a class="active" href="#"><span>Category</span> :
								${product.category.categoryName}</a></li>
						<li><a href="#"><span>Availibility</span> :
								${product.status?"In Stock" : "Out of Stock"}</a></li>
					</ul>

					<br>
					<div class="card_area d-flex align-items-center">
						<button onclick="addBasket('${product.proId}')"
							class="primary-btn btn text-decoration-none">Add to Cart</button>
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
			<li class="nav-item"><a class="nav-link" id="home-tab"
				data-toggle="tab" href="#home" role="tab" aria-controls="home"
				aria-selected="true">Description</a></li>
			<li class="nav-item"><a class="nav-link" id="profile-tab"
				data-toggle="tab" href="#profile" role="tab" aria-controls="profile"
				aria-selected="false">Specification</a></li>
			<li class="nav-item"><a class="nav-link active" id="review-tab"
				data-toggle="tab" href="#review" role="tab" aria-controls="review"
				aria-selected="false">Reviews</a></li>
		</ul>
		<div class="tab-content" id="myTabContent">
			<div class="tab-pane fade" id="home" role="tabpanel"
				aria-labelledby="home-tab">${product.description}</div>
			<div class="tab-pane fade" id="profile" role="tabpanel"
				aria-labelledby="profile-tab">
				<div class="table-responsive">
					<table class="table">
						<tbody>
							<tr>
								<td>
									<h5>Width</h5>
								</td>
								<td>
									<h5>128mm</h5>
								</td>
							</tr>
							<tr>
								<td>
									<h5>Height</h5>
								</td>
								<td>
									<h5>508mm</h5>
								</td>
							</tr>
							<tr>
								<td>
									<h5>Depth</h5>
								</td>
								<td>
									<h5>85mm</h5>
								</td>
							</tr>
							<tr>
								<td>
									<h5>Weight</h5>
								</td>
								<td>
									<h5>52gm</h5>
								</td>
							</tr>
							<tr>
								<td>
									<h5>Quality checking</h5>
								</td>
								<td>
									<h5>yes</h5>
								</td>
							</tr>
							<tr>
								<td>
									<h5>Freshness Duration</h5>
								</td>
								<td>
									<h5>03days</h5>
								</td>
							</tr>
							<tr>
								<td>
									<h5>When packeting</h5>
								</td>
								<td>
									<h5>Without touch of hand</h5>
								</td>
							</tr>
							<tr>
								<td>
									<h5>Each Box contains</h5>
								</td>
								<td>
									<h5>60pcs</h5>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
			<div class="tab-pane fade" id="contact" role="tabpanel"
				aria-labelledby="contact-tab">
				<div class="row">
					<div class="col-lg-6">
						<div class="comment_list">

							<div class="review_item">
								<div class="media">
									<div class="d-flex">
										<img
											src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRU2kmuGEPylkxHTNhZ9xTfS090MOP1AEAjsg&s"
											alt="">
									</div>
									<div class="media-body">
										<h4></h4>
										<h5></h5>

									</div>
								</div>
								<p></p>
							</div>

						</div>
					</div>
				</div>
			</div>
			<div class="tab-pane fade show active" id="review" role="tabpanel"
				aria-labelledby="review-tab">
				<div class="row">
					<div class="col-lg-6">
						<div class="row total_rate">
							<div class="col-6">
								<div class="box_total">
									<h5>Overall</h5>
									<c:set var="sum" value="0" />
									<c:set var="count" value="${ratings.size()}" />

									<c:forEach items="${ratings}" var="rating">
										<%-- Accumulate sum of rating_star --%>
										<c:set var="sum" value="${sum + rating.rating_star}" />
									</c:forEach>

									<%-- Calculate average rating_star --%>
									<c:set var="averageRating"
										value="${count > 0 ? sum / count : 0}" />
									<h4>${averageRating}</h4>

									<h6>(${ratings.size()} Reviews)</h6>
								</div>
							</div>
							<div class="col-6">
								<div class="rating_list">
									<h3>Based on ${ratings.size()} Reviews</h3>
								</div>
							</div>
						</div>
						<div class="review_list mt-5">
							<c:forEach items="${ratings }" var="rating">
								<div class="review_item">
									<div class="media">
										<div class="d-flex">
											<img
												src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRU2kmuGEPylkxHTNhZ9xTfS090MOP1AEAjsg&s"
												alt="" width="50px" height="50px">
										</div>
										<div class="media-body">
											<h4>${rating.name }</h4>
											<c:forEach begin="1" end="${rating.rating_star}">
												<i class="fa fa-star"></i>
											</c:forEach>
										</div>
									</div>
									<p>${rating.review }</p>
								</div>
							</c:forEach>
						</div>
					</div>
					<div class="col-lg-6">
						<form action="add-rating" method="post" th:object="${rating}">
							<div class="review_box">
								<h4>Add a Review</h4>
								<p>Your Rating:</p>
								<ul class="list" id="starList">
									<li data-star="1"><i class="fa fa-star"></i></li>
									<li data-star="2"><i class="fa fa-star"></i></li>
									<li data-star="3"><i class="fa fa-star"></i></li>
									<li data-star="4"><i class="fa fa-star"></i></li>
									<li data-star="5"><i class="fa fa-star"></i></li>
								</ul>
								<input type="hidden" th:field="*{rating_star}" id="rating_star"
									name="rating_star" value=""> <input type="hidden"
									th:field="*{product_id}" id="" name="product_id"
									value="${product.proId }">
								<p>Outstanding</p>

								<div class="row contact_form">
									<div class="col-md-12">
										<div class="form-group">
											<label for="name">Your Full Name</label> <input type="text"
												class="form-control" th:field="*{name}" id="name"
												name="name" placeholder="Your Full name" required>
										</div>
									</div>
									<div class="col-md-12">
										<div class="form-group">
											<label for="email">Email Address</label> <input type="email"
												class="form-control" th:field="*{email}" id="email"
												name="email" placeholder="Email Address" required>
										</div>
									</div>
									<div class="col-md-12">
										<div class="form-group">
											<label for="message">Review</label>
											<textarea class="form-control" th:field="*{review}"
												id="message" name="review" rows="3" placeholder="Review"
												required></textarea>
										</div>
									</div>
									<div class="col-md-12 text-right">
										<button type="submit" class="primary-btn">Submit Now</button>
									</div>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script>
	document.addEventListener('DOMContentLoaded', function () {
	    const starList = document.getElementById('starList');
	    const stars = starList.querySelectorAll('li');
	    const ratingInput = document.getElementById('rating_star');

	    stars.forEach(star => {
	        star.addEventListener('click', function (event) {
	            const rating = this.getAttribute('data-star');
	            ratingInput.value = rating;

	            // Xóa lớp selected khỏi tất cả các ngôi sao
	            stars.forEach(s => s.classList.remove('selected'));

	            // Thêm lớp selected vào các ngôi sao được chọn
	            for (let i = 0; i < rating; i++) {
	                stars[i].classList.add('selected');
	            }
	        });
	    });
	});

	</script>

</section>

