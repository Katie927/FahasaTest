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
<head>
<meta charset='utf-8'>
<meta http-equiv='X-UA-Compatible' content='IE=edge'>
<title>Chi tiet san pham</title>
<link rel="icon"
	href="${classpath}/frontend/images/header_img/favicon4.ico"
	type="image/x-icon">
<meta name='viewport' content='width=device-width, initial-scale=1'>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
	integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel='stylesheet' type='text/css' media='screen'
	href='${classpath}/frontend/css/style.css'>
<link rel="stylesheet" href="${classpath}/frontend/slick/slick.css">
<link rel="stylesheet"
	href="${classpath}/frontend/font/SansSerifBldFLF-Italic.otf">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>

<body>

	<!-- header -->
	<jsp:include page="/WEB-INF/views/frontend/layout/header.jsp"></jsp:include>

	<!--  -->
	<nav>
		<!--  -->
		<form action="${classpath }/product-detail" method="get">
			<div class="container">
				<div class="add_to_cart_form">
					<div class="product_page_container">
						<div class="product_images">
							<div class="product_image_thumbnails">
								<c:forEach items="${productImages }" var="productImage">
									<li class="image_thumbnails_items" style="cursor: pointer;"><img
											src="${classpath }/FileUploads/${productImage.path }"
											alt="">
									</li>
								</c:forEach>
								
							</div>
							<div class="product_image_view">
								<a href=""><img
									src="${classpath }/FileUploads/${product.avatar }" alt=""></a>
							</div>
						</div>
						<div class="product_details" style="margin-left: 13px;">
							<div class="product_name">
								<h2>${product.name }</h2>
							</div>
							<div class="supplier">
								<div class="supplier_name">
									Nhà cung câp: <a href=""><p>${product.publisher.name }</p></a>
								</div>
								<div class="supplier_name">
									Nhà xuất bản:
									<p>NXB Hội Nhà Văn</p>
								</div>
								<div class="supplier_name">
									Tác giả:
									<p>Higashino Keigo</p>
								</div>
								<div class="supplier_name">
									Hình thức bìa:
									<p>Bìa mềm</p>
								</div>
							</div> 
							<div class="rate">
								<div class="rating_box"
									style="background: url('./images/product_item/ico_star_gray.svg');">
									<div class="rating"
										style="background: url(images/product_item/ico_star_yellow.svg);">
									</div>
								</div>
								<div class="review_position">
									<p>(50 đánh giá)</p>
								</div>
							</div>
							<div class="product_price">
								<div class="price product_discounted_price">
									<fmt:formatNumber value="${product.salePrice }"
										minFractionDigits="0"></fmt:formatNumber>
									<sup>đ</sup>
								</div>
								<div class="main_price" style="font-size: 17px;">
									<fmt:formatNumber value="${product.price }"
										minFractionDigits="0"></fmt:formatNumber>
									<sup>đ</sup>
								</div>
								<div class="discount">-15%</div>
							</div>
							<!--  -->
							<div class="supplier">
								<div class="supplier_name">
									Thời gian giao hàng: <a href=""><p></p></a>
								</div>
								<div class="supplier_name">
									Giao hàng đến: <a href=""><p>Cập nhật địa chỉ</p></a>
								</div>
								<div class="supplier_name">Chính sách đổi trả:</div>
								<div class="supplier_name">
									Đổi trả sản phẩm trong 30 ngày <a href=""><p>xem thêm</p></a>
								</div>
							</div>
							<!--   -->
							<div class="quantity_to_add">
								<div>Số lượng:</div>
								<div class="input_quantity">
									<button onclick="decreaseValue()" class="quantity_button">-</button>
									<input type="number" id="number" class="quantity_number"
										value="1">
									<button onclick="increaseValue()" class="quantity_button">+</button>
								</div>
							</div>


						</div>
					</div>
					<div class="add_to_cart">
						<div class="add" style="cursor: pointer;">
							<a onclick="addToCart(${product.id })"> <img
								src="${classpath}/frontend/images/header_img/icon-cart.svg"
								alt=""> Thêm vào giỏ hàng
							</a>
						</div>
						<div class="add add_right">
							<a href=""> Mua ngay </a>
						</div>
					</div>
				</div>
			</div>

			<div class="container">
				<div class="product_info">
					<div class="product_info_title">
						<h2>Thông tin sản phẩm</h2>
					</div>
					<div class="all_product_info">
						<table>
							<thead>

							</thead>
							<colgroup style="width: 100%;">
								<col style="width: 25%;">
								<col>
							</colgroup>
							<tbody>
								<tr>
									<td>Mã hàng</td>
									<td>8935235212473</td>
								</tr>
								<tr>
									<td>Tên nhà cung cấp</td>
									<td><a href="" style="color: blue;">${product.publisher.name }</a></td>
								</tr>
								<tr>
									<td>Tác giả</td>
									<td>Higashino Keigo</td>
								</tr>
								<tr>
									<td>Người dịch</td>
									<td>Uyên Thiểm, Trương Thùy Lan</td>
								</tr>
								<tr>
									<td>NXB</td>
									<td>NXB Hội Nhà Văn</td>
								</tr>
								<tr>
									<td>Năm XB</td>
									<td>2018</td>
								</tr>
								<tr>
									<td>Trọng lượng (gr)</td>
									<td>500</td>
								</tr>
								<tr>
									<td>Kích thước bao bì</td>
									<td>14 x 20.5 cm</td>
								</tr>
								<tr>
									<td>Số trang</td>
									<td>468</td>
								</tr>
								<tr>
									<td>Hình thức</td>
									<td>Bìa mềm</td>
								</tr>
							</tbody>
						</table>
						<div style="padding: 12px 27px; line-height: 25px;">
							<p>Giá sản phẩm trên Fahasa.com đã bao gồm thuế theo luật
								hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa
								chỉ giao hàng mà có thể phát sinh thêm chi phí khác như Phụ phí
								đóng gói, phí vận chuyển, phụ phí hàng cồng kềnh,...</p>
							<p style="color: #C92127;">Chính sách khuyến mãi trên
								Fahasa.com không áp dụng cho Hệ thống Nhà sách Fahasa trên toàn
								quốc</p>
						</div>

						<div id="product_content_desciption">
							<div id="desc_content">
								<p style="margin-bottom: 13px;">Cuộc sống của Hirasule trôi
									qua hết sức bình lặng, cho đến một ngày tai nạn giao thông
									khủng khiếp xảy ra và gã mất đi người vợ yêu quý nhất của mình,
									còn đứa con gái bé bỏng vẫn trong tình trạng hôn mê bất tỉnh.
									Nhưng chỉ sau một đêm, con gái gã tỉnh lại và một mực xưng mình
									là Naoko, vợ gã. Dường như linh hồn của Naoko đã nhập vào thể
									xác con gái, còn Monami thực sự đã chết. Rốt cuộc Hirasuke đã
									mất vợ hay con gái trong vụ tai nạn ấy?</p>
								<p>
									<strong>Bí mật của Naoko</strong> đã giành Giải thưởng của Hiệp
									hội các Nhà văn viết truyện kỳ bí Nhật Bản vào năm 1999, và là
									một trong những tác phẩm quan trọng nhất trong sự nghiệp của
									Higashino Keigo, bậc thầy truyện trinh thám Nhật thế kỷ XX.
								</p>
							</div>
						</div>

					</div>
				</div>
			</div>
		</form>
	</nav>

	<!--  -->
	<main>
		<!--  -->
		<div class="container">
			<div class="product_sale">
				<div class="product_sale_bar product_propose">
					<img
						src="${classpath}/frontend/images/main_img/product_group/icon_dealhot_new.png"
						alt="">
					<div class="">
						<a href="">Sản phẩm liên quan</a>
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
								<div class="price">${product.salePrice}</div>
								<div class="main_price">${product.price}</div>
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
				<div class="product_sale_bar product_propose">
					<img
						src="${classpath}/frontend/images/main_img/product_group/icon_dealhot_new.png"
						alt="">
					<div class="">
						<a href="">Fahasa đề xuất</a>
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
								<div class="price">${product.salePrice}</div>
								<div class="main_price">${product.price}</div>
							</div>
						</c:if>
						<c:set var="count" value="${count + 1}" />
					</c:forEach>
				</div>
			</div>
		</div>
	</main>

	<!--  -->
	<!-- footer -->
	<jsp:include page="/WEB-INF/views/frontend/layout/footer.jsp"></jsp:include>


