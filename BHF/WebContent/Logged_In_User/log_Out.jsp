<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<jsp:include page="header_User.jsp" />
<br>
<div class="container" id="cointer_intro-message">
	<div class="row justify-content-md-center">
		<div class="col-6 col-md-6">
			<h3>Do you really want to log out?</h3>
			<br>
		</div>
		<div class="w-100"></div>



		<div class="col-6 col-md-6">
			<form class="form-horizontal" method="post"
				action="${pageContext.request.contextPath}/LogOutServletPath">
				<button type="submit" id="buttonlogout"
					class="btn_rej btn-danger btn-sm col-sm-12 col-md-12 ">Log
					Out</button>
			</form>
		</div>
	</div>
</div>
<br>



<jsp:include page="footer_User.jsp" />