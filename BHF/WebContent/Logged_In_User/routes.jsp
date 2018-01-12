<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="bhf.objects.User"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<%
	User user = (User) session.getAttribute("user");
%>
<sql:setDataSource var="snapshot" driver="org.sqlite.JDBC"
	url="jdbc:sqlite:G:/Programowanie/eclipse jee workspace 32bit/BHF/bhf.db" />
<sql:query dataSource="${snapshot}" var="result">
SELECT * FROM `trainings` WHERE userid =( SELECT id FROM users WHERE login = '<%=user.getLogin()%>');
</sql:query>


<jsp:include page="header_User.jsp" />
<br>
<div class="container" id="cointer_intro-message">
	<div class="row justify-content-md-center">
		<div class="col-3 col-md-3">
			<h3>Your progress:</h3>
			<br>
		</div>


		<div class="w-100"></div>
		<table class="table table-hover table-striped table-condensed">
			<c:set var="iterator" scope="session" value="${1}"></c:set>
			<c:forEach var="training" items="${result.rows}">
				<tr>
					<td><c:out value="${iterator}" /></td>
					<td><c:out value="${training.name}" /></td>
					<td><c:out value="${training.type}" /></td>
					<td><c:out value="${training.distance}" /></td>
				</tr>
				<c:set var="iterator" scope="session" value="${iterator+1}"></c:set>
			</c:forEach>
		</table>
	</div>

</div>
<jsp:include page="footer_User.jsp" />