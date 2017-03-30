<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

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
	function boardReply() {
		location.href = "<c:url value='/board/boardReply/${board.num }' />";
	}
	
	function boardModify() {
		location.href = "<c:url value='/board/boardModify/${board.num }' />";
	}
	
	function boardDelete() {
		location.href = "<c:url value='/board/boardDelete/${board.num }' />";
	}
	
	function boardList() {
		location.href = "<c:url value='/board/boardList' />";
	}
</script>
</head>
<body>
	<input type="hidden" value="${board.num}" />
	<input type="hidden" value="${board.pass }" />
	<input type="hidden" value="${board.re_ref}" />
	<input type="hidden" value="${board.re_lev}" />
	<input type="hidden" value="${board.re_seq}" />
	<div class="container">
		<form:form class="form-horizontal" >
			<h2 class="form-join-heading">사용자 게시판</h2>
			<table class="table">
				<tr>
					<td	style="font-family: 돋음; font-size: 12" height="16">		
						<div class="input-group">
							<label for="inputSubject">제목</label>
							<input type="hidden" id="inputSubject" class="form-control" />
						</div>
					</td>
					<td style="font-family: 돋음; font-size: 12">
						${board.subject }
					</td>
				</tr>
			
				<tr>
					<td	style="font-family: 돋음; font-size: 12" height="16">		
						<div class="input-group">
							<label for="inputContent">내용</label>
							<input type="hidden" id="inputContent" class="form-control" />
						</div>
					</td>
					<td style="font-family: 돋음; font-size: 12">
						<table border=0 width=490 height=250 
							style="table-layout: fixed">
							<tr>
								<td valign=top style="font-maily: 돋음; font-size: 12">
									${board.content }
								</td>
							</tr>
						</table>			
					</td>
				</tr>
				
				<tr>
					<c:if test="${!empty board.files }">
					<td	style="font-family: 돋음; font-size: 12">		
						<div class="input-group">
							<label for="inputFiles">파일 : </label>
							<input type="hidden" id="inputFiles" class="form-control" />
						</div>
					</td>
					<td style="font-family: 돋음; font-size: 12">
						<div class="attach-files">
							<c:set var="ext" value="${fn:split(board.files,'.')}"/>
							<c:choose>
								<c:when test="${ext[1] eq 'jpg' || ext[1] eq 'gif' || ext[1] eq 'png'}">
									<img src='<c:url value="/" />uploads/${board.files }' class="img-responsive">
								</c:when>
								<c:otherwise>첨부파일 없음	</c:otherwise>
							</c:choose>
						</div>
					</td>
					</c:if>
				</tr>
				<tr>
					<td colspan="5">	
						<div class="btn-group btn-group-justified" role="group">
							<div class="btn-group" role="group">
								<button class="btn btn-primary btn-block" type="button"
									onclick="boardReply();">답변</button>
							</div>
							<div class="btn-group" role="group">
								<button class="btn btn-warning btn-block" type="button"
									onclick="boardModify();">수정</button>
							</div>
							<div class="btn-group" role="group">
								<button class="btn btn-warning btn-block" type="button"
									onclick="boardDelete();">삭제</button>
							</div>
							<div class="btn-group" role="group">
								<button class="btn btn-warning btn-block" type="button"
									onclick="boardList();">목록</button>
							</div>						
						</div>
					</td>
				</tr>		
			</table>	
		</form:form>
	</div>	
</body>
</html>