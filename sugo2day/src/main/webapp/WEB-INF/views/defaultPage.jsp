<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="<c:url value="/resources/css/css.css"/>" rel='stylesheet'>
</head>

<body>
	<!-- 테스트용 주석-->
	<div id="wrapper">
		<div id="left-wrap">
		<div id="left">
			<%@ include file="/WEB-INF/views/include/left.jsp"%>
		</div>
		</div>
		<div id="right-wrap">
		<div id="header">
			<%@ include file="/WEB-INF/views/include/header.jsp"%>
		</div>
		<div id="content">
			<p>TEST</p>
		</div>
		<div id="footer">
			<%@ include file="/WEB-INF/views/include/footer.jsp"%>
		</div>
		</div>
	</div>



</body>
</html>