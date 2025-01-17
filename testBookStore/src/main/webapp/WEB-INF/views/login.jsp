<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<!-- directive của JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset='utf-8'>
<meta http-equiv='X-UA-Compatible' content='IE=edge'>
<title>Nhà sách trực tuyến Fahasa.com</title>
<link rel="icon"
	href="${classpath}/frontend/images/header_img/favicon4.ico"
	type="image/x-icon">
<meta name='viewport' content='width=device-width, initial-scale=1'>

<link rel='stylesheet' type='text/css' media='screen'
	href='${classpath}/frontend/css/style4.css'>
<link rel="stylesheet" href="${classpath}/frontend/slick/slick.css">
<link rel="stylesheet"
	href="${classpath}/frontend/font/SansSerifBldFLF-Italic.otf">
<link rel="stylesheet" href="${classpath}/backend/css/bootstrap.min.css" />
<!-- BoxIcon -->
<link href='https://unpkg.com/boxicons@2.1.2/css/boxicons.min.css'
	rel='stylesheet'>
<!-- Swiper -->
<link rel="stylesheet"
	href="https://unpkg.com/swiper/swiper-bundle.min.css" />

</head>
<body>
	<!-- header -->
	<jsp:include page="/WEB-INF/views/frontend/layout/header.jsp"></jsp:include>

	<!--  -->
	<nav></nav>

	<!--  -->
	<main>
		<div class="container">
			<div class="login_title">
				<h3>Đăng Nhập</h3>
			</div>
			<div class="login_form" >
				<form class="form_creat_user" method="POST" action="${classpath }/login_processing_url">
					<c:if test="${not empty param.login_error }">
						<div class="alert alert-danger" role="alert">Login attempt
							was not successful, try again!!!</div>
					</c:if>
					<div class="login_row">
						<label for="">Số điện thoại/Email</label> <input type="text"
							name="username" id="username"
							placeholder="Nhập số điện thoại hoặc email">
					</div>
					<div class="login_row">
						<label for="">Mật khẩu</label> <input type="password"
							name="password" id="password" placeholder="Nhập mật khẩu">
					</div>
					<div class="password_forget">
						<a href="">Quên mật khẩu</a>
					</div>
					<br>
					<div class="password_forget">
						<a href="${classpath }/signup">Đăng ký</a>
					</div>
					<div class="login_button">
						<button type="submit">Đăng nhập</button>
					</div>
					
				</form>
			</div>
		</div>
	</main>

	<!-- footer -->
	<jsp:include page="/WEB-INF/views/frontend/layout/footer.jsp"></jsp:include>

</body>
</html>