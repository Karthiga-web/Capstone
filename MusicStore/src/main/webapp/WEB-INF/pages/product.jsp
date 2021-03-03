<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View Tasks</title>
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
		<form id="product" action="/viewdetail" method="post">
			<table>
				<tr>
					<th>Image</th>
					<th>Name</th>
					<th>Category</th>
					<th>Condition</th>
					<th>Description</th>
					<th>Click to Update</th>
				</tr>
				<c:forEach var="product" items="${products}">
					<tr>
						<td><img src="data:image/jpg;base64,${product.base64image}" width="75" height="75"/></td>
						<td>${product.name}</td>
						<td>${product.category}</td>
						<td>${product.condition}</td>
						<td>${product.price}</td>
						<td><a href="viewdetail/${product.id}">View Detail</a></td>
					</tr>
				</c:forEach>
			</table>
		</form>
	</div>
</body>
</html>