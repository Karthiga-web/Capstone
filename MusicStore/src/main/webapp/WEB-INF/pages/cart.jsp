<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
<title>View Cart</title>
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
			<div class="collapse navbar-collapse" id="navbarNav">
				<ul class="navbar-nav">
					<!-- Home tab -->
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="/" name="target-top-home" >Home</a></li>
					<!-- Products -->
					<li class="nav-item"><a class="nav-link " href="/product">Products</a>
					</li>
					<!-- Welcome User -->
					<li class="nav-item"> <a class="nav-link">Welcome: ${ username}</a></li>
					<!-- Logout -->
					<li class="nav-item"><a class="nav-link" href="<c:url value="/logout"/>">Logout</a>
					</li>
					<!-- Cart -->
					<li class="nav-item"><a class="nav-link" href="/cart">Cart</a>
					</li>
				</ul>
			</div>
		</div>
	</nav>
	<div align="center">
		${message }
		<form id="cartaction" action="/cartAction" method="post">
			<input type="submit" name="button" value="Clear Cart" /><br> <input
				type="submit" name="button" value="Check Out" />
			<table>
				<tr>
					<th>Product</th>
					<th>Unit price</th>
					<th>Quantity</th>
					<th>Price</th>
					<th>Action</th>
				</tr>
				<c:forEach var="Order" items="${orders}">
					<tr>
						<td>${Order.productName}</td>
						<td>${Order.unitPrice}</td>
						<td>${Order.quantity}</td>
						<td>${Order.price}</td>
						<td><a href="/cartRemove/${Order.id}">Remove</a></td>
					</tr>
				</c:forEach>
			</table>
			<input type="submit" name="button" value="Continue Shopping" />
		</form>
	</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js" integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0" crossorigin="anonymous"></script>
</body>
</html>