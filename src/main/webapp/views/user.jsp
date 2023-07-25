<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<title>Trang Người dùng</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">

</head>
<style>
.hover1 {
	color: black;
	text-decoration: none;
}

.hover1:hover {
	color: red;
}

/* phần user */
img {
	width: 60px;
	height: 40px;
}

.opstion nav {
	margin-top: 10px;
	color: #fff;
	padding: 10px;
}

.opstion  ul {
	list-style-type: none;
	margin: 0;
	padding: 0;
}

.opstion  ul li {
	display: inline;
	margin-right: 10px;
}

.op nav ul li a {
	color: #fff;
	text-decoration: none;
	padding: 5px;
}

section {
	padding: 20px;
}

.user-info {
	border: 1px solid #ddd;
	border-radius: 5px;
	padding: 20px;
}

.user-info h2 {
	margin-top: 0;
}

.user-info p {
	margin: 0;
}
</style>
<body>
	<%@include file="header.jsp"%>


	<div class="row">
		<div style="margin-bottom: 280px;" class="col-12">
			<section>
				<div class="user-info">
					<div class="row">
						<div class="col-6">
							<h2>Thông tin tài khoản</h2>
							<p>Tên người khách hàng: ${user.username}</p>
							<p>Email: ${user.email}</p>
						</div>
						<div class="col-2 offset-md-4">
							<form:form action="/logout" method="post">
								<button class="m-2 text-light" type="submit"
									style="width: 200px; height: 40px; display: block; background-color: rgb(18, 116, 207);">Đăng
									xuất</button>
							</form:form>

							<form:form action="/doiMatKhau" method="POST">
								<button class="m-2 text-light" type="submit"
									style="width: 200px; height: 40px; display: block; background-color: rgb(18, 116, 207);">
									Đổi mật khẩu</button>
							</form:form>
							<a href="/HoaDon">
								<button class="m-2 text-light"
									style="width: 200px; height: 40px; display: block; background-color: rgb(18, 116, 207);">Hóa
									đơn</button>
							</a>
						</div>
					</div>
				</div>
			</section>
		</div>
	</div>



	<%@include file="footer.jsp"%>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"
		integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3"
		crossorigin="anonymous">
		
	</script>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.min.js"
		integrity="sha384-7VPbUDkoPSGFnVtYi0QogXtr74QeVeeIs99Qfg5YCF+TidwNdjvaKZX19NZ/e6oz"
		crossorigin="anonymous">
		
	</script>
</body>
</html>
