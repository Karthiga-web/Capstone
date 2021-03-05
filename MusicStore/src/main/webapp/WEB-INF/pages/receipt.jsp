<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<style>
 .receipt { 
 	background-color: lightgrey; 
	width: max-content;
 	border: 15px solid green; 
 	padding: 50px;
 	margin: 20px; 
} 
</style>
<meta charset="ISO-8859-1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
<title>Order Receipt</title>
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
						aria-current="page" href="/" name="target-top-home">Home</a></li>
					<!-- Products -->
					<li class="nav-item"><a class="nav-link " href="/product">Products</a>
					</li>
					<!-- Welcome User -->
					<li class="nav-item"> <a class="nav-link">Welcome: ${ username}</a></li>
					<!-- Logout -->
					<li class="nav-item"><a class="nav-link" href="<c:url value="/logout"/>">Logout</a></li>
					<!-- Cart -->
					<li class="nav-item"><a class="nav-link" href="/cart">Cart</a></li>
				</ul>
			</div>
		</div>
	</nav>
	<h2  align="center">Order</h2>
	<h5  align="center">Order Confirmation</h5>
	<div align="center">
		<div class="receipt"  align="center">
		<form id="submitOrder" action="/submitOrder" method="post">
			<h5>Receipt</h5>
			<br>
			<p>Shipping Address: ${Address}</p>
			<p>Shipping Date: ${date}</p>
			<p>Billing Address: ${Address}</p>
			<table>
				<tr>
					<th>Product</th>
					<th>Quantity</th>
					<th>Price in $</th>
					<th>Total in $</th>
				</tr>
				<c:forEach var="Order" items="${orders}">
					<tr>
						<td>${Order.productName}</td>
						<td>${Order.quantity}</td>
						<td>$${Order.unitPrice}</td>
						<td>$${Order.price}</td>
					</tr>
				</c:forEach>
			</table>
			<p>Grand Total: ${total}</p>
			<input type="submit" name="button" value="Back" /> <input
				type="submit" name="button" value="Submit Order" /> <input
				type="submit" name="button" value="Cancel" />
		</form>
	</div>
	</div>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js" integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0" crossorigin="anonymous"></script>
</body>
</html>