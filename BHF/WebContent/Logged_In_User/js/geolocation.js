/*
function getLocation() {
	var x = document.getElementById("geoLocation");
    if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(showPosition);
    } else {
        x.innerHTML = "Geolocation is not supported by this browser.";
    }
}
function showPosition(position) {
	var x = document.getElementById("geoLocation");
    x.innerHTML = "Latitude: " + position.coords.latitude + "<br>Longitude: " + position.coords.longitude; 
}

$(document).on('click', '#getGeolocation', function(){
    getLocation();
}); */

//map page
var y;
var mapLatitude;
var mapLongitude;
var myLatlng;

function getMapLocation() {
	y = document.getElementById("map-canvas");
    if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(showMapPosition);
    } else {
        y.innerHTML = "Geolocation is not supported by this browser.";
    }
}
function showMapPosition(position) {
	console.log("showMapPosition");
    mapLatitude = position.coords.latitude;
    mapLongitude = position.coords.longitude;
    myLatlng = new google.maps.LatLng(mapLatitude,mapLongitude);
    getMap();
}


var map;
function getMap() {
	console.log("getMap");
  var mapOptions = {
    zoom: 16,
    center: new google.maps.LatLng(mapLatitude, mapLongitude)
  };
  map = new google.maps.Map(document.getElementById('map-canvas'),
      mapOptions);

	var marker = new google.maps.Marker({
	    position: myLatlng,
	    map: map,
	    title:"You are here!"
	});
}

$( document ).on( "click", "#getGeolocation", function( event ) {
  getMapLocation();
}); 
//aaa

//wyswietlanie
//var directionsDisplay=[];
//var directionsMap=[];
var z = document.getElementById("directions-canvas");
var z1 = document.getElementById("directions-canvas1");
var z2 = document.getElementById("directions-canvas2");
var z3 = document.getElementById("directions-canvas3");
var z4 = document.getElementById("directions-canvas4");
var z5 = document.getElementById("directions-canvas5");
var z6 = document.getElementById("directions-canvas6");
var z7 = document.getElementById("directions-canvas7");
var z8 = document.getElementById("directions-canvas8");

var start =[];
var ends =[];
var markers_all = [];


$( document ).on( "click", "#getGeolocation", function( event ) {
		$("#choose_Your_Training_Button").prop('disabled', false);
		getDirectionsLocation();
		getDirectionsLocation1();
		getDirectionsLocation2();
		getDirectionsLocation3(); 
		getDirectionsLocation4(); 
	    getDirectionsLocation5(); 
		getDirectionsLocation6(); 
		getDirectionsLocation7(); 
		getDirectionsLocation8(); 
});


function getDirectionsLocation() {
	//console.log("getDirectionsLocation");
    if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(showDirectionsPosition);
    } else {
        z.innerHTML = "Geolocation is not supported by this browser.";
    }
}
function showDirectionsPosition(position) {
 	//console.log("showDirectionsPosition");
    directionsLatitude = position.coords.latitude;
    directionsLongitude = position.coords.longitude;
    directionsLatLng = new google.maps.LatLng(directionsLatitude,directionsLongitude);
    getDirections();
}

 function getDirections() {
//	 wyswietlanie
 // directionsDisplay[1] = new google.maps.DirectionsRenderer();
  var directionsOptions = {
    zoom:10,
    center: start[1]
  }
  //OD KOMENTUJ BY MAPA DZIAŁAŁA
 // directionsMap[1] = new google.maps.Map(document.getElementById("directions-canvas"), directionsOptions);
 // directionsDisplay[1].setMap(directionsMap[1]);
calcRoute();
  
}

