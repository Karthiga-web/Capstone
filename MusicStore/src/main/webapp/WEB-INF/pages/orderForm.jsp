<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en" xmlns:th="http://www.thymeleaf.org">
<head>
    <meta charset="ISO-8859-1">
    <title>Order</title>
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
            <a class="navbar-brand" href="#" th:href="@{/}">Instrument Store</a>
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
            <div th:if="${param.success}">
                <div class="alert alert-info">Order Updated!</div>
            </div>

            <h1>Update Order</h1>

            <form th:action="@{/orderForm}" method="post" th:object="${order}">
                <input type="hidden" th:field="*{id}" />
                <div class="form-group">
                    <label class="control-label" for="userId"> User Id </label>
                    <input id="userId" class="form-control" th:field="*{userId}"
                           required autofocus="autofocus"/>
                </div>

                <div class="form-group">
                    <label class="control-label" for="productId"> Product Id </label> <input
                        id="productId" class="form-control" th:field="*{productId}"
                        required autofocus="autofocus"/>
                </div>

                <div class="form-group">
                    <label class="control-label" for="productName"> Product Name </label> <input
                        id="productName" class="form-control" th:field="*{productName}" required
                        autofocus="autofocus"/>
                </div>

                <div class="form-group">
                    <label class="control-label" for="unitPrice"> Unit Price in $</label> <input
                        id="unitPrice" class="form-control"
                        th:field="*{unitPrice}" required autofocus="autofocus"/>
                </div>

                <div class="form-group">
                    <label class="control-label" for="quantity"> Quantity </label> <input
                        id="quantity" class="form-control"
                        th:field="*{quantity}" required autofocus="autofocus"/>
                </div>

                <div class="form-group">
                    <label class="control-label" for="price"> Price in $</label> <input
                        id="price" class="form-control"
                        th:field="*{price}" required autofocus="autofocus"/>
                </div>

                <div class="form-group">
                    <label class="control-label" for="status"> Status </label> <input
                        id="status" class="form-control"
                        th:field="*{status}" required autofocus="autofocus"/>
                </div>

                <div class="form-group">
                    <button type="submit" class="btn btn-success">Update</button>
                </div>
            </form>
        </div>
    </div>
</div>
</body>
</html>