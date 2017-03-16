<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>정보</title>
<link href="<c:url value='/resources/css/style.css'/>" rel="stylesheet">

</head>

<body >
	
	<p>글번호 :${board.num}</p>
	<p>작성자 :${board.writer}</p>
	<p>내용 :${board.content}</p>
	<p>제목 :${board.subject}</p>
	<p>파일 :${board.file}</p>
	<p><img  src='<c:url value="/" />uploads/${board.file }' width="200"></p>
	<p>
	가입일
		<fmt:formatDate value="${board.regDate }"
			pattern="yyyy-MM-dd "/>
	</p>
	<a href="<c:url value="/boardList"/>">돌아가기</a>
	<a href="${pageContext.request.contextPath}/board/update/${board.num} ">go</a>
	<a href="${pageContext.request.contextPath}/board/boardReply/${board.num}">댓글</a>
	
</body>
</html>