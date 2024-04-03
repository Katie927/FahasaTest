<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<!-- directive của JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta http-equiv="X-UA-Compatible" content="ie=edge" />
<title>Product Page - Admin HTML Template</title>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Roboto:400,700" />
<!-- https://fonts.google.com/specimen/Roboto -->
<link rel="stylesheet"
	href="${classpath}/backend/css/fontawesome.min.css" />
<!-- https://fontawesome.com/ -->
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
	<nav class="navbar navbar-expand-xl">
		<div class="container h-100">
			<a class="navbar-brand" href="index.html">
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
					<li class="nav-item"><a class="nav-link" href="index.html">
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
						href="${classpath }/admin/products/list"> <i class="fas fa-shopping-cart"></i>
							Products
					</a></li>

					<li class="nav-item"><a class="nav-link active" href="${classpath }/admin/categories/list">
							<i class="fas fa-shopping-cart"></i> Category
					</a></li>

					<li class="nav-item"><a class="nav-link" href="accounts.html">
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
						href="login.html"> Admin, <b>Logout</b>
					</a></li>
				</ul>
			</div>
		</div>
	</nav>
	<div class="container mt-5">
		<div class="row tm-content-row">
			<!-- Tìm kiếm -->
			<div class="col-md-2">
				<div class="form-group mb-4">
					<!-- 
													<label for="status">&nbsp;&nbsp;&nbsp;&nbsp;</label>
													<input type="checkbox" class="form-check-input" id="status" name="status" checked="checked" />
			                                        <label for="status">Active</label>
			                                         -->
					<select class="form-control" id="status" name="status"
						style="padding: 0 13px;">
						<option value="2">All</option>
						<option value="1">Active</option>
						<option value="0">Inactive</option>
					</select>
				</div>
			</div>

			<div class="col-md-2">
				<select class="form-control" id="categoryId" name="categoryId"
					style="margin-right: 10px; padding: 0 13px">
					<option value="0">Select category</option>
					<c:forEach items="${categories }" var="category">
						<option value="${category.id }">${category.name }</option>
					</c:forEach>
				</select>
			</div>

			<div class="col-md-2">
				<input class="form-control" type="date" id="beginDate"
					name="beginDate" />
			</div>
			<div class="col-md-2">
				<input class="form-control" type="date" id="endDate" name="endDate" />
			</div>

			<div class="col-md-3">
				<input type="text" class="form-control" id="keyword" name="keyword"
					placeholder="Search keyword" />
			</div>

			<div class="col-md-1">
				<button type="submit" id="btnSearch" name="btnSearch"
					class="btn btn-primary" style="padding-left: 9px">Search</button>
			</div>

			<!-- Hết tìm kiếm -->

			<div class="col-sm-12 col-md-12 col-lg-12 col-xl-12 tm-block-col">
				<div class="tm-bg-primary-dark tm-block tm-block-products">
					<div class="tm-product-table-container">
						<table class="table table-hover tm-table-small tm-product-table">
							<thead>
								<tr>
									<th scope="col">ID</th>
									<th scope="col">Category Name</th>
									<th scope="col">Category</th>
									<th scope="col">PRICE</th>
									<th scope="col">Num Of Product</th>
									<th scope="col">User CREATE /UPDATE</th>
									<th scope="col">CREATE /UPDATE Date</th>
									<th scope="col">STATUS</th>
									<th scope="col">Description</th>
									<th scope="col">&nbsp;</th>
								</tr>
							</thead>
							<tbody>

								<c:forEach var="category" items="${categories }" varStatus="loop">
									<tr>
										<!--  <th scope="row"><input type="checkbox" /></th> -->
										<td class="tm-product-name">${category.id }</td>
										<td class="tm-product-name">${category.name }</td>
										<td>${category.name }</td>
										<td>${category.name }</td>
										<td>${category.name }</td>
										<td>${category.userCreateCategory.username }/
											${category.userUpdateCategory.username }</td>
										<td><fmt:formatDate value="${category.createDate }"
												pattern="dd-MM-yyyy" /> / <fmt:formatDate
												value="${category.updateDate }" pattern="dd-MM-yyyy" /></td>
										<td><span id="_product_status_${category.id }"> <c:choose>
													<c:when test="${category.status }">
														<span>Active</span>
													</c:when>
													<c:otherwise>
														<span>Inactive</span>
													</c:otherwise>
												</c:choose>
										</span></td>

										<td>${products.isHot }</td>
										<td>
											<!--  
											<a
												href="${classpath }/admin/category/edit/${category.id }"
												role="button" class="btn btn-primary">Edit
											</a> 
											--> <a
											href="${classpath }/admin/category/delete/${category.id }">
												<i class="far fa-trash-alt tm-product-delete-icon"></i>
										</a>

										</td>
									</tr>
								</c:forEach>
								<!-- 
								<tr>
									<th scope="row"><input type="checkbox" /></th>
									<td class="tm-product-name">Lorem Ipsum Product 1</td>
									<td>1,450</td>
									<td>550</td>
									<td>28 March 2019</td>
									<td><a href="#" class="tm-product-delete-link"> <i
											class="far fa-trash-alt tm-product-delete-icon"></i>
									</a></td>
								</tr>
-->
							</tbody>
						</table>
					</div>
					<!-- table container -->
					<a href="${classpath }/admin/products/add"
						class="btn btn-primary btn-block text-uppercase mb-3">Add new
						product</a>
					<button class="btn btn-primary btn-block text-uppercase">
						Delete selected products</button>
				</div>
			</div>

			<!-- ___________________________________________ -->

			<!--  
			<div class="col-sm-12 col-md-12 col-lg-4 col-xl-4 tm-block-col">
				<div class="tm-bg-primary-dark tm-block tm-block-product-categories">
					<h2 class="tm-block-title">Product Categories</h2>
					<div class="tm-product-table-container">
						<table class="table tm-table-small tm-product-table">
							<tbody>
								<tr>
									<td class="tm-product-name">Product Category 5</td>
									<td class="text-center"><a href="#"
										class="tm-product-delete-link"> <i
											class="far fa-trash-alt tm-product-delete-icon"></i>
									</a></td>
								</tr>
								<tr>
									<td class="tm-product-name">Product Category 6</td>
									<td class="text-center"><a href="#"
										class="tm-product-delete-link"> <i
											class="far fa-trash-alt tm-product-delete-icon"></i>
									</a></td>
								</tr>
								<tr>
									<td class="tm-product-name">Product Category 7</td>
									<td class="text-center"><a href="#"
										class="tm-product-delete-link"> <i
											class="far fa-trash-alt tm-product-delete-icon"></i>
									</a></td>
								</tr>
								<tr>
									<td class="tm-product-name">Product Category 8</td>
									<td class="text-center"><a href="#"
										class="tm-product-delete-link"> <i
											class="far fa-trash-alt tm-product-delete-icon"></i>
									</a></td>
								</tr>
							</tbody>
						</table>
					</div>
					<!-- table container -->
			<!-- 
					<button class="btn btn-primary btn-block text-uppercase mb-3">
						Add new category</button>
					-->
		</div>
	</div>
	-->
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
	<script src="${classpath}/backend/js/bootstrap.min.js"></script>
	<!-- https://getbootstrap.com/ -->
	<script>
		$(function() {
			$(".tm-product-name").on("click", function() {
				window.location.href = "edit-product.html";
			});
		});
	</script>
</body>
</html>