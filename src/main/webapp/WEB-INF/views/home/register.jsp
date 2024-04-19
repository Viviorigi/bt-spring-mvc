<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="f" uri="http://www.springframework.org/tags/form" %>
     <c:set var="contextPath"  value="${pageContext.servletContext.contextPath}" scope="session" />
     	<!--================Login Box Area =================-->
	<section class="login_box_area section_gap">
		<div class="container">
			<div class="row">
				<div class="col-lg-6">
					<div class="login_box_img">
						<img class="img-fluid"  src="${contextPath }/home/img/login.jpg" alt="">
						<div class="hover">
							<h4>You have account? </h4>
							<p>There are advances being made in science and technology everyday, and a good example of this is the</p>
							<a class="primary-btn" href="${contextPath }/login">Login Account</a>
						</div>
					</div>
				</div>
				<div class="col-lg-6">
					<div class="login_form_inner">
						<h3>Register Account</h3>
						<f:form class="row login_form" action="postRegister" modelAttribute="account" method="post" id="contactForm" novalidate="novalidate">
							<div class="col-md-12 form-group">
								<f:input path="fullname" type="text" class="form-control" id="name" name="name" placeholder="Name" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Name'"></f:input>
							</div>
							<div class="col-md-12 form-group">
								<f:input  path="username" type="text" class="form-control" id="name" name="name" placeholder="Username(Email)" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Username'"></f:input>
							</div>
							<div class="col-md-12 form-group">
								<f:input path="password" type="password" class="form-control" id="name" name="name" placeholder="Password" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Password'"></f:input>
							</div>
							<div class="col-md-12 form-group">
								<f:input path="phone" type="text" class="form-control" id="name" name="name" placeholder="Phone Number" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Phone Number'"></f:input>
							</div>
							<div class="col-md-12 form-group">
								<f:input path="address" type="text" class="form-control" id="name" name="name" placeholder="Address" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Address'"></f:input>
							</div>
							<div class="col-md-12 form-group">
								<button type="submit" value="submit" class="primary-btn">Create Account</button>
							</div>
						</f:form>
					</div>
				</div>
			</div>
		</div>
	</section>