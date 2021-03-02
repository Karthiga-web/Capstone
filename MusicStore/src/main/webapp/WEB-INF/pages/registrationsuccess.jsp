<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login Here!</title>
</head>
<body>
	<div align="center">
		${message }
		<form id="login" action="/success" method="post">
			<input type="submit" name = "button" value="Product"/>
		</form>
	</div>
</body>
</html>