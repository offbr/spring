<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function wformCheck(){
	var f = document.wform;
	if (f.title.value == "") {
		alert("제목을 입력하세요.");
		f.title.focus();
		return;
	}
	if (f.cont.value == "") {
		alert("내용을 입력하세요.");
		f.cont.focus();
		return;
	}
	if (f.pass.value == "") {
		alert("해당 게시글의 비밀번호를 등록하세요.");
		f.pass.focus();
		return;
	}
	
	if(confirm("정말 등록하시겠습니까?")){
		f.action = "boardwrite";
		f.submit();	
	}
}
</script>
</head>

<div class="container">
<body>
<%@ include file="../../../header.jsp" %>

<br><br><br><br><br>

<!-- 글쓰기 -->
<form method="post" name="wform">
<input type="hidden" name="num" value="${count}">
<input type="hidden" name="bip" value="<%=request.getRemoteAddr()%>">
<input type="hidden" name="gnum" value="${count}">
  
<div class="container">
<div class="panel panel-default table-responsive">
	
    <!-- Table -->
 	<table class="table table-sm" border="1">
 	
  		<tr>
    		<th style="width: 10%">제목</th><td colspan="3"><input type="text" name="title" value=""></td>
   		</tr>
   		<tr>
   			<th>작성자</th><td><input type="text" name="name" value=""></td>
   		</tr>
   		<tr>
   			<th>메일</th><td><input type="text" name="mail" value=""></td>
   		</tr>
   		<tr>
   		<th>비밀번호</th><td><input type="text" name="pass"></td>
   		</tr>
   		<tr>
   			<th rowspan="4">내용</th>
   			<td colspan="3" rowspan="4"><textarea rows="10" style="width: 100%; border: none;" name="cont"></textarea></td>
   		</tr>
	</table>	
 	<!-- //table -->
  
</div>
</div>
</form>
  
<!-- //게시판리스트 -->
<div class="container text-center">
<div class="btn-group btn-group-sm" role="group" aria-label="...">
        	<button type="button" onclick="javascript:wformCheck()" class="btn btn-default">등록완료</button>
        	<button type="button" onclick="javascript:history.back()" class="btn btn-default">돌아가기</button>
		</div>
</div>


</body>
</div>
</html>