<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl"
            crossorigin="anonymous">
    <title>View Details Of Product</title>
    <style>
        .left-align-footer {
            text-align: right;
        }
    </style>
</head>
<body>
<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container-fluid">
        <!-- brand header -->
        <a class="navbar-brand" href="/">Musical.ly</a>
        <button class="navbar-toggler" type="button"
                data-bs-toggle="collapse" data-bs-target="#navbarNav"
                aria-controls="navbarNav" aria-expanded="false"
                aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div  id="navbar" class="collapse navbar-collapse" >
            <ul class="nav navbar-nav" >
                <li sec:authorize="isAuthenticated()"><a href="/adminHome">Home</a></li>
                <li sec:authorize="isAuthenticated()"><a href="/adminProduct">Products</a></li>
                <li sec:authorize="isAuthenticated()"><a href="/adminCustomerManage">Customers</a></li>
                <li sec:authorize="isAuthenticated()"><a href="/adminOrders">Orders</a></li>
                <li sec:authorize="isAuthenticated()"><a href="/logout">Logout</a></li>
            </ul>
        </div>
    </div>
</nav>
<div align="center">
    <h5>Product Detail</h5>
    <br>
    <p>Here is the detail information of the product!</p>
    <br>
    <form id="order" action="/admin-new" method="post" enctype="multipart/form-data">
        <table style="with: 50%">
            <tr>
                <td>Name</td>
                <td><input type="text" name="name"></td>
            </tr>
            <tr>
                <td>Category</td>
                <td><input type="text" name="category"></td>
            </tr>
            <tr>
                <td>Condition</td>
                <td><input type="text" name="condition"></td>
            </tr>
            <tr>
                <td>Price in $</td>
                <td><input id="price" name="price"></td>
            <tr>
                <td>Image</td>
                <td><input type="file" accept="image/jpg" name="image345" id="image345"/></td>
            </tr>
        </table>
        <input type="submit" name="button" value="Submit"/>
    </form>
</div>

<!-- Footer -->
<footer class="row">
    <div class="col">
        @2016 Company.Inc <a href="#">Privacy </a> &#8226 <a href="#">Terms</a>
    </div>
    <div class="col left-align-footer">
        <a href="#target-top-home">Back to top</a>
    </div>
</footer>
<!-- Bootstrap -->
<script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0"
        crossorigin="anonymous"></script>


</body>
</html>