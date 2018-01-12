$( document ).on( "click", "#choose_Your_Training_Button", function( event ) {

	for (var j = 1; j < 10; j++) {
	console.log(markers_all[j][0] + " " +markers_all[j][1] + " " +markers_all[j][2] + " "+markers_all[j][3] + " ");
	}
	
	 document.getElementById("choose_Your_Training").value=markers_all;
   //  document.getElementById("playerNames").submit();
});