</body>

<script>
	function increaseValue() {
		let value = parseInt(document.getElementById('number').value, 10);
		value = isNaN(value) ? 0 : value;
		value++;
		document.getElementById('number').value = value;
	}

	function decreaseValue() {
		let value = parseInt(document.getElementById('number').value, 10);
		value = isNaN(value) ? 1 : value;
		value < 2 ? value = 2 : '';
		value--;
		document.getElementById('number').value = value;
	}
</script>

<!-- Add to cart -->
<script type="text/javascript">
	addToCart = function(_productId) {
		// alert("Thêm "  + _quantity + " sản phẩm '" + _productName + "' vào giỏ hàng ");
		let data = {
			productId : _productId, //lay theo id
			quantity : jQuery("#number").val(),

		};

		//$ === jQuery
		jQuery.ajax({
			url : "/add-to-cart",
			type : "POST",
			contentType : "application/json",
			data : JSON.stringify(data),
			dataType : "json", //Kieu du lieu tra ve tu controller la json

			success : function(jsonResult) {
				alert(jsonResult.code + ": " + jsonResult.message);
				let totalProducts = jsonResult.totalCartProducts;
				$("#totalCartProductsId").html(totalProducts);
			},

			error : function(jqXhr, textStatus, errorMessage) {
				alert(': Đã có lỗi xay ra...!')
				// alert(jsonResult.code + ': Đã có lỗi xay ra...!')
			},
		});
	}
</script>

</html>