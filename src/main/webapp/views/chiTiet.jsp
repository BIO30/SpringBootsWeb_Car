<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!doctype html>
<html lang="en">

<head>
<title>Title</title>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS v5.2.1 -->
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

/* phần chi tiết */
.row .duongKe {
	content: "";
	display: block;
	background: #00a2d1 center center no-repeat;
	width: 100px;
	height: 4px;
	margin: 20px auto 30px;
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
	background-color: #00a2d1;
	border-radius: 20px 1px 1px;
}
</style>
<body>
	<%@include file="header.jsp"%>

	<main>

		<div class="container-md mt-4">
			<div class="col-12">
				<div class="row">

					<nav aria-label="breadcrumb">
						<ol class="breadcrumb">
							<li class="breadcrumb-item"><a href="/trangChu"
								style="text-decoration: none; color: black;">Trang chủ</a></li>
							<li class="breadcrumb-item"><a href="/sanpham"
								style="text-decoration: none; color: black;">Sản phẩm</a></li>
							<li class="breadcrumb-item" aria-current="page"
								style="color: #00a2d1;">${product.productName}</li>
						</ol>
					</nav>
				</div>
				<div class="row">
					<div class="col-7">
						<div class="row">
							<div id="carouselExampleCaptions" class="carousel slide">
								<div class="carousel-indicators">
									<button type="button" data-bs-target="#carouselExampleCaptions"
										data-bs-slide-to="0" class="active" aria-current="true"
										aria-label="Slide 1"></button>
									<button type="button" data-bs-target="#carouselExampleCaptions"
										data-bs-slide-to="1" aria-label="Slide 2"></button>
									<button type="button" data-bs-target="#carouselExampleCaptions"
										data-bs-slide-to="2" aria-label="Slide 3"></button>
								</div>
								<div class="carousel-inner">
									<div class="carousel-item active">
										<img src="${product.image}" class="d-block w-100" alt="...">

									</div>
									<div class="carousel-item">
										<img
											src="https://bizweb.dktcdn.net/thumb/1024x1024/100/058/097/products/ford-2.jpg?v=1456996067910"
											class="d-block w-100" alt="...">
										<!-- <div class="carousel-caption d-none d-md-block">
                                        <h5>Toyota Corolla Altis</h5>
                                        <p>Sản phẩm mang tính đột phá trong công nghệ giúp trãi nghiệm được nâng tầm.</p>
                                    </div> -->
									</div>
									<div class="carousel-item">
										<img
											src="https://bizweb.dktcdn.net/thumb/1024x1024/100/058/097/products/0749372g-h-auris-3-min.jpg?v=1469603961497"
											class="d-block w-100" alt="...">
										<!-- <div class="carousel-caption d-none d-md-block">
                                        <h5>Toyota Corolla Altis</h5>
                                        <p>Sản phẩm mang tính đột phá trong công nghệ giúp trãi nghiệm được nâng tầm.</p>
                                    </div> -->
									</div>
								</div>
								<button class="carousel-control-prev" type="button"
									data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
									<span class="carousel-control-prev-icon" aria-hidden="true"></span>
									<span class="visually-hidden">Previous</span>
								</button>
								<button class="carousel-control-next" type="button"
									data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
									<span class="carousel-control-next-icon" aria-hidden="true"></span>
									<span class="visually-hidden">Next</span>
								</button>
							</div>

						</div>
					</div>
					<div class="col-5">
					<form action="" method="post">
						<div class="row">
						<input class="d-none" name="id" value="${product.productId}">
							<h2>${product.productName}</h2>
							<p>
								<b>Mã sản phẩm: </b>${product.productId}
							</p>
							<p>
								<b>Nhà sản xuất: </b>${categories.categoryName}
							</p>
							<p>
								<b>${product.price}</b>
							</p>
							<p>
								<i class="bi bi-check-circle-fill"></i> Xăng 1.5L Duratec 16 Van
								<br> <i class="bi bi-check-circle-fill"></i> Hệ thống nhiên
								liệu phun đa điểm<br> <i class="bi bi-check-circle-fill"></i>
								Hệ thống lái trợ lực điện điều khiển điện tử<br> <i
									class="bi bi-check-circle-fill"></i> Hộp số tự động 6 cấp
								PowerShift<br>
							</p>
							<hr>

						</div>
						<div class="row">
							<div class="col-6">
								<div class="row">
									<p>
										<b>Màu sắc:</b> 
										<select class="form-select" aria-label="Default select example" name="color">
										 <c:forEach items="${PDD}" var="item">
                                        	<option value="${item.color}">${item.color}</option>
                                        </c:forEach>
										</select>
									</p>
								</div>
							</div>
							<div class="col-6">
								<div class="row">

									<p>
										<b>Số lượng:</b>
										<td class="w-25"><input class="w-50 form-control"
											type="number" min="1" value="1" name="quantity"/></td>
									</p>
								</div>
							</div>
							<hr>
						</div>
						<div class="row">
							<div class="col-11">
								<div class="row">
									<button formaction="/GioHang" type="submit"
										style="background-color: #00a2d1;" class="btn">
										<b><i class="bi bi-cart4"></i> Mua hàng</b>
									</button>
								</div>
							</div>
							<div class="col-1">
								<div class="row">
									<button type="button" class="btn btn-light">
										<i class="bi bi-heart"></i>
									</button>
								</div>
							</div>
						</div>
						</form>
					</div>
					
					<hr class="mt-5">
				</div>
				<div class="row">
					<ul class="nav nav-tabs" id="myTab" role="tablist">
						<li class="nav-item" role="presentation">
							<button class="nav-link active" id="home-tab"
								data-bs-toggle="tab" style="color: #00a2d1;"
								data-bs-target="#home-tab-pane" type="button" role="tab"
								aria-controls="home-tab-pane" aria-selected="true">
								<b>Nội dung</b>
							</button>
						</li>
						<li class="nav-item" role="presentation">
							<button class="nav-link" id="profile-tab" data-bs-toggle="tab"
								style="color: #00a2d1;" data-bs-target="#profile-tab-pane"
								type="button" role="tab" aria-controls="profile-tab-pane"
								aria-selected="false">
								<b>Hướng dẫn mua hàng</b>
							</button>
						</li>
					</ul>
					<div class="tab-content" id="myTabContent">
						<div class="tab-pane fade show active" id="home-tab-pane"
							role="tabpanel" aria-labelledby="home-tab" tabindex="0">
							<p style="text-align: justify;">${product.description}</p>
						</div>
						<div class="tab-pane fade" id="profile-tab-pane" role="tabpanel"
							aria-labelledby="profile-tab" tabindex="0">
							Bước 1: Tìm sản phẩm cần mua Bạn có thể truy cập website để tìm
							và chọn sản phẩm muốn mua bằng nhiều cách: <br> + Sử dụng ô
							tìm kiếm phía trên, gõ tên sản phẩm muốn mua (có thể tìm đích
							danh 1 sản phẩm, tìm theo hãng...). Website sẽ cung cấp cho bạn
							những gợi ý chính xác để lựa chọn: <br> Bước 2: Đặt mua sản
							phẩm Sau khi chọn được sản phẩm ưng ý muốn mua, bạn tiến hành đặt
							hàng bằng cách: <br> + Chọn vào nút MUA NGAY nếu bạn muốn
							thanh toán luôn toàn bộ giá tiền sản phẩm <br> + Điền đầy đủ
							các thông tin mua hàng theo các bước trên website, sau đó chọn
							hình thức nhận hàng là giao hàng tận nơi hay đến siêu thị lấy
							hàng, chọn hình thức thanh toán là trả khi nhận hàng hay thanh
							toán online (bằng thẻ ATM, VISA hay MasterCard) và hoàn tất đặt
							hàng. <br> +Lưu ý: <br> 1. Chúng tôi chỉ chấp nhận
							những đơn đặt hàng khi cung cấp đủ thông tin chính xác về địa
							chỉ, số điện thoại. Sau khi bạn đặt hàng, chúng tôi sẽ liên lạc
							lại để kiểm tra thông tin và thỏa thuận thêm những điều có liên
							quan. <br> 2. Một số trường hợp nhạy cảm: giá trị đơn hàng
							quá lớn & thời gian giao hàng vào buổi tối địa chỉ giao hàng
							trong ngõ hoặc có thể dẫn đến nguy hiểm. Chúng tôi sẽ chủ động
							liên lạc với quý khách để thống nhất lại thời gian giao hàng cụ
							thể. <br>

						</div>

					</div>
					<hr>
				</div>
				<div class="row">
					<h4 style="text-align: center;">SẢN PHẨM CÓ LIÊN QUAN</h4>
					<hr class="duongKe">
				</div>
				<div class="row ">
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
			</div>

		</div>
	</main>

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