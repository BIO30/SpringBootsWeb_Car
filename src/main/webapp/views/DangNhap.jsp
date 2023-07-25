<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Đăng Nhập</title>
 <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

  <!-- Bootstrap CSS v5.2.1 -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">

    <style>
        .hover1 {
    color: black;
    text-decoration: none;
  }

  .hover1:hover {
    color: red;

  }
      .hv{
        color: #fff;
        background-color: #00a2d1;
        border-color: #00a2d1;
        box-shadow: none;
      }
      .hv:hover{
        color: #00a2d1;
        background-color: #fff;
        
      }
    </style>
</head>

<body >
<%@include file="header.jsp" %>
	<main>
		<div class="row mt-5 mb-5">
			<div class="col-md-4 "></div>
			<div class="col-12 col-sm-12 col-md-4"
				style="background-color: #fff;">
				<form:form action="/DangNhap" modelAttribute="userT" method="post">
					<center>
						<h4>Đăng Nhập</h4>
						<p>
							Nếu bạn chưa có tài khoản, <a href="DangKy">Đăng ký tại đây</a>
						</p>
						<input class="mb-3 p-2" style="width: 60%;" type="email"
							placeholder="Email" name="username" id=""> <br> 
							<c:if test="${not empty error_loginUsername}">
	  		  <div class="form-text text-danger" role="alert">
		  		${error_loginUsername}
			  </div>
	  	    </c:if>
							<input class="mb-3 p-2" style="width: 60%;" type="password"
							placeholder="Mật khẩu" name="password" id=""> <br>
							<c:if test="${not empty error_loginPass}">
	  		  <div class="form-text text-danger" role="alert">
		  		${error_loginPass}
			  </div>
	  	    </c:if>
						<button class="mb-3 p-2 hv" style="width: 60%;" type="submit">Đăng
							nhập</button>
						<p>
							<a href="">Quên mật khẩu</a>
						</p>
						<p>Hoặc đang nhập bằng</p>
						<a href=""><img style="width: 129px; height: 37px;"
							src="//bizweb.dktcdn.net/assets/admin/images/login/fb-btn.svg"
							alt=""></a> <a href=""><img
							style="width: 129px; height: 37px;"
							src="//bizweb.dktcdn.net/assets/admin/images/login/gp-btn.svg"
							alt=""></a>
					</center>
				</form:form>
			</div>
		</div>
		<div class="col-md-4"></div>
	</main>
	<%@include file="footer.jsp" %>
  <!-- Bootstrap JavaScript Libraries -->
  <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"
    integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous">
  </script>

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.min.js"
    integrity="sha384-7VPbUDkoPSGFnVtYi0QogXtr74QeVeeIs99Qfg5YCF+TidwNdjvaKZX19NZ/e6oz" crossorigin="anonymous">
  </script>
</body>

</html>