<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="f" uri="http://www.springframework.org/tags/form"%>
<f:form action="saveCategory" method="post"  modelAttribute="category">
	<div class="container ">
		<div class="row mt-5">
			<div class="col-md-10  m-auto">
				<div class="card card-primary">
					<div class="card-header">
						<h3 class="card-title">Add new Category</h3>

						<div class="card-tools">
							<button type="button" class="btn btn-tool"
								data-card-widget="collapse" title="Collapse">
								<i class="fas fa-minus"></i>
							</button>
						</div>
					</div>
					<div class="card-body">
						<div class="form-group">
							<label for="inputName">Category Name</label>
							<f:input path="categoryName" class="form-control"/>
							<f:errors class="text-danger" path="categoryName"></f:errors>
						</div>
						<div class="form-group">
							<label for="inputStatus">Status</label> 
								<f:select path="status" class="form-control custom-select">	
								<f:option value="true"  >Active</f:option>
								<f:option value="false">InActive</f:option>
								</f:select>
						</div>
					</div>
					<!-- /.card-body -->
				</div>
				<!-- /.card -->
			</div>

		</div>
		<div class="row">
			<div class="col-md-10 m-auto">
				<a href="${contextPath}/admin/category" class="btn btn-secondary">Cancel</a> <input
					type="submit" value="Create new Project"
					class="btn btn-success float-right">
			</div>
		</div>
	</div>


</f:form>
