<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <link rel="stylesheet"
          href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
          integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
          crossorigin="anonymous">
    <title>Create Product</title>
    <style>
        .left-align-footer {
            text-align: right;
        }

        .container {
            width:80%;
            height:80%;
            margin:0 auto;
            padding:8%;
            align-content:center;
            text-align:center;
        }

        table {
            margin:0 auto;
        }

        input {
            padding:5px;
            margin:8px auto;
        }

        button {
            padding:5px 10px;
            margin:8px;
        }



    </style>
</head>
<body>
<!-- Navbar -->
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
<div class="container" align="center">
    <h3>Here is the detail information of the product!</h3>
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
        <input type="submit" name="button" value="Submit" class="btn btn-primary"/>
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