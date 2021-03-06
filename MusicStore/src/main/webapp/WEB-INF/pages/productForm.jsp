<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en" xmlns:th="http://www.thymeleaf.org">
<head>
    <meta charset="ISO-8859-1">
    <title>Product</title>
    <link rel="stylesheet"
          href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
          integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
          crossorigin="anonymous">
</head>
<body>

<!-- create navigation bar ( header) -->
<nav class="navbar navbar-inverse navbar-fixed-top">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed"
                    data-toggle="collapse" data-target="#navbar" aria-expanded="false"
                    aria-controls="navbar">
                <span class="sr-only">Toggle navigation</span> <span
                    class="icon-bar"></span> <span class="icon-bar"></span> <span
                    class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="/">Instrument Store</a>
        </div>
    </div>
</nav>

<br>
<br>
<!-- Create HTML registration form -->
<div class="container">
    <div class="row">
        <div class="col-md-6 col-md-offset-3">

            <!-- success message -->
            <div if="${param.success}">
                <div class="alert alert-info">Product Updated!</div>
            </div>

            <h1>Update Product</h1>

            <form id="adminProductForm" action="/productFormDone" method="post">
                <div class="form-group">
                    <label class="control-label" for="name"> Product name </label>
                    <input id="name" class="form-control" field="*{name}"
                           required autofocus="autofocus"/>
                </div>

                <div class="form-group">
                    <label class="control-label" for="category"> Category </label> <input
                        id="category" class="form-control" field="*{category}"
                        required autofocus="autofocus"/>
                </div>

                <div class="form-group">
                    <label class="control-label" for="price"> Price in $</label> <input
                        id="price" class="form-control" field="*{price}" required
                        autofocus="autofocus"/>
                </div>

                <div class="form-group">
                    <label class="control-label" for="condition"> Condition </label> <input
                        id="condition" class="form-control"
                        field="*{condition}" required autofocus="autofocus"/>
                </div>

                <div class="form-group">
                    <input type="submit" class="btn btn-success">Update</input>
                </div>
            </form>
        </div>
    </div>
</div>
</body>
</html>