<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org"
      xmlns:sec="http://www.thymeleaf.org/thymeleaf-extras-springsecurity3">
<head>
    <meta charset="ISO-8859-1">
    <title>Admin Home</title>
    <link rel="stylesheet"
          href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
          integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
          crossorigin="anonymous">

    <style>
        .container {
            width:80%;
            height:85vh;
            margin:0 auto;
            padding:10%;
            align-content:center;
            text-align:center;
        }
    </style>
</head>
<body>
<!-- create navigation bar ( header) -->
<nav class="navbar navbar-inverse navbar-fixed-top">
    <div class="nav-container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed"
                    data-toggle="collapse" data-target="#navbar" aria-expanded="false"
                    aria-controls="navbar">
                <span class="sr-only">Toggle navigation</span> <span
                    class="icon-bar"></span> <span class="icon-bar"></span> <span
                    class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#" th:href="@{/}">Instrument Store</a>
        </div>
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
<br>
<br>

<div class="container">
    <h1>Administrator Page</h1>
    <h1>Welcome: admin | <a href="/logout">Logout</a></h1>
    <h2><a href="/adminProduct">Product Inventory</a></h2>
    <p>Here you can View, Check, and Modify the product inventory!</p>
    <h2><a href="/adminCustomerManage">Customer Management</a></h2>
    <p>Here you can manage customer information!</p>
    <h2><a href="/adminOrders">Order Management</a></h2>
    <p>Here you can manage Order status!</p>
</div>
<br>
<br>
<div>
    <footer>
        <pre><p style="text-align: left;">� 2021 Music.ly Inc</p><a href="#"> Privacy </a><a href="#"> Terms</a></pre>
    </footer>
</div>
</body>
</html>