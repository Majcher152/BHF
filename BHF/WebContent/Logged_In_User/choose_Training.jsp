<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<jsp:include page="header_User.jsp" />


<%
	String[] routes = request.getParameterValues("choose_Your_Training");
	String tmp = routes[0];
	String[] parts = tmp.split(",");
	String[][] markers = new String[parts.length][5];
	int a = 1, b = 0;
	//In case polish language
	/*markers[0][0] = parts[1];
	markers[0][1] = parts[2];
	markers[0][2] = parts[3].concat("." + parts[4]);
	markers[0][3] = parts[5];
	markers[0][4] = parts[6];
	for (int i = 7; i < parts.length; i++) {
		if (i % 6 == 0) {
			markers[a][b-1] = parts[i];
			b = 0;
			a++;
		}  else if (b == 3) {
			markers[a][b - 1] = markers[a][b - 1].concat("." + parts[i]);
			b++;
		}else if (b == 4) {
			markers[a][b - 1] = parts[i];
			b++;
		} else {
			markers[a][b] = parts[i];
			b++;
		}
	}*/

	markers[0][0] = parts[1];
	markers[0][1] = parts[2];
	markers[0][2] = parts[3];
	markers[0][3] = parts[4];
	markers[0][4] = parts[5];
	for (int i = 6; i < parts.length; i++) {
		if (i % 5 == 0) {
			markers[a][b] = parts[i];
			b = 0;
			a++;
		} else {
			markers[a][b] = parts[i];
			b++;
		}
	}
%>
<br>
<br>
<div class="container-fluid" id="cointer_intro-message">
	<div class="row justify-content-md-center">
		<div class="col-3 col-md-3">
			<h3>Please select your route</h3>
			<br>
		</div>
		<div class="w-100"></div>
		<div class="col-3 col-md-3 alert-success">
			<h5 id="green_Route">Green route - for the beginners</h5>
		</div>
		<div class="w-100"></div>
		<br>
		<div class="col-3 col-md-3 alert-primary">
			<h5 id="blue_Route">Blue route - for the intermediate</h5>
		</div>
		<div class="w-100"></div>
		<br>
		<div class="col-3 col-md-3 alert-danger">
			<h5 id="red_Route">Red route - for the advance cyclist</h5>
		</div>
		<div class="w-100"></div>
		<br>
	</div>
</div>
<br>
<br>
<table class="table table-hover table-striped table-condensed">
	<%
		for (int i = 0; i < a; i++) {
	%>


	<tr onClick="document.forms.direction<%=i%>.submit();" class="d-none"
		id="routes<%=i%>">
		<form method="post" action="/BHF/Logged_In_User/direction_Route.jsp"
			class="inline" name="direction<%=i%>">
			<td align="center"><%=markers[i][4]%></td>
			<td><input type="hidden" name="final_location"
				value="<%=markers[i][0]%> <%=markers[i][1]%>"> <input
				type="hidden" name="final_distance" value="<%=markers[i][2]%>">
				<input
				type="hidden" name="final_name" value="<%=markers[i][4]%>"></td>
			<td id="distance<%=i%>ID"><%=markers[i][2]%></td>
			<td id="duration<%=i%>ID"><%=markers[i][3]%></td>
		</form>
	</tr>
	<%
		}
	%>
</table>

<jsp:include page="routes_Colors.jsp" />


<jsp:include page="footer_User.jsp" />