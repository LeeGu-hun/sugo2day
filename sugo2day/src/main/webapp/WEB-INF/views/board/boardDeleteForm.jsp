<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<%-- Context Path 경로를 String cp 로 정의--%>
<% String cp = request.getContextPath(); %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
<link href="<%=cp%>/resources/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link href="<%=cp%>/resources/bootstrap/css/else/boardDelForm.css"
	rel="stylesheet">
<script>
	function deleteCancel() {
		location.href = "<c:url value='/board/boardList' />";
	}
</script>
</head>

<body>
	<div class="container">
		<form:form action="boarDeleteSuccess" commandName="board" class="form-delete">
			<h2 class="form-signin-heading">글을 삭제하시겠습니까?</h2>

			<label for="inputPassword" class="sr-only">Password</label>
			<form:password path="pass" id="inputPassword" class="form-control"
				placeholder="Password" />
						
			<div class="error-message">
				<span class="label label-danger label-large"><form:errors path="pass"/></span>
			</div>
			
			<div class="btn-group btn-group-justified" role="group">
				<div class="btn-group" role="group">
					<button class="btn btn-primary btn-block" type="submit">삭제</button>
				</div>
				<div class="btn-group" role="group">	
					<button class="btn btn-primary btn-block" type="button" onclick="deleteCancel();">취소</button>
				</div>
			</div>		
		</form:form>
	</div>
	<!-- /container -->

</body>
</html>
