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

<!-- Custom Ajax Script -->
<script src="<%=cp %>/resources/customJS/changePublicStatus.js"></script>

<script>
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
						<li class="dropdown"><a href="<c:url value="/letter/letterManage" />">Quest Manage</a></li>
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
	
	<c:if test="${ empty letterM }">
	<div class="body-content">
			<div class="fake-size-top">
				<p>&nbsp;</p>
			</div>
			<h3>글을 작성해 달라</h3>
	</div>	
	</c:if>

	<div class="body-list">
	<c:if test="${! empty letterM }">
	<!-- 게시글을 주우우욱 보여주기 -->
		<c:forEach var="mletter" items="${letterM }">
			<div class="list_wrapper">
				<div class="list_container">
					<div>
						<input type="hidden" id="lnum"  value="${mletter.num }"/>
						<div class="pull-left">
							<h4 class="lead">${mletter.questcate }</h4>
						</div>
						<div class="pull-right">
							<div class="list_title2">
								<h4 class="lead">${mletter.regdate }</h4>
							</div>
						</div>
					</div>
					
					<c:if test="${! empty mletter.files }">
					<div style="max-width: 550px; margin-left: auto; margin-right: auto;">	
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
					
					<div style="max-width: 550px; margin-left: auto; margin-right: auto;" class="list_content">
						<textarea class="lead" id="content" cols="54" rows="6" style="overflow-y:scroll"
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
					<div class="row" style="margin-left: 0; margin-right: 0; padding-left: 15px;">
						<div class="pull-left" style="max-width: 300px;">
							<span class="lead">by <b>${mletter.writer }</b></span>
						</div>	
						
						<div class="input-group pull-right" role="group" style="width: 300px; height: 35px;">
							<div class="col-lg-5" style="padding: 0; max-width: 125px;">		
								<div class="input-group">	
									<span class="input-group-addon">
										<input type="radio" name="stat" value="공개글" onclick="changeShow(${mletter.num }, '공개글')">
									</span>
									<input type="text" class="form-control" placeholder="공개글" readonly style="width: 88px;">
								</div>
							</div>
							<div class="col-lg-5" style="padding: 0; max-width: 125px;">	
								<div class="input-group">	
									<span class="input-group-addon">
										<input type="radio" name="stat" value="비공개" onclick="changeShow(${mletter.num }, '비공개')">
									</span>
									<input type="text" class="form-control" placeholder="비공개" readonly style="width: 88px;">
								</div>
							</div>
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
    