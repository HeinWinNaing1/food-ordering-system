<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>update user</title>
<link rel="stylesheet" href="css/form.css">
</head>
<body>
	<form action="profile" method="post">
		<input type="hidden" name="mode" value="UPDATE"> <input
			type="hidden" name="id" value="${user.id }"> <input
			type="hidden" name="password" value="${user.password }">
		<div class="form-body">
			<div class="row">
				<div class="form-holder">
					<div class="form-content">
						<div class="form-items">
							<h3>Update Information</h3>

							<div class="col-md-12">
								<div>Name</div>
								<input class="form-control" type="text" name="username"
									value="${user.username }" required>
							</div>

							<div class="col-md-12">
								<div>E-mail</div>
								<input class="form-control" type="text" name="email"
									value="${user.email }" required>

							</div>
							<div class="col-md-12">
								<div>Role</div>
								<input class="form-control" type="text" name="role"
									value="${user.role }" required>

							</div>

							<div class="form-button mt-3">
								<button id="submit" type="submit" class="btn btn-primary">Update</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</form>
</body>
</html>