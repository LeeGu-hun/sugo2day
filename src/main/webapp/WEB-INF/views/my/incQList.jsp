<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:if test="${ empty QSletters }">
<h1>QSletters 커맨드 객체에 담긴 값 없음</h1>
</c:if>

<c:if test="${! empty QSletters }">
<c:forEach var="letter" items="${QSletters }">
	<div class="list_wrapper">
		<div class="list_container">
			<div>
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
				<textarea class="lead" id="content" cols="52" rows="6" style="resize: none; overflow-y:scroll"
					readonly="readonly">${letter.content }</textarea>
				<script type="text/javascript">
				$(function() {
					$('#content').val().replace(/\n/g, "<br>");
				});	
			</script>					
			</div>
			
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
		</div>
	</div>
<div class="fake-size">
	<p>&nbsp;</p>
</div>			
</c:forEach>
</c:if>