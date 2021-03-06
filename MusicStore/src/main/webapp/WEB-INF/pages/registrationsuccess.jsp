<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
<style>
.toppadding{
    padding-top: 50%;
}
</style>
<title>Success!</title>
</head>
<body>
	<!-- Navbar -->
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
	<div class="alert alert-danger" role="alert" align="center">
		<h1>${message }</h1>
		<br>
		<br>
		<form id="success" action="/success" method="post">
			<input type="submit" name = "button" value="Home"/>
		</form>
	</div>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js" integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0" crossorigin="anonymous"></script>
</body>
</html>