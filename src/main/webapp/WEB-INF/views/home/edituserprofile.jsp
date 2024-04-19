<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="f" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
  <!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-section set-bg" data-setbg="{{ asset('Customer-assets') }}/img/banner.png">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>Cập nhật Thông tin</h2>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->
    <section style="background-color: #eee;" class="">
        <div class="container bootstrap snippets bootdey card ">
            <h1 class=" p-3">Cập nhật thông tin</h1>
            <hr>
            <form class="form-horizontal" role="form" method="POST"
                        action="${contextPath}/updateuser" enctype="multipart/form-data"  >
            <div class="row">
                <!-- left column -->

                <div class="col-md-3">
                    
                        
                        <div class="text-center mt-4">
                        <c:choose>
                        	<c:when test="${!empty user.picture  }">
	                        	<img id='img' src="${contextPath}/images/${user.picture }" alt="avatar"
	                          class=" img-fluid mb-2" style="width: 150px;">
                        	</c:when>
                        	<c:otherwise>
                        	<img id='img' src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-chat/ava3.webp" alt="avatar"
	                          class=" img-fluid mb-2" style="width: 150px;">
                        	</c:otherwise>
                        </c:choose>
                    
                            <h6 class="mt-2 mb-2">Change Avatar</h6>
                            <input type="file" class="form-control" onchange="showImg(this,'img')" name="photo">
                        </div>
                </div>

                <!-- edit form column -->
                <div class="col-md-9 personal-info">
                   	<input hidden name="username" value="${user.username }" />               
                    <h3 class=" p-3">Personal info</h3>
                    <div class="form-group">
                        <label class="col-lg-3 control-label">Full Name</label>
                        <div class="col-lg-10">
                            <input  name="fullname" class="form-control" value="${user.fullname }" >
                        </div>
                        
                    </div>
                    <div class="form-group">
                        <label class="col-lg-3 control-label">Phone Number</label>
                        <div class="col-lg-10">
                            <input name="phone" class="form-control"  value="${user.phone }">
                        </div>
                       
                    </div>
                    <div class="form-group">
                        <label class="col-lg-3 control-label">Address</label>
                        <div class="col-lg-10">
                            <input name="address" class="form-control"  value="${user.address }">
                        </div>
                       
                    </div>
                    <button type="submit" class="btn btn-success m-3">Cập nhật thông tin</button>

                </div>
               
            </div>
             </form>
        </div>

    </section>
    
    <script>
    function showImg(input, target) {
        let file = input.files[0];
        let reader = new FileReader();

        reader.readAsDataURL(file);
        reader.onload = function() {
            let img = document.getElementById(target);
            // can also use "this.result"
            img.src = reader.result;
        }
    }
    </script>