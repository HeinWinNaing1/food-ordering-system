<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Food Items</title>
<!-- CDN-->
<link rel="stylesheet"
	href="https://cdn.datatables.net/1.12.1/css/dataTables.bootstrap5.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script
	src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.min.js"></script>
<script
	src="https://cdn.datatables.net/1.12.1/js/dataTables.bootstrap5.min.js"></script>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/school.ico" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="css/styles.css" rel="stylesheet" />
<link href="css/custom.css" rel="stylesheet" />
</head>
<body>
	<div class="container">
		<c:import url="common/navbar.jsp"></c:import>
		<div class="add"></div>
		<!-- Page content-->
		<div class="container mt-5">
			<table id="example" class="table table-striped" style="width: 100%">
				<thead>
					<tr>
						<th>ID</th>
						<th>Email</th>
						<th>Date</th>
						<th>Quantity</th>
						<th>Rate</th>
						<th>Food-Name</th>
						<th>Price</th>
						<c:if test="${fn:contains(user.role,'admin') }">
							<th>Action</th>
						</c:if>
					</tr>
				</thead>
				<tbody>

					<c:if test="${fn:contains(user.role,'admin') }">
						<c:forEach var="order" items="${orderList}">

							<c:url var="deleteLink" value="order">
								<c:param name="mode" value="DELETE"></c:param>
								<c:param name="id" value="${order.id }"></c:param>
							</c:url>


							<tr>
								<td><c:out value="${order.id }"></c:out></td>
								<td><c:out value="${order.email }"></c:out></td>
								<td><c:out value="${order.date }"></c:out></td>
								<td><c:out value="${order.quantity }"></c:out></td>
								<td><c:out value="${order.rate }"></c:out> $</td>
								<td><c:out value="${order.foodName }"></c:out></td>
								<td><c:out value="${order.price }"></c:out> $</td>


								<td><a href="${deleteLink }" id="delete"
									class="btn btn-danger"
									onclick="return confirm('Are you sure to delete this result?');">Delete</a>
								</td>

							</tr>
						</c:forEach>
					</c:if>
					<c:if test="${fn:contains(user.role,'user') }">
						<c:forEach var="order" items="${order}">

							<c:url var="deleteLink" value="order">
								<c:param name="mode" value="DELETE"></c:param>
								<c:param name="id" value="${order.id }"></c:param>
							</c:url>


							<tr>
								<td><c:out value="${order.id }"></c:out></td>
								<td><c:out value="${order.email }"></c:out></td>
								<td><c:out value="${order.date }"></c:out></td>
								<td><c:out value="${order.quantity }"></c:out></td>
								<td><c:out value="${order.rate }">$</c:out> $</td>
								<td><c:out value="${order.foodName }"></c:out></td>
								<td><c:out value="${order.price }"></c:out> $</td>

							</tr>
						</c:forEach>
					</c:if>

				</tbody>
				<tfoot>
					<tr>
						<th>ID</th>
						<th>Email</th>
						<th>Date</th>
						<th>Quantity</th>
						<th>Rate</th>
						<th>Food-Name</th>
						<th>Price</th>
						<c:if test="${fn:contains(user.role,'admin') }">
							<th>Action</th>
						</c:if>

					</tr>
				</tfoot>
			</table>

		</div>
	</div>
	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="js/scripts.js"></script>

	<script>
            $(document).ready(function () {
                 $('#example').DataTable();
            });
            
        </script>
</body>
</html>