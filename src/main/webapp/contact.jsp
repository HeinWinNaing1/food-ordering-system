<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="css/custom.css">
<title>contact</title>
</head>
<body>
	<div id="container">
		<h2>Contact us</h2>
		<div class="row">
			<div>
				<label for="name">Name</label>
			</div>
			<div>
				<input type="text" id="name" name="name"
					placeholder="Enter your name">
			</div>
		</div>
		<div class="row">
			<div>
				<label for="name">Email</label>
			</div>
			<div>
				<input type="text" id="email" name="email" placeholder="Email">
			</div>
		</div>
		<div class="row">
			<div>
				<label for="name">Message</label>
			</div>
			<div>
				<textarea id="address" name="address" id="address" rows="5">
                
            </textarea>
			</div>
		</div>
		<div class="row">
			<input type="submit" value="submit">
		</div>
	</div>
</body>
</html>