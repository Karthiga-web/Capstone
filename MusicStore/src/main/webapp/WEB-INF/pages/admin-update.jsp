<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org"
      xmlns:sec="http://www.thymeleaf.org/thymeleaf-extras-springsecurity3">
<head>
    <meta charset="ISO-8859-1">
    <title>Product Inventory</title>

    <link rel="stylesheet"
          href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
          integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
          crossorigin="anonymous">
</head>

<style>
    #ex_table {
        table-layout: fixed !important;
    }

    #ex_table thead tr {
        width: 500px !important;
        position: fixed !important;
    }

    #ex_table tbody tr {
        width: 500px !important;
    }

    #ex_table th, td {
        width: 100px;
    }

    table {
        font-family: arial, sans-serif;
        border-collapse: collapse;
        text-align: center;
        vertical-align: text-bottom;
        width: 100%;
    }

    td, th {
        border: 1px solid #dddddd;
        text-align: left;
        vertical-align: center;
        padding: 8px;
    }

    tr:nth-child(even) {
        background-color: #dddddd;
    }

    .container {
        width:80%;
        height:80%;
        margin:0 auto;
        padding:8%;
        align-content:center;
        text-align:center;
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


<div class="container" align="center">
    <div class="panel-body">
        <h1>Edit Product Details</h1>
        <form id="newProduct" action="/admin-update" method="post" enctype="multipart/form-data">
            <input type="hidden" name="id" value="${current.id}" readonly />  <br>      <!--Hidden ID -->
            <label>Product Name</label>
            <input type="text" name="name" value="${current.name}"/>        <br>        <!--Product Name-->
            <label>Category</label>
            <input type="text" name="category" value="${current.category}" />   <br>    <!--Product Category-->
            <label>Condition</label>
            <input type="text" name="condition" value="${current.condition}" />   <br>  <!--Product Condition-->
            <label>Price in $</label>
            <input type="text" name="price" value="${current.price}" />  <br>           <!--Product Price-->
            <img src="data:image/jpg;base64,${current.base64image}" width="100" height="100" /><br>
            <input type="file" accept="image/jpg" name="image345"/>    <br>             <!--Product Image-->

            <input type="submit" value="submit" class="btn btn-primary">
        </form>
    </div>

    <br>

    <div>
        <a href="/adminCreateProduct">Add Product</a>
    </div>
</div>

<br>
<br>

<div>
    <footer>
			<pre>
				<p style="text-align: left;">© 2021 Music.ly Inc</p>
				<a href="#"> Privacy </a><a href="#"> Terms</a>
			</pre>
    </footer>
</div>

</body>
</html>