function calcRoute() {
	var locationID, sfl, distanceID, durationID, dt, dr, nameID, name_Location;
	var z_loc = 1;
		var directionsService = new google.maps.DirectionsService();
		var service = new google.maps.DistanceMatrixService;
		locationID	="sfl" + z_loc +"ID";
       	sfl = document.getElementById(locationID).value;
       	nameID ="name" + z_loc +"ID";
       	name_Location= document.getElementById(nameID).value;
     	distanceID = "distance"+z_loc+"ID";
	    durationID = "duration"+z_loc+"ID";
	start[z_loc] = directionsLatLng;
	ends[z_loc] = sfl;
	var request = {
		origin : start[z_loc],
		destination : ends[z_loc],
		travelMode : google.maps.TravelMode.BICYCLING
	};
	directionsService.route(request, function(result, status) {
		if (status == google.maps.DirectionsStatus.OK) {
			//wyswietlanie
		//	directionsDisplay[z_loc].setDirections(result);
			service.getDistanceMatrix({
				  origins: [start[z_loc]],
				  destinations: [ends[z_loc]],
				  travelMode: 'BICYCLING',
				  unitSystem: google.maps.UnitSystem.METRIC
				}, function(response, status) {
			          if (status === 'OK') {
			        	  var originList = response.originAddresses;
			              var destinationList = response.destinationAddresses;
						
			              for (var i = 0; i < originList.length; i++) {
			                  var results = response.rows[i].elements;
			                  for (var j = 0; j < results.length; j++) {
			                  var element = results[j];
			                  dt = element.distance.text;
			                  dr = element.duration.text;
					          document.getElementById(distanceID).innerHTML = dt;
				              document.getElementById(durationID).innerHTML = dr;
				          	  markers_all[z_loc] = [sfl,dt,dr,name_Location];
			                  console.log(markers_all[z_loc][0]+ " " +markers_all[z_loc][1]+ " " +markers_all[z_loc][2] + " " +markers_all[z_loc][3]);
			                  }
			                }
			            } 
				});
	}
});
}

function getDirectionsLocation1() {
//	console.log("getDirectionsLocation1");
    if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(showDirectionsPosition1);
    } else {
        z1.innerHTML = "Geolocation is not supported by this browser.";
    }
}
function showDirectionsPosition1(position1) {
 //	console.log("showDirectionsPosition1");
    directionsLatitude1 = position1.coords.latitude;
    directionsLongitude1 = position1.coords.longitude;
    directionsLatLng1 = new google.maps.LatLng(directionsLatitude1,directionsLongitude1);
    getDirections1();
}

function getDirections1() {
	//console.log('getDirections1');
	
//	 wyswietlanie
	// directionsDisplay[2] = new google.maps.DirectionsRenderer();
 // start = new google.maps.LatLng(directionsLatLng);
  var directionsOptions = {
    zoom:10,
    center: start[2]
  }
  //OD KOMENTUJ BY MAPA DZIAŁAŁA
 // directionsMap[2] = new google.maps.Map(document.getElementById("directions-canvas1"), directionsOptions);
 // directionsDisplay[2].setMap(directionsMap[2]);
calcRoute1();
}

function calcRoute1() {
	var locationID, sfl, distanceID, durationID, dt, dr, nameID, name_Location;
	var z_loc = 2;
	//var z_back = 8;
		var directionsService = new google.maps.DirectionsService();
		var service = new google.maps.DistanceMatrixService;
		locationID	="sfl" + z_loc +"ID";
       	sfl = document.getElementById(locationID).value;
       	nameID ="name" + z_loc +"ID";
       	name_Location= document.getElementById(nameID).value;
     	distanceID = "distance"+z_loc+"ID";
	    durationID = "duration"+z_loc+"ID";
	start[z_loc] = directionsLatLng1;
	ends[z_loc] = sfl;
	var request = {
		origin : start[z_loc],
		destination : ends[z_loc],
		travelMode : google.maps.TravelMode.BICYCLING
	};
	directionsService.route(request, function(result, status) {
		if (status == google.maps.DirectionsStatus.OK) {
//			 wyswietlanie
			//directionsDisplay[z_loc].setDirections(result);
			service.getDistanceMatrix({
				  origins: [start[z_loc]],
				  destinations: [ends[z_loc]],
				  travelMode: 'BICYCLING',
				  unitSystem: google.maps.UnitSystem.METRIC
				}, function(response, status) {
			          if (status === 'OK') {
			        	  var originList = response.originAddresses;
			              var destinationList = response.destinationAddresses;
						
			              for (var i = 0; i < originList.length; i++) {
			                  var results = response.rows[i].elements;
			                  for (var j = 0; j < results.length; j++) {
			                  var element = results[j];
			                  dt = element.distance.text;
			                  dr = element.duration.text;
					          document.getElementById(distanceID).innerHTML = dt;
				              document.getElementById(durationID).innerHTML = dr;
				              markers_all[z_loc] = [sfl,dt,dr,name_Location];
			                  }
			                }
			            } 
				});
	}
});
}
	

