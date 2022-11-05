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
<link rel="stylesheet" type="text/css" href="css/mystyle1.css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" />
<title>index</title>
</head>
<body>

	<div class="main">

		<!----- Start Header ------>
		<div class="header">

			<div class="header-left">
				<img src="images/bgremoveb.png" width="300" height="150" alt="Logo">
			</div>
			<div class="header-right">

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

				<ul>
					<li><a href="index">Home</a></li>
					<li><a href="about.html">About</a></li>

					<c:if test="${fn:contains(user.role,'user') }">
						<li><a href="${loadOrder }">My Order</a></li>
					</c:if>

					<c:if test="${fn:contains(user.role,'admin') }">
						<li><a href="${loadOrderList }">View All Order</a></li>
					</c:if>

					<c:if test="${fn:contains(user.role,'user') }">
						<li><a href="${loadCart }">My cart</a></li>
					</c:if>

					<c:if test="${fn:contains(user.role,'user') }">
						<li><a href="contact.jsp">Contact</a></li>
					</c:if>

					<c:if test="${fn:contains(user.role,'admin') }">
						<li><a href="${loadMenu }">SEE THE MENU </a></li>
					</c:if>

					<li><a href="${loadProfile }">My Profile</a></li>


				</ul>
			</div>

			<div class="header-bottom">
				<div class="header-font">Eat healthy food &amp; Enjoy your
					life.</div>
				<c:if test="${fn:contains(user.role,'user') }">
					<div class="p50_0" align="center">
						<a href="${loadMenu }" class="header-btns">SEE THE MENU </a>
					</div>
				</c:if>
			</div>

		</div>
		<!----- End Header ------>

		<!----- Start Content ------>
		<div class="content-part-1">
			<div class="content-part-1-left">
				<div class="content-part-1-left-h3">MOKE HIN GAR</div>
				<div class="content-part-1-left-p">Mohingar has a delicious
					taste and can be eaten or drunk. It contains both solids and gravy.
					It is a mixture of rice-noodles and gravy. The solid are made of
					rice like noodles. The gravy is made of rice powder, pea-powder,
					and peanut powder. Fish is essential for Monhinga gravy. It also
					contains several pieces of onion, garlic, lemon grass, ginger,
					chili, pepper and shrimp paste. And the banana trunk is served as
					an important ingredient in Monhingar. Monhingar is the favorite
					snack of the whole country, especially in the morning.</div>
				<div class="p20_0">
					<a href="#!" class="content-part-1-left-btn">Read More.</a>
				</div>
			</div>
			<div class="content-part-1-right" align="center">
				<img src="images/mokehin.png" width="673" height="434"
					alt="Restaurant">
			</div>
		</div>

		<div class="content-part-2">
			<div class="content-part-2-inner">
				<div class="interior-font">Best Food</div>
				<div class="content-interior">
					<img src="images/Ham.png" width="350" height="200">
					<div class="content-interior-h3">HanBurger</div>
					<div class="content-interior-p">A hamburger, or simply
						burger, is a food consisting of fillings—usually a patty of ground
						meat, typically beef—placed inside a sliced bun or bread roll.</div>
				</div>
				<div class="content-interior">
					<img src="images/pizza.jpg" width="350" height="200">
					<div class="content-interior-h3">Pizza</div>
					<div class="content-interior-p">pizza, dish of Italian origin
						consisting of a flattened disk of bread dough topped with some
						combination of olive oil, oregano, tomato, olives, mozzarella or
						other cheese in a commercial setting, using a wood-fired oven
						heated to a very high temperature—and served hot.</div>
				</div>
			</div>
		</div>

		<div class="content-part-3">
			<div class="content-part-3-left">
				<img src="images/onionring.jpg" width="230" height="155">
			</div>
			<div class="content-part-3-right">
				<div class="content-part-3-right-h4">Onion ring</div>
				<div class="price">
					Price : <i class="green"><i class="fa-duotone fa-dollar-sign"></i>100</i>
				</div>
				An onion ring, also called a French fried onion ring, is a form of
				appetizer or side dish in British and American cuisine.

			</div>
			<div class="content-part-3-left">
				<img src="images/pancake.jpg" width="230" height="155">
			</div>
			<div class="content-part-3-right">
				<div class="content-part-3-right-h4">Pan cake</div>
				<div class="price">
					Price :<i class="green"><i class="fa-duotone fa-dollar-sign"></i>100</i>
				</div>
				A pancake is a flat cake made from a batter of eggs, milk and flour
				and fried on a very hot surface, often with butter.
			</div>

			<div class="content-part-3-left">
				<img src="images/pasta.jpg" width="230" height="155">
			</div>
			<div class="content-part-3-right">
				<div class="content-part-3-right-h4">Pasta</div>
				<div class="price">
					Price :<i class="green"><i class="fa-duotone fa-dollar-sign"></i>100</i>
				</div>
				Pasta is a type of food typically made from an unleavened dough of
				wheat flour mixed with water or eggs, and formed into sheets or
				other shapes.
			</div>
			<div class="content-part-3-left">
				<img src="images/Burgar.jpg" width="230" height="155">
			</div>
			<div class="content-part-3-right">
				<div class="content-part-3-right-h4">Burger</div>
				<div class="price">
					Price : <i class="green"><i class="fa-duotone fa-dollar-sign"></i>100</i>
				</div>
				A hamburger, or simply burger, is a food consisting of
				fillings—usually a patty of ground meat, typically beef—placed
				inside a sliced bun or bread roll.
			</div>

			<div class="content-part-3-left">
				<img src="images/applepie.jpg" width="230" height="155">
			</div>
			<div class="content-part-3-right">
				<div class="content-part-3-right-h4">Apple pie</div>
				<div class="price">
					Price :<i class="green"><i class="fa-duotone fa-dollar-sign"></i>100</i>
				</div>
				An apple pie is a pie in which the principal filling ingredient is
				apples. The earliest printed recipe is from England.
			</div>
			<div class="content-part-3-left">
				<img src="images/bread.jpg" width="230" height="155">
			</div>
			<div class="content-part-3-right">
				<div class="content-part-3-right-h4">Bread</div>
				<div class="price">
					Price : <i class="green"><i class="fa-duotone fa-dollar-sign"></i>100</i>
				</div>
				Bread is a staple food prepared from a dough of flour (usually
				wheat) and water, usually by baking.
			</div>

			<div class="content-part-3-left">
				<img src="images/chickenfried.jpg" width="230" height="155">
			</div>
			<div class="content-part-3-right">
				<div class="content-part-3-right-h4">Chicken fried</div>
				<div class="price">
					Price : <i class="green"><i class="fa-duotone fa-dollar-sign"></i>100</i>
				</div>
				Fried chicken has been described as being "crunchy" and "juicy", as
				well as "crispy".
			</div>
			<div class="content-part-3-left">
				<img src="images/chimichanga.jpg" width="230" height="155">
			</div>
			<div class="content-part-3-right">
				<div class="content-part-3-right-h4">Chimichanga</div>
				<div class="price">
					Price : <i class="green"><i class="fa-duotone fa-dollar-sign"></i>100</i>
				</div>
				Fried chicken has been described as being "crunchy" and "juicy", as
				well as "crispy".
			</div>

			<div class="content-part-3-left">
				<img src="images/donuts.jpg" width="230" height="155">
			</div>
			<div class="content-part-3-right">
				<div class="content-part-3-right-h4">Donuts</div>
				<div class="price">
					Price : <i class="green"><i class="fa-duotone fa-dollar-sign"></i>100</i>
				</div>
				Doughnuts are usually deep fried from a flour dough, but other types
				of batters can also be used.
			</div>
			<div class="content-part-3-left">
				<img src="images/friedrice.jpg" width="230" height="155">
			</div>
			<div class="content-part-3-right">
				<div class="content-part-3-right-h4">Fried rice</div>
				<div class="price">
					Price : <i class="green"><i class="fa-duotone fa-dollar-sign"></i>100</i>
				</div>
				Fried rice is a dish of cooked rice that has been stir-fried in a
				wok or a frying pan and is usually mixed with other ingredients.
			</div>

			<div class="content-part-3-left">
				<img src="images/fries.jpg" width="230" height="155">
			</div>
			<div class="content-part-3-right">
				<div class="content-part-3-right-h4">Fries</div>
				<div class="price">
					Price : <i class="green"><i class="fa-duotone fa-dollar-sign"></i>100</i>
				</div>
				french fries, also called chips, finger chips, fries made from
				deep-fried potatoes that have been cut into various shapes,
				especially thin strips.
			</div>
			<div class="content-part-3-left">
				<img src="images/icecream.jpg" width="230" height="155">
			</div>
			<div class="content-part-3-right">
				<div class="content-part-3-right-h4">IceCream</div>
				<div class="price">
					Price : <i class="green"><i class="fa-duotone fa-dollar-sign"></i>100</i>
				</div>
				ice cream, frozen dairy food made from cream or butterfat, milk,
				sugar, and flavourings.
			</div>

			<div class="content-part-3-left">
				<img src="images/icecreamcake.jpg" width="230" height="155">
			</div>
			<div class="content-part-3-right">
				<div class="content-part-3-right-h4">Ice cream cake</div>
				<div class="price">
					Price : <i class="green"><i class="fa-duotone fa-dollar-sign"></i>100</i>
				</div>
				ice cream, frozen dairy food made from cream or butterfat, milk,
				sugar, and flavourings.
			</div>
			<div class="content-part-3-left">
				<img src="images/potpie.jpg" width="230" height="155">
			</div>
			<div class="content-part-3-right">
				<div class="content-part-3-right-h4">Pot pie</div>
				<div class="price">
					Price : <i class="green"><i class="fa-duotone fa-dollar-sign"></i>100</i>
				</div>
				pie made by lining the inner surface of a pot with pastry and
				filling it with meat and seasoning and baking it.
			</div>
			<div class="content-part-3-left">
				<img src="images/steak.jpg" width="230" height="155">
			</div>
			<div class="content-part-3-right">
				<div class="content-part-3-right-h4">Steak</div>
				<div class="price">
					Price : <i class="green"><i class="fa-duotone fa-dollar-sign"></i>100</i>
				</div>
				A steak is a thick cut of meat generally sliced across the muscle
				fibers, sometimes including a bone. It is normally grilled or fried.
			</div>
			<div class="content-part-3-left">
				<img src="images/tacos.jpg" width="230" height="155">
			</div>
			<div class="content-part-3-right">
				<div class="content-part-3-right-h4">Tacos</div>
				<div class="price">
					Price : <i class="green"><i class="fa-duotone fa-dollar-sign"></i>100</i>
				</div>
				A taco is a traditional Mexican food consisting of a small
				hand-sized corn- or wheat-based tortilla topped with a filling.
			</div>
		</div>
		<!----- End Content ------>

		<!------ Start Footer ------>
		<div class="footer">
			<div class="footer-parts">
				<div class="footer-parts-h3">Make your own delicios dishes.
					Have a good day.</div>
				<div class="footer-parts-p">The meal tody was very tasty.
					You've done a great job. Thanks very much, you cooked that meal to
					perfection. Your cooking has really brought out all the many
					flavours.</div>
				<div class="footer-icons">
					<ul>
						<li><a href="#!"><i class="fa-brands fa-facebook"></i></a></li>
						<li><a href="#!"><i class="fa-brands fa-twitter"></i></a></li>
						<li><a href="#!"><i class="fa-brands fa-linkedin"></i></a></li>
						<li><a href="#!"><i class="fa-brands fa-google-plus"></i></a></li>
					</ul>
				</div>
			</div>
		</div>
		<div class="footer-bottom">
			<div class="white">
				&copy;
				<script language="javascript" type="text/javascript">
					document.write(new Date().getFullYear());
				</script>
				. All rights reserved by <a href="#" target="_blank">Hein Win
					Naing</a>.
			</div>
		</div>
		<!------ End Footer ------->

		<div class="clearfix"></div>
	</div>

</body>
</html>