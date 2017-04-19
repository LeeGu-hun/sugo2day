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
				<div class="pull-left">
					<div>
						<h4 class="lead" style="padding-left: 10px;">Quest : ${quest.q_title }</h4>
					</div>
				</div>
				<br>
				<div style="max-width: 550px; margin-left:auto; margin-right: auto;" class="list_content">
					<textarea class="lead" id="content" cols="52" rows="6" style="resize: none; overflow-y:scroll"
						readonly="readonly" >${quest.q_descript }</textarea>
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
				
				<div class="row" style="margin-left: 0; margin-right: 0; padding-left: 15px;">
					<div class="pull-left" style="max-width: 300px;">
						<h3 class="lead">by <b>${quest.q_writer }</b></h3>
					</div>
					<div class="input-group pull-right" role="group" style="width: 300px; height: 35px;">
						<div class="col-lg-5" style="padding: 0; max-width: 125px;">		
							<div class="input-group">	
								<span class="input-group-addon">
									<input type="radio" name="stat" value="Y" onclick="changeShow(${quest.q_num }, '공개')">
								</span>
									<input type="text" class="form-control" placeholder="공개글" readonly style="width: 88px;">
							</div>
						</div>
						<div class="col-lg-5" style="padding: 0; max-width: 125px;">	
							<div class="input-group">	
								<span class="input-group-addon">
									<input type="radio" name="stat" value="N" onclick="changeShow(${quest.q_num }, '비공개')">
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
    