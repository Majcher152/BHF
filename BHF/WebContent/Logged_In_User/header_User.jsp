<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>Bike High Five</title>

<!-- Bootstrap core CSS -->
<link href="/BHF/lib/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom fonts for this template -->
<link href="/BHF/lib/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Lato:300,400,700,300italic,400italic,700italic"
	rel="stylesheet" type="text/css">
<link href="/BHF/Main_Page/css/landing-page.css" rel="stylesheet">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>


<script src="/BHF/Logged_In_User/js/animation_Carousel.js"
	type="text/javascript"></script>
<script src="/BHF/Logged_In_User/js/JESZCZENIEWIEM.js"
	type="text/javascript"></script>
<script type="text/javascript"
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCTZea67jn4YSPIGu0dNTHRyB1jnvo1Q00&language=en"></script>

</head>

<body>

	<!-- Navigation -->
	<nav class="navbar navbar-expand-lg navbar-light fixed-top"
		id="navigationID">
		<div class="container-fluid" id="cointer_intro-message">
			<div class="col-xl-1 col-1">
				<a class="navigation_Title" href="/BHF/Logged_In_User/user.jsp"
					id="navigationID_Title">Bike High Five</a>
				<button class="navbar-toggler" type="button" data-toggle="collapse"
					data-target="#navbarResponsive" aria-controls="navbarResponsive"
					aria-expanded="false" aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
			</div>
			<div class="col-xl-5 col-5"></div>
			<div class="col-xl-7 col-7">
					<ul class="navbar-nav" id="navbar-items-list">
						<li class="nav-item"><a class="navbar-link"
							href="/BHF/Logged_In_User/user.jsp" id="howItWorks_Button">How
								it works?</a></li>
						<li class="nav-item"><a class="navbar-link"
							href="/BHF/Logged_In_User/new_Training.jsp"
							id="new_Training_Button">New training</a></li>
						<li class="nav-item"><a class="navbar-link"
							href="/BHF/Logged_In_User/routes.jsp" id="routes_Button">Your
								routes</a></li>
						<li class="nav-item"><a class="navbar-link"
							href="/BHF/Logged_In_User/your_Profile.jsp"
							id="your_Profile_Button">Your profile</a></li>
						<li class="nav-item"><a class="navbar-link"
							href="/BHF/Logged_In_User/log_Out.jsp" id="log_Out_Button">Log out</a></li> 
				<!-- 		<li class="nav-item"><a class="navbar-link"
							id="log_Out_Button"><button
									type="submit" id ="logout">Log out</button></a></li> -->


					</ul>
			</div>
		</div>
	</nav>

	<div id="carouselExampleIndicators" class="carousel slide"
		data-ride="carousel">
		<ol class="carousel-indicators">
			<li data-target="#carouselExampleIndicators" data-slide-to="0"
				class="active"></li>
			<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
			<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
		</ol>
		<div class="carousel-inner" role="listbox">
			<div class="carousel-item active">
				<img class="d-block img-fluid"
					src="/BHF/Main_Page/img/Main_Bike.jpg" alt="First slide">
			</div>
			<div class="carousel-item">
				<img class="d-block img-fluid" src="/BHF/Main_Page/img/b3.jpg"
					alt="Second slide">
			</div>
			<div class="carousel-item">
				<img class="d-block img-fluid" src="/BHF/Main_Page/img/b4.jpg"
					alt="Third slide">
			</div>
		</div>
		<a class="carousel-control-prev" href="#carouselExampleIndicators"
			role="button" data-slide="prev"> <span
			class="carousel-control-prev-icon" aria-hidden="true"></span> <span
			class="sr-only">Previous</span>
		</a> <a class="carousel-control-next" href="#carouselExampleIndicators"
			role="button" data-slide="next"> <span
			class="carousel-control-next-icon" aria-hidden="true"></span> <span
			class="sr-only">Next</span>
		</a>
	</div>