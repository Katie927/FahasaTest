<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset='utf-8'>
        <meta http-equiv='X-UA-Compatible' content='IE=edge'>
        <title>Login</title>
        <link rel="icon" href="./images/header_img/favicon4.ico" type="image/x-icon">
        <meta name='viewport' content='width=device-width, initial-scale=1'>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel='stylesheet' type='text/css' media='screen' href='./css/style.css'>
        <link rel="stylesheet" href="./slick/slick.css">
        <link rel="stylesheet" href="./font/SansSerifBldFLF-Italic.otf">
    </head>
<body>
    <!-- header -->
    <jsp:include page="/WEB-INF/views/frontend/layout/header.jsp"></jsp:include>

    <!--  -->
    <nav>

    </nav>

    <!--  -->
    <main>
        <div class="container">
            <div class="login_title">
                <h3>Đăng Nhập</h3>
            </div>
            <div class="login_form">
                <div class="form_creat_user">
                    <div class="login_row">
                        <label for="">Số điện thoại/Email</label>
                        <input type="email" name="username" id="username" placeholder="Nhập số điện thoại hoặc email">
                    </div>
                    <div class="login_row">
                        <label for="">Mật khẩu</label>
                        <input type="password" name="password" id="password" placeholder="Nhập mật khẩu">
                    </div>
                    <div class="password_forget">
                        <a href="">Quên mật khẩu</a>
                    </div>
                    <div class="login_button">
                        <button type="button">Đăng nhập</button>
                    </div>
                    
                </div>
            </div>
        </div>
    </main>

    <!-- footer -->
    <jsp:include page="/WEB-INF/views/frontend/layout/footer.jsp"></jsp:include>

</body>
</html>