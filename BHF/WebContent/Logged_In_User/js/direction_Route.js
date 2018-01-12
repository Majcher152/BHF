

var directionsDisplay;
var directionsService = new google.maps.DirectionsService();
var directionsMap;
var z = document.getElementById("directions-canvas");
var start;
var end;

function getDirectionsLocation() {
    if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(showDirectionsPosition);
    } else {
        z.innerHTML = "Geolocation is not supported by this browser.";
    }
}
function showDirectionsPosition(position) {
    directionsLatitude = position.coords.latitude;
    directionsLongitude = position.coords.longitude;
    directionsLatLng = new google.maps.LatLng(directionsLatitude,directionsLongitude);
    getDirections();
}

function getDirections() {
  directionsDisplay = new google.maps.DirectionsRenderer();
  var directionsOptions = {
    zoom:10,
    center: start
  }
  directionsMap = new google.maps.Map(document.getElementById("directions-canvas"), directionsOptions);
  directionsDisplay.setMap(directionsMap);
  calcRoute();
}

function calcRoute() {
  start = directionsLatLng;
  end = document.getElementById("locationID").value;
  var request = {
    origin:start,
    destination:end,
    travelMode: google.maps.TravelMode.BICYCLING
  };
  directionsService.route(request, function(result, status) {
    if (status == google.maps.DirectionsStatus.OK) {
      directionsDisplay.setDirections(result);
      directionsDisplay.setPanel(document.getElementById('panel'));
   }

    
    
  });
}
window.addEventListener("pageshow", getDirectionsLocation);

//$( document ).on( "pageshow", function( event ) {
//	console.log("lol");
//  getDirectionsLocation();
//});