<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="f" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<f:form method="post" action="${contextPath}/admin/updateorder"
	modelAttribute="order" >
	<div class="container">
		<div class="row mt-5 mb-5">
			<div class="col-md-10 m-auto">
				<div class="card card-primary">
					<div class="card-header">
						<h3 class="card-title">Edit Order</h3>

						<div class="card-tools">
							<button type="button" class="btn btn-tool"
								data-card-widget="collapse" title="Collapse">
								<i class="fas fa-minus"></i>
							</button>
						</div>
					</div>
					<div class="card-body">
						<div class="form-group">
							<label for="inputName">OrderID</label>
							<input id="simpleDomainForm" readonly="readonly" value="${order.orderId }" class="form-control"  />
							<f:hidden  id="title" path="orderId" />
						</div>
						<div class="form-group">
							<label for="inputName">Cutomer Name</label>
							<input id="title" value="${order.account.fullname }" readonly class="form-control" />
							<f:hidden  id="title" path="accountId" /> 
						</div>
						<div class="form-group">
							<label for="inputName">OrderNote</label>
							<input id="title" value="${order.note }" readonly class="form-control" />
							<f:hidden  id="title" path="note" /> 
						</div>
						<div class="form-group">
							<label for="inputStatus">Status</label>
							<c:choose>
								<c:when test="${order.status == 1}">
									<f:select path="status" class="form-control custom-select">										
										<f:option value="1">Verify order</f:option>
										<f:option value="2">In delivery</f:option>
										<f:option value="3">Success</f:option>
										<f:option value="4">Cancel order</f:option>
									</f:select>
								</c:when>
								<c:when test="${order.status == 2}">
									<f:select path="status" class="form-control custom-select">
										<f:option value="2">In delivery</f:option>
										<f:option value="3">Success</f:option>
									</f:select>
								</c:when>
							</c:choose>					
						</div>
						<div class="form-group">
							<label for="inputStatus">PaymentMethod</label>
							<input id="title" value="${order.paymentMethod==1 ?'Cash' : 'Credit Transfer' }" readonly class="form-control" />
							<f:hidden  id="title" path="paymentMethod" /> 
						</div>
						<div class="col-md-10 m-auto p-3">
							<a href="${contextPath}/admin/order" class="btn btn-secondary">Cancel</a>
							<input type="submit" value="Update Order"
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

