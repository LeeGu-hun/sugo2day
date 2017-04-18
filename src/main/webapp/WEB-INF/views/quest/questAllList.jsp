<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- 이 페이지는 전체 글 리스트 -->
<!-- letters 는 커맨드 객체 이름(작성된 글이 있을때만 노출)-->
<c:if test="${ empty quests }">
<div class="fake-size-top">
	<p>&nbsp;</p>
</div>
	<h3>작성된 글이 없습니다</h3>
</c:if>

<c:if test="${! empty quests}">

<!-- 게시글을 주우우욱 보여주기 -->
	<c:forEach var="quest" items="${quests}">
		<div class="list_wrapper">
			<div class="list_container">
				<div>
					<div class="pull-right">
						<div class="list_title2">
							<h4 class="lead">${quest.q_regdate }</h4>
						</div>
					</div>
				</div>
				<br>
				<div style="max-width: 550px; margin-left:auto; margin-right: auto;" class="list_content">
					<textarea class="lead" id="content" cols="52" rows="6" style="resize: none; overflow-y:scroll"
						readonly="readonly">${quest.q_content }</textarea>
					<script type="text/javascript">
					$(function() {
						$('#content').val().replace(/\n/g, "<br>");
					});	
				</script>					
				</div>
				
				<c:if test="${! empty quest.q_startdate }">
				<div class="list_date">
					<h4 class="lead">${quest.q_startdate } 부터 ${quest.q_enddate } 까지</h4>
				</div>		
				</c:if>
				<c:if test="${empty quest.q_startdate }">
				<div class="list_date">					
				</div>		
				</c:if>
			
				<div class="pull-left">
					<div class="user_id">
						<h3 class="lead">by <b>${quest.q_writer }</b></h3>
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
    