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

function getPassword(num, mode) {
	var f = document.passFrm;
	$('#pass').focus();
	$('#myModal').modal('show');
	f.action = mode;
}

function checkPwdFrm() {
	var f = document.passFrm;
	if (f.pass.value == "") {
		alert("비밀번호를 입력해 주세요.");
		f.pass.focus();
		return;
	}
	if(f.action.value == 'delete'){
		if(confirm("정말 수정하시겠습니까?")){
			f.submit();
			return;
		}else{
			return;
		}
	}
	
	f.submit();	
}

function closePwd() {
	$('#myModal').modal('hide');
}

function boardReply() {
	document.passFrm.action = "boardrewrite";
	document.passFrm.submit();
}
</script>
<style>
th {
	font-weight: bold;	
}
td {
	font-family: 'Abel', sans-serif;
}

</style>

</head>
<div class="container">
<body>

<%@ include file="../../../header.jsp" %>

<br><br><br><br><br>

<c:if test="${param.no == 1}">
<script>
	alert("비밀번호를 다시 확인해주세요");
</script>
</c:if>


<div class="container">
<div class="panel panel-default table-responsive">

  <!-- Table -->
 	<table class="table table-sm" border="1">
  		<tr>
    		<th style="width: 100px">제목</th><td colspan="3">${dto.title}</td>
   		</tr>
   		<tr>
   			<th>작성자</th><td>${dto.name}</td> <th style="width: 100px">작성일</th><td>${fn:substring(dto.bdate, 0, 10)}</td>
   		</tr>
   		<tr>
   			<th>메일</th><td>${dto.mail}</td> <th style="width: 100px">ip</th><td>${dto.bip}</td>
   		</tr>
   		<tr>
   			<th rowspan="4">내용</th>
   			<td colspan="3" rowspan="4"><textarea rows="10" style="width: 100%; border: none;" readonly="readonly">${dto.cont}</textarea></td>
   		</tr>
	</table>
  <!-- //table -->
  
</div>
</div>
<!-- //게시판리스트 -->

<div class="container text-center">
<div class="btn-group btn-group-sm" role="group" aria-label="...">
        	<button type="button" onclick="javascript:getPassword(${dto.num}, 'boardupdate')" class="btn btn-default">수정</button>
        	<button type="button" onclick="javascript:getPassword(${dto.num}, 'boarddelete')" class="btn btn-default">삭제</button>
        	<button type="button" onclick="javascript:boardReply()" class="btn btn-default">답글</button>
        	<button type="button" onclick="javascript:history.back();" class="btn btn-default">돌아가기</button>
		</div>
</div>

<!-- 비밀번호 폼 -->
<!-- Modal -->
<div class="modal fade bs-example-modal-sm" id="myModal" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-sm">
    <div class="modal-content">

<div class="form-group text-center">
<form name="passFrm" id="passFrm"  method="get" class="form-inline">
	<input type="hidden" name="num" id="num" value="${dto.num}"/>
	<div class="modal-body">
		<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		<h4 class="modal-title" id="gridSystemModalLabel">비밀번호</h4>
		<label for="recipient-name" class="control-label">해당 게시글의 비밀번호를 입력해주세요</label>
            <input type="text" maxlength="20" name="pass" id="pass" class="form-control input-sm">
        <div class="btn-group btn-group-sm" role="group" aria-label="...">
        	<button type="button" onclick="javascript:closePwd();" class="btn btn-default" data-dismiss="modal">Close</button>
        	<button type="button" onclick="javascript:checkPwdFrm();" class="btn btn-default">OK</button>
		</div>
	</div>
</form>
</div>

   </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
<!-- //비밀번호 폼 -->


</body>
</div>
</html>