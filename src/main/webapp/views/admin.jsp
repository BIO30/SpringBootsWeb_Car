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
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">

<script
	src="https://connect.facebook.net/en_US/sdk.js#xfbml=1&amp;version=v2.9"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>

<script
	src="https://ajax.googleapis.com/ajax/libs/angularjs/1.8.2/angular.min.js"></script>
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
























1






















;
}
33
























.33











 











%
{
opacity






















:











 











1






















;
}
53
























.33











 











%
{
opacity






















:











 











0






















;
}
100
























%
{
opacity
























:
























0






















;
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


/* test thử phần dưới */
</style>

<body>

	<%@include file="header.jsp"%>


	<div class="container">

		<div class="opstion">


			<nav>
				<form:form action="/logout" method="post">

					<ul>


						<li><a href="/adminn/index">Quản lý tài khoản người dùng</a></li>
						<li><a href="/product/index" class="text-decoration-none ">
								Quản lí sản phẩm</a></li>
						<li class="float-end">
							<button type="submit" class="btn btn-outline-light">Đăng
								xuất</button>


						</li>


					</ul>
				</form:form>
			</nav>
		</div>



	



	</div>

	<%@include file="footer.jsp"%>




</body>
</html>