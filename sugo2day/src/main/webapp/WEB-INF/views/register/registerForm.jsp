<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Insert title here</title>
</head>
<body>
	<form:form action="registerSuccess" commandName="registerRequest">
		<p>
			<label>이메일<br>
			<form:input path="email" placeholder="E-MAIL 주소 형식으로 입력"/>
			<form:errors path="email" />
			</label>
		</p>
		<p>
			<label>닉네임<br>
			<form:input path="name" placeholder="한글, 영문, 숫자 사용가능"/>
			<form:errors path="name" />
			</label>
		</p>
		<p>
			<label>비밀번호<br>
			<form:password path="password" placeholder="영문과 숫자 조합으로 입력"/>
			<form:errors path="password" />
			</label>
		</p>
		<p>
			<label>비밀번호 확인<br>
			<form:password path="confirmPassword" placeholder="비밀번호를 한 번 더 입력"/>
			<form:errors path="confirmPassword" />
			</label>
		</p>
		<p>
			<label>생년월일<br>
			<form:input path="birthday" placeholder="YYYY-MM-DD"/>
			</label>
		</p>
		<p>
			<label>성별<br>
			<form:radiobutton path="gender" value="male" label="남성"/>
			<form:radiobutton path="gender" value="female" label="여성"/>
			</label>
		</p>	
	<input type="submit" value="가입하기">	
	</form:form>
</body>
</html>