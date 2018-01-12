<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.sql.*"%>
<%@ page import="bhf.objects.User"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<sql:setDataSource var="snapshot" driver="org.sqlite.JDBC"
	url="jdbc:sqlite:G:/Programowanie/eclipse jee workspace 32bit/BHF/bhf.db" />
<sql:query dataSource="${snapshot}" var="result">
SELECT * FROM `markers`;
</sql:query>

<%
	User user =(User) session.getAttribute("user");
%>

<jsp:include page="header_User.jsp" />
<script src="/BHF/Logged_In_User/js/geolocation.js"></script>
<input type="hidden" id="iteratorID"
	value="<c:out value="${iterator}"/>">
<div class="container-fluid" id="cointer_intro-message">
	<div class="row justify-content-md-center">
		<br>
		<div class="col-5 col-md-5">
			<div data-role="page" id="homePage">
				<div class="panel-heading">
					<div id="geoLocation">
						<br>
						<h1 class="title">Check your posistion on the map!</h1>
					</div>

				</div>
			</div>
		</div>
		<div class="w-100"></div>
		<div class="col-2 col-md-2">
			<br>
			<button id="getGeolocation">Get geolocation!</button>
		</div>
	</div>
</div>
<br>
<br>
<br>
<div data-role="page" id="mapPage">
	<div role="main" class="ui-content">
		<div id="map-canvas">Please click "Get geolocation" button for
			getting started.</div>
	</div>
</div>

<form method="post" action="/BHF/Logged_In_User/choose_Training.jsp"
	class="inline">

	<div class="container-fluid" id="cointer_intro-message">
		<div class="row justify-content-md-center">
			<div class="col-12 col-md-12">
				<input type="hidden" id="choose_Your_Training"
					name="choose_Your_Training">
				<button type="submit" name="submit_param" value="submit_value"
					class="btn-lg btn-primary btn-block  link-button" id="choose_Your_Training_Button" disabled>Choose
					your training!</button>
			</div>
		</div>
	</div>
<br>

	<table class="table table-hover table-striped table-condensed">
		<c:set var="iterator" scope="session" value="${1}"></c:set>
		<c:forEach var="marker" items="${result.rows}">

			<input type="hidden" id="sfl<c:out value="${iterator}"/>ID"
				value="<c:out value="${marker.location}" />">
			<input type="hidden" id="name<c:out value="${iterator}"/>ID"
				value="<c:out value="${marker.name}" />">
				
			<tr class="d-none">
				<td><c:out value="${marker.location}" /></td>
				<td><c:out value="${marker.name}" /></td>
				<td id="distance<c:out value="${iterator}"/>ID"></td>
				<td id="duration<c:out value="${iterator}"/>ID"></td>
			</tr>

			<c:set var="iterator" scope="session" value="${iterator+1}"></c:set>

		</c:forEach>

	</table>
</form>

<script>
	
</script>





<jsp:include page="footer_User.jsp" />