function getDirectionsLocation2() {
	//console.log("getDirectionsLocation2");
    if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(showDirectionsPosition2);
    } else {
        z2.innerHTML = "Geolocation is not supported by this browser.";
    }
}
function showDirectionsPosition2(position2) {
 	//console.log("showDirectionsPosition2");
    directionsLatitude2 = position2.coords.latitude;
    directionsLongitude2 = position2.coords.longitude;
    directionsLatLng2 = new google.maps.LatLng(directionsLatitude2,directionsLongitude2);
    getDirections2();
}

function getDirections2() {
  var directionsOptions = {
    zoom:10,
    center: start[3]
  }
calcRoute2();
}

function calcRoute2() {
	var locationID, sfl, distanceID, durationID, dt, dr, nameID, name_Location;
	var z_loc = 3;;
		var directionsService = new google.maps.DirectionsService();
		var service = new google.maps.DistanceMatrixService;
		locationID	="sfl" + z_loc +"ID";
       	sfl = document.getElementById(locationID).value;
       	nameID ="name" + z_loc +"ID";
       	name_Location= document.getElementById(nameID).value;
     	distanceID = "distance"+z_loc+"ID";
	    durationID = "duration"+z_loc+"ID";
	start[z_loc] = directionsLatLng2;
	ends[z_loc] = sfl;
	var request = {
		origin : start[z_loc],
		destination : ends[z_loc],
		travelMode : google.maps.TravelMode.BICYCLING
	};
	directionsService.route(request, function(result, status) {
		if (status == google.maps.DirectionsStatus.OK) {
			service.getDistanceMatrix({
				  origins: [start[z_loc]],
				  destinations: [ends[z_loc]],
				  travelMode: 'BICYCLING',
				  unitSystem: google.maps.UnitSystem.METRIC
				}, function(response, status) {
			          if (status === 'OK') {
			        	  var originList = response.originAddresses;
			              var destinationList = response.destinationAddresses;
						
			              for (var i = 0; i < originList.length; i++) {
			                  var results = response.rows[i].elements;
			                  for (var j = 0; j < results.length; j++) {
			                  var element = results[j];
			                  dt = element.distance.text;
			                  dr = element.duration.text;
					          document.getElementById(distanceID).innerHTML = dt;
					          document.getElementById(durationID).innerHTML = dr;
					          markers_all[z_loc] = [sfl,dt,dr,name_Location];
			                  }
			                }
			            } 
				});
	}
});
}




function getDirectionsLocation3() {
    if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(showDirectionsPosition3);
    } else {
        z3.innerHTML = "Geolocation is not supported by this browser.";
    }
}
function showDirectionsPosition3(position3) {
    directionsLatitude3 = position3.coords.latitude;
    directionsLongitude3 = position3.coords.longitude;
    directionsLatLng3 = new google.maps.LatLng(directionsLatitude3,directionsLongitude3);
    getDirections3();
}
function getDirections3() {
  var directionsOptions = {
    zoom:10,
    center: start[4]
  }
calcRoute3();
}
function calcRoute3() {
	
	var locationID, sfl, distanceID, durationID, dt, dr, nameID, name_Location;
	var z_loc = 4;
		var directionsService = new google.maps.DirectionsService();
		var service = new google.maps.DistanceMatrixService;
		locationID	="sfl" + z_loc +"ID";
       	sfl = document.getElementById(locationID).value;
       	nameID ="name" + z_loc +"ID";
       	name_Location= document.getElementById(nameID).value;
     	distanceID = "distance"+z_loc+"ID";
	    durationID = "duration"+z_loc+"ID";
	start[z_loc] = directionsLatLng3;
	ends[z_loc] = sfl;
	var request = {
		origin : start[z_loc],
		destination : ends[z_loc],
		travelMode : google.maps.TravelMode.BICYCLING
	};
	directionsService.route(request, function(result, status) {
		if (status == google.maps.DirectionsStatus.OK) {
			service.getDistanceMatrix({
				  origins: [start[z_loc]],
				  destinations: [ends[z_loc]],
				  travelMode: 'BICYCLING',
				  unitSystem: google.maps.UnitSystem.METRIC
				}, function(response, status) {
			          if (status === 'OK') {
			        	  var originList = response.originAddresses;
			              var destinationList = response.destinationAddresses;
						
			              for (var i = 0; i < originList.length; i++) {
			                  var results = response.rows[i].elements;
			                  for (var j = 0; j < results.length; j++) {
			                  var element = results[j];
			                  dt = element.distance.text;
			                  dr = element.duration.text;
					          document.getElementById(distanceID).innerHTML = dt;
				              document.getElementById(durationID).innerHTML = dr;
				              markers_all[z_loc] = [sfl,dt,dr,name_Location];
			                  }
			                }
			            } 
				});
	}
});
}


