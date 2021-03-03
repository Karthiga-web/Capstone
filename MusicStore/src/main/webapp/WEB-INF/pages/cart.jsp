<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
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
						<td><a href="/${Order.id}">Remove</a></td>
					</tr>
				</c:forEach>
			</table>
			<input type="submit" name="button" value="Continue Shopping" />
		</form>
	</div>
</body>
</html>