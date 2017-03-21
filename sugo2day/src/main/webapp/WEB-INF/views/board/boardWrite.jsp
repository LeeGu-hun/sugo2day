<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<%-- Context Path 경로를 String cp 로 정의--%>
<%
	String cp = request.getContextPath();
%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; harset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<meta name="description" content="">
<meta name="author" content="">
<!-- Title 왼쪽 아이콘 삽입 -->
<!-- 
    <link rel="icon" href="../../favicon.ico">
	 -->

<title>Insert title here</title>
<link href="<%=cp%>/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="<%=cp%>/resources/bootstrap/css/else/boardForm.css" rel="stylesheet">
<script>
	function addBoard() {
		document.getElementById("boardFrm").submit();
	}
	
	function goBack() {
		location.href = "<c:url value='/board/boardList' />";
	}
</script>
</head>
<body>
	<div class="container">
		<form:form commandName="boardCommand" id="boardFrm" class="form-horizontal" method="POST"
			enctype="multipart/form-data" action="/project/board/boardWrite">
			<h2 class="form-join-heading">사용자 게시판</h2>
			<div class="input-group">
				<label for="inputWriter">글쓴이</label>
				<input type="hidden" id="inputWriter" class="form-control" >
				<form:input path="writer" class="form-control" value="${sessionScope.authInfo.name }" readonly="true" />
			</div>
			
			<div class="input-group">
				<label for="inputPass">글 비밀번호</label>
				<input type="hidden" id="inputPass" class="form-control" >
				<form:password path="pass" class="form-control" />
			</div>
			<div class="error-message">
				<span class="label label-danger label-large"><form:errors path="pass" /></span>
			</div>
			
			<div class="input-group">
				<label for="inputSubject">제목</label>
				<input type="hidden" id="inputSubject" class="form-control" >
				<form:input path="subject" class="form-control" />	
			</div>
			<div class="error-message">
				<span class="label label-danger label-large"><form:errors path="subject" /></span>
			</div>

			<div class="input-group">
				<label for="inputContent">내용</label>
				<input type="hidden" id="inputContent" class="form-control">
				<form:textarea path="content" class="form-control" cols="67" rows="15" />		
			</div>
			<div class="error-message">
				<span class="label label-danger label-large"><form:errors path="content" /></span>
			</div>

			<div class="input-group">
				<label for="inputFiles">파일첨부</label>
				<input type="hidden" id="inputFiles">
				<form:hidden path="upDir" class="form-control" value='<%=request.getRealPath("/uploads/") %>' />
				<input type="file" name="multiFile" id="multiFile" />
			</div>	
			
			<div class="btn-group btn-group-justified" role="group">
				<div class="btn-group" role="group">
					<button class="btn btn-primary btn-block" type="button"
						onclick="addBoard();">등록</button>
				</div>
				<div class="btn-group" role="group">
					<button class="btn btn-warning btn-block" type="button"
						onclick="goBack();">취소</button>
				</div>		
			</div>
		</form:form>
	</div>	
</body>
</html>