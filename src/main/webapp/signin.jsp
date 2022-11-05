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
<title>Sign in</title>
</head>
<body>
	<div id="container">
		<form action="login" method="post">
			<input type="hidden" name="mode" value="SIGNIN">

			<div class="row">
				<h3>Sign in</h3>
			</div>
			<div class="row">
				<c:if test="${loginFail }">
					<h4>Email or password is incorrect</h4>
				</c:if>
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
			<div class="enter">
				<div>
					<input type="submit" id="submit" value="Enter">
				</div>
			</div>
			<div class="row">
				<div>
					<span>Doesn't have accound yet? <a href="signup.jsp">Create
							Account</a></span>
				</div>
			</div>
		</form>
	</div>
</body>
</html>