<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><spring:message code="t.board.list.detail" /></title>
</head>
<body>
	<input type="hidden" value="${board.num}" />
	<input type="hidden" value="${board.re_ref}" />
	<input type="hidden" value="${board.re_lev}" />
	<input type="hidden" value="${board.re_seq}" />
	<table cellpadding="0" cellspacing="0">
		<tr align="center" valign="middle">
			<td colspan="5">MVC 게시판</td>
		</tr>
		<tr>
			<td style="font-family: 돋음; font-size: 12" height="16">
				<div align="center">제 목&nbsp;&nbsp;</div>
			</td>

			<td style="font-family: 돋음; font-size: 12">${board.subject }
			</td>
		</tr>

		<tr bgcolor="cccccc">
			<td colspan="2" style="height: 1px;"></td>
		</tr>

		<tr>
			<td style="font-family: 돋음; font-size: 12">
				<div align="center">내 용</div>
			</td>
			<td style="font-family: 돋음; font-size: 12">
				<table border=0 width=490 height=250 style="table-layout: fixed">
					<tr>
						<td valign=top style="font-family: 돋음; font-size: 12">${board.content }
						</td>
					</tr>
				</table>
			</td>
		</tr>
		
		<tr>
			<c:if test="${! empty board.file }">
			<td style="font-family: 돋음; font-size: 12">
				<div align="center">첨부파일 : </div>
			</td>
			<td style="font-family: 돋음; font-size: 12">
			<p>
			
				<c:set var="ext" value="${fn:split(board.file,'.')}"/>
				<c:choose>
					<c:when test="${ext[1] eq 'jpg' || ext[1] eq 'gif' || ext[1] eq 'png'}">
						<img src='<c:url value="/" />uploads/${board.file }' width="200">
					</c:when>
					<c:otherwise>첨부파일 없음	</c:otherwise>
				</c:choose>
			</p>
			</td>
			</c:if>
		</tr>
		<tr bgcolor="cccccc">
			<td colspan="2" style="height: 1px;"></td>
		</tr>
		<tr>
			<td colspan="2">&nbsp;</td>
		</tr>
		<tr align="center" valign="middle">
			<td colspan="5"><font size=2><a href="<c:url value='/board/boardReply/${board.num }' />">[답변]</a>
				&nbsp;&nbsp; <a
					href="<c:url value='/board/boardModify/${board.num }' />">[수정]</a>&nbsp;&nbsp;
					<a href="<c:url value='/board/boardDelete/${board.num }' />"> [삭제]
				</a>&nbsp;&nbsp;<a href="<c:url value='/board/boardList' />">[목록]</a>&nbsp;&nbsp;
			</font></td>
		</tr>
	</table>
</body>
</html>