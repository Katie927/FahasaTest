<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<!-- directive của JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html lang="en">
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

<body id="reportsPage">
	<div class="" id="home">
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
						<li class="nav-item"><a class="nav-link"
							href="${classpath }/admin/index"> <i
								class="fas fa-tachometer-alt"></i> Dashboard <span
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
							href="${classpath }/admin/product/list"> <i
								class="fas fa-shopping-cart"></i> Products
						</a></li>

						<li class="nav-item"><a class="nav-link"
							href="${classpath }/admin/category/list"> <i
								class="fas fa-shopping-cart"></i> Category
						</a></li>

						<li class="nav-item"><a class="nav-link"
							href="${classpath }/admin/publisher/list"> <i
								class="fas fa-shopping-cart"></i> Publisher
						</a></li>

						<li class="nav-item"><a class="nav-link active"
							href="${classpath }/admin/user/list"> <i class="far fa-user"></i>
								Accounts
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
		<div class="container mt-5">

			<!-- row -->
			<div class="row tm-content-row">
				<div class="tm-block-col tm-col-avatar">
					<div class="tm-bg-primary-dark tm-block tm-block-avatar">
						<h2 class="tm-block-title">Change Avatar</h2>
						<div class="tm-avatar-container">
							<img src="img/avatar.png" alt="Avatar"
								class="tm-avatar img-fluid mb-4" /> <a href="#"
								class="tm-avatar-delete-link"> <i
								class="far fa-trash-alt tm-product-delete-icon"></i>
							</a>
						</div>
						<button class="btn btn-primary btn-block text-uppercase">
							Upload New Photo</button>
					</div>
				</div>
				<div class="tm-block-col tm-col-account-settings">
					<div class="tm-bg-primary-dark tm-block tm-block-settings">
						<h2 class="tm-block-title">Account Settings</h2>
						<sf:form action="${classpath }/admin/user/edit-save" class="tm-signup-form row" method="post" modelAttribute="user"
								enctype="multipart/form-data">
							<sf:hidden path="id"/>
							<div class="form-group col-lg-6">
								<label for="name">Account Name</label> <sf:input path="name" id="name"
									name="name" type="text" class="form-control validate" readonly="true" style="background-color: #54657d"></sf:input>
							</div>
							<div class="form-group col-lg-6">
								<label for="username">Username</label> <sf:input path="username" id="username"
									name="username" type="text" class="form-control validate" readonly="true" style="background-color: #54657d"></sf:input>
							</div>
							<div class="form-group col-lg-6">
								<label for="email">Account Email</label> <sf:input path="email" id="email"
									name="email" type="email" class="form-control validate" readonly="true" style="background-color: #54657d"></sf:input>
							</div>
							<div class="form-group col-lg-6">
								<label for="password">Password</label> <sf:input path="password" id="password"
									name="password" type="password" class="form-control validate" readonly="true" style="background-color: #54657d"></sf:input>
							</div>
							<div class="form-group col-lg-6">
								<label for="address">Address</label> <sf:input path="address"
									id="address" name="address" type="text"
									class="form-control validate" readonly="true" style="background-color: #54657d"></sf:input>
							</div>
							<div class="form-group col-lg-6">
								<label for="mobile">Phone</label> <sf:input path="mobile" id="mobile" name="mobile"
									type="tel" class="form-control validate" readonly="true" style="background-color: #54657d"></sf:input>
							</div>

							<div class="form-group col-lg-6">
								<label for="userRoles">User Role</label>
								<select class="form-control" style="background-color: #54657d" 
											id="userRoles" readonly="true" style="padding: 7px">
										<option value="0">User Role</option>
										<c:forEach items="${userRoles }" var="userRole">
											<option value="${userRole.id }">${userRole.name }</option>
										</c:forEach>
								</select>
							</div>
							<div class="form-group col-lg-6">
								<label for="roles">Role to add</label>
								<select class="form-control" name="roles"
											id="roles" style="padding: 7px">
										<option value="0">Select Role</option>
										<c:forEach items="${roles }" var="role">
											<option value="${role.id }">${role.name }</option>
										</c:forEach>
								</select>
							</div>
							<div class="col-12">
								<button type="submit"
									class="btn btn-primary btn-block text-uppercase">
									Save Account</button>
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
	</div>

	<script src="js/jquery-3.3.1.min.js"></script>
	<!-- https://jquery.com/download/ -->
	<script src="js/bootstrap.min.js"></script>
	<!-- https://getbootstrap.com/ -->
</body>
</html>
