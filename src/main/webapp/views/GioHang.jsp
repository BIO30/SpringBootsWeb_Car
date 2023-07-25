<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>login</title>
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
<link rel="stylesheet" href="index.css"><link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">

</head>
<body>
<%@include file="header.jsp"%>
<div class="container" style="height: 750px">
	<div class="w-50 me-auto ms-auto mt-3">
		<table class="table table-hover">
			<thead>
			    <tr>
			      <th scope="col">ID</th>
			      <th scope="col">Name</th>
			      <th scope="col">Price</th>
                  <th scope="col">Color</th>
			      <th scope="col">Quantity</th>
			      <th scope="col">Amount</th>
			      <th scope="col">Action</th>
			    </tr>
		  	</thead>
	
			  <tbody>
			  <c:set var="total" value="0" />
			    <c:forEach items="${sessionScope.Order}" var="c">
				    <tr>
				      <th scope="row">${c.productID.productId}</th>
				      <td >${c.productID.productName}</td>
				      <td >${c.productID.price}</td>
                      <td >${c.color}</td>
				      <td class="w-25"> <input class="w-50" id="${c.orderDetailsId}input" value="${c.quantity}" onblur="updateQty('${c.orderDetailsId}')" type="number" min="1" /></td>
				      <td >${c.quantity * c.productID.price}</td>
				      <td><a href="/GioHang/remove?oddid=${c.orderDetailsId}" class="text-danger"><i class="bi bi-trash"></i></a></td>
				   <!-- Lấy giá trị tiền của phần tử -->
   <c:set var="price" value="${c.quantity * c.productID.price}" />

   <!-- Thêm giá trị tiền vào tổng -->
   <c:set var="total" value="${total + price}" />
				    </tr>
			    </c:forEach>
			  </tbody>
		</table>
		<label class="float-start">Total money: <b class="text-danger">${total}</b> </label>
		<div class="d-flex float-end">
			<a href="/GioHang/clear"><button type="button" class="btn btn-danger">Clear</button></a>
			&nbsp;
			<a href="/GioHang/thanhtoan?totalmoney=${total}"><button type="button" class="btn btn-success">Pay</button></a>
	
		</div>
    </div>
		<script type="text/javascript">
		function updateQty(id){
			location.href = "/GioHang/update?id="+id+"&qty="+document.getElementById(id+"input").value;
		}
	</script>
	</div>
	
<%@include file="footer.jsp"%>

</body>
</html>