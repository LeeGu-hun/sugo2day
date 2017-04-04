<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>

<%-- Context Path 경로를 String cp 로 정의--%>
<%
	String cp = request.getContextPath();
%>
<meta http-equiv="Content-Type" content="text/html; harset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css"
	type="text/css" media="all" />
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"
	type="text/javascript"></script>
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"
	type="text/javascript"></script>
<meta name="description" content="">
<meta name="author" content="">
<!-- Title 왼쪽 아이콘 삽입 -->
<!-- 
    <link rel="icon" href="../../favicon.ico">
	 -->

<title>Insert title here</title>
<link href="<%=cp%>/resources/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link href="<%=cp%>/resources/bootstrap/css/else/boardForm.css"
	rel="stylesheet">
<script src="<%=cp%>/resources/register.js" type="text/javascript"></script>
</head>
<body>

	<div class="container">
		
		<!-- 	NUM;QNUM;QSUBJECT;NAME;CONTENT;STARTDATE;ENDDATE;WORKINGDATE;PROD; -->
		<form:form commandName="quest" id="questFrm" class="form-horizontal"
			method="POST" action="/sugo2day/quest/questRegister">
			<form:hidden path="ID" value="${sessionScope.authInfo.id }"/>
			<h2 class="form-join-heading">퀘스트 등록테스트</h2>

			<div class="input-group" style="width: 200px;">
				<label>글쓴이</label>
				<form:input path="NAME" value="${sessionScope.authInfo.name }"
					class="form-control" placeholder="작성자란" />
				<form:errors path="NAME" />
			</div>

			<div class="input-group" style="width: 200px;">
				<label>목표</label>
				<form:input path="SUBJECT" class="form-control" placeholder="목표 입력" />
				<form:errors path="SUBJECT" />
			</div>

			<div class="input-group" >
				<label>난이도</label>
				<form:radiobutton value="0" onclick="sang();" path="DIFFICULTY" label="상" />
 	  			<form:radiobutton value="1" onclick="jung();" path="DIFFICULTY" label="중" />
 	  			<form:radiobutton value="2" path="DIFFICULTY" label="하" />
			</div>
			

			<div class="input-group">
				<label>내용</label>
				<form:textarea path="CONTENT" class="form-control" cols="60"
					rows="8" style="resize: none;" placeholder="내용을 입력하세요 최소 300자" />
			</div>

			<span> <label>목표 시작일:<input name="STARTDATE"
					id="STARTDATE" class="form-control" class="input-group"
					placeholder="push" /></label> ~ <label>목표 종료일: <input
					name="ENDDATE" id="ENDDATE" class="form-control"
					class="input-group" placeholder="push" /></label>

			</span>
			<div class="input-group" style="width: 200px;">
				<label for="inputSubject">결과</label>
				<form:input path="PROB" class="form-control" placeholder="작성 no!" />
			</div>
			<div class="btn_group btn-group-justified" role="group"></div>


			<div
				style="position: absolute; left: 670px; width: 700px; top: 700px;">
				<div class="btn-group" role="group">
					<button class="btn btn-primary btn-block" type="button"
						onclick="addBoard();" style="width: 280px;">퀘스트 등록</button>
				</div>
				<div class="btn-group" role="group">
					<button class="btn btn-warning btn-block" type="button"
						onclick="goBack();" style="width: 280px;">등록 취소</button>
				</div>
			</div>
	</form:form>
	</div>
</body>
</html>