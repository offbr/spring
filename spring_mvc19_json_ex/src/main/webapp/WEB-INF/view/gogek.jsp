<!DOCTYPE html>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<html>
<head>
<meta charset="utf-8">
<title>Welcome</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$("#btn").on("click", view);
});

function view(){
	$("#showData").empty();
	$.ajax({
		type:"post",
		url:"gogekSearch",
		data:{"gogek_no":$("#gogek_no").val(), "gogek_name":$("#gogek_name").val()},
		dataType:"json",
		success:function(gogekLists){
			var str = "<table border='1'>";
			str += "<tr><th>직원명</th><th>직급</th><th>부서명</th><th>부서전화</th></tr>";
			var list = gogekLists.datas;
			$(list).each(function(index, objArr){
				str += "<tr>";
				str += "<td>" + objArr["sawon_name"] + "</td>";
				str += "<td>" + objArr["sawon_jik"] + "</td>";
				str += "<td>" + objArr["buser_name"] + "</td>";
				str += "<td>" + objArr["buser_tel"] + "</td>";
				str += "</tr>";
			});
			str += "</table>";
			$("#showData").append(str);
		},
		error:function(){
			$("#showData").text("에러발생");
		}
	});
}

</script>
</head>
<body>
	<h2>*Ajax*</h2>
	<a href="index.jsp"><button>HOME</button></a><br><br>
	<form action="gogekSearch" method="post">
	고객번호 : <input type="text" size="5" id="gogek_no" name="gogek_no">
	고객명 : <input type="text" id="gogek_name" name="gogek_name">
	<input type="button" id="btn" value="확인">
	</form>
	<hr>
<div id="showData"></div>
</body>
</html>



