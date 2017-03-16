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
<script>
	function addBoard() {
		document.getElementById("frm").submit();
	}
</script>
</head>
<body>
<form:form method="POST" commandName="boardCommand" 
			id="frm" enctype="multipart/form-data">
	<table>
		<tr>
			<td colspan="2">MVC 게시판</td>
		</tr>
		<tr>
			<td>작성자</td>
			<td><input type="text" id="name" name="name"  
				value="${sessionScope.authInfo.name}" readonly />
				<form:hidden path="board_writer" id="board_writer" 
				value="${sessionScope.authInfo.id}"/>
				</td>
		</tr>	
		<tr>
			<td>제목</td>
			<td><form:input path="board_subject" id="board_subject" /></td>
		</tr>	
		<tr>
			<td>내용</td>
			<td>
				<form:textarea path="board_content" cols="67" rows="15"/>
			</td>
		</tr>	
		<tr>
			<td>파일 첨부</td>
			<td>
			<form:hidden path="board_upDir"
				value='<%=request.getRealPath("/uploads/")%>'/>
			<input type="file" name="board_multiFile" id="board_multiFile"/></td>
		</tr>
		<tr bgcolor="cccccc">
			<td colspan=2 style="height:1px;"></td>
		</tr>
		<tr bgcolor="cccccc">
			<td colspan=2></td>
		</tr>			
		<tr align="center" valign="middle">
			<td colspan=2>
				<a href="javascript:addBoard()">[등록]</a>&nbsp;&nbsp;
				<a href="javascript:history.go(-1)">[뒤로]</a>
			</td>
		</tr>
	</table>
</form:form>
</body>
</html>