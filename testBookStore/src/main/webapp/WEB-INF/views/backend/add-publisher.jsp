<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<!-- directive của JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta http-equiv="X-UA-Compatible" content="ie=edge" />
<title>Add Product - Dashboard HTML Template</title>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Roboto:400,700" />
<!-- https://fonts.google.com/specimen/Roboto -->
<link rel="stylesheet"
	href="${classpath}/backend/css/fontawesome.min.css" />
<!-- https://fontawesome.com/ -->
<link rel="stylesheet"
	href="${classpath}/backend/jquery-ui-datepicker/jquery-ui.min.css"
	type="text/css" />
<!-- http://api.jqueryui.com/datepicker/ -->
<link rel="stylesheet" href="${classpath}/backend/css/bootstrap.min.css" />
<!-- https://getbootstrap.com/ -->
<link rel="stylesheet"
	href="${classpath}/backend/css/templatemo-style.css">
<!--
	Product Admin CSS Template
	https://templatemo.com/tm-524-product-admin
	-->
</head>

<body>
	<nav class="navbar navbar-expand-xl">
		<div class="container h-100">
			<a class="navbar-brand" href="${classpath }/admin/index">
				<h1 class="tm-site-title mb-0">Product Admin</h1>
			</a>
			<button class="navbar-toggler ml-auto mr-0" type="button"
				data-toggle="collapse" data-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<i class="fas fa-bars tm-nav-icon"></i>
			</button>

			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav mx-auto h-100">
					<li class="nav-item"><a class="nav-link" href="${classpath }/admin/index">
							<i class="fas fa-tachometer-alt"></i> Dashboard <span
							class="sr-only">(current)</span>
					</a></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
						role="button" data-toggle="dropdown" aria-haspopup="true"
						aria-expanded="false"> <i class="far fa-file-alt"></i> <span>
								Reports <i class="fas fa-angle-down"></i>
						</span>
					</a>
						<div class="dropdown-menu" aria-labelledby="navbarDropdown">
							<a class="dropdown-item" href="#">Daily Report</a> <a
								class="dropdown-item" href="#">Weekly Report</a> <a
								class="dropdown-item" href="#">Yearly Report</a>
						</div></li>
					<li class="nav-item"><a class="nav-link"
						href="${classpath }/admin/products/list"> <i
							class="fas fa-shopping-cart"></i> Products
					</a></li>

					<li class="nav-item"><a class="nav-link" href="${classpath }/admin/publisher/list">
							<i class="fas fa-shopping-cart"></i> Category
					</a></li>
					
					<li class="nav-item"><a class="nav-link active"
						href="${classpath }/admin/publisher/list"> <i
							class="fas fa-shopping-cart"></i> Publisher
					</a></li>

					<li class="nav-item"><a class="nav-link" href="${classpath }/admin/user/list">
							<i class="far fa-user"></i> Accounts
					</a></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
						role="button" data-toggle="dropdown" aria-haspopup="true"
						aria-expanded="false"> <i class="fas fa-cog"></i> <span>
								Settings <i class="fas fa-angle-down"></i>
						</span>
					</a>
						<div class="dropdown-menu" aria-labelledby="navbarDropdown">
							<a class="dropdown-item" href="#">Profile</a> <a
								class="dropdown-item" href="#">Billing</a> <a
								class="dropdown-item" href="#">Customize</a>
						</div></li>
				</ul>
				<ul class="navbar-nav">
					<li class="nav-item"><a class="nav-link d-block"
						href="login.html"> ${loginedUser.name }, <b>Logout</b>
					</a></li>
				</ul>
			</div>
		</div>
	</nav>

	<div class="container tm-mt-big tm-mb-big">
		<div class="row">

			<div class="col-xl-9 col-lg-10 col-md-12 col-sm-12 mx-auto">
				<div class="tm-bg-primary-dark tm-block tm-block-h-auto">
					<div class="row">
						<div class="col-12">
							<h2 class="tm-block-title d-inline-block">Add Product</h2>
						</div>
					</div>
					<sf:form action="${classpath }/admin/publisher/add-save"
						method="post" modelAttribute="publisher"
						enctype="multipart/form-data">
						<div class="row tm-edit-product-row">

							<div class="col-xl-6 col-lg-6 col-md-12">
								<!-- 							<form action="" class="tm-edit-product-form">	 -->
								<div class="form-group mb-3">
									<label for="name">Publisher Name </label> <input id="name"
										name="name" type="text" class="form-control validate" required />
								</div>
								<div class="form-group mb-3">
									<label for="description">Description</label>
									<sf:textarea path="description" class="form-control validate" rows="3"></sf:textarea>
								</div>
								<div class="form-group mb-4">
									<label for="status">&nbsp;&nbsp;&nbsp;&nbsp;</label>
												<sf:checkbox path="status" class="form-check-input" id="status" name="status"></sf:checkbox>
			                        <label for="status">Active</label>
                                </div>

							</div>
							<div class="col-xl-6 col-lg-6 col-md-12 mx-auto mb-4">
								<div class="tm-product-img-dummy mx-auto">
									<i class="fas fa-cloud-upload-alt tm-upload-icon"
										onclick="document.getElementById('fileInput').click();"></i>
								</div>
								<div class="custom-file mt-3 mb-3">
									<input id="fileInput" type="file" style="display: none;" /> <input
										type="button" class="btn btn-primary btn-block mx-auto"
										value="UPLOAD CATEGORY AVATAR"
										onclick="document.getElementById('fileInput').click();" />
								</div>
								<br>
								<div class="row"></div>
							</div>
							<!--  -->
							<div class="col-xl-6 col-lg-6 col-md-12 mx-auto mb-4">
								<div class="row">
								
									<!-- create/update date -->
									<div class="form-group mb-3 col-xs-12 col-sm-6">
										<label for="create">Create by</label>
										<sf:select path="userCreatePublisher.id" class="form-control"
											id="createBy" style="padding: 7px">
											<sf:options items="${users }" itemValue="id"
												itemLabel="username"></sf:options>
										</sf:select>
									</div>
									<div class="form-group mb-3 col-xs-12 col-sm-6">
										<label for="create">Update by</label>
										<sf:select path="userUpdatePublisher.id" class="form-control"
											id="updateBy" style="padding: 7px">
											<sf:options items="${users }" itemValue="id"
												itemLabel="username"></sf:options>
										</sf:select>
									</div>
								</div>
							</div>
							<!--  -->
							<div class="col-xl-6 col-lg-6 col-md-12 mx-auto mb-4">
								<div class="row">
									
									<div class="form-group mb-3 col-xs-12 col-sm-6">
										<label for="createdate">Create date</label>
										<!--  <input id="stock"
													name="stock" type="text" class="form-control validate"
													required />	-->
										<sf:input path="createDate" class="form-control" type="date"
											id="createDate" name="createDate" readonly="true" style="background-color: #54657d"></sf:input>
									</div>
									<div class="form-group mb-3 col-xs-12 col-sm-6">
										<label for="createdate">Update date</label>
										<!--  <input id="stock"
													name="stock" type="text" class="form-control validate"
													required />	-->
										<sf:input path="updateDate" class="form-control" type="date"
											id="updateDate" name="updateDate" readonly="true" style="background-color: #54657d"></sf:input>
									</div>
								</div>
							</div>
							<!--  -->
							<div class="col-12">
								<button type="submit"
									class="btn btn-primary btn-block text-uppercase">Add
									Category Now</button>
							</div>

						</div>
					</sf:form>
				</div>
			</div>
		</div>
	</div>
	<footer class="tm-footer row tm-mt-small">
		<div class="col-12 font-weight-light">
			<p class="text-center text-white mb-0 px-4 small">
				Copyright &copy; <b>2018</b> All rights reserved. Design: <a
					rel="nofollow noopener" href="https://templatemo.com"
					class="tm-footer-link">Template Mo</a>
			</p>
		</div>
	</footer>

	<script src="${classpath}/backend/js/jquery-3.3.1.min.js"></script>
	<!-- https://jquery.com/download/ -->
	<script
		src="${classpath}/backend/jquery-ui-datepicker/jquery-ui.min.js"></script>
	<!-- https://jqueryui.com/download/ -->
	<script src="${classpath}/backend/js/bootstrap.min.js"></script>
	<!-- https://getbootstrap.com/ -->
	<script>
		$(function() {
			$("#expire_date").datepicker();
		});
	</script>
</body>
</html>
