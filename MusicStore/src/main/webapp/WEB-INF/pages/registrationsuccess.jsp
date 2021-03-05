<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<style>
.toppadding{
    padding-top: 50%;
}
</style>
<title>Login Here!</title>
</head>
<body>
	<div class="toppadding" align="center">
		<h1>${message }</h1>
		<br>
		<br>
		<form id="success" action="/success" method="post">
			<input type="submit" name = "button" value="Home"/>
		</form>
	</div>
</body>
</html>