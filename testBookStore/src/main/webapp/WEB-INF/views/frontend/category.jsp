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
<title>Danh muc san pham</title>
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
</head>
<body  id="products">
	<!-- header -->
	<jsp:include page="/WEB-INF/views/frontend/layout/header.jsp"></jsp:include>

	<!--  -->
	<nav></nav>

	<!--  -->
	<main>
		<div class="container">
			<div class="row">
				<div class="left">
					<div class="sidebar">
						<div class="product_title">
							<h3>Danh muc</h3>
						</div>
						<ul class="menu_sidebar">
							<c:forEach items="${categories }" var="category">
								<li style="cursor:pointer;">
									<a onclick="searchByCategory('${category.id}')">${category.name}</a>
								</li>
							</c:forEach>
						</ul>
					</div>
					<br>
					<div class="sidebar">
						<div class="product_title">
							<h4>Giá</h4>
						</div>
						<ul class="menu_sidebar filter">
							<li><input onchange="searchByPrice(this)" type="checkbox" value="1" name="price"
								id="price_1"> <label for="price_1"> 0 - 100.000</label>
							</li>
							<li><input onchange="searchByPrice(this)" type="checkbox" value="2" name="price"
								id="price_2"> <label for="price_2"> 100.000 -
									250.000</label></li>
							<li><input onchange="searchByPrice(this)" type="checkbox" value="3" name="price"
								id="price_3"> <label for="price_3"> 250.000 -
									400.000</label></li>
							<li><input onchange="searchByPrice(this)" type="checkbox" value="4" name="price"
								id="price_4"> <label for="price_4"> > 400.000</label></li>
						</ul>
					</div>
					<!--  -->
					<br>
					<div class="sidebar">
						<div class="product_title">
							<h4>Nhà xuất bản</h4>
						</div>
						<ul class="menu_sidebar">
							<c:forEach items="${publishers }" var="publisher">
								<li style="cursor:pointer;">
									<a onclick="searchByPublisher('${publisher.id}')">${publisher.name}</a>
								</li>
							</c:forEach>
						</ul>
					</div>
				</div>
				<div class="right">
					<div class="flash_sale_slider product_list">
						<c:forEach items="${products }" var="product">
							<div class="flash_sale_item product_item">
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
						</c:forEach>

					</div>
				</div>
			</div>
		</div>
	</main>



	<!--  -->
	<!-- footer -->
	<jsp:include page="/WEB-INF/views/frontend/layout/footer.jsp"></jsp:include>

	
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script>
		function searchByCategory(categoryId) {
			$.get('/category-u', {
				category : categoryId
			}, function(data) {
				// Cập nhật trang web với dữ liệu trả về từ máy chủ
				$('#products').html(data);
			});
		}
	</script>
	<script>
		function searchByPublisher(publisherId) {
			$.get('/category-u', {
				publisher : publisherId
			}, function(data) {
				// Cập nhật trang web với dữ liệu trả về từ máy chủ
				$('#products').html(data);
			});
		}
	</script>
	
	<script>
		function searchByKeyword() {
			var _keyword = document.getElementById('search_box').value;
			$.get('/category-u', {
				keyword : _keyword
			}, function(data) {
				// Cập nhật trang web với dữ liệu trả về từ máy chủ
				$('#products').html(data);
			});
		}
	</script>
	
	<script>
	$('input[name="price"]').on('change', function seachByPrice() {
	    var value = $(this).val();
	    var minPrice, maxPrice;
	    switch(value) {
	    case '1':
	        minPrice = 0;
	        maxPrice = 100000;
	        break;
	    case '2':
	        minPrice = 100000;
	        maxPrice = 250000;
	        break;
	    case '3':
	        minPrice = 250000;
	        maxPrice = 400000;
	        break;
	    case '4':
	        minPrice = 400000;
	        maxPrice = Number.MAX_SAFE_INTEGER;
	        break;
	    }
	    if ($(this).is(':checked')) {
	        $.ajax({
	            url : '/category-u',
	            method : 'GET',
	            data : {
	                minPrice : minPrice,
	                maxPrice : maxPrice
	            },
	            success : function(response) {
	                $('#products').html(response);
	            }
	        });
	    }
	});
	</script>


</body>
</html>