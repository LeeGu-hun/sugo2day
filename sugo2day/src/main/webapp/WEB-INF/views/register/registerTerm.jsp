<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
    
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
<link href="<%=cp%>/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="<%=cp%>/resources/bootstrap/css/else/registerTerm.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script>
function oneCheckbox(x){
    var obj = document.getElementsByName("agree");
    for(var i=0; i<obj.length; i++){
        if(obj[i] != x){
            obj[i].checked = false;
        }
    }
}
</script>
</head>
<body>
	<fieldset>
	<div class="container">
		<fieldset>
     	<div class="page-header">
        	<h1>이용 약관</h1>
      	</div>
      	</fieldset>
      	
      	<form class="form-agree" action="registerForm" method="post">
      	<fieldset>
     		<p class="lead">약관 내용 솰라솰롸</p>
     		<p class="lead">개인정보를 제공하는데 동의함?</p>
      		<div class="checkbox">
      		<label>
            	<input type="checkbox" name="agree" class="check_class" value="true"
            		onclick="oneCheckbox(this)">
            	 네, 약관에 동의합니다.
          	</label>
          	<label>
          		<input type="checkbox" name="agree" class="check_class" value="false"
          			onclick="oneCheckbox(this)">
          		아니오, 약관에 동의하지 않습니다.
          	</label>	
        	</div>
        </fieldset>
           	<button class="btn btn-lg btn-primary btn-block" type="submit">
          		다음 단계</button>
        </form>
    </div>
    </fieldset>
</body>
</html>