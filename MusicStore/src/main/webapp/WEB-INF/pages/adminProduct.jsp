<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org"
	xmlns:sec="http://www.thymeleaf.org/thymeleaf-extras-springsecurity3">
<head>
<meta charset="ISO-8859-1">
<title>View Tasks</title>

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
	vertical-align: bottom;
	padding: 8px;
}

tr:nth-child(even) {
	background-color: #dddddd;
}
</style>
</head>
<body>

	<!-- create navigation bar ( header) -->
	<nav class="navbar navbar-inverse navbar-fixed-top">
		<div class="container">
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
			<div id="navbar" class="collapse navbar-collapse">
				<ul class="nav navbar-nav">
					<li sec:authorize="isAuthenticated()"><a href="/">Home</a></li>
					<li sec:authorize="isAuthenticated()"><a href="/adminProduct">Products</a></li>
					<li sec:authorize="isAuthenticated()"><a
						href="/adminCustomerManage">Customers</a></li>
					<li sec:authorize="isAuthenticated()"><a href="/">Welcome
							admin</a></li>
					<li sec:authorize="isAuthenticated()"><a href="/logout">Logout</a></li>
					<li sec:authorize="isAuthenticated()"><a href="/adminHome">Admin</a></li>
				</ul>
			</div>
		</div>
	</nav>

	<br>
	<br>
	<br>
	<br>

	<div>
		<h1>Product Inventory Page</h1>
		<p>This is the product inventory Page!</p>
	</div>

	<br>
	<br>

	<div align="center">
		<div class="panel-body">
			<form id="product" action="/viewDetail" method="post">
				<table>
					<tr>
						<th>Image</th>
						<th>Name</th>
						<th>Category</th>
						<th>Condition</th>
						<th>Price</th>
					</tr>
					<c:forEach var="product" items="${products}">
						<tr>
							<td><img src="data:image/jpg;base64,${product.base64image}"
								width="75" height="75" /></td>
							<td>${product.name}</td>
							<td>${product.category}</td>
							<td>${product.condition}</td>
							<td>${product.price}</td>
							<td><a type="button" class="btn btn-success"
								href="/admin-delete/${product.id}">Delete</a></td>
							<td><a type="button" class="btn btn-success"
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
				<a th:href="@{/logout}"> Privacy </a><a th:href="@{/logout}"> Terms</a>
			</pre>
		</footer>
	</div>

</body>
</html>