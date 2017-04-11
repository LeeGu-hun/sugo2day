<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- 이 페이지는 전체 글 리스트 -->
<!-- lists 는 커맨드 객체 이름(작성된 글이 있을때만 노출)-->
<c:if test="${ empty letters }">
	<h3>글을 작성해 달라</h3>
</c:if>

<c:if test="${! empty letters }">
<!-- 게시글을 주우우욱 보여주기 -->
	<c:forEach var="letter" items="${letters }">
		<ul class="timeline">
		<li>
			<div class="timeline-panel">
				<div class="timeline-heading">
					<h4>${letter.content }</h4>
				</div>
				<div class="timeline-body">
					<ul class="list-inline post-detail">
						<li>${letter.subject }</li>
						<li>by ${letter.writer }</li>
						<li>
							<a>
								<i class="fa fa-calendar"></i>${letter.startdate } ~ 
								<i class="fa fa-calendar"></i>${letter.enddate }
							</a>
						</li>
						<li>
							<c:if test="${! empty letter.files }">
								<div>
									<label>사진</label>
								</div>
								<div>
									<c:set var="ext" value="${fn:split(letter.file,'.')}"/>
									<c:choose>
										<c:when test="${ext[1] eq 'jpg' || ext[1] eq 'gif' || ext[1] eq 'png'}">
											<img class="img-responsive" src='<c:url value="/" />uploads/${letter.file }'>
										</c:when>
									<c:otherwise>첨부된 사진 없음</c:otherwise>
									</c:choose>
								</div>
							</c:if>
						</li>				
					</ul>
				</div>
			</div>
		<li>	
		</ul>
	</c:forEach>
</c:if>
    