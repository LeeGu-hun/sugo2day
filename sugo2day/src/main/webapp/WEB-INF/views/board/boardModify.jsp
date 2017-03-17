<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><spring:message code="t.board.modify" /></title>
<script>
	function modifyboard() {
		modifyform.submit();
	}
</script>
</head>
<body>
	<form:form commandName="board" id="modifyform" action="/project/board/boardModify" method="post">
		<form:hidden path="num" id="num" />
		<table cellpadding="0" cellspacing="0">
			<tr align="center" valign="middle">
				<td colspan="5">MVC 게시판</td>
			</tr>
			<tr>
			<td>제목</td>
			<td><form:input path="subject" id="subject" /></td>
		</tr>	
		<tr>
			<td>내용</td>
			<td>
				<form:textarea path="content" id="content" cols="67" rows="15" />
			</td>
		</tr>	
			<tr>
				<td style="font-family: 돋음; font-size: 12">
					<div align="center">파일 첨부</div>
				</td>
				<td>&nbsp;&nbsp;${board.file }
				</td>
			</tr>
			<tr bgcolor="cccccc">
				<td colspan="2" style="height: 1px;"></td>
			</tr>
			<tr>
				<td colspan="2">&nbsp;</td>
			</tr>

			<tr align="center" valign="middle">
				<td colspan="5"><font size=2> <a
						href="javascript:modifyboard()">[수정]</a>&nbsp;&nbsp; <a
						href="javascript:history.go(-1)">[뒤로]</a>&nbsp;&nbsp;
				</font></td>
			</tr>
		</table>
	</form:form>
</body>
</html>