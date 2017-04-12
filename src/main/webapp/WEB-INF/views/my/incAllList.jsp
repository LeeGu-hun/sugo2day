<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- 이 페이지는 전체 글 리스트 -->
<!-- letters 는 커맨드 객체 이름(작성된 글이 있을때만 노출)-->
<c:if test="${ empty letters }">
<div class="fake-size-top">
	<p>&nbsp;</p>
</div>
	<h3>작성된 글이 없습니다</h3>
</c:if>

<c:if test="${! empty letters }">

<!-- 게시글을 주우우욱 보여주기 -->
	<c:forEach var="letter" items="${letters }">
		<div class="list_wrapper">
			<div class="list_container">
				<div>
					<div class="pull-left">
						<div class="list_title1">
							<h4 class="lead"><b>${letter.subject }</b></h4>
						</div>
					</div>
					<div class="pull-right">
						<div class="list_title2">
							<h4 class="lead">${letter.regdate }</h4>
						</div>
					</div>
				</div>
				
				<c:if test="${! empty letter.files }">
				<div style="max-width: 600px;">	
				<c:set var="ext" value="${fn:split(letter.files,'.')}"/>
					<c:choose>
						<c:when test="${ext[1] eq 'jpg' || ext[1] eq 'gif' || ext[1] eq 'png'}">
							<img class="img-responsive" src='<c:url value="/" />uploads/${letter.files }'>
						</c:when>
						<c:otherwise>첨부된 사진 없음</c:otherwise>
					</c:choose>
				</div>	
				</c:if>
				<br>
				
				<div style="max-width: 600px;" class="list_content">
					<br>
					<h5 class="lead">${letter.content }</h5>					
				</div>
				<br>
				
				<c:if test="${! empty letter.startdate }">
				<div class="list_date">
					<h4 class="lead">${letter.startdate } 부터 ${letter.enddate } 까지</h4>
				</div>		
				</c:if>
			
				<div class="pull-left">
					<div class="user_id">
						<h3 class="lead">by <b>${letter.writer }</b></h3>
						
					</div>
				</div>
			
				<!-- 추후 B페이지에서 사용 
				<div class="pull-right">
					<div class="user_write">
						여기에 라디오 버튼으로 공개/비공개 설정
					</div>
				</div>
				 -->
			</div>
		</div>
	<div class="fake-size">
		<p>&nbsp;</p>
	</div>			
	</c:forEach>
</c:if>
    