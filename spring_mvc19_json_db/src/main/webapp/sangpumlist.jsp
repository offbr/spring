<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$("#showData").empty();
	$.ajax({
		type:"get",
		url:"sangpum",
		dataType:"json",
		success:function(sangpumData){
			var str = "<table border='1'>";
			str += "<tr><th>code</th><th>sang</th><th>su</th><th>dan</th></tr>";
			var list = sangpumData.datas;
			$(list).each(function(index, objArr){
				str += "<tr>";
				str += "<td>" + objArr["code"] + "</td>";
				str += "<td>" + objArr["sang"] + "</td>";
				str += "<td>" + objArr["su"] + "</td>";
				str += "<td>" + objArr["dan"] + "</td>";
				str += "</tr>";
			});
			str += "</table>";
			$("#showData").append(str);
		},
		error:function(){
			$("#showData").text("에러발생");
		}
	});
});
</script>
</head>
<body>
<h2> ** 상품자료 처리 결과 ** (Spring, Ajax)</h2>
<div id="showData">출력</div>
</body>
</html>