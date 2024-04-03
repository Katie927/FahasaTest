<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- directive của JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<header>
        <div id="banner_container" style="background-color:#FBEAD6;">
            <div id="banner_top">
                <a href=""><img src="${classpath}/frontend/images/header_img/ConMungConTet_T2.jpg" alt=""></a>
            </div>
        </div>
        
        <div class="container">
            <div class="content_header">
                <div id="logo">
                    <a href="${classpath }/index">
                        <img src="${classpath}/frontend/images/header_img/fahasa-logo.png" alt="" width="100%">
                    </a>
                </div>
                <div class="category_menu">
                    <a href="${classpath }/category-u"> <img src="${classpath}/frontend/images/header_img/ico_menu.svg" alt=""></a>
                    <a href="${classpath }/category-u"><img src="${classpath}/frontend/images/header_img/icon_seemore_gray.svg" alt=""></a>
                </div>
                <div class="search_bar">
                    <div class="form_search">
                        <div class="in_search_box">
                            <input id="search_box" type="text" name="keyword" placeholder="Nhập từ khóa tìm kiếm">
                            <span id="search_button">
                                <button onclick="searchByKeyword()">
                                    <img src="${classpath}/frontend/images/header_img/ico_search_white.svg" alt="">
                                </button> 
                            </span>
                        </div>
                    </div>
                </div>
                <div class="header_right">
                    <div class="header_noti">
                        <a href="">
                            <img src="${classpath}/frontend/images/header_img/ico_noti_gray.svg" alt="">
                        </a>
                        <div class="top_menu_label">Thông báo</div>
                    </div>
                    <div class="header_cart">
                        <a href="${classpath }/cart">
                            <img src="${classpath}/frontend/images/header_img/ico_cart_gray.svg" alt="">
                        </a>
                        <div class="top_menu_label">Giỏ hàng</div>
                        
                    </div>
                    <div class="header_user">
                        <c:choose>
					        <c:when test="${loginedUser.username != null}">
					            <a href="${classpath }/logout">
					                <img src="${classpath}/frontend/images/header_img/ico_account_gray.svg" alt="">
					            </a>
					            <div class="top_menu_label">${loginedUser.name}</div>
					        </c:when>
					        <c:otherwise>
					            <a href="${classpath }/login">
					                <img src="${classpath}/frontend/images/header_img/ico_account_gray.svg" alt="">
					            </a>
					            <div class="top_menu_label">Đăng nhập</div>
					        </c:otherwise>
					    </c:choose>
                    </div>
                    <div class="header_language">
                        <img src="${classpath}/frontend/images/header_img/default.svg" alt="">
                        <img style="margin-left: 4px;" src="${classpath}/frontend/images/header_img/icon_seemore_gray.svg" alt="">
                    </div>
                </div>
            </div>
        </div>
    </header>
    <!--  
    <script>
	    function searchByKeyword() {
	        var _keyword = document.getElementById('search_box').value;
	        var path = window.location.pathname;
	        $.get(path, {
	            keyword : _keyword
	        }, function(data) {
	            $('#products').html(data);
	            window.location.href = '/category-u';
	        });
	    }
	</script>
	-->
	<script>
	function searchByKeyword() {
	    var _keyword = document.getElementById('search_box').value;
	    window.location.href = '/category-u?keyword=' + _keyword;
	}
	</script>