function getDirectionsLocation4() {
    if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(showDirectionsPosition4);
    } else {
        z4.innerHTML = "Geolocation is not supported by this browser.";
    }
}
function showDirectionsPosition4(position4) {
    directionsLatitude4 = position4.coords.latitude;
    directionsLongitude4 = position4.coords.longitude;
    directionsLatLng4 = new google.maps.LatLng(directionsLatitude4,directionsLongitude4);
    getDirections4();
}
function getDirections4() {
  var directionsOptions = {
    zoom:10,
    center: start[5]
  }
calcRoute4();
}
function calcRoute4() {
	var locationID, sfl, distanceID, durationID, dt, dr, nameID, name_Location;
	var z_loc = 5;
		var directionsService = new google.maps.DirectionsService();
		var service = new google.maps.DistanceMatrixService;
		locationID	="sfl" + z_loc +"ID";
       	sfl = document.getElementById(locationID).value;
       	nameID ="name" + z_loc +"ID";
       	name_Location= document.getElementById(nameID).value;
     	distanceID = "distance"+z_loc+"ID";
	    durationID = "duration"+z_loc+"ID";
	start[z_loc] = directionsLatLng4;
	ends[z_loc] = sfl;
	var request = {
		origin : start[z_loc],
		destination : ends[z_loc],
		travelMode : google.maps.TravelMode.BICYCLING
	};
	directionsService.route(request, function(result, status) {
		if (status == google.maps.DirectionsStatus.OK) {
			service.getDistanceMatrix({
				  origins: [start[z_loc]],
				  destinations: [ends[z_loc]],
				  travelMode: 'BICYCLING',
				  unitSystem: google.maps.UnitSystem.METRIC
				}, function(response, status) {
			          if (status === 'OK') {
			        	  var originList = response.originAddresses;
			              var destinationList = response.destinationAddresses;
						
			              for (var i = 0; i < originList.length; i++) {
			                  var results = response.rows[i].elements;
			                  for (var j = 0; j < results.length; j++) {
			                  var element = results[j];
			                  dt = element.distance.text;
			                  dr = element.duration.text;
					          document.getElementById(distanceID).innerHTML = dt;
				              document.getElementById(durationID).innerHTML = dr;
				              markers_all[z_loc] = [sfl,dt,dr,name_Location];
			                  }
			                }
			            } 
				});
	}
});
}


