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
	<form:form commandName = "loginCommand">
	<form:errors />
	<p>
		<label>이메일:<br>
		<form:input path="email" />
		<form:errors path="email" />
		</label>
	</p>
	<p>
		<label>비밀번호:<br>
		<form:password path="password" />
		<form:errors path="password" />
		</label>
	</p>
	<p>
		<label>이메일기억:
		<form:checkbox path="rmbEmail" />
		</label>
	</p>
	<input type="submit" value="로그인">
	</form:form>
			
</body>
</html>