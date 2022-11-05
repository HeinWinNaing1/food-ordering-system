<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:url var="loadCart" value="index">
	<c:param name="mode" value="LOADCART"></c:param>
</c:url>
<c:url var="loadOrder" value="index">
	<c:param name="mode" value="LOADORDER"></c:param>
</c:url>
<c:url var="loadOrderList" value="index">
	<c:param name="mode" value="LOADORDERLIST"></c:param>
</c:url>
<c:url var="loadMenu" value="index">
	<c:param name="mode" value="LOADMENU"></c:param>
</c:url>
<c:url var="loadProfile" value="index">
	<c:param name="mode" value="PROFILE"></c:param>
</c:url>
<nav class="navbar navbar-expand-lg navbar-dark">
	<div class="container">
		<a class="navbar-brand" href="#"><img id="logo"
			src="assets/bremove.png" alt="logo" />FOOD</a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav ms-auto mb-2 mb-lg-0">
				<li class="nav-item"><a class="nav-link active"
					aria-current="page" href="index">Home</a></li>
				<li class="nav-item"><a class="nav-link active"
					aria-current="page" href="about.html">About</a></li>
				<c:if test="${fn:contains(user.role,'user') }">
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="${loadCart }">MyCart</a></li>
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="${loadOrder }">MyOrder</a></li>
				</c:if>
				<c:if test="${fn:contains(user.role,'admin') }">
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="${loadOrderList }">ViewAllOrder</a></li>
				</c:if>
				<li class="nav-item"><a class="nav-link active"
					aria-current="page" href="${loadMenu }">ShowMenu</a></li>
					<c:if test="${fn:contains(user.role,'user') }">
				<li class="nav-item"><a class="nav-link active"
					aria-current="page" href="contact.jsp">Contact</a></li>
					</c:if>
				<li class="nav-item"><a class="nav-link active"
					aria-current="page" href="${loadProfile }">MyProfile</a></li>
			</ul>
		</div>
	</div>
</nav>