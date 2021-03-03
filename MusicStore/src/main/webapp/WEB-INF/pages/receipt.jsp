<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<style>
div {
	background-color: lightgrey;
	width: 300px;
	border: 15px solid green;
	padding: 50px;
	margin: 20px;
}
</style>
<meta charset="ISO-8859-1">
<title>Order Receipt</title>
</head>
<body>
	<h6>Order</h6>
	<h5>Order Confirmation</h5>
	<div>
		<form id="submitOrder" action="/submitOrder" method="post">
			<h5>Receipt</h5>
			<br>
			<p>Shipping Address:${Address}</p>
			<%-- 		<p>Shipping Date:${date}</p> --%>
			<p>Billing Address:${Address}</p>
			<table>
				<tr>
					<th>Product</th>
					<th>Quantity</th>
					<th>Price</th>
					<th>Total</th>
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
</body>
</html>