<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- registerForm 접근 방식 구분을 위해 울며 겨자먹기로 추가 -->
	<h2>약관</h2>
	<p>개인 정보를 제공하는데 동의함?</p>
	<form action="registerForm" method="post">
	<label>
		<input type="checkbox" name="agree" value="true">동의
	</label>
		<input type="submit" value="다음단계"/>
	</form>
</body>
</html>