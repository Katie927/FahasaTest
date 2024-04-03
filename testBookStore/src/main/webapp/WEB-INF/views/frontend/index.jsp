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
<meta charset='utf-8'>
<meta http-equiv='X-UA-Compatible' content='IE=edge'>
<title>Nhà sách trực tuyến Fahasa.com</title>
<link rel="icon"
	href="${classpath}/frontend/images/header_img/favicon4.ico"
	type="image/x-icon">
<meta name='viewport' content='width=device-width, initial-scale=1'>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
	integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel='stylesheet' type='text/css' media='screen'
	href='${classpath}/frontend/css/style4.css'>
<link rel="stylesheet" href="${classpath}/frontend/slick/slick.css">
<link rel="stylesheet"
	href="${classpath}/frontend/font/SansSerifBldFLF-Italic.otf">
</head>
<body>
	<!-- header -->
	<jsp:include page="/WEB-INF/views/frontend/layout/header.jsp"></jsp:include>

	<!--  -->
	<nav>
		<div class="container">
			<div class="nav_banner_top">
				<div class="left_slider">
					<div class="slider_item">
						<a href=""><img
							src="${classpath}/frontend/images/nav_image/ConMung.jpg"
							alt=""></a>
					</div>
					<div class="slider_item">
						<a href=""><img
							src="${classpath}/frontend/images/nav_image/NCCDinhTI_T123_Slide_840x320_3.jpg"
							alt=""></a>
					</div>
					<div class="slider_item">
						<a href=""><img
							src="${classpath}/frontend/images/nav_image/slider_Branday_T12_Resize_840x320_1.jpg"
							alt=""></a>
					</div>
					<div class="slider_item">
						<a href=""><img
							src="${classpath}/frontend/images/nav_image/slider_Diamond_T1223_Ver2_DeliSlide_840x320.jpg"
							alt=""></a>
					</div>
				</div>
				<div class="right_slider">
					<div class="sub_banner" style="margin-bottom: 6px;">
						<a href=""><img
							src="${classpath}/frontend/images/nav_image/nav_top_banner_right_VNpayT12_392x156.png"
							alt=""></a>
					</div>
					<div class="sub_banner">
						<a href=""><img
							src="${classpath}/frontend/images/nav_image/nav_top_banner_right_2_SubBanner.png"
							alt=""></a>
					</div>
				</div>
			</div>
			<div class="nav_banner_bot">
				<div class="banner_bot_item" style="margin-right: 7px;">
					<a href=""><img
						src="${classpath}/frontend/images/nav_image/nav_banner_bot_1_HTĐonHang_SBanner_310x210.png"
						alt=""></a>
				</div>
				<div class="banner_bot_item" style="margin-right: 7px;">
					<a href=""><img
						src="${classpath}/frontend/images/nav_image/nav_banner_bot_2_TrangThieuNhiT923_Banner_SmallBanner_310x210_1.png"
						alt=""></a>
				</div>
				<div class="banner_bot_item" style="margin-right: 7px;">
					<a href=""><img
						src="${classpath}/frontend/images/nav_image/nav_banner_bot_3_BlindBoxT1123_Banner_SmallBanner_310x210.png"
						alt=""></a>
				</div>
				<div class="banner_bot_item">
					<a href=""><img
						src="${classpath}/frontend/images/nav_image/nav_banner_bot_4.png"
						alt=""></a>
				</div>
			</div>

			<div class="nav_menu">
				<div class="nav_menu_item">
					<div>
						<a href=""><img
							src="${classpath}/frontend/images/nav_image/menu/YearAndSale.png"
							alt=""></a>
					</div>
					<div class="menu_info">Year end Sale</div>
				</div>
				<div class="nav_menu_item">
					<div>
						<a href=""><img
							src="${classpath}/frontend/images/nav_image/menu/IconDonKho_120x120.png"
							alt=""></a>
					</div>
					<div class="menu_info">Dọn Kho</div>
				</div>
				<div class="nav_menu_item">
					<div>
						<a href=""><img
							src="${classpath}/frontend/images/nav_image/menu/Icon_NCC_Deli_1.png"
							alt=""></a>
					</div>
					<div class="menu_info">Deli</div>
				</div>
				<div class="nav_menu_item">
					<div>
						<a href=""><img
							src="${classpath}/frontend/images/nav_image/menu/Icon_CayThongNoel_120x120.png"
							alt=""></a>
					</div>
					<div class="menu_info">Giáng sinh</div>
				</div>
				<div class="nav_menu_item">
					<div>
						<a href=""><img
							src="${classpath}/frontend/images/nav_image/menu/Icon_MangaT11_120x120_3.png"
							alt=""></a>
					</div>
					<div class="menu_info">Manga</div>
				</div>
				<div class="nav_menu_item">
					<div>
						<a href=""><img
							src="${classpath}/frontend/images/nav_image/menu/Icon_FlashSale_Thuong_120x120.png"
							alt=""></a>
					</div>
					<div class="menu_info">Flash Sale</div>
				</div>
				<div class="nav_menu_item">
					<div>
						<a href=""><img
							src="${classpath}/frontend/images/nav_image/menu/Icon_MaGiamGia_8px_1.png"
							alt=""></a>
					</div>
					<div class="menu_info">Mã giảm giá</div>
				</div>
				<div class="nav_menu_item">
					<div>
						<a href=""><img
							src="${classpath}/frontend/images/nav_image/menu/IconDoChoi_Thuong_120x120.png"
							alt=""></a>
					</div>
					<div class="menu_info">Đồ chơi</div>
				</div>
				<div class="nav_menu_item">
					<div>
						<a href=""><img
							src="${classpath}/frontend/images/nav_image/menu/Icon_MayTinh_120x120_1.png"
							alt=""></a>
					</div>
					<div class="menu_info">Máy tính</div>
				</div>
				<div class="nav_menu_item">
					<div>
						<a href=""><img
							src="${classpath}/frontend/images/nav_image/menu/Icon_SanPhamMoi_8px_1.png"
							alt=""></a>
					</div>
					<div class="menu_info">Sản phẩm mới</div>
				</div>
			</div>
		</div>
	</nav>

	<!--  -->
	<main>
		<!-- flash_sale -->
		<div></div>
		<div class="flash_sale_container"
			style="background-image: url('${classpath}/frontend/images/main_img/flash_sale_background_image.jpg');">
			<div class="container">
				<div class="flash_sale">
					<div class="flash_sale_banner">
						<div>
							<img
								src="${classpath}/frontend/images/main_img/label-flashsale.svg"
								alt="">
						</div>
					</div>
					<div class="flash_sale_slider">
						<c:set var="count" value="0" />
						<c:forEach items="${hotProducts }" var="hotProduct">
							<c:if test="${count < 5}">
								<div class="flash_sale_item">
									<div class="item_img">
										<a href="${classpath }/product-detail/${hotProduct.id}"><img
											src="${classpath }/FileUploads/${hotProduct.avatar }" alt=""></a>
									</div>
									<div class="flash_sale_item_info">
										<a href="${classpath }/product-detail/${hotProduct.id}"><h4>${hotProduct.name }</h4></a>
										<br>
									</div>
									<div class="price">
										<fmt:formatNumber value="${hotProduct.salePrice }"
											minFractionDigits="0"></fmt:formatNumber>
									</div>
									<div class="main_price">
										<fmt:formatNumber value="${hotProduct.price }"
											minFractionDigits="0"></fmt:formatNumber>
									</div>
								</div>
							</c:if>
							<c:set var="count" value="${count + 1}" />
						</c:forEach>
						<!-- 
						<div class="flash_sale_item">
							<div class="item_img">
								<a href="${classpath }/product.html"><img
									src="${classpath}/frontend/images/product_item/image_195509_1_9655.jpg"
									alt=""></a>
							</div>
							<div class="flash_sale_item_info">
								<a href="${classpath }/product.html"><h4>Bí mật của
										Naoko</h4></a> <br>
							</div>
							<div class="price">98.800</div>
							<div class="main_price">108.000</div>
						</div>
						 -->
					</div>
				</div>
			</div>
		</div>

		<!-- product -->
		<div class="product_container">
			<div class="container">
				<div class="menu_bar">
					<div class="btn_menu_bar">
						<img src="${classpath}/frontend/images/main_img/ico_menu_red.svg"
							alt="">
						<div class="">
							<a href="">Danh mục sản phẩm</a>
						</div>
					</div>
					<div class="menu_bar_items">
						<div class="menu_item">
							<a href=""><img
								src="${classpath}/frontend/images/main_img/menu_bar/giang-sinh-mau-2.jpg"
								alt=""></a> <a href="">Giáng sinh</a>
						</div>
						<div class="menu_item">
							<a href=""><img
								src="${classpath}/frontend/images/main_img/menu_bar/8935337508955-_4_.jpg"
								alt=""></a> <a href="">Đồ chơi</a>
						</div>
						<div class="menu_item">
							<a href=""><img
								src="${classpath}/frontend/images/main_img/menu_bar/9786043654370.jpg"
								alt=""></a> <a href="">Xu hướng kinh tế</a>
						</div>
						<div class="menu_item">
							<a href=""><img
								src="${classpath}/frontend/images/main_img/menu_bar/_am_m_.jpg"
								alt=""></a> <a href="">Ngôn tình đam mĩ</a>
						</div>
						<div class="menu_item">
							<a href=""><img
								src="${classpath}/frontend/images/main_img/menu_bar/Cat_PopMart_100x100.jpg"
								alt=""></a> <a href="">Thế giới pop mart</a>
						</div>
						<div class="menu_item">
							<a href=""><img
								src="${classpath}/frontend/images/main_img/menu_bar/T_m_linh.jpg"
								alt=""></a> <a href="">Tâm linh luân hồi</a>
						</div>
						<div class="menu_item">
							<a href=""><img
								src="${classpath}/frontend/images/main_img/menu_bar/Thao_t_ng.jpg"
								alt=""></a> <a href="">Tâm lý thao túng</a>
						</div>
						<div class="menu_item">
							<a href=""><img
								src="${classpath}/frontend/images/main_img/menu_bar/thieunhis2.jpg"
								alt=""></a> <a href="">Thiếu nhi</a>
						</div>
						<div class="menu_item">
							<a href=""><img
								src="${classpath}/frontend/images/main_img/menu_bar/Ti_u_Thuy_t.jpg"
								alt=""></a> <a href="">Tiểu thuyết</a>
						</div>
						<div class="menu_item">
							<a href=""><img
								src="${classpath}/frontend/images/main_img/menu_bar/tpkds1.jpg"
								alt=""></a> <a href="">Văn học kinh điển</a>
						</div>

					</div>

				</div>
			</div>
		</div>


		<!--  -->
		<div class="container">
			<div class="product_sale">
				<div class="product_sale_bar">
					<img
						src="${classpath}/frontend/images/main_img/product_group/icon_dealhot_new.png"
						alt="">
					<div class="">
						<a href="">Xu hướng mua sắm</a>
					</div>
				</div>
				<div class="flash_sale_slider">
					<c:set var="count" value="0" />
					<c:forEach items="${products }" var="product">
						<c:if test="${count < 5}">
							<div class="flash_sale_item">
								<div class="item_img">
									<a href="${classpath }/product-detail/${product.id}"><img
										src="${classpath }/FileUploads/${product.avatar }" alt=""></a>
								</div>
								<div class="flash_sale_item_info">
									<a href="${classpath }/product-detail/${product.id}"><h4>${product.name }</h4></a>
									<br>
								</div>
								<div class="price">
									<fmt:formatNumber value="${product.salePrice }"
										minFractionDigits="0"></fmt:formatNumber>
								</div>
								<div class="main_price">
									<fmt:formatNumber value="${product.price }"
										minFractionDigits="0"></fmt:formatNumber>
								</div>
							</div>
						</c:if>
						<c:set var="count" value="${count + 1}" />
					</c:forEach>
				</div>
			</div>
		</div>

		<!--  -->
		<div class="container">
			<div class="product_sale">
				<div class="product_sale_bar">
					<img
						src="${classpath}/frontend/images/main_img/product_group/icon_dealhot_new.png"
						alt="">
					<div class="">
						<a href="">Thường hiệu nổi bật</a>
					</div>
				</div>
				<div class="flash_sale_slider">
					<c:set var="count" value="0" />
					<c:forEach items="${products }" var="product">
						<c:if test="${count < 5}">
							<div class="flash_sale_item">
								<div class="item_img">
									<a href="${classpath }/product-detail/${product.id}"><img
										src="${classpath }/FileUploads/${product.avatar }" alt=""></a>
								</div>
								<div class="flash_sale_item_info">
									<a href="${classpath }/product-detail/${product.id}"><h4>${product.name }</h4></a>
									<br>
								</div>
								<div class="price">
									<fmt:formatNumber value="${product.salePrice }"
										minFractionDigits="0"></fmt:formatNumber>
								</div>
								<div class="main_price">
									<fmt:formatNumber value="${product.price }"
										minFractionDigits="0"></fmt:formatNumber>
								</div>
							</div>
						</c:if>
						<c:set var="count" value="${count + 1}" />
					</c:forEach>
				</div>
			</div>
		</div>
	</main>

	<!-- footer -->
	<jsp:include page="/WEB-INF/views/frontend/layout/footer.jsp"></jsp:include>

</body>

<script src="${classpath}/frontend/slick/jquery-3.7.1.min.js"></script>
<script src="${classpath}/frontend/slick/slick.min.js"></script>
<script>
	$('.left_slider')
			.slick(
					{
						dots : true,
						autoplay : true,
						speed : 300,
						slidesToShow : 1,
						slidesToScroll : 1,

						prevArrow : '<button type="button" class="slick_prev btn_custom_prev"><i class="fa-solid fa-chevron-left"></i></button>',
						nextArrow : '<button type="button" class="slick_prev btn_custom_next"><i class="fa-solid fa-chevron-right"></i></button>'

					})
</script>
</html>