function getDirectionsLocation5() {
    if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(showDirectionsPosition5);
    } else {
        z5.innerHTML = "Geolocation is not supported by this browser.";
    }
}
function showDirectionsPosition5(position5) {
    directionsLatitude5 = position5.coords.latitude;
    directionsLongitude5 = position5.coords.longitude;
    directionsLatLng5 = new google.maps.LatLng(directionsLatitude5,directionsLongitude5);
    getDirections5();
}
function getDirections5() {
  var directionsOptions = {
    zoom:10,
    center: start[6]
  }
calcRoute5();
}
function calcRoute5() {
	var locationID, sfl, distanceID, durationID, dt, dr, nameID, name_Location;
	var z_loc = 6;
		var directionsService = new google.maps.DirectionsService();
		var service = new google.maps.DistanceMatrixService;
		locationID	="sfl" + z_loc +"ID";
       	sfl = document.getElementById(locationID).value;
       	nameID ="name" + z_loc +"ID";
       	name_Location= document.getElementById(nameID).value;
     	distanceID = "distance"+z_loc+"ID";
	    durationID = "duration"+z_loc+"ID";
	start[z_loc] = directionsLatLng5;
	ends[z_loc] = sfl;
	var request = {
		origin : start[z_loc],
		destination : ends[z_loc],
		travelMode : google.maps.TravelMode.BICYCLING
	};
	directionsService.route(request, function(result, status) {
		if (status == google.maps.DirectionsStatus.OK) {
			service.getDistanceMatrix({
				  origins: [start[z_loc]],
				  destinations: [ends[z_loc]],
				  travelMode: 'BICYCLING',
				  unitSystem: google.maps.UnitSystem.METRIC
				}, function(response, status) {
			          if (status === 'OK') {
			        	  var originList = response.originAddresses;
			              var destinationList = response.destinationAddresses;
						
			              for (var i = 0; i < originList.length; i++) {
			                  var results = response.rows[i].elements;
			                  for (var j = 0; j < results.length; j++) {
			                  var element = results[j];
			                  dt = element.distance.text;
			                  dr = element.duration.text;
					          document.getElementById(distanceID).innerHTML = dt;
				              document.getElementById(durationID).innerHTML = dr;
				              markers_all[z_loc] = [sfl,dt,dr,name_Location];
			                  }
			                }
			            } 
				});
	}
});
}



function getDirectionsLocation6() {
    if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(showDirectionsPosition6);
    } else {
        z6.innerHTML = "Geolocation is not supported by this browser.";
    }
}
function showDirectionsPosition6(position6) {
    directionsLatitude6 = position6.coords.latitude;
    directionsLongitude6 = position6.coords.longitude;
    directionsLatLng6 = new google.maps.LatLng(directionsLatitude6,directionsLongitude6);
    getDirections6();
}
function getDirections6() {
  var directionsOptions = {
    zoom:10,
    center: start[7]
  }
calcRoute6();
}
function calcRoute6() {
	var locationID, sfl, distanceID, durationID, dt, dr, nameID, name_Location;
	var z_loc = 7;
		var directionsService = new google.maps.DirectionsService();
		var service = new google.maps.DistanceMatrixService;
		locationID	="sfl" + z_loc +"ID";
       	sfl = document.getElementById(locationID).value;
       	nameID ="name" + z_loc +"ID";
       	name_Location= document.getElementById(nameID).value;
     	distanceID = "distance"+z_loc+"ID";
	    durationID = "duration"+z_loc+"ID";
	start[z_loc] = directionsLatLng6;
	ends[z_loc] = sfl;
	var request = {
		origin : start[z_loc],
		destination : ends[z_loc],
		travelMode : google.maps.TravelMode.BICYCLING
	};
	directionsService.route(request, function(result, status) {
		if (status == google.maps.DirectionsStatus.OK) {
			service.getDistanceMatrix({
				  origins: [start[z_loc]],
				  destinations: [ends[z_loc]],
				  travelMode: 'BICYCLING',
				  unitSystem: google.maps.UnitSystem.METRIC
				}, function(response, status) {
			          if (status === 'OK') {
			        	  var originList = response.originAddresses;
			              var destinationList = response.destinationAddresses;
						
			              for (var i = 0; i < originList.length; i++) {
			                  var results = response.rows[i].elements;
			                  for (var j = 0; j < results.length; j++) {
			                  var element = results[j];
			                  dt = element.distance.text;
			                  dr = element.duration.text;
					          document.getElementById(distanceID).innerHTML = dt;
				              document.getElementById(durationID).innerHTML = dr;
				              markers_all[z_loc] = [sfl,dt,dr,name_Location];
			                  }
			                }
			            } 
				});
	}
});
}



