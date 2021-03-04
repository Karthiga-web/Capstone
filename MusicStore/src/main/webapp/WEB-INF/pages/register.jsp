<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
<title>Register Here!</title>
</head>
<body>
	<!-- Navbar -->
   <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
      <div class="container-fluid">
        <!-- brand header -->
        <a class="navbar-brand" href="/">Musical.ly</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
          <ul class="navbar-nav">
            <!-- Home tab -->
            <li class="nav-item">
              <a class="nav-link active" aria-current="page" href="/">Home</a>
            </li>
            <!-- Products -->
            <li class="nav-item">
              <a class="nav-link " href="/product" >Products</a>
            </li>
            <!-- Login -->
            <li class="nav-item">
              <a class="nav-link" href="/login">Login</a>
            </li>
            <!-- Register -->
            <li class="nav-item">
              <a class="nav-link" href="/register">Register</a>
            </li>
          </ul>
        </div>
      </div>
    </nav>
	<!--Registration Form  -->
	<div align="center">
		${message }
		<form id="register" action="/registerdone" method="post">
			<table style="with: 50%">
				<tr>
					<td>Name</td>
					<td><input type="text" name="name" required /></td>
				</tr>
				<tr>
					<td>UserName</td>
					<td><input type="text" name="userName" required /></td>
				</tr>
				<tr>
					<td>Password</td>
					<td><input type="text" name="password" required /></td>
				</tr>
				<tr>
					<td>Email</td>
					<td><input type="text" name="email" required /></td>
				</tr>
				<tr>
					<td>Phone</td>
					<td><input type="text" name="phone" required /></td>
				</tr>
				<tr>
					<td>Address</td>
					<td><input type="text" name="address" required /></td>
				</tr>
				<tr>
					<td>Apartment No</td>
					<td><input type="text" name="apartmentNumber" required /></td>
				</tr>
				<tr>
					<td>City</td>
					<td><input type="text" name="city" required /></td>
				</tr>
				<tr>
					<td>State</td>
					<td><input type="text" name="state" required /></td>
				</tr>
				<tr>
					<td>Country</td>
					<td><input type="text" name="country" required /></td>
				</tr>
				<tr>
					<td>Zipcode</td>
					<td><input type="text" name="zipcode" required /></td>
				</tr>
				<tr>
					<td>Active:</td>
					<td><input type="radio" id="activeYes" name="active"
						value="true"> <label for="yes">YES</label> <br></td>
					<td><input type="radio" id="activeNo" name="active"
						value="false"> <label for="no">NO</label> <br></td>
				</tr>
				<tr>
					<td>Role</td>
					<td><input type="radio" id="user" name="roles" value="1"><label
						for="user">User</label></td>
					<td><input type="radio" id="admin" name="roles" value="2"><label
						for="admin">Admin</label></td>
					<td>
				</tr>
			</table>
			<input type="submit" value="Register" />
		</form>
	</div>
<!-- Bootstrap -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js" integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0" crossorigin="anonymous"></script>
</body>
</html>