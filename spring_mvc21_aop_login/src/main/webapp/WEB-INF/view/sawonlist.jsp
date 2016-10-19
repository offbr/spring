<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>직원 자료</h2>
<a href="index.jsp">홈</a>
<table border="1">
	<tr><th>사번</th><th>이름</th><th>직급</th><th>부서명</th></tr>
	<c:forEach var="s" items="${list}">
		<tr>
			<td>${s.sawon_no}</td>
			<td>${s.sawon_name}</td>
			<td>${s.sawon_jik}</td>
			<td>${s.buser_name}</td>
		</tr>
	</c:forEach>
</table>
</body>
</html>