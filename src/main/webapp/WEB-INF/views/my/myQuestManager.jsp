<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<%-- Context Path 경로를 String cp 로 정의--%>
<% String cp = request.getContextPath(); %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<meta name="description" content="">
<meta name="author" content="">
<title>Insert title here</title>

<!-- Bootstrap main -->
<link href="<%=cp%>/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<!-- font awesome for icons -->
<link href="<%=cp%>/resources/font-awesome/css/font-awesome.min.css" rel="stylesheet">
<!--mega menu -->
<link href="<%=cp%>/resources/css/yamm.css" rel="stylesheet" type="text/css">
<!-- Custom CSS -->
<link href="<%=cp%>/resources/css/style.css" rel="stylesheet">
<link href="<%=cp%>/resources/css/myList.css" rel="stylesheet">
<link href="<%=cp%>/resources/css/letterLayout.css" rel="stylesheet">

<!-- JQuery Main -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script>
$(function() {
	$('input:checkbox[id="onprivate"]').is('checked', function() {
	    $.ajax({
	        url:'letter/letterManage',
			type: 'post',
		    data: { isprivate: $('#onprivate').val() },
			success: function(t) { alert('비밀글 설정 완료'); },
			error: function() { alert('설정 실패...'); }
	    });
	});
	
	$('input:checkbox[id="offprivate"]').is('checked', function() {
	    $.ajax({
	        url:'letter/letterManage',
			type: 'post',
		    data: { isprivate: $('#offprivate').val() },
			success: function(t) { alert('공개글 설정 완료'); },
			error: function() { alert('설정 실패...'); }
	    });
	});
});


function goQL() {
	location.href = "<c:url value='/letter/myLetter' />";
}

</script>
</head>
<body>
<!-- 본문 상단 공통 고정 메뉴 -->
	<div class="top-bar-light">
		<div class="container">
			<div class="row">
				<div class="col-sm-5 hidden-xs">
					<div class="top-bar-socials"></div>
				</div>
				<div class="col-sm-7 text-right">
					<ul class="list-inline top-dark-right">
						<c:if test="${empty authInfo }">
							<li><a href="<c:url value='/login' />"><i
									class="fa fa-lock"></i> Login</a></li>
							<li><a href="<c:url value='/register/registerTerm' />"><i
									class="fa fa-user"></i> Sign Up</a></li>
						</c:if>
						<c:if test="${!empty authInfo }">
							<li>${authInfo.name }님,환영합니다.</li>
							<li><a href="<c:url value='/logout' />">
							<i class="fa fa-user"></i> Logout</a></li>
							<li><a href="javascript:void(window.open('<c:url value='/edit/changePassword' />', '_blank', 'width=350, height=400'))">
							<i class="fa fa-lock"></i> ChangePW</a></li>
						</c:if>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<div id="nav-wrapper">
		<div class="navbar navbar-default navbar-static-top yamm sticky"
			role="navigation">
			<div class="container">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle" data-toggle="collapse"
						data-target=".navbar-collapse">
						<span class="sr-only">Toggle navigation</span> <span
							class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>
					<div id="brandLogo">
						<a class="navbar-brand" href="<c:url value="/main" />"><img
							src="<%=cp%>/resources/images/Logo.png" alt=""></a>
					</div>
				</div>
				<div class="navbar-collapse collapse">
					<ul class="nav navbar-nav navbar-right">
						<li class="dropdwon"><a href="<c:url value="/letter/myLetter" />">MyPage </a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
<div class="body-wrapper">
	<div class="body-header">
		<button type="button" class="btn btn-default btn-lg" onclick="goQL()">퀘스트 등록</button>
		<hr>
	</div>	
	
	<div class="body-content">
		<c:if test="${ empty letterM }">
			<div class="fake-size-top">
				<p>&nbsp;</p>
			</div>
			<h3>글을 작성해 달라</h3>
		</c:if>
	</div>	

	<div class="body-list">
	<c:if test="${! empty letterM }">
	<!-- 게시글을 주우우욱 보여주기 -->
		<c:forEach var="mletter" items="${letterM }">
			<div class="list_wrapper">
				<div class="list_container">
					<div>
						<div class="pull-left">
							<div class="list_title1">
								<h4 class="lead"><b>${mletter.subject }</b></h4>
							</div>
						</div>
						<div class="pull-right">
							<div class="list_title2">
								<h4 class="lead">${mletter.regdate }</h4>
							</div>
						</div>
					</div>
					
					<c:if test="${! empty mletter.files }">
					<div style="max-width: 600px;">	
					<c:set var="ext" value="${fn:split(mletter.files,'.')}"/>
						<c:choose>
							<c:when test="${ext[1] eq 'jpg' || ext[1] eq 'gif' || ext[1] eq 'png'}">
								<img class="img-responsive" src='<c:url value="/" />uploads/${mletter.files }'>
							</c:when>
							<c:otherwise>첨부된 사진 없음</c:otherwise>
						</c:choose>
					</div>	
					</c:if>
					<br>
					
					<div style="max-width: 600px;" class="list_content">
						<textarea class="lead" id="content" cols="52" rows="6" style="overflow-y:scroll"
							readonly="readonly">${mletter.content }</textarea>
						<script type="text/javascript">
						$(function() {
							$('#content').val().replace(/\n/g, "<br>");
						});	
					</script>					
					</div>
					
					<c:if test="${! empty mletter.startdate }">
					<div class="list_date">
						<h4 class="lead">${mletter.startdate } 부터 ${mletter.enddate } 까지</h4>
					</div>		
					</c:if>
				
					<div class="pull-left">
						<div class="user_id">
							<h3 class="lead">by <b>${mletter.writer }</b></h3>
						</div>
					</div>
				
					
					<div class="pull-right">
						<div class="user_write">
							<input type="radio" name="isprivate" id="onprivate" value="공개글" checked="checked">
							<label> 공개글</label>
							<input type="radio" name="isprivate" id="offprivate" value="비공개">
							<label> 비공개글</label>
						</div>
					</div>
				</div>
			</div>
		<div class="fake-size">
			<p>&nbsp;</p>
		</div>			
		</c:forEach>
	</c:if>
	</div>
</div>
</body>
</html>
    