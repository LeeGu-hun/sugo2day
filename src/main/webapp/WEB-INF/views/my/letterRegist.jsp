<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>	
	
<form:form commandName="letter" class="form-horizontal"
	enctype="multipart/form-data" action="letterWrite" method="post">
	<h4 class="form-join-heading">글을 등록하세요</h4>

	<label>글 종류</label>
	<div class="input-group" style="width: 200px;">
		<form:checkbox path="isquest" value="퀘스트글" label="퀘스트글" />
	</div>

	<label>공개여부</label>
	<div class="input-group" style="width: 200px;">
		<form:checkbox path="isprivate" value="비공개" label="비공개" />
	</div>
	
	<div class="input-group" style="width: 200px;">
		<div class="pull-left" style="width: 88px;">	
			<input size="10" type="text" id="startdate" placeholder="목표 시작일" readonly />
		</div>
		<span class="lead" style="width: 2px;"> ~ </span>
		<div class="pull-right" style="width: 88px;">
			<input size="10" type="text" id="enddate" placeholder="목표 종료일" readonly />
		</div>
	</div>
		    
	<div class="input-group" style="width: 200px;">
		<label>글쓴이</label>
		<form:input path="writer" value="${sessionScope.authInfo.name }"
			class="form-control" placeholder="작성자란" readonly="true" />
	</div>

	<div class="input-group" style="width: 200px;">
		<label>제목</label>
		<form:input path="subject" class="form-control" placeholder="목표 입력" />
		<form:errors path="subject" />
	</div>

	<div class="input-group">
		<label>내용</label>
		<form:textarea path="content" class="form-control" cols="60" rows="8"
			style="resize: none;" placeholder="내용을 입력하세요 최소 300자" />
		<form:errors path="subject" />
	</div>
	
	<div class="input-group">
		<label for="inputFiles">파일첨부</label> <input type="hidden"
			id="inputFiles">
		<form:hidden path="upDir" class="form-control"
			value='<%=request.getRealPath("/uploads/")%>' />
		<input type="file" name="multiFile" id="multiFile" />
	</div>

	<div class="btn_group btn-group-justified" role="group" style="width: 210px;">
		<div class="btn-group" role="group">
			<button class="btn btn-primary btn-block" type="submit"
				style="width: 100px;">글 등록</button>
		</div>
		<div class="btn-group" role="group">
			<button class="btn btn-warning btn-block" type="button"
				style="width: 100px;"onclick="goBack();">등록 취소</button>
		</div>
	</div>
</form:form>
