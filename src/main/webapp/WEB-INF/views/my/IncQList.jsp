<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!-- 이 페이지는 퀘스트 글 리스트 -->
<!-- lists 는 커맨드 객체 이름(작성된 글이 있을때만 노출)-->
<c:if test="${! empty letter }">
<!-- 게시글을 주우우욱 보여주기 -->
	<c:forEach var="letters" items="${letter }">
		<ul class="timeline">
			<div class="timeline-panel">
				<div class="timeline-heading">
					<h3>
						<a href="#">${letters.subject }</a>
					</h3>
				</div>
				<div class="timeline-body">
					<ul class="list-inline post-detail">
						<li>by 
							<a href="#">${letters.writer }</a>
						</li>
						<li>
							<a>
								<i class="fa fa-calendar"></i>${letters.startdate } ~ 
								<i class="fa fa-calendar"></i>${letters.enddate }
							</a>
						</li>
						<li>
							<c:if test="${! empty letters.file }">
								<div>
									<label>사진</label>
								</div>
								<div>
									<c:set var="ext" value="${fn:split(letters.file,'.')}"/>
									<c:choose>
										<c:when test="${ext[1] eq 'jpg' || ext[1] eq 'gif' || ext[1] eq 'png'}">
											<img class="img-responsive" src='<c:url value="/" />uploads/${letters.file }'>
										</c:when>
									<c:otherwise>첨부된 사진 없음</c:otherwise>
									</c:choose>
								</div>
							</c:if>
						</li>				
					</ul>
				</div>
			</div>
		</ul>
	</c:forEach>
</c:if>    