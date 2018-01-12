<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import="java.io.*" %>
<jsp:include page="header_Main.jsp" />

<div class="container marketing">
		
			<br><br><br><br><br>
			<div class="panel-heading" id="logInID">
				<div class="panel-title text-center">
					<h1 class="title" >Log In:</h1>
				</div>
			</div>

			<div class="main-login main-center">
				<form class="form-horizontal" method="post" action="${pageContext.request.contextPath}/LogInServletPath">

					<div class="form-group">
						<label for="username" class="cols-sm-2 control-label">Login</label>
						<div class="cols-md-6">
							<div class="input-group">
								<span class="input-group-addon"><i class="fa fa-users fa"
									aria-hidden="true"></i></span> <input type="text" class="form-control"
									name="login" id="login" placeholder="Write your login"/>
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
									placeholder="Write your password." />
							</div>
						</div>
					</div>

					<div class="form-group ">
						<button type="submit" id="btn_loguj"
							class="btn btn-primary btn-lg btn-block login-button">Log In</button>
					</div>
					
					<%String blad =(String) request.getAttribute("blad"); %>
						<%if(blad!=null){ %>
						<div class="alert alert-danger"> 
						<%=blad %> 
						</div>
						<%} %>
					
					<div class="login-register">
						Don't you have account? <a href="/BHF/Main_Page/join_Now#singUpID">Sing Up!</a>
					</div>
					
				</form>
			</div>
		

		<hr class="featurette-divider">
</div>
<jsp:include page="footer_Main.jsp" />