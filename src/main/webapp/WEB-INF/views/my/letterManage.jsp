<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- 내 글 관리 페이지 -->
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
					<c:if test="${letter.l_isquest == 'Y' }">
					<c:if test="${letter.l_questcate != 'null' }">
					<div class="pull-left" id="show_title">
						<h4 class="lead" style="padding-left: 10px;">Quest : ${letter.l_questcate }</h4> 
					</div>
					<br><br>
					</c:if>
					</c:if>					
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
				<br>
				<div style="max-width: 550px; margin-left:auto; margin-right: auto;" class="list_content">
					<textarea class="lead" id="content" cols="52" rows="6" style="resize: none; overflow-y:scroll"
						readonly="readonly">${letter.l_content }</textarea>
					<script type="text/javascript">
						$(function() {
							$('#content').val().replace(/\n/g, "<br>");
						});	
					</script>	
				</div>
				
				<c:if test="${empty letter.l_files }">
				<div>
					<br>
				</div>
				</c:if>					
								
				<div class="row" style="margin-left: 0; margin-right: 0; padding-left: 15px;">
					<div class="pull-left" style="max-width: 300px;">
						<h3 class="lead">by <b>${letter.l_writer }</b></h3>
					</div>
					<div class="input-group pull-right" role="group" style="width: 300px; height: 35px;">
						<div class="col-lg-5" style="padding: 0; max-width: 125px;">		
							<div class="input-group">	
								<span class="input-group-addon">
									<input type="radio" name="stat" value="Y" onclick="changeLShow(${letter.l_num }, 'Y')">
								</span>
									<input type="text" class="form-control" placeholder="공개글" readonly style="width: 88px;">
							</div>
						</div>
						<div class="col-lg-5" style="padding: 0; max-width: 125px;">	
							<div class="input-group">	
								<span class="input-group-addon">
									<input type="radio" name="stat" value="N" onclick="changeLShow(${letter.l_num }, 'N')">
								</span>
									<input type="text" class="form-control" placeholder="비공개" readonly style="width: 88px;">
							</div>
						</div>
					</div>
				</div>
				<div class="pull-right" style="margin-top:10px; max-width: 300px;">
					<input type="checkbox" name="l-del-chk" id="${letter.l_num }">
					<label for="${letter.l_num }" class="label label-danger label-large" style="margin-right: 5px;">이 글을 삭제합니다</label>
							
					<button id="l-del-btn" type="button" class="btn btn-xs btn-default"
						onclick="letterDelete(${letter.l_num}, '${letter.l_isprivate }')">삭제</button>
				</div>	
			</div>
		</div>
	<div class="fake-size">
		<p>&nbsp;</p>
	</div>			
	</c:forEach>
</c:if>
    