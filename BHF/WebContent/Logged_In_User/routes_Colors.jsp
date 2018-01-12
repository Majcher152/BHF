<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.io.*,java.sql.*"%>

<script>

$(document).ready(function() {
	var distance_all = [];
	var name_tmp_distance, name_tmp_route;
	for (var i = 0; i < 9; i++) {
		name_tmp_distance = "distance" + i +"ID";
		name_tmp_route = "#routes" +i;
		distance_all[i] =document.getElementById(name_tmp_distance).innerText;
		distance_all[i]= distance_all[i].substring(0, (distance_all[i].length -2));
		if(distance_all[i] < 4){
		$(name_tmp_route).removeClass("d-none").addClass("table-success");
		} else if (distance_all[i] < 7){
		$(name_tmp_route).removeClass("d-none").addClass("table-primary");
		}else if (distance_all[i] < 10){
		$(name_tmp_route).removeClass("d-none").addClass("table-danger");
		}else {
		$(name_tmp_route).addClass("table-active");
		}
	}
});
</script>