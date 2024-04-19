<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="f" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<f:form method="post" action="${contextPath}/admin/updateproduct"
	modelAttribute="product" enctype="multipart/form-data">
	<div class="container">
		<div class="row mt-5 mb-5">
			<div class="col-md-10 m-auto">
				<div class="card card-primary">
					<div class="card-header">
						<h3 class="card-title">Edit Product</h3>

						<div class="card-tools">
							<button type="button" class="btn btn-tool"
								data-card-widget="collapse" title="Collapse">
								<i class="fas fa-minus"></i>
							</button>
						</div>
					</div>
					<div class="card-body">
						<div class="form-group">
							<f:hidden id="inputName" path="proId" class="form-control" />
						</div>
						<div class="form-group">
							<label for="inputName">Product Name</label>
							<f:input id="title" path="proName" class="form-control"
								onkeyup="ChangeToSlug()" />
							<f:errors class="text-danger" path="proName"></f:errors>
						</div>
						<div class="form-group">
							<label for="inputName">Slug</label>
							<f:input id="slug" path="slug" class="form-control" />
							<f:errors class="text-danger" path="slug"></f:errors>
						</div>
						<div class="form-group">
							<label for="inputName">price</label>
							<f:input id="inputName" path="price" class="form-control" />
							<f:errors class="text-danger" path="price"></f:errors>
						</div>
						<div class="form-group">
							<label for="inputName">old price</label>
							<f:input id="inputName" path="oldPrice" class="form-control" />
							<f:errors class="text-danger" path="oldPrice"></f:errors>
						</div>
						<div class="form-group">
							<label for="inputStatus">Status</label>
							<f:select path="status" class="form-control custom-select">
								<f:option value="true">InStock</f:option>
								<f:option value="false">OutOfStock</f:option>
							</f:select>
						</div>
						<div class="form-group">
							<label for="inputStatus">Category</label>
							<f:select path="categoryId" class="form-control custom-select">
								<c:forEach items="${category }" var="c">
									<f:option value="${c.id }">${c.categoryName}</f:option>
								</c:forEach>
							</f:select>
						</div>
						<div class="form-group">
							<label for="inputDescription">Description</label>
							<f:textarea id="inputDescription" name="description"
								class="form-control" path="description" rows="4" />
							<f:errors class="text-danger" path="description"></f:errors>
						</div>
						<div class="form-group">
							<label for="inputName"> Image</label> <input id="inputName"
								name="picture" type="file" class="form-control" onchange="showImg(this,'preview')" />
								<img src="${contextPath }/images/${ product.image}" width="350px" id="preview" >
						</div>
						<div class="form-group">
							<label for="inputName"> Images</label> <input id="inputName"
								name="files" type="file" multiple="multiple"
								class="form-control" />
								<c:forEach items="${product.imgProducts }" var="imgPro">
									<img src="${contextPath }/images/${ imgPro.image}" width="250px">
								</c:forEach>
						</div>
						<div class="col-md-10 m-auto p-3">
							<a href="${contextPath}/admin/product" class="btn btn-secondary">Cancel</a>
							<input type="submit" value="Update Product"
								class="btn btn-success float-right">
						</div>
					</div>


				</div>
				<!-- /.card-body -->
			</div>
			<!-- /.card -->
		</div>
		</div>
</f:form>

<script>
	CKEDITOR.replace('description')

	function ChangeToSlug() {
		var title, slug;

		//Lấy text từ thẻ input title 
		title = document.getElementById("title").value;

		//Đổi chữ hoa thành chữ thường
		slug = title.toLowerCase();

		//Đổi ký tự có dấu thành không dấu
		slug = slug.replace(/á|à|ả|ạ|ã|ă|ắ|ằ|ẳ|ẵ|ặ|â|ấ|ầ|ẩ|ẫ|ậ/gi, 'a');
		slug = slug.replace(/é|è|ẻ|ẽ|ẹ|ê|ế|ề|ể|ễ|ệ/gi, 'e');
		slug = slug.replace(/i|í|ì|ỉ|ĩ|ị/gi, 'i');
		slug = slug.replace(/ó|ò|ỏ|õ|ọ|ô|ố|ồ|ổ|ỗ|ộ|ơ|ớ|ờ|ở|ỡ|ợ/gi, 'o');
		slug = slug.replace(/ú|ù|ủ|ũ|ụ|ư|ứ|ừ|ử|ữ|ự/gi, 'u');
		slug = slug.replace(/ý|ỳ|ỷ|ỹ|ỵ/gi, 'y');
		slug = slug.replace(/đ/gi, 'd');
		//Xóa các ký tự đặt biệt
		slug = slug
				.replace(
						/\`|\~|\!|\@|\#|\||\$|\%|\^|\&|\*|\(|\)|\+|\=|\,|\.|\/|\?|\>|\<|\'|\"|\:|\;|_/gi,
						'');
		//Đổi khoảng trắng thành ký tự gạch ngang
		slug = slug.replace(/ /gi, "-");
		//Đổi nhiều ký tự gạch ngang liên tiếp thành 1 ký tự gạch ngang
		//Phòng trường hợp người nhập vào quá nhiều ký tự trắng
		slug = slug.replace(/\-\-\-\-\-/gi, '-');
		slug = slug.replace(/\-\-\-\-/gi, '-');
		slug = slug.replace(/\-\-\-/gi, '-');
		slug = slug.replace(/\-\-/gi, '-');
		//Xóa các ký tự gạch ngang ở đầu và cuối
		slug = '@' + slug + '@';
		slug = slug.replace(/\@\-|\-\@|\@/gi, '');
		//In slug ra textbox có id “slug”
		document.getElementById('slug').value = slug;
	}
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
