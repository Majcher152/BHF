<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="bhf.objects.User"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%
	User usero = (User) session.getAttribute("user");
%>
<sql:setDataSource var="snapshot" driver="org.sqlite.JDBC"
	url="jdbc:sqlite:C:/Users/Lukas/git1/BHF/BHF/bhf.db" />
<sql:query dataSource="${snapshot}" var="result">
SELECT * FROM `users` WHERE login = '<%=usero.getLogin()%>';
</sql:query>

<jsp:include page="header_User.jsp" />
<jsp:include page="validation_Edit.jsp"/>

<div class="container marketing">
	<div class="col-md-6 col-sm-offset-2 col-md-11 col-md-offset-1 main">
		<c:forEach var="user" items="${result.rows}">
			<h1 class="page-header">Edit</h1>
			<div
				class="form-group-first col-sm-6 col-sm-offset-4 col-md-8 col-md-offset-2">
				<%
					String blad = (String) request.getAttribute("blad");
				%>
				<%
					if (blad != null && !blad.equals("")) {
				%>
				<div class="alert alert-success">
					<p style="text-align: center"><%=blad%></p>
				</div>

				<%
					}
				%>
			</div>
			<%
				if (blad != null && !blad.equals("")) {
			%>
			<br>
			<%
				}
			%>
			<form action="${pageContext.request.contextPath}/EditInformationServletPath"
				method="post">
				<div class="container-fluid" id="cointer_intro-message">
					<div class="main-login main-center">

						<div class="form-group ">
							<label for="name" class="cols-sm-2 control-label">Name</label>
							<div class="cols-sm-4">
								<div class="input-group">
									<span class="input-group-addon"><i class="fa fa-user fa"
										aria-hidden="true"></i></span> <input type="text"
										class="form-control" name="name" id="name"
										value="<c:out value="${user.name}" />"
										placeholder="Write your name." data-toggle="popover"
										data-content="Name needs to be consists of 3 to 30 letters." />
								</div>
							</div>

							<div class="form-group">
								<label for="name" class="cols-sm-2 control-label">Last
									name</label>
								<div class="cols-md-4">
									<div class="input-group">
										<span class="input-group-addon"><i
											class="fa fa-user fa" aria-hidden="true"></i></span> <input
											type="text" class="form-control" name="lastName"
											id="lastName" value="<c:out value="${user.lastname}" />"
											placeholder="Write your last name." data-toggle="popover"
											data-content="Last name needs to be consists of 3 to 30 letters." />
									</div>
								</div>
							</div>

							<div class="form-group">
								<label for="email" class="cols-sm-2 control-label">E-mail</label>
								<div class="cols-md-4">
									<div class="input-group">
										<span class="input-group-addon"><i
											class="fa fa-envelope fa" aria-hidden="true"></i></span> <input
											type="text" class="form-control" name="email" id="email"
											value="<c:out value="${user.email}" />"
											placeholder="Write your e-mail." data-toggle="popover"
											data-content="E-mail needs to be in format: example@example.com" />
										<span class="glyphicon form-control-feedback"></span>
									</div>
								</div>
							</div>

							<div class="form-group">
								<label for="email" class="cols-sm-2 control-label">Phone
									number</label>
								<div class="cols-md-6">
									<div class="input-group">
										<span class="input-group-addon"><i class="fa fa-phone"
											aria-hidden="true"></i></span> <input type="text"
											class="form-control" name="phoneNumber" id="phoneNumber"
											value="<c:out value="${user.phonenumber}" />"
											placeholder="Write your phone number." data-toggle="popover"
											data-content="Phone number needs to be consists of 9 digits." />
										<span class="glyphicon form-control-feedback"></span>
									</div>
								</div>
							</div>

							<div class="form-group">
								<label for="username" class="cols-sm-2 control-label">Login</label>
								<div class="cols-md-6">
									<div class="input-group">
										<span class="input-group-addon"><i
											class="fa fa-users fa" aria-hidden="true"></i></span> <input
											type="text" class="form-control" name="login" id="login"
											value="<c:out value="${user.login}" />"
											placeholder="Write your login" data-toggle="popover"
											data-content="Login needs to be consists of 4 to 16 letters or digits." />
										<span class="glyphicon form-control-feedback"></span>
									</div>
								</div>
							</div>

						</div>
						<br>
						<div class="form-group-last">
							<button type="submit" id="btn_edytuj_dane"
								class="btn_rej btn-primary btn-sm col-sm-2  col-md-1 ">Save it</button>
						</div>
					</div>
				</div>
			</form>
		</c:forEach>


	</div>
</div>


<jsp:include page="footer_User.jsp" />