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
<title>View Tasks</title>
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

.left-align-footer {
	text-align: right;
}
.margin-align{
margin-right:5%;
margin-left:5%;
}
</style>
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
		<div class="container-fluid">
			<!-- brand header -->
			<a class="navbar-brand" href="/">Music.ly</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarNav"
				aria-controls="navbarNav" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarNav">
				<ul class="navbar-nav">
					<!-- Home tab -->
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="/" name="target-top-home">Home</a></li>
					<!-- Products -->
					<li class="nav-item"><a class="nav-link " href="/product">Products</a>
					</li>
					<!-- Login -->
					<li class="nav-item"><a class="nav-link" href="/login">Login</a>
					</li>
					<!-- Register -->
					<li class="nav-item"><a class="nav-link" href="/register">Register</a>
					</li>
				</ul>
			</div>
		</div>
	</nav>
	<!--Tables  -->
	<div class="margin-align" align="center" >
		<h3>All Products</h3>
		<h5>Checkout All the Awesome products available now!</h5>
		<form id="search" action="/search" method="get">
			<input type="text" name="search" placeholder="search"> <input
				type="submit" name="button" value="search">
		</form>
		<form id="product" action="/viewdetail" method="post">
			<table>
				<tr>
					<th>Image</th>
					<th>Name</th>
					<th>Category</th>
					<th>Condition</th>
					<th>Price in $</th>
					<th>Click to Update</th>
				</tr>
				<c:forEach var="product" items="${products}">
					<tr>
						<td><img src="data:image/jpg;base64,${product.base64image}"
							width="75" height="75" /></td>
						<td>${product.name}</td>
						<td>${product.category}</td>
						<td>${product.condition}</td>
						<td>${product.price}</td>
						<td><a href="viewdetail/${product.id}">View Detail</a></td>
					</tr>
				</c:forEach>
			</table>
		</form>
	</div>
	<!-- Footer -->
	<footer class="row margin-align">
		<div class="col">
			@2016 Company.Inc <a href="#">Privacy </a> &#8226 <a href="#">Terms</a>
		</div>
		<div class="col left-align-footer">
			<a href="#target-top-home">Back to top</a>
		</div>
	</footer>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0"
		crossorigin="anonymous"></script>
</body>
</html>