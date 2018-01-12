<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.io.*,java.sql.*"%>

<script>

$(document).ready(function() {
	
	$('#name').popover({
		container: 'body',
		trigger : 'focus',
		placement : 'right'
	});
	
	$('#lastName').popover({
		container: 'body',
		trigger : 'focus',
		placement : 'right'
	});
	
	$('#email').popover({
		container: 'body',
		trigger : 'focus',
		placement : 'right'
	});
	
	$('#phoneNumber').popover({
		container: 'body',
		trigger : 'focus',
		placement : 'right'
	});
	
	$('#login').popover({
		container: 'body',
		trigger : 'focus',
		placement : 'right'
	});
	
	$('#type').popover({
		container: 'body',
		trigger : 'focus',
		placement : 'right'
	});
	

	$(document).ready(function() {
		$('#name').addClass("alert-success");
		$('#name').parent().removeClass("has-error").addClass("has-success");
		
		$('#lastName').addClass("alert-success");
		$('#lastName').parent().removeClass("has-error").addClass("has-success");
		
		$('#email').addClass("alert-success");
		$('#email').parent().removeClass("has-error").addClass("has-success");
		
		$('#phoneNumber').addClass("alert-success");
		$('#phoneNumber').parent().removeClass("has-error").addClass("has-success");
		
		$('#login').addClass("alert-success");
		$('#login').parent().removeClass("has-error").addClass("has-success");	
});
	
	

	var warning = false;
	
	$('#btn_loguj').click(function(event){
		var name = $('#name');
		var lastName = $('#lastName');
		var email = $('#email');
		var phoneNumber = $('#phoneNumber');
		var login = $('#login');
		
		if(!(name.hasClass('alert-success') && lastName.hasClass('alert-success') && email.hasClass('alert-success') && phoneNumber.hasClass('alert-success') && login.hasClass('alert-success'))){
			event.preventDefault();
			if (warning == false) {
				$('<div class="alert alert-danger"> Fill everything correct!</div>').insertBefore(".login-register");
				warning = true;
			}
		}
});
	
	
	
	//Walidacja imienia
	$('#name').on('blur', function() {
		var input = $(this);
		var pattern = /^[a-zA-ZąęółżźćśńĘŹĆŻŁÓĄŚŃ-\s]{3,30}$/;
		var is_name = pattern.test(input.val());
		console.log(input.next());
		if(is_name){
			input.parent().removeClass("has-error").addClass("has-success");
			input.removeClass("alert-danger").addClass("alert-success");
		}
		else{
			input.parent().removeClass("has-success").addClass("has-error");
			input.removeClass("alert-success").addClass("alert-danger");
		}
	});
	
	//Walidacja nazwiska
	$('#lastName').on('blur', function() {
		var input = $(this);
		var pattern = /^[a-zA-ZąęółżźćśńĘŹĆŻŁÓĄŚŃ-]{3,30}$/;
		var is_name = pattern.test(input.val());
		
		if(is_name){
		//	input.next().removeClass("glyphicon-remove").addClass("glyphicon-ok");
			input.parent().removeClass("has-error").addClass("has-success");
			input.removeClass("alert-danger").addClass("alert-success");
		}
		else {
		//	input.next().removeClass("glyphicon-ok").addClass("glyphicon-remove");
			input.parent().removeClass("has-success").addClass("has-error");
			input.removeClass("alert-success").addClass("alert-danger");
		}
	});
		
	//Walidacja email
	$('#email').on('blur', function() {
		var input = $(this);
		var pattern = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
		var is_email = pattern.test(input.val());
		if(is_email){
		//	input.next().removeClass("glyphicon-remove").addClass("glyphicon-ok");
			input.parent().removeClass("has-error").addClass("has-success");
			input.removeClass("alert-danger").addClass("alert-success");
		}
		else{
		//	input.next().removeClass("glyphicon-ok").addClass("glyphicon-remove");
			input.parent().removeClass("has-success").addClass("has-error");
			input.removeClass("alert-success").addClass("alert-danger");
		}
	});	
	
	//Walidacja numeru telefonu
	$('#phoneNumber').on('blur', function() {
		var input = $(this);
		var pattern = /^[0-9]{9}$/;
		var is_email = pattern.test(input.val());
		if(is_email){
			//	input.next().removeClass("glyphicon-remove").addClass("glyphicon-ok");
			input.parent().removeClass("has-error").addClass("has-success");
			input.removeClass("alert-danger").addClass("alert-success");
		}
		else{
			//	input.next().removeClass("glyphicon-ok").addClass("glyphicon-remove");
			input.parent().removeClass("has-success").addClass("has-error");
			input.removeClass("alert-success").addClass("alert-danger");
		}
	});
	
	//Walidacja loginu
	$('#login').on('blur', function() {
		var input = $(this);
		var pattern = /^[a-z0-9]{4,16}$/;
		var is_email = pattern.test(input.val());
		if(is_email){
			//	input.next().removeClass("glyphicon-remove").addClass("glyphicon-ok");
			input.parent().removeClass("has-error").addClass("has-success");
			input.removeClass("alert-danger").addClass("alert-success");
		}
		else{
			//	input.next().removeClass("glyphicon-ok").addClass("glyphicon-remove");
			input.parent().removeClass("has-success").addClass("has-error");
			input.removeClass("alert-success").addClass("alert-danger");
		}
	});
	
});
</script>
