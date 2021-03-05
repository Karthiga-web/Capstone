<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
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
					<li class="nav-item"><a class="nav-link" href="<c:url value="/logout"/>">Logout</a></li>
					<!-- Cart -->
					<li class="nav-item"><a class="nav-link" href="/cart">Cart</a>
					</li>
				</ul>
			</div>
		</div>
	</nav>
	<div align="center">
		<h5>Product Detail</h5>
		<br>
		<p>Here is the detail information of the product!</p>
		<br> 
		<form id="order" action="/order" method="post">
			<table style="with: 50%">
				<tr>
					<td>Name</td>
					<td><input type="text" name="name" readonly value=${ name}></td>
				</tr>
				<tr>
					<td>Category</td>
					<td><input type="text" name="category" readonly value=${ category}></td>
					<td><input type="text"name="id" value=${ id} readonly hidden/></td>
				</tr>
				<tr>
					<td>Condition</td>
					<td><input type="text" name="condition" readonly
						value=${ condition}></td>
				</tr>
				<tr>
					<td>Price</td>
					<td><input id="price" name="price" readonly value=${ price}></td>
					<tr>
					<td>Image</td>
					<td><img src="data:image/jpg;base64,${image}" width="100"
						height="100" /></td>
					<td><input type="file" accept="image/jpg" name="image"
						readonly hidden /></td>
				</tr>
			</table>
			<input type="submit" name="button" value="Back" />
			<input type="submit" name="button" value="Order" id="orderOnclick" />
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
		<!-- Onclick -->
		<script type="text/javascript">
			function orderAlert() {
				alert("Product has been added");
			}
			document.getElementById('orderOnclick').onclick = orderAlert;
		</script>

				</body>
</html>