function getDirectionsLocation7() {
    if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(showDirectionsPosition7);
    } else {
        z.innerHTML = "Geolocation is not supported by this browser.";
    }
}
function showDirectionsPosition7(position7) {
    directionsLatitude7 = position7.coords.latitude;
    directionsLongitude7 = position7.coords.longitude;
    directionsLatLng7 = new google.maps.LatLng(directionsLatitude7,directionsLongitude7);
    getDirections7();
}
function getDirections7() {
  var directionsOptions = {
    zoom:10,
    center: start[8]
  }
calcRoute7();
}

function calcRoute7() {
	var locationID, sfl, distanceID, durationID, dt, dr, nameID, name_Location;
	var z_loc = 8;
		var directionsService = new google.maps.DirectionsService();
		var service = new google.maps.DistanceMatrixService;
		locationID	="sfl" + z_loc +"ID";
       	sfl = document.getElementById(locationID).value;
       	nameID ="name" + z_loc +"ID";
       	name_Location= document.getElementById(nameID).value;
     	distanceID = "distance"+z_loc+"ID";
	    durationID = "duration"+z_loc+"ID";
	start[z_loc] = directionsLatLng7;
	ends[z_loc] = sfl;
	var request = {
		origin : start[z_loc],
		destination : ends[z_loc],
		travelMode : google.maps.TravelMode.BICYCLING
	};
	directionsService.route(request, function(result, status) {
		if (status == google.maps.DirectionsStatus.OK) {
			service.getDistanceMatrix({
				  origins: [start[z_loc]],
				  destinations: [ends[z_loc]],
				  travelMode: 'BICYCLING',
				  unitSystem: google.maps.UnitSystem.METRIC
				}, function(response, status) {
			          if (status === 'OK') {
			        	  var originList = response.originAddresses;
			              var destinationList = response.destinationAddresses;
						
			              for (var i = 0; i < originList.length; i++) {
			                  var results = response.rows[i].elements;
			                  for (var j = 0; j < results.length; j++) {
			                  var element = results[j];
			                  dt = element.distance.text;
			                  dr = element.duration.text;
					          document.getElementById(distanceID).innerHTML = dt;
				              document.getElementById(durationID).innerHTML = dr;
				              markers_all[z_loc] = [sfl,dt,dr,name_Location];
			                  }
			                }
			            } 
				});
	}
});
}


function getDirectionsLocation8() {
    if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(showDirectionsPosition8);
    } else {
        z.innerHTML = "Geolocation is not supported by this browser.";
    }
}
function showDirectionsPosition8(position8) {
    directionsLatitude8 = position8.coords.latitude;
    directionsLongitude8 = position8.coords.longitude;
    directionsLatLng8 = new google.maps.LatLng(directionsLatitude8,directionsLongitude8);
    getDirections8();
}
function getDirections8() {
  var directionsOptions = {
    zoom:10,
    center: start[9]
  }
calcRoute8();
}
function calcRoute8() {
	var locationID, sfl, distanceID, durationID, dt, dr, nameID, name_Location;
	var z_loc = 9;
		var directionsService = new google.maps.DirectionsService();
		var service = new google.maps.DistanceMatrixService;
		locationID	="sfl" + z_loc +"ID";
       	sfl = document.getElementById(locationID).value;
       	nameID ="name" + z_loc +"ID";
       	name_Location= document.getElementById(nameID).value;
       	distanceID = "distance"+z_loc+"ID";
	    durationID = "duration"+z_loc+"ID";
	start[z_loc] = directionsLatLng8;
	ends[z_loc] = sfl;
	var request = {
		origin : start[z_loc],
		destination : ends[z_loc],
		travelMode : google.maps.TravelMode.BICYCLING
	};
	directionsService.route(request, function(result, status) {
		if (status == google.maps.DirectionsStatus.OK) {
			service.getDistanceMatrix({
				  origins: [start[z_loc]],
				  destinations: [ends[z_loc]],
				  travelMode: 'BICYCLING',
				  unitSystem: google.maps.UnitSystem.METRIC
				}, function(response, status) {
			          if (status === 'OK') {
			        	  var originList = response.originAddresses;
			              var destinationList = response.destinationAddresses;
						
			              for (var i = 0; i < originList.length; i++) {
			                  var results = response.rows[i].elements;
			                  for (var j = 0; j < results.length; j++) {
			                  var element = results[j];
			                  dt = element.distance.text;
			                  dr = element.duration.text;
					          document.getElementById(distanceID).innerHTML = dt;
				              document.getElementById(durationID).innerHTML = dr;
				              markers_all[z_loc] = [sfl,dt,dr,name_Location];
			                  }
			                }
			            } 
				});
	}
});
}







