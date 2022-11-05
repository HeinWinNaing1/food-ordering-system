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
<title>Add Item</title>
</head>
<body>
	<div class="container">
		<div class="title">Adding Items</div>
		<div class="content">
			<form action="food" method="post">
				<input type="hidden" name="mode" value="CREATE">
				<div class="user-details">
					<div class="input-box">
						<span class="details">Food Name</span> <input type="text"
							id="foodname" name="foodname" placeholder="Enter food name"
							required>
					</div>
					<div class="input-box">
						<span class="details">Catagory</span> <input type="text"
							id="catagory" name="catagory" placeholder="Enter catagory"
							required>
					</div>
					<div class="input-box">
						<span class="details">Taste</span> <input type="text" id="taste"
							name="taste" placeholder="Enter taste" required>
					</div>
					<div class="input-box">
						<span class="details">Price</span> <input type="number" id="price"
							name="price" placeholder="Enter price" required>
					</div>
				</div>
				<div class="button">
					<input type="submit" value="Create">
				</div>
			</form>
		</div>
	</div>

</body>
</html>