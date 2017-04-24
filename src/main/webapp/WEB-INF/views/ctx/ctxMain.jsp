<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


  <!-- Main jumbotron for a primary marketing message or call to action -->
    <div class="jumbotron">
      <div class="container">
      <c:if test="${!empty map }">
        <h1>화제의 퀘스트 3가지 !</h1>
        <hr>
      <c:forEach var="hq" items="${map }" end="2">
        <span class="text-left lead" style="margin-left: 20px;"><b>&laquo;${hq.key }&raquo; 퀘스트 관련 글이 총 ${hq.value }개 작성되었습니다 !</b></span>
        <span class="pull-right"><button type="button" class="btn btn-primary btn-xm">퀘스트 확인하기 &raquo;</button></span>
        <hr>
        <div class="divide10"></div>
      </c:forEach> 
      </c:if>
      </div>
    </div>

    <div class="container">
      <!-- 일반글 영역 -->
      <div class="col-md-6"	style="width: 45%; margin: 10px 20px 10px 20px;">
      	<h2>가장 최근에 작성된 일반글</h2>
      	<c:if test="${empty letters }">
      		<h1>값 못가져옴</h1>
      	</c:if>
      	<c:if test="${!empty letters }">
      	<c:forEach var="letterN" items="${letters}">
      	<!-- 여기서부터 -->
      	<c:if test="${letterN.l_isquest == 'N' }">
      	<div class="row" style="background-color: #FBFFD8; border-radius: 5px;">
      	  <h4 id="content" class="text-right" style="padding: 10px 50px 0 0;">작성자 : ${letterN.l_writer }</h4>          
		  <div>
		  	<c:if test="${!empty letterN.l_files }">
			<div style="max-width: 350px; margin-left: auto; margin-right: auto;">
			<c:set var="ext" value="${fn:split(letterN.l_files,'.')}"/>
				<c:choose>
					<c:when test="${ext[1] eq 'jpg' || ext[1] eq 'gif' || ext[1] eq 'png'}">
						<img class="img-responsive" src='<c:url value="/" />uploads/${letterN.l_files }'>
					</c:when>
					<c:otherwise>첨부된 사진 없음</c:otherwise>
				</c:choose>
			</div>
			</c:if>
		  </div>
		  <p class="text-overfow lead" style="margin: 10px 50px 10px 50px">${letterN.l_content }</p>	  
		  <div class="divide10"></div>
        </div>
        <div class="divide20"></div> 
        </c:if>
        </c:forEach>   
        </c:if>   
      </div>
      <!-- 퀘스트글 영역 -->
      <div class="col-md-6" style="width: 45%; margin: 10px 20px 10px 20px;">
      	<h2>가장 최근에 작성된 퀘스트글</h2>
      	<c:if test="${empty letters }">
      		<h1>값 못가져옴</h1>
      	</c:if>
      	<c:if test="${!empty letters }">
      	<c:forEach var="letter" items="${letters}">
      	<c:if test="${letter.l_isquest == 'Y' }">
      	<div class="row" style="background-color: #D6F1FC; border-radius: 5px;">
      	  <h4 class="text-left" style="margin: 10px 0 5px 30px;">퀘스트 : ${letter.l_questcate }</h4>
      	  <h4 class="text-right" style="padding: 5px 50px 0 0;">작성자 : ${letter.l_writer }</h4>          
		  <div>
			<c:if test="${!empty letter.l_files }">
			<div style="max-width: 350px; margin-left: auto; margin-right: auto;">
			<c:set var="ext" value="${fn:split(letter.l_files,'.')}"/>
				<c:choose>
					<c:when test="${ext[1] eq 'jpg' || ext[1] eq 'gif' || ext[1] eq 'png'}">
						<img class="img-responsive" src='<c:url value="/" />uploads/${letter.l_files }'>
					</c:when>
					<c:otherwise>첨부된 사진 없음</c:otherwise>
				</c:choose>
			</div>
			</c:if>
		  </div>
		  <p class="text-overfow lead" style="margin: 10px 50px 10px 50px">${letter.l_content }</p>
		  <div class="divide10"></div>
        </div>
        <div class="divide20"></div> 
        </c:if>
        </c:forEach>   
        </c:if>   
      </div>
    </div> <!-- /container -->	