<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<%-- Context Path 경로를 String cp 로 정의--%>
<% String cp = request.getContextPath(); %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!--  5초 뒤 자동으로 창 닫기 -->
<script type='text/javascript'>
     opener=self;
     setTimeout('self.close()',5000);
</script>

<title>회원 탈퇴</title>

<link href="<%=cp%>/resources/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link href="<%=cp%>/resources/bootstrap/css/else/successPage.css"
	rel="stylesheet">
</head>
<body onLoad="setTimeout('window.close()', 5000);">
	<div class="site-wrapper">
		<div class="site-wrapper-inner">
			<div class="cover-container">
				<div class="inner cover">
					<h1 class="cover-heading">회원 탈퇴 완료</h1>
					<h4 class="warining">작성하신 모든 게시글이 삭제되었습니다.</h4>
					<h3 class="primary">지금까지 서비스를 이용해 주셔서 감사합니다.</h3>
					<p class="lead">5초 후, 자동으로 창이 닫힙니다.</p>
					<br>
					<br>
					<p class="lead">
						<a href="#" class="btn btn-lg btn-default" onclick="window.close();">즉시 닫기</a>
					</p>
				</div>
			</div>
		</div>
	</div>
</body>
</html>