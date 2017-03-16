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
<script>
	function addBoard() {
		document.getElementById("frm").submit();
	}
</script>
</head>
<body>
<form:form commandName="board" id="frm">
	<table>
		<tr>
			<td colspan="2">MVC 게시판</td>
		</tr>
		<tr>
			<td>작성자</td>
			<td>${board.writer}</td>
		</tr>	
		<tr>
			<td>제목</td>
			<td><input type="text" id="subject" name="subject" value="${board.subject }" /></td>
		</tr>	
		<tr>
			<td>내용</td>
			<td>
				<textarea id="content" name="content"  cols="67" rows="15">${board.content }</textarea>
			</td>
		</tr>	
		<tr>
			<td>파일 첨부</td>
			<td><input type="file" name="file" id="file"/></td>
		</tr>
		<tr bgcolor="cccccc">
			<td colspan=2 style="height:1px;"></td>
		</tr>
		<tr bgcolor="cccccc">
			<td colspan=2></td>
		</tr>
					
		<tr align="center" valign="middle">
			<td colspan=2>
				<a href="javascript:addBoard()">[수정]</a>&nbsp;&nbsp;
				<a href="javascript:history.go(-1)">[뒤로]</a>
			</td>
		</tr>
	</table>
</form:form>
</body>
</html>