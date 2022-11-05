<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="css/formstyle.css">
<title>food order</title>
</head>
<body>
	<div id="container">
		<form action="cart" method="post">
			<input type="hidden" name="mode" value="ORDERITEM"> <input
				type="hidden" name="id" value="${cart.id }">
			<div class="row">
				<h2>Food Order</h2>
			</div>
			<div class="row">
				<div>
					<input type="text" id="foodname" name="foodname"
						value="${cart.foodName }" readonly="readonly">
				</div>
			</div>
			<div class="row">
				<div>
					<input type="text" id="catagory" name="catagory"
						value="${cart.catagory }" readonly="readonly">
				</div>
			</div>
			<div class="row">
				<div>
					<input type="text" id="taste" name="taste" value="${cart.taste }"
						readonly="readonly">
				</div>
			</div>
			<div class="row">
				<div>
					<input type="email" id="email" name="email" value="${cart.email }"
						readonly="readonly">
				</div>
			</div>
			<div class="row">
				<div>
					<input type="text" id="price" name="price" value="${cart.price }"
						readonly="readonly">
				</div>
			</div>
			<div class="row">
				<div>
					<input type="number" id="quantity" name="quantity" value="1"
						min=1 max=50>
				</div>
			</div>
			<div class="row">
				<div>
					<input type="submit" id="submit" value="Order">
				</div>
			</div>
		</form>
	</div>
</body>
</html>