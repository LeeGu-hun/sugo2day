<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%-- Context Path 경로를 String cp 로 정의--%>
<% String cp = request.getContextPath(); %>
    
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1">
   	 
   <title>회원 탈퇴</title>
   
<link href="<%=cp%>/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="<%=cp%>/resources/bootstrap/css/else/changePwd.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>

<script>
function toggle_btn() {
	if ($("input:checkbox[id='agree_check']").is(":checked") == true) {
		$("#btn-agree").removeClass("hidden");
		$("#btn-agree").addClass("show");
	}
	
	if ($("input:checkbox[id='agree_check']").is(":checked") == false) {
		$("#btn-agree").removeClass("show");
		$("#btn-agree").addClass("hidden");
	}
}
</script>    
</head>
<body>
	<div class="container">
	<div class="page-container">
		<fieldset>
     	<div class="page-header text-center">
        	<h1>회원 탈퇴</h1>
      	</div>
      	</fieldset>
      	
      	<form class="form-agree" action="withDrawAgree" method="post">
      	<fieldset class="text-left">
     		<h2>회원 탈퇴를 한다면?</h2>
     		<h4>1. 작성한 모든 게시글이 삭제됩니다.</h4>
     		<h4>2. 작성한 모든 퀘스트가 삭제됩니다.</h4>
     		<h4>정말로 탈퇴하시겠습니까?</h4>
      		<div class="checkbox">
      		<label>
            	<input type="checkbox" name="agree" id="agree_check" value="true"
            		onclick="toggle_btn()">
            	 네, 탈퇴하겠습니다.
          	</label>
          	</div>
        </fieldset>
			<div id="btn-agree" class="hidden" role="group">
				<button class="btn btn-primary btn-block" type="submit">탈퇴</button>
			</div>
			<div class="show" role="group">
				<button class="btn btn-warning btn-block" type="button"
						onclick="window.close();">취소</button>
			</div>	
        </form>
    </div>	
	</div>	
</body>
</html>