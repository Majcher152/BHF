$(document).ready(function() {
	function Carousel() {
		$('.carousel').carousel({
			interval : 2000
		})
	}
	
	var	navig = $(document.getElementById('navigationID')),
	carousel = $(document.getElementById('carouselExampleIndicators')),
	bottom = (carousel.height() + navig.height())/2,
	navigation = document.getElementById('navigationID'),
	navigation_Title = document.getElementById('navigationID_Title');

	function Scroll() {
		var ypos = window.pageYOffset;
		if (ypos > bottom) {
					navigation.style.height = "45px";
					document.getElementById('navigationID_Title').style.fontSize = "20px";
					document.getElementById('howItWorks_Button').style.fontSize = "18px";
					document.getElementById('new_Training_Button').style.fontSize = "18px";
					document.getElementById('routes_Button').style.fontSize = "18px";
					document.getElementById('your_Profile_Button').style.fontSize = "18px";
					document.getElementById('log_Out_Button').style.fontSize = "18px";
			} else if (ypos < bottom) {
					navigation.style.height = "100px";
					document.getElementById('navigationID_Title').style.fontSize = "30px";
					document.getElementById('howItWorks_Button').style.fontSize = "22px";
					document.getElementById('new_Training_Button').style.fontSize = "22px";
					document.getElementById('routes_Button').style.fontSize = "22px";
					document.getElementById('your_Profile_Button').style.fontSize = "22px";
					document.getElementById('log_Out_Button').style.fontSize = "22px";
				}
	}
	
	window.addEventListener("scroll", Scroll);
	document.getElementById("howItWorks_Button").addEventListener("click", Scroll);
});