<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<title>Trang Admin</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
	crossorigin="anonymous"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/angularjs/1.8.2/angular.min.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">

</head>
<style>
.caro1 {
	width: 1920px;
	height: 600px;
	overflow: hidden;
	position: relative;
}

.slide1 {
	width: 100%;
	height: 100%;
	position: absolute;
	top: 0;
	left: 0;
	opacity: 0;
	transition: opacity 1s ease;
}

.slide1 img {
	width: 100%;
	height: 100%;
	object-fit: cover;
}

.slide1.active {
	opacity: 1;
}

@
keyframes carouselAnimation { 0% {
	opacity: 0;
}

20
%
{
opacity
:
1;
}
33
.33 % {
	opacity: 1;
}

53
.33 % {
	opacity: 0;
}

100
%
{
opacity
:
0;
}
}
.caro1 .slide1:nth-child(1) {
	animation: carouselAnimation 5s infinite;
}

.caro1 .slide1:nth-child(2) {
	animation: carouselAnimation 5s infinite 2s;
}

.caro1 .slide1:nth-child(3) {
	animation: carouselAnimation 5s infinite 2s;
}

.hover1 {
	color: black;
	text-decoration: none;
}

.hover1:hover {
	color: red;
}

.blockprice {
	position: relative;
	display: inline-block;
}

.blockprice p {
	position: absolute;
	top: 87%;
	right: 0;
	color: white;
	font-size: 20px;
	background-color: rgb(15, 178, 248);
	border-radius: 20px 1px 1px;
}

.link-hover {
	color: black;
}

.link-hover:hover {
	color: rgb(15, 178, 248);
}
/* phần admin  */
body {
	font-family: Arial, sans-serif;
	margin: 0;
	padding: 0;
}

img {
	width: 60px;
	height: 40px;
}

.opstion nav {
	margin-top: 10px;
	background-color: #555;
	color: #fff;
	padding: 10px;
}

.opstion nav ul {
	list-style-type: none;
	margin: 0;
	padding: 0;
}

.opstion  ul li {
	display: inline;
	margin-right: 10px;
}

.opstion  ul li a {
	color: #fff;
	text-decoration: none;
	padding: 5px;
}

section {
	padding: 20px;
}

table {
	width: 100%;
	border-collapse: collapse;
}

th, td {
	padding: 10px;
	text-align: left;
	border-bottom: 1px solid #ddd;
}

input {
	width: 500px;
}

/* phần chi tiết */
.row .duongKe {
	content: "";
	display: block;
	background: #0589ad center center no-repeat;
	width: 100px;
	height: 4px;
	margin: 20px auto 30px;
}

/* test thử phần dưới */
</style>

<body>
	<%@include file="header.jsp"%>


	<div class="container">

		<div class="opstion">
			<nav>
				<ul>
					<li><a class="navbar-brand" href="#"><img
							src="hieupaint.png" alt=""></a></li>
					<li><a href="detailadmin.jsp">Thông tin tài khoản</a></li>
					<li><a href="admin.jsp">Quản lý tài khoản người dùng</a></li>
				</ul>
			</nav>
		</div>

		<div style="margin-bottom: 300px;">
			<section>
				<h2>Thông tin tài khoản</h2>
				<p class="fw-bold">
					Tên người dùng: <label class="fw-normal">John Doe</label>
				</p>
				<p class="fw-bold">
					Email: <label class="fw-normal">john@example.com</label>
				</p>
				<p class="fw-bold">
					Vai trò: <label class="fw-normal text-success">Admin</label>
				</p>
			</section>
		</div>
	</div>



	<%@include file="footer.jsp"%>

	<!-- Bootstrap JavaScript Libraries -->
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