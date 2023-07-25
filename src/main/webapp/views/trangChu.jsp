<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en">

<head>
<title>Trang</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
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
<link rel="stylesheet" href="index.css">
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
</style>

<body>




		<%@include file="header.jsp"%>



	<div id="demo" class=" carousel slide" data-bs-ride="carousel">

		<!-- Indicators/dots -->
		<div class="carousel-indicators">
			<button type="button" data-bs-target="#demo" data-bs-slide-to="0"
				class="active"></button>
			<button type="button" data-bs-target="#demo" data-bs-slide-to="1"></button>

		</div>

		<!-- The slideshow/carousel -->
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img src="img/banner-du-toan-chi-phi.jpg" alt="anh1"
					class="d-block w-100">
			</div>
			<div class="carousel-item">
				<img src="img/CtIEH2v2ste902803zfA-01.png" alt="anh2"
					class="d-block w-100">
			</div>

		</div>

		<!-- Left and right controls/icons -->
		<button class="carousel-control-prev" type="button"
			data-bs-target="#demo" data-bs-slide="prev">
			<span class="carousel-control-prev-icon"></span>
		</button>
		<button class="carousel-control-next" type="button"
			data-bs-target="#demo" data-bs-slide="next">
			<span class="carousel-control-next-icon"></span>
		</button>
	</div>





	<div class="container">
		<div class="row py-5">
			<div class="col-12 col-md-6 pb-3">
				<div class="card">


					<img src="img/banner_1.webp" alt="">

				</div>

			</div>
			<div class=" col-12 col-md-6 pb-2">
				<div class="card">
					<img src="img/banner_2.webp" class="card-img-top" alt="sale">

				</div>
			</div>
		</div>

		<h3 class="text-center p-3">
			<strong>SẢN PHẨM NỖI BẬT</strong>
		</h3>

		<div class="row pb-3 ">
			<div class="col-md-3">

				<div class="card rounded-0 blockprice">
					<img src="img/1.webp" class="card-img-top" alt="..."> <strong>
						<p>600.000.000</p>
					</strong>
				</div>
				<div class="card-footer">
					<a href="#" class="text-decoration-none  link-hover"> <strong>
							<p>Ford Everest XLT 4×2 MT</p>
					</strong>

					</a>
				</div>
				<div class="row text-center">
					<div class="col-md-6">
						<button type="button" class="rounded-0 btn btn-outline-info">

							<i class="bi bi-cart3"></i> TÙY CHỌN

						</button>
					</div>
					<div class="col-md-6">
						<button type="button" class="rounded-0 btn btn-outline-info">

							<i class="bi bi-eye"></i>CHI TIẾT

						</button>
					</div>
				</div>
			</div>
			<div class="col-md-3">

				<div class="card rounded-0 blockprice">
					<img src="img/2.webp" class="card-img-top" alt="..."> <strong>
						<p>600.000.000</p>
					</strong>
				</div>
				<div class="card-footer">
					<a href="#" class="text-decoration-none  link-hover"> <strong>
							<p>Ford Everest XLT 4×2 MT</p>
					</strong>

					</a>
				</div>
				<div class="row text-center">
					<div class="col-md-6">
						<button type="button" class="rounded-0 btn btn-outline-info">

							<i class="bi bi-cart3"></i> TÙY CHỌN

						</button>
					</div>
					<div class="col-md-6">
						<button type="button" class="rounded-0 btn btn-outline-info">

							<i class="bi bi-eye"></i>CHI TIẾT

						</button>
					</div>
				</div>
			</div>
			<div class="col-md-3 ">

				<div class="card rounded-0 blockprice">
					<img src="img/3.webp" class="card-img-top" alt="..."> <strong>
						<p>600.000.000</p>
					</strong>
				</div>
				<div class="card-footer">
					<a href="#" class="text-decoration-none  link-hover"> <strong>
							<p>Ford Everest XLT 4×2 MT</p>
					</strong>

					</a>
				</div>
				<div class="row text-center">
					<div class="col-md-6">
						<button type="button" class="rounded-0 btn btn-outline-info">

							<i class="bi bi-cart3"></i> TÙY CHỌN

						</button>
					</div>
					<div class="col-md-6">
						<button type="button" class="rounded-0 btn btn-outline-info">

							<i class="bi bi-eye"></i>CHI TIẾT

						</button>
					</div>
				</div>
			</div>
			<div class="col-md-3">

				<div class="card rounded-0 blockprice">
					<img src="img/4.webp" class="card-img-top" alt="..."> <strong>
						<p>600.000.000</p>
					</strong>
				</div>
				<div class="card-footer">
					<a href="#" class="text-decoration-none  link-hover"> <strong>
							<p>Ford Everest XLT 4×2 MT</p>
					</strong>

					</a>
				</div>
				<div class="row text-center">
					<div class="col-md-6">
						<button type="button" class="rounded-0 btn btn-outline-info">

							<i class="bi bi-cart3"></i> TÙY CHỌN

						</button>
					</div>
					<div class="col-md-6">
						<button type="button" class="rounded-0 btn btn-outline-info">

							<i class="bi bi-eye"></i>CHI TIẾT

						</button>
					</div>
				</div>
			</div>



		</div>

		<h3 class="text-center p-5">
			<strong>SẢN PHẨM MỚI</strong>
		</h3>

		<div class="card mb-3 rounded-0 bg-dark">
			<div class="row g-0">

				<div class="col-md-4">
					<div class="card-body">
						<h5 class="card-title" style="color: rgb(15, 178, 248);">Ford
							EcoSport 1.5L AT Trend</h5>
						<p class="card-text text-secondary">
							Xăng 1.5L Duratec 16 Van <br> Hệ thống nhiên liệu phun đa
							điểm <br> Hệ thống lái trợ lực điện điều khiển điện tử <br>
							Hộp số tự động 6 cấp PowerShift.
						</p>
						<a style="color: rgb(15, 178, 248);" href="#">Xem thêm...</a>
					</div>
				</div>

				<div class="col-md-8 ">
					<img src="img/anhspnb.webp" class="img-fluid  " alt="...">
				</div>

			</div>
		</div>

	</div>



	<div class="container-fluid p-3"
		style="background-color: rgb(226, 230, 234);">

		<h3 class="text-center p-3 ">
			<strong> XE CŨ <br>
				<p style="color: rgb(15, 178, 248);">________</p>
			</strong>
		</h3>

		<div class="row mb-3 ">

			<div class="caro1">
				<div class="slide1 img-fluid">
					<img src="img/slider_1.webp" alt="Slide 1">
				</div>
				<div class="slide1 img-fluid">
					<img src="img/banner.jpg" alt="Slide 2">
				</div>


			</div>

		</div>


	</div>

	<div class="container">

		<h3 class="text-center p-5">
			<strong>GIỚI THIỆU</strong>
		</h3>

		<div class="card mb-3 m-3 rounded-0 bg-dark">
			<div class="row g-0">

				<div class="col-md-4">
					<div class="card-body">
						<h4 class="card-title" style="color: rgb(15, 178, 248);">Carcenter</h4>
						<p class="card-text text-secondary">
							Với 10 năm kinh nghiệm với tất cả các hãng xe hàng đầu thế giới.
							<br> Chúng tôi - Carcenter tự hào là cơ sở duy nhất đáp ứng
							mọi nhu cầu của khách hàng <br> <a
								style="color: rgb(15, 178, 248);" href="#">Xem thêm...</a>
					</div>
				</div>

				<div class="col-md-8 ">
					<img src="img/img_about_home.webp" class="w-100 " alt="...">
				</div>

			</div>
		</div>

		<div class="row p-5 text-center">
			<h3 class="text-center p-5">
				<strong>DỊCH VỤ CUNG CẤP</strong>
			</h3>
			<div class="col-md-3">
				<div class="card border-0">
					<i class="bi bi-wrench "
						style="font-size: 60px; color: rgb(15, 178, 248);"></i> <a
						class="text-decoration-none link-dark" href="#"> <strong>
							<p class="fs-5">Bảo hành</p>
					</strong>
					</a>
					<p>
						Dịch vụ bảo hành ở tất cả các <br> đại lý trên toàn quốc
					</p>
				</div>
			</div>
			<div class="col-md-3">
				<div class="card border-0">
					<i class="bi bi-coin "
						style="font-size: 60px; color: rgb(15, 178, 248);"></i> <a
						class="text-decoration-none link-dark" href="#"> <strong>
							<p class="fs-5">Trả góp</p>
					</strong>
					</a>
					<p>
						Xử lý trong vòng 24h sau khi<br> tiếp nhận hồ sơ mua xe
					</p>
				</div>
			</div>
			<div class="col-md-3">
				<div class="card border-0">
					<i class="bi bi-car-front "
						style="font-size: 60px; color: rgb(15, 178, 248);"></i> <a
						class="text-decoration-none link-dark" href="#"> <strong>
							<p class="fs-5">Lái thử</p>
					</strong>
					</a>
					<p>
						Carcenter có dịch vụ lái thử xe <br> tại các đại lý trên toàn
						quốc
					</p>
				</div>
			</div>
			<div class="col-md-3">
				<div class="card border-0">
					<i class="bi bi-repeat "
						style="font-size: 60px; color: rgb(15, 178, 248);"></i> <a
						class="text-decoration-none link-dark" href="#"> <strong>
							<p class="fs-5">Đổi trả</p>
					</strong>
					</a>
					<p>
						Hoàn trả trong vòng 10 ngày <br> kể từ ngày nhận xe
					</p>
				</div>
			</div>
		</div>



		<div class="row ">

			<h3 class="text-center pb-5">
				<strong>TIN TỨC</strong>
			</h3>

			<div class="col-md-6 ">
				<div class="card border-0">
					<img src="img/tt1.webp" class="card-img-top" alt="...">
					<div class="card-body">
						<h5 class="card-title">Mercedes-Benz C-Class Cabriolet 2017
							chính thức ra mắt</h5>
						<p class="card-text">
							Là đối thủ cạnh tranh của Audi A4 Convertible và BMW 4-Series
							Convertible, <br> Mercedes-Benz C-Class Cabriolet mới được
							phát triển dựa trên C-Class Coupe. Hãng Mercedes-
						</p>
						<a href="#" class="text-decoration-none">Xem thêm...</a>
					</div>
				</div>
			</div>
			<div class="col-md-6">
				<div class="card border-0">
					<img src="img/tt2.webp" class="card-img-top" alt="...">
					<div class="card-body">
						<h5 class="card-title">Centenario - Siêu xe mạnh nhất của
							Lamborghini trình làng</h5>
						<p class="card-text">
							Với động cơ V12, hút khí tự nhiên, tạo ra công suất tối đa 770 mã
							lực, <br> Lamborghini Centenario có thể tăng tốc từ 0-100
							km/h trong 2,8 giây và đạt vận tốc tối đa hơn 350
						</p>
						<a href="#" class="text-decoration-none">Xem thêm...</a>
					</div>
				</div>
			</div>


		</div>

	</div>

	<%@include file="footer.jsp"%>






</body>

</html>