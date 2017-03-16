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
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js" type="text/javascript"></script>
<script>
function pageGo(page) {
	document.getElementById("page").value = page;
	document.getElementById("frm").submit();
}

function goWrite(){
	location.href="./boardWrite";
}
function goMemList(){
	location.href="./member/list";
}

</script>
<style>
	ul{list-style: none;}
	li{float: left;margin-right: 15px;}
</style>
<link href="<c:url value='/resources/css/style.css'/>" rel="stylesheet">
<script type='text/javascript' src='http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js'></script>
</head>
<body>

		<a href="#" onclick="goMemList();">회원목록</a>
	<form:form commandName="pageMaker" id="frm">
		<p>
			<input type='text' id='txtFilter' onkeyup='{filter();return false}' 
			onkeypress='javascript:if(event.keyCode==13){ filter(); return false;}'>
			<input type="submit" value="조회">
			<input type="button" value="글쓰기" onclick="goWrite();">
			
		</p>
	</form:form>

	<c:if test="${! empty boards}">
	
		<table >
			<tr>
				<th>글번호</th>
				<th>글제목</th>
				<th>작성일자</th>
				<th>글쓴이</th>
				<th>조회수</th>
			</tr>
			<c:forEach var="board" items="${boards}">
				<tr>
					<td>${board.num}</td>
					<td>
					<c:choose>
					<c:when test="${board.re_lev ne 0 }">
					<c:forEach var="i" begin="0" end="${board.re_lev*2}"
					step="1">&nbsp;</c:forEach>▶
					</c:when>
					<c:otherwise>▶</c:otherwise></c:choose>
					<a href="<c:url value="/board/detail/${board.num }"/>">
							${board.subject}</a></td>
					<td><fmt:formatDate value="${board.regDate}"
							pattern="yyyy-MM-dd" /></td>
					<td>${board.writer}</td>
					<td>${board.readcount}</td>
				</tr>
			</c:forEach>
			<tr>
				<td colspan="4">
					<ul class="pageUL">
						<c:if test="${pageMaker.prev }">
							<li><a href='#' onclick='pageGo(${pageMaker.page-1});'>이전</a></li>
						</c:if>
						<c:forEach begin="${pageMaker.start }" end="${pageMaker.end}"
							var="idx">
							<li class='<c:out value="${idx == pageMaker.page?'current':''}"/>'>
								<a href='#' onclick='pageGo(${idx});'>${idx}</a>
							</li>
						</c:forEach>
						<c:if test="${pageMaker.next }">
							<li><a href='#' onclick='pageGo(${pageMaker.page+1});'>다음</a></li>
						</c:if>
					</ul>
				</td>
			</tr>
		</table>
	</c:if>
	



		
</body>
</html>