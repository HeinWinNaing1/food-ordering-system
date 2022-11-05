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
<title>Sign Up</title>
</head>
<body>
	<div id="container">
		<form action="user" method="post">
			<input type="hidden" name="mode" value="SIGNUP">
			<div class="row">
				<h3>Sign up</h3>
			</div>
			<div class="row">
				<div>
					<input type="text" id="username" name="username"
						placeholder="Your Name" required>
				</div>
			</div>
			<div class="row">
				<div>
					<input type="email" id="email" name="email" placeholder="E-mail"
						required>
				</div>
			</div>
			<div class="row">
				<div>
					<input type="password" id="password" name="password"
						placeholder="password" required>
				</div>
			</div>
			<div class="row">
				<div>
					<input type="checkbox" class="form-check-input" id="role"
						name="role" value="true"> <label class="form-check-label"
						for="role">Admin</label>
				</div>
			</div>
			<div class="row">
				<div>
					<input type="submit" id="submit" value="Create Account">
				</div>
			</div>
			<div class="row">
				<p>
					Already has an account ? <a href="signin.jsp">Please Sign in</a>
				</p>
			</div>
		</form>
	</div>
</body>
</html>