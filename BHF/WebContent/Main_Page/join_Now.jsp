<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import="java.io.*" %>
<jsp:include page="header_Main.jsp" />
<jsp:include page="registration_Validation.jsp"/>
				
	<div class="container marketing">
			<br><br><br><br><br>
			<div class="panel-heading" id="singUpID">
				<div class="panel-title text-center">
					<h1 class="title" >Sign Up:</h1>
				</div>
			</div>
			<div class="main-login main-center">
				<form class="form-horizontal" method="post" action="${pageContext.request.contextPath}/SingUpServletPath">
					<div class="form-group ">
						<label for="name" class="cols-sm-2 control-label">Name</label>
						<div class="cols-sm-4">
							<div class="input-group">
								<span class="input-group-addon"><i class="fa fa-user fa"
									aria-hidden="true"></i></span> <input type="text" class="form-control"
									name="name" id="name" placeholder="Write your name." 
									data-toggle="popover" data-content="Name needs to be consists of 3 to 30 letters."/>
							</div>
						</div>	
					</div>
					<div class="form-group">
						<label for="name" class="cols-sm-2 control-label">Last name</label>
						<div class="cols-md-4">
							<div class="input-group">
								<span class="input-group-addon"><i class="fa fa-user fa"
									aria-hidden="true"></i></span> <input type="text" class="form-control"
									name="lastName" id="lastName"
									placeholder="Write your last name." 
									data-toggle="popover" data-content="Last name needs to be consists of 3 to 30 letters."/>
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
									placeholder="Write your e-mail." 
									data-toggle="popover" data-content="E-mail needs to be in format: example@example.com"/>
									<span class="glyphicon form-control-feedback"></span>
							</div>
						</div>
					</div>
					<div class="form-group">
						<label for="email" class="cols-sm-2 control-label">Phone number</label>
						<div class="cols-md-6">
							<div class="input-group">
								<span class="input-group-addon"><i class="fa fa-phone"
									aria-hidden="true"></i></span> <input type="text" class="form-control"
									name="phoneNumber" id="phoneNumber"
									placeholder="Write your phone number." 
									data-toggle="popover" data-content="Phone number needs to be consists of 9 digits."/>
									<span class="glyphicon form-control-feedback"></span>
							</div>
						</div>
					</div>
					<div class="form-group">
						<label for="username" class="cols-sm-2 control-label">Login</label>
						<div class="cols-md-6">
							<div class="input-group">
								<span class="input-group-addon"><i class="fa fa-users fa"
									aria-hidden="true"></i></span> <input type="text" class="form-control"
									name="login" id="login" placeholder="Write your login"
									data-toggle="popover" data-content="Login needs to be consists of 4 to 16 letters or digits."/>
									<span class="glyphicon form-control-feedback"></span>
							</div>
						</div>
					</div>
					<div class="form-group">
						<label for="password" class="cols-sm-2 control-label">Password</label>
						<div class="cols-md-6">
							<div class="input-group">
								<span class="input-group-addon"><i
									class="fa fa-lock fa-lg" aria-hidden="true"></i></span> <input
									type="password" class="form-control" name="password" id="password"
									placeholder="Write your password." 
									data-toggle="popover" data-content="Password needs to be consists of 8 to 18 characters and contains at least 1 small letter, 1 big letter and a digit."/>
									<span class="glyphicon form-control-feedback"></span>
							</div>
						</div>
					</div>
					<div class="form-group">
						<label for="confirm" class="cols-sm-2 control-label">Repeat password</label>
						<div class="cols-md-6">
							<div class="input-group">
								<span class="input-group-addon"><i
									class="fa fa-lock fa-lg" aria-hidden="true"></i></span> <input
									type="password" class="form-control" name="password2" id="password2"
									placeholder="Write again your password " 
									data-toggle="popover" data-content="Passwords need to be the same."/>
									<span class="glyphicon form-control-feedback"></span>
							</div>
						</div>
					</div>

					<div class="form-group ">
						<button type="submit" id="btn_loguj"
							class="btn btn-primary btn-lg btn-block login-button">Register</button>
					</div>
					
					<%
						String blad = (String) request.getAttribute("blad");
					%>
					<%
						if (blad != null && blad.equals("Register has been done successfully.")) {
					%>
					<div class="alert alert-success">
						<p style="text-align:center"><%=blad%></p>
					</div>
					<%
						}
					else if (blad != null && !blad.equals("")) { 
					%>
					<div class="alert alert-danger">
						<p style="text-align:center"><%=blad%></p>
					</div>
					<%
					}
					%>
					
					<div class="login-register">
						<a href="/BHF/Main_Page/log_In.jsp#logInID">Log In</a>
					</div>
				</form>
			</div>
		

		<hr class="featurette-divider">
</div>
<jsp:include page="footer_Main.jsp" />