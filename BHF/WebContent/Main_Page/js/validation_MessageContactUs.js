//Legend for Contats us Message 

$(document).ready(function(){
	$('#name').popover({
		container: 'body',
		trigger : 'focus',
		placement : 'left'
	});
	
	$('#email').popover({
		container: 'body',
		trigger : 'focus',
		placement : 'left'
	});
	
	$('#phone').popover({
		container: 'body',
		trigger : 'focus',
		placement : 'left'
	});
	
	$('#message').popover({
		container: 'body',
		trigger : 'focus',
		placement : 'right'
	});
});