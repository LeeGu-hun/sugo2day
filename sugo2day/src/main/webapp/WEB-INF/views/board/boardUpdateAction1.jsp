<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><spring:message code="member.sns" /></title>

</head>
<body>
<form action="${pageContext.request.contextPath}/board/update" method="post">
	<table>
		<tr>
			<td colspan="2">MVC 게시판</td>
		</tr>
		<tr>
			<td>글번호</td>
			<td>
				<input type="hidden" value="${board.num }"/>
				
				<input type="text" id="num" name="num"  
				value="${sessionScope.authInfo.email}" readonly />
				<input type="hidden" path="writer" id="writer" 
				value="${sessionScope.authInfo.id}"/>
				</td>
		</tr>	
		<tr>
			<td>제목</td>
			<td><input type="text" id="subject" name="subject" value="${board.subject }" /></td>
		</tr>	
		<tr>
			<td>내용</td>
			<td>
				<textarea  cols="67" rows="15">${board.content}</textarea>
			</td>
		</tr>	
		
		<tr align="center" valign="middle">
			<td colspan=2>
				<a href="${pageContext.request.contextPath}/board/update/${board.num}  ">[수정]</a>&nbsp;&nbsp;
				<a href="javascript:history.go(-1)">[뒤로]</a>
			</td>
		</tr>
	</table>
		<input type="submit" value="수정" >	
</form>
</body>
</html>