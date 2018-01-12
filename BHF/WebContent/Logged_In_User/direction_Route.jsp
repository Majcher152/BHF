<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="bhf.objects.User"%>

<jsp:include page="header_User.jsp" />
<script src="/BHF/Logged_In_User/js/direction_Route.js"></script>
<%
	String final_location = request.getParameter("final_location");
    String final_name = request.getParameter("final_name");
	String final_distance = request.getParameter("final_distance");
	User user =(User) session.getAttribute("user");
%>

<br>
<input type="hidden" id="locationID" value="<%=final_location%>">

<div class="container-fluid" id="cointer_intro-message">
	<div class="row justify-content-md-center">
		<div class="col-3 col-md-3">
			<h3>Your training for today!</h3>
			<br>
		</div>
		<div class="w-100"></div>
	</div>
</div>

<div data-role="page" id="directionsPage">
	<div role="main" class="ui-content">
		<div id="directions-canvas">Map should load itself soon. If not
			please check if your browser allows HTML5.</div>
	</div>
</div>

<div class="container" id="cointer_intro-message">
	<div class="row justify-content-md-center">
		<div class="col-7 col-md-7" id="panel"></div>
	</div>
</div>
<br>


<form method="post"
	action="${pageContext.request.contextPath}/SaveTrainingServletPath"
	class="inline">
	<input type="hidden" name="final_name" id="final_name" value="<%=final_name%>">
	<input type="hidden" name="final_distance" id="final_distance" value="<%=final_distance%>">
	<input type="hidden" name="login" id="login" value="<%=user.getLogin()%>">

	<div class="container-fluid" id="cointer_intro-message">
		<div class="row justify-content-md-center">
			<div class="col-12 col-md-12">
				<button type="submit" name="submit_param" value="submit_value"
					class="btn-lg btn-primary btn-block  link-button"
					id="save_Training_Button">Save this training!</button>
			</div>
		</div>
	</div>
	<br>
</form>
<jsp:include page="footer_User.jsp" />