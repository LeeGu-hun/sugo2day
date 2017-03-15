<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/3/w3.css">
<title>Insert title here</title>
</head>
<body>
<!-- 퀘스트 등록-->

<div class="w3-card-4">
  <div class="w3-container w3-brown">
    <h2>Input Colors</h2>
  </div>
  <form class="w3-container" action="/action_page.php">
    <p>      
    <label><b>퀘스트</b></label>
    <input name="first" type="text"></p>
    <p>      
    <label> <b>Last Name</b></label>
    <input name="last" type="text"></p>
    <p>
    <button>Register</button></p>
  </form>
</div>


</body>
</html>