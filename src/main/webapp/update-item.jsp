<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta charset="UTF-8">
<!---<title> Responsive Registration Form | CodingLab </title>--->
<link rel="stylesheet" href="css/style1.css">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Update Item</title>
</head>
<body>
	<div class="container">
		<div class="title">Edit Items</div>
		<div class="content">
			<form action="food" method="post">
				<input type="hidden" name="mode" value="UPDATE"> <input
					type="hidden" name="id" value="${food.id }">
				<div>
					<p>
						<c:out value="ID: ${food.id }"></c:out>
					</p>
				</div>
				<div class="user-details">
					<div class="input-box">
						<span class="details">Food Name</span> <input type="text"
							id="foodname" name="foodname" value="${food.foodName }" required>
					</div>
					<div class="input-box">
						<span class="details">Catagory</span> <input type="text"
							id="catagory" name="catagory" value="${food.catagory }" required>
					</div>
					<div class="input-box">
						<span class="details">Taste</span> <input type="text" id="taste"
							name="taste" value="${food.taste }" required>
					</div>
					<div class="input-box">
						<span class="details">Price</span> <input type="number" id="price"
							name="price" value="${food.price }" required>
					</div>
				</div>
				<div class="button">
					<input type="submit" value="Update">
				</div>
			</form>
		</div>
	</div>
</body>
</html>