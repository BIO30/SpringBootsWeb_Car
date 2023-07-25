<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>QLSP</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
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

/* test thử phần dưới */
</style>

<body>

	<%@include file="header.jsp"%>



	<div class="container">

		<div class="opstion">

			<nav>
				<ul>


					<li><a href="/adminn/index">Quản lý tài khoản người dùng</a></li>
					<li><a href="/product/index">Quản lý sản phẩm</a></li>
				</ul>
			</nav>
		</div>



		<section>


			<form:form action="/product/create" modelAttribute="productItem"
				method="post">
				<h2>Quản lý sản phẩm</h2>
				<div>
					<c:if test="${not empty success_Product}">
						<div class="alert alert-success" role="alert">
							${success_Product}</div>
					</c:if>
					<div class="mb-3">
						<label class="form-label">Product ID</label>
						<form:input path="productId" type="text" class="form-control" />

						<c:if test="${not empty error_productId}">
							<div class="form-text text-danger">${error_productId}</div>
						</c:if>
					</div>
					<div class="mb-3">
						<label class="form-label">Category ID</label>
						<form:input path="categoryID.categoryId" type="text"
							class="form-control" />


						<!--  			<select class="form-select" id="inlineFormSelectPref" name="categoryId">
								<option selected>chon</option>
								<option value="CT001">CT001</option>
								<option value="CT002">CT002</option>
								<option value="CT003">CT003</option>
								<option value="CT004">CT004</option>
								<option value="CT005">CT005</option>
							</select>
					-->

					</div>
					<div class="mb-3">
						<label class="form-label">Product Name</label>
						<form:input path="productName" type="text" class="form-control" />
					</div>

					<div class="mb-3">
						<label class="form-label">Price</label>
						<form:input path="price" type="text" class="form-control" />
					</div>
					<div class="mb-3">
						<label class="form-label">Image</label>
						<form:input path="image" type="text" class="form-control" />
					</div>
					<div class="mb-3">
						<label class="form-label">Description</label>
						<form:input path="description" type="text" class="form-control" />
					</div>



				</div>
				<div class="">
					<button formaction="/product/create" type="submit"
						class="btn btn-primary">Create</button>
					<button formaction="/product/update" type="submit"
						class="btn btn-secondary">Update</button>
					<button formaction="/product/delete" type="submit"
						class="btn btn-danger">Delete</button>
					<button formaction="/product/index" type="submit"
						class="btn btn-warning">Reset</button>
				</div>

			</form:form>

			<table>
				<thead>
					<tr>
						<th scope="col">Product ID</th>
						<!--  	<th scope="col">Categogy ID</th>-->
						<th scope="col">Product Name</th>
						<th scope="col">Price</th>
						<!-- 		<th scope="col">Image</th>
						<th scope="col">description</th> -->
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${productItems}" var="pro">
						<tr>
							<td scope="row">${pro.productId}</td>


							<td>${pro.productName}</td>
							<td>${pro.price}</td>

							<th><button type="button"
									class="btn btn-success text-decoration-none ">
									<a href="/product/edit?productId=${pro.productId}"> <i
										class="bi bi-pencil-fill "></i>
									</a>
								</button>

								<button type="button"
									class="btn btn-success text-decoration-none">
									<a href="/product/delete?productId=${pro.productId}"> <!--  -->
										<i class="bi bi-trash3"></i>
									</a>

								</button>
								<button type="button" class="btn btn-success">
									<i class="bi bi-eye"></i>
								</button></th>

						</tr>
					</c:forEach>


				</tbody>
			</table>
		</section>



	</div>




	<%@include file="footer.jsp"%>


</body>

</html>