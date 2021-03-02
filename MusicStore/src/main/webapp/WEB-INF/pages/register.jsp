<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Register Here!</title>
</head>
<body>
	<div align="center">
		${message }
		<form id="register" action="/register" method="post">
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
</body>
</html>