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
					<div style="margin-left: 10px;" id="show_title">
					<c:if test="${letter.l_isquest == 'Y' }">
						<h4 class="lead">${letter.q_title }</h4> 
					</c:if>
					</div>
					<div class="pull-right">
						<div class="list_title2">
							<h4 class="lead">${letter.l_regdate }</h4>
						</div>
					</div>
				</div>
				
				<c:if test="${! empty letter.l_files }">
				<div style="max-width: 550px; margin-left: auto; margin-right: auto;">	
				<c:set var="ext" value="${fn:split(letter.l_files,'.')}"/>
					<c:choose>
						<c:when test="${ext[1] eq 'jpg' || ext[1] eq 'gif' || ext[1] eq 'png'}">
							<img class="img-responsive" src='<c:url value="/" />uploads/${letter.l_files }'>
						</c:when>
						<c:otherwise>첨부된 사진 없음</c:otherwise>
					</c:choose>
				</div>	
				</c:if>
				
				<div style="max-width: 550px; margin-left:auto; margin-right: auto;" class="list_content">
					<textarea class="lead" id="content" cols="52" rows="6" style="resize: none; overflow-y:scroll"
						readonly="readonly">${letter.l_content }</textarea>
					<script type="text/javascript">
					$(function() {
						$('#content').val().replace(/\n/g, "<br>");
					});	
				</script>					
				</div>
			
				<div class="pull-left">
					<div class="user_id">
						<h3 class="lead">by <b>${letter.l_writer }</b></h3>
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
    