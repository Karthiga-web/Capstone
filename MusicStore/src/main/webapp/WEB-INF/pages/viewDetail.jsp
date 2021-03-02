<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View Details Of Product</title>
</head>
<body>
	<div align="center">
	<h5>Product Detail </h5><br>
		<p>HEre is the detail information of the product!</p><br>
		${message }
		<form id="order" action="/order" method="post">
			<table style="with: 50%">
				<tr>
					<td>Name</td>
					<td><input type="text" name="name" readonly
						value=${ name}></td>
				</tr>
				<tr>
					<td>Category</td>
					<td><input type="text" name="category" readonly value=${ category}></td>
				</tr>
				<tr>
					<td>Condition</td>
					<td><input type="text" name="condition" readonly value=${ condition}></td>
				</tr>
				<tr>
					<td>Price</td>
					<td><input id="price"  name="price" readonly value=${ price}></td>
				<tr>
					<td>Image</td>
					<td><input type="text" readonly name="image" value=${ image}></td>
				</tr>
			</table>
			<input type="submit" name = "button"value="Back" />
			<input type="submit" name = "button"value="Order" />
		</form>
	</div>
</body>
</html>