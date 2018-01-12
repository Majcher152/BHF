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
SELECT * FROM `users` WHERE login = '<%=user.getLogin()%>';
</sql:query>


<jsp:include page="header_User.jsp" />
<br>
<div class="container" id="cointer_intro-message">
	<div class="row justify-content-md-center">
		<div class="col-3 col-md-3">
			<h3>Your profile:</h3>
			<br>
		</div>


		<div class="w-100"></div>

		<c:forEach var="user" items="${result.rows}">
			<table class="table table-hover table-striped table-condensed">

				<tr>
					<td>Name:</td>
					<td><c:out value="${user.name}" /></td>
				</tr>
				<tr>
					<td>Last name:</td>
					<td><c:out value="${user.lastname}" /></td>
				</tr>
				<tr>
					<td>Login:</td>
					<td><c:out value="${user.login}" /></td>
				</tr>
				<tr>
					<td>Email:</td>
					<td><c:out value="${user.email}" /></td>
				</tr>
				<tr>
					<td>Phone number:</td>
					<td><c:out value="${user.phonenumber}" /></td>
				</tr>

			</table>
		</c:forEach>
	</div>
	<div class="form-group-last">
		<form method="post"
			action="/BHF/Logged_In_User/your_Profile_Edit.jsp"
			class="inline">
			<input type="hidden" name="email" value="${user.login} ">
			<button type="submit" id="buttonEdytuj"
				class="btn_rej btn-primary btn-sm col-sm-2  col-md-1 ">Edit</button>
		</form>
	</div>
</div>
<br>

<jsp:include page="footer_User.jsp" />