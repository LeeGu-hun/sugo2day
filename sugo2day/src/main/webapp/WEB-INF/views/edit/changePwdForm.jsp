<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form:form>
	<p>
		<label>현재 비밀번호:<br>
		<form:input path="currentPassword" />
		<form:errors path="currentPassword" />
		</label>
	</p>
	<p>
		<label>새 비밀번호:<br>
		<form:password path="newPassword" />
		<form:errors path="newPassword" />
		</label>
	</p>
	<input type="submit" value="확인">
	</form:form>	
		
</body>
</html>