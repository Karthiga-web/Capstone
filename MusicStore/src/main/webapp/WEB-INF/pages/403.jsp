<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Error!</title>
</head>
<body>
	<div align="center">
		<form id="index" action="/errorMapping" method="post">
			<table>
				<tr>
					<td>You don't have access to this Page!</td>
				</tr>
				<tr>
					<td><input type="submit" name="button" value="Home" /></td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>