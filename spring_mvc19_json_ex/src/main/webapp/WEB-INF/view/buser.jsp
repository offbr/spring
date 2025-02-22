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
	$("#btn").on("click", buser);
});

function buser(){
	$("#buserData").empty();
	$("#buserData").append("<h2>" + $("#buser_name").val() + "</h2>");
	$.ajax({
		type:"post",
		url:"buserSearch",
		data:{"buser_name":$("#buser_name").val()},
		dataType:"json",
		success:function(buserLists){
			var str = "<table border='1'>";
			str += "<tr><th>부서</th><th>직원번호</th><th>직원명</th><th>부서전화</th><th>직급</th><th>관리고객</th></tr>";
			var list = buserLists.datas;
			$(list).each(function(index, objArr){
				str += "<tr>";
				str += "<td>" + objArr["buser_name"] + "</td>";
				str += "<td>" + objArr["sawon_no"] + "</td>";
				if(objArr["count"] > 0){
					str += "<td><a href='javascript:gogek(" + objArr["sawon_no"] + ")'>" + objArr["sawon_name"] + "</a></td>";
				}else{					
					str += "<td>" + objArr["sawon_name"] + "</td>";
				}
				str += "<td>" + objArr["buser_tel"] + "</td>";
				str += "<td>" + objArr["sawon_jik"] + "</td>";
				str += "<td>" + objArr["count"] + "</td>";
				str += "</tr>";
			});
			str += "</table>";
			$("#buserData").append(str);
		},
		error:function(){
			$("#buserData").text("에러발생");
		}
	});
}

function gogek(no){
	$("#gogekData").empty();
	var msg = "<hr><h2>관리고객 자료</h2>";
	$("#gogekData").append(msg);
	$.ajax({
		type:"get",
		url:"gogekList",
		data:{"sawon_no":no},
		dataType:"json",
		success:function(gogekLists){
			var str = "<table border='1'>";
			str += "<tr><th>고객번호</th><th>고객명</th><th>고객전화</th></tr>";
			var list = gogekLists.datas;
			$(list).each(function(index, objArr){
				str += "<tr>";
				str += "<td>" + objArr["gogek_no"] + "</td>";
				str += "<td title='" + objArr["gogek_jumin"] + "'>" + objArr["gogek_name"] + "</td>";
				str += "<td>" + objArr["gogek_tel"] + "</td>";
				str += "</tr>";
			});
			str += "</table>";
			$("#gogekData").append(str);
		},
		error:function(){
			$("#gogekData").text("에러발생");
		}
	});
}

</script>
</head>
<body>
	<h2>*Ajax*</h2>
	<a href="index.jsp"><button>HOME</button></a><br><br>
	<form action="buserSearch" method="post">
	부서명 : <input type="text" id="buser_name" name="buser_name">
	<input type="button" id="btn" value="확인">
	</form>
	<hr>
<div id="buserData"></div>
<div id="gogekData"></div>
</body>
</html>