/*function calcRoute() {
		var directionsService = new google.maps.DirectionsService();
		var service = new google.maps.DistanceMatrixService;
		var sfl = document.getElementById("sfl2ID").value;
		var iterator = document.getElementById("iteratorID").value;
		console.log("calcRoute");
		start = directionsLatLng;
		end = sfl;
		// end = "50.046032, 19.938671";
		//  console.log(location1.toString());
		//end = "50.061150, 19.911594";
		//  end = "Aleja 29-Go Listopada 39B, 31-425 Kraków";
		var request = {
			origin : start,
			destination : end,
			travelMode : google.maps.TravelMode.BICYCLING
		};
		directionsService.route(request, function(result, status) {
			if (status == google.maps.DirectionsStatus.OK) {
				//directionsDisplay.setDirections(result);
				
				service.getDistanceMatrix({
					  origins: [start],
					  destinations: [end],
					  travelMode: 'BICYCLING',
					  unitSystem: google.maps.UnitSystem.METRIC
					}, function(response, status) {
				          if (status === 'OK') {
				        	  var originList = response.originAddresses;
				              var destinationList = response.destinationAddresses;
				             // var outputDiv = document.getElementById('output');
				             // outputDiv.innerHTML = '';
				            //  deleteMarkers(markersArray);
				              
				              for (var i = 0; i < originList.length; i++) {
				                  var results = response.rows[i].elements;
				                //  geocoder.geocode({'address': originList[i]},
				                 //     showGeocodedAddressOnMap(false));
				                  for (var j = 0; j < results.length; j++) {
				                 //   geocoder.geocode({'address': destinationList[j]},
				                  //      showGeocodedAddressOnMap(true));
				                  //  outputDiv.innerHTML += originList[i] + ' to ' + destinationList[j] +
				                  //      ': ' + results[j].distance.text + ' in ' +
				                  //      results[j].duration.text + '<br>';
				                  var element = results[j];
				                  dt = element.distance.text;
				                  dr = element.duration.text;
				                  document.getElementById("distanceID").innerHTML = dt;
				                  document.getElementById("durationID").innerHTML = dr;
				                  console.log( dt + " " + dr);
				                  }
				                }
				            } 
					});
		}
	});
		}*/
/*

var service = new google.maps.DistanceMatrixService;
service.getDistanceMatrix({
  origins: [origin1, origin2],
  destinations: [destinationA, destinationB],
  travelMode: 'DRIVING',
  unitSystem: google.maps.UnitSystem.METRIC,
  avoidHighways: false,
  avoidTolls: false
}, function(response, status) {
  if (status !== 'OK') {
    alert('Error was: ' + status);
  } else {
    var originList = response.originAddresses;
    var destinationList = response.destinationAddresses;
    var outputDiv = document.getElementById('output');
    outputDiv.innerHTML = '';
    deleteMarkers(markersArray);

    var showGeocodedAddressOnMap = function(asDestination) {
      var icon = asDestination ? destinationIcon : originIcon;
      return function(results, status) {
        if (status === 'OK') {
          map.fitBounds(bounds.extend(results[0].geometry.location));
          markersArray.push(new google.maps.Marker({
            map: map,
            position: results[0].geometry.location,
            icon: icon
          }));
        } else {
          alert('Geocode was not successful due to: ' + status);
        }
      };
    };

    for (var i = 0; i < originList.length; i++) {
      var results = response.rows[i].elements;
      geocoder.geocode({'address': originList[i]},
          showGeocodedAddressOnMap(false));
      for (var j = 0; j < results.length; j++) {
        geocoder.geocode({'address': destinationList[j]},
            showGeocodedAddressOnMap(true));
        outputDiv.innerHTML += originList[i] + ' to ' + destinationList[j] +
            ': ' + results[j].distance.text + ' in ' +
            results[j].duration.text + '<br>';
      }
    }
  }
});
}
*/