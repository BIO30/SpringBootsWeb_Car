<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
    <title>Chi tiết hóa đơn</title>
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
    <div class="container">
        <h1>Chi tiết hóa đơn</h1>

        <h2>Mã hóa đơn: ${Order.orderId}</h2>
        <p>Tên khách hàng: ${Order.user.username}</p>
        <p>Tổng tiền: ${Order.total}</p>
        <p>Ngày tạo: ${Order.orderDate}</p>

        <h3>Sản phẩm</h3>
        <table class="table">
            <thead>
                <tr>
                    <th>Mã sản phẩm</th>
                    <th>Tên sản phẩm</th>
                    <th>Màu sắc</th>
                    <th>Số lượng</th>
                    <th>Đơn giá</th>
                    <th>Thành tiền</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${List}" var="c">
                    <tr>
                        <th scope="row">${c.productID.productId}</th>
				      <td >${c.productID.productName}</td>
				      
                      <td >${c.color}</td>
                      <td >${c.quantity}</td>
                      <td >${c.productID.price}</td>
                      <td >${c.productID.price}</td>
                      
                    </tr>
                </c:forEach>
            </tbody>
        </table>

        <a href="/HoaDon" class="btn btn-primary">Quay lại danh sách hóa đơn</a>
    </div>

   
</body>
</html>







