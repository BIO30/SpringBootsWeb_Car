<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<title>Trang adminn</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">

  <script src="https://connect.facebook.net/en_US/sdk.js#xfbml=1&amp;version=v2.9"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>

  <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.8.2/angular.min.js"></script>
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

  @keyframes carouselAnimation {
    0% {
      opacity: 0;
    }

    20% {
      opacity: 1;
    }

    33.33% {
      opacity: 1;
    }

    53.33% {
      opacity: 0;
    }

    100% {
      opacity: 0;
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
/* phần adminn  */
body {
      font-family: Arial, sans-serif;
      margin: 0;
      padding: 0;
    }


    img{
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

 
    input{
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
      <li><a class="navbar-brand" href="#"><img src="hieupaint.png" alt=""></a></li>
      <li><a href="detailadminn.jsp">Thông tin tài khoản</a></li>
      <li><a href="/adminn/index" class="text-decoration-none "> Quản lý tài khoản người dùng</a></li>
    <li>
      <a href="/product/index" class="text-decoration-none "> Quản lí sản phẩm</a>
	
    </li>
    </ul>
  </nav>
</div>

 <section>
    <h2>Thông tin tài khoản người dùng</h2>
    <form:form action="/adminn/create" modelAttribute="UsersItem" method="post">
              <div>   
                <c:if test="${not empty success_User}">
                  <div class="alert alert-success" role="alert">
                    ${success_User}</div>
                </c:if>
                <div class="mb-3">
                  <label class="form-label">Email</label>
                  <form:input path="Email" type="email" class="form-control" />
                   <c:if test="${not empty error_userId}">
                    <div class="form-text text-danger">${error_userId}</div>
                  </c:if>
                 
                </div>
                <div class="mb-3">
                  <label class="form-label">Username</label>
                  <form:input path="username" type="text" class="form-control" />

                </div>
                <div class="mb-3">
                  <label class="form-label">password</label>
                  <form:input path="password" type="text" class="form-control" />
                </div>

                <div class="mb-3">
                  <label class="form-label">role</label>
                  <form:input path="role" type="text" class="form-control" />
                </div>
              
              </div>
              <div class="">
                <button formaction="/adminn/create" type="submit" class="btn btn-primary">Create</button>
                <button formaction="/adminn/update" type="submit" class="btn btn-secondary">Update</button>
                                <button formaction="/adminn/index" type="submit" class="btn btn-warning">Reset</button>
              </div>

            </form:form>
  </section>
  <section>
    <h2>Quản lý tài khoản người dùng</h2>
    <table>
       <thead>
                <tr>
                  <th scope="col">Email</th>
                  <th scope="col">UserName</th>
                   <th scope="col">Password</th>
                  <th scope="col">Role</th>
                 
                  
                </tr>
              </thead>
      <tbody>
                <c:forEach items="${UsersItems}" var="pro">
                  <tr>
                    <td scope="row">${pro.email}</td>
                    <td>${pro.username}</td>
                    <td>${pro.password}</td>
                    <td>${pro.role}</td>
                    

                    <th><button type="button" class="btn btn-warning text-light  ">
                        <a href="/adminn/edit?email=${pro.email}"> <i class="bi bi-pencil-fill "></i>
                        </a>
                      </button>

                      <button type="button" class="btn btn-warning ">
                        <a href="/adminn/delete?email=${pro.email}">
                         <i class="bi bi-trash3"></i>
                        </a>

                      </button>
                    </th>
                  </tr>
                </c:forEach>
              </tbody>
    </table>
  </section>
</div>
 <%@include file="footer.jsp"%>

</body>
</html>