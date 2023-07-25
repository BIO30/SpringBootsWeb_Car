<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<title>Hóa đơn</title>
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
<body>
	<%@include file="header.jsp"%>
	<div class="container">
		<h1>Hóa đơn</h1>

		<table class="table">
			<thead>
				<tr>
					<th>Mã hóa đơn</th>
					<th>Tên khách hàng</th>
					<th>Tổng tiền</th>
					<th>Ngày tạo</th>
					<th>Chi tiết</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${ListOrder}" var="Order">
					<tr>
						<td>${Order.orderId}</td>
						<td>${Order.user.username}</td>
						<td>${Order.total}</td>
						<td>${Order.orderDate}</td>
						<td><a href="/HoaDon/chitiet?Order=${Order.orderId}"><i
								class="bi bi-eye"></i> Xem chi tiết</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>




	<%@include file="footer.jsp"%>

</body>
</html>
