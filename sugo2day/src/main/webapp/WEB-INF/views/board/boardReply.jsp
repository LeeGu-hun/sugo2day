<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><spring:message code="t.board.reply" /></title>
<script>
	function replyboard() {
		boardform.submit();
	}
</script>
</head>
<body>
	<form:form commandName="board" method="post" name="boardform" action="/project/board/boardReply">
		<form:hidden path="num" />
		<form:hidden path="re_ref" />
		<form:hidden path="re_lev" />
		<form:hidden path="re_seq" />

		<table cellpadding="0" cellspacing="0">
			<tr align="center" valign="middle">
				<td colspan="5">MVC 게시판</td>
			</tr>
			<tr>
				<td>글쓴이</td>
			<td><input type="text" id="name" name="name"
				value="${sessionScope.authInfo.name}" readonly ></td>
				<form:hidden path="writer" id="writer" value="${sessionScope.authInfo.id }" />	
			</tr>
			<tr>
				<td style="font-family: 돋음; font-size: 12" height="16">
					<div align="center">제 목</div>
				</td>
				<td><input type="text" name="subject" size="50"
					maxlength="100" value="Re: ${board.subject }" /></td>
			</tr>
			<tr>
				<td style="font-family: 돋음; font-size: 12">
					<div align="center">내 용</div>
				</td>
				<td><textarea name="content" cols="67" rows="15"></textarea>
				</td>
			</tr>
						
			<tr bgcolor="cccccc">
				<td colspan="2" style="height: 1px;"></td>
			</tr>
			<tr>
				<td colspan="2">&nbsp;</td>
			</tr>

			<tr align="center" valign="middle">
				<td colspan="5"><a href="javascript:replyboard()">[등록]</a>&nbsp;&nbsp;
					<a href="javascript:history.go(-1)">[뒤로]</a></td>
			</tr>
		</table>
	</form:form>
</body>
</html>