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
	width:90%;
	height:80%;
	margin:0 auto;
	padding:10% 0;
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
		<h1>Product Inventory Page</h1>
		<div class="panel-body">
			<form id="product" action="/viewDetail" method="post">
				<table>
					<tr>
						<th>Image</th>
						<th>Name</th>
						<th>Category</th>
						<th>Condition</th>
						<th>Price in $</th>
						<th  style="text-align: center;">Delete</th>
						<th  style="text-align: center;">Update</th>
					</tr>
					<c:forEach var="product" items="${products}">
						<tr>
							<td><img src="data:image/jpg;base64,${product.base64image}"
								width="75" height="75" /></td>
							<td>${product.name}</td>
							<td>${product.category}</td>
							<td>${product.condition}</td>
							<td>${product.price}</td>
							<td style="text-align: center;"><a type="button" class="btn btn-danger"
								href="/admin-delete/${product.id}">Delete</a></td>
							<td style="text-align: center;"><a type="button" class="btn btn-success"
								href="/admin-update/${product.id}">Update</a></td>
						</tr>
					</c:forEach>
				</table>
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