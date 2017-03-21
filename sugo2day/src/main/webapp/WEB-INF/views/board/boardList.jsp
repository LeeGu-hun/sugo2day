<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    

<%-- Context Path 경로를 String cp 로 정의--%>
<% String cp = request.getContextPath(); %>
    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<meta name="description" content="">
<meta name="author" content="">
<!-- Title 왼쪽 아이콘 삽입 -->
<!-- 
    <link rel="icon" href="../../favicon.ico">
	 -->

<title>Insert title here</title>
<link href="<%=cp%>/resources/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<script>
	function pageGo(page) {
		document.getElementById("page").value = page;
		document.getElementById("frm").submit();
	}
	
	function goWrite() {
		location.href = "<c:url value='/board/boardWrite' />";
	}
</script>
<style>
body {
	background-color: #eee;
}

.wrapper {
	max-width: 800px;
	max-height: 600px;
	margin: 0 auto;
	padding: 40px;
}

.paging {
	margin: 5 auto;
	padding: 5px;
}
</style>
</head>
<body>

<div class="wrapper">
	<nav class="navbar-form navbar-right" role="search">
		<div class="form-group">
			<form:form commandName="pageMaker" id="frm">
			<input type="text" class="form-control" placeholder="검색할 내용을 입력하세요" />
			<input type="submit" class="btn btn-default" value="검색">
			<input type="button" class="btn btn-default" onclick="goWrite();" value="글쓰기">
			<form:hidden path="page" id="page" />
			</form:form>
		</div>
	</nav>

		
	<table class="table table-hover">
		<thead>
		<tr align="center" valign="middle">
			<td colspan="4">게시판</td>
		</tr>	
		<tr class="info" align="center" valign="middle">
			<td style="font-family:Tahoma; font-size:8pt;" width="8%" height="26">
				<div align="center">글번호</div>
			</td>
			<td style="font-family:Tahoma; font-size:8pt;" width="50%" height="26">
				<div align="center">제목</div>
			</td>	
			<td style="font-family:Tahoma; font-size:8pt;" width="14%" height="26">
				<div align="center">작성일</div>
			</td>	
			<td style="font-family:Tahoma; font-size:8pt;" width="17%" height="26">
				<div align="center">작성자</div>
			</td>	
			<td style="font-family:Tahoma; font-size:8pt;" width="11%" height="26">
				<div align="center">조회수</div>
			</td>
		</tr>
		</thead>
		<c:if test="${! empty boards }">
		<tbody>
		<c:forEach var="board" items="${boards }">
			<tr align="center" valign="middle">
				<td height="23" style="font-family:Tahoma; font-size:10pt;">${board.num }</td>
				
				<td style="font-family:Tahoma; font-size:10pt;">
				<div align="left">
				<c:if test="${0 == board.re_lev }">
					<a href="<c:url value="/board/boardDetail/${board.num }"/>" >${board.subject }</a>
				</c:if>
				<c:if test="${0 != board.re_lev}">
					<a href="<c:url value="/board/boardDetail/${board.num }"/>" >
						<c:forEach begin="0" end="${board.re_lev }" var="lev">
							<c:out value="${lev < board.re_lev ? '▶' : ''  }"/>
						</c:forEach>
					${board.subject }</a>
				</c:if>
				</div>
				</td>
				
				<td style="font-family:Tahoma; font-size:10pt;">
					<div align="center">
						<fmt:formatDate value="${board.regdate }" pattern="yyyy-MM-dd"/>
					</div>
				</td>
			
				<td style="font-family:Tahoma; font-size:10pt;">
					<div align="center">${board.writer }</div>
				</td>
			
				<td style="font-family:Tahoma; font-size:10pt;">
					<div align="center">${board.readcount }</div>
				</td>
			</tr>		
		</c:forEach>
		</tbody>
		</c:if>
		<tfoot>
		<tr>
		<td colspan=5>
		<div align="center">
		<nav>
		<ul class="pagination">
  			<c:if test="${pageMaker.prev }">
  				<li>
  					<a href="#" aria-label="Previous" onclick='pageGo(${pageMaker.page-1});'>
  						<span aria-hidden="true">&laquo;</span>
  					</a>
  				</li>
	   		</c:if>
	   		<c:forEach begin="${pageMaker.start }" end="${pageMaker.end }" var="idx">
	   			<li class='<c:out value="${idx == pageMaker.page?'active':''}"/>'>
	   				<a href="#" onclick="pageGo(${idx});">${idx }
	   					<span class="sr-only">(current)</span>
	   				</a>
	   			</li>
	   		</c:forEach>
	   		<c:if test="${pageMaker.next }">
	  			<li>
	  				<a href="#" aria-label="Next" onclick='pageGo(${pageMaker.page+1});'>
	   					<span aria-hidden="true">&raquo;</span>
	   				</a>
	   			</li>
	   		</c:if>	
	   	</ul>
	   	</nav>
	   	</div>
	   	</td>
	   	</tr>
	   	</tfoot>	
	</table>
</div>		
</body>
</html>