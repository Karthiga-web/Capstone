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
			<div class="collapse navbar-collapse" id="navbarNav">
				<ul class="navbar-nav">
					<!-- Home tab -->
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="/">Home</a></li>
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
	<div align="center">
		<h5>Product Detail</h5>
		<br>
		<p>HEre is the detail information of the product!</p>
		<br>
		<!--Card  -->
		<div class="card mb-3" style="max-width: 540px;">
			<div class="row g-0" id="order" action="/order" method="post">
				<div class="col-md-4">
					<img name="image" src=${ image} alt="...">
				</div>
				<div class="col-md-8">
					<div class="card-body">
						<h5 class="card-title" type="text" name="name" readonly
							value=${ name}>Instrument: ${ name}</h5>
						<p class="card-text" type="text" name="category" readonly
							value=${ category}>Category: ${ category}</p>
						<p class="card-text" type="text" name="condition" readonly
							value=${ condition}>Condition: ${ condition}</p>
						<p class="card-text" id="price" name="price" readonly
							value=${ price}>Price: ${ price}</p>
						<input type="submit" name="button" value="Back" /> <input
							type="submit" name="button" value="Order" id="orderOnclick" />

					</div>
				</div>
			</div>
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