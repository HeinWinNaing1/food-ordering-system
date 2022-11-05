<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="css/profile.css">
<title>profile</title>
</head>
<body>
	<c:url var="logout" value="profile">
		<c:param name="mode" value="LOGOUT"></c:param>
	</c:url>
	<c:url var="edit" value="profile">
		<c:param name="mode" value="LOAD"></c:param>
		<c:param name="id" value="${user.id }"></c:param>
	</c:url>
	<div id="head">
		<h2>My profile</h2>
	</div>
	<div>
		<img src="images/pizza.jfif" alt="">
	</div>
	<div class="container">
		<div class="row">
			<div>
				<h3>Name:</h3>
			</div>
			<div>
				<p>
					<c:out value="${user.username }"></c:out>
				</p>
			</div>
		</div>
		<div class="row">
			<div>
				<h3>Email:</h3>
			</div>
			<div>
				<p>
					<c:out value="${user.email }"></c:out>
				</p>
			</div>
		</div>
		<div class="row">
			<div>
				<h3>Role:</h3>
			</div>
			<div>
				<p>
					<c:out value="${user.role }"></c:out>
				</p>
			</div>
		</div>
		<div class="row">
			<p class="btn">
				<a href="${edit }" class="btn1">Edit</a>
			</p>
		</div>
		<div class="row">
			<p class="btn">
				<a href="${logout }" class="btn2">Logout</a>
			</p>
		</div>
	</div>
</body>
</html>