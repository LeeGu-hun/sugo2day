<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
		<form:form commandName="letter" id="questFrm" class="form-horizontal"
			method="POST" action="letter/letterWrite">
			<h2 class="form-join-heading">글 작성</h2>
			
			<label>글 종류</label>
			<div class="input-group" style="width: 200px;">
				<form:radiobutton path="isquest" value="0" label="일반글" />
				<form:radiobutton path="isquest" value="1" label="퀘스트글" />
			</div>
			
			<label>공개여부</label>
			<div class="input-group" style="width: 200px;">
				<form:radiobutton path="isprivate" value="0" label="전체공개" />
				<form:radiobutton path="isprivate" value="1" label="나만보기" />
			</div>
			
<!--1  -->
			<div class="input-group" style="width: 200px;">
				<label>글쓴이</label>
				<form:input path="writer" value="${sessionScope.authInfo.name }"
					class="form-control" placeholder="작성자란" readonly="true" />
			</div>
<!--  -->

			<div class="input-group" style="width: 200px;">
				<label>제목</label>
				<form:input path="subject" class="form-control" placeholder="목표 입력" />
				<form:errors path="subject" />
			</div>


			<div class="input-group">
				<label>내용</label>
				<form:textarea path="content" class="form-control" cols="60"
					rows="8" style="resize: none;" placeholder="내용을 입력하세요 최소 300자" />
				<form:errors path="subject" />	
			</div>

			<span> <label>목표 시작일:<input name="startdate"
					id="startdate" class="form-control" class="input-group"
					placeholder="push" /></label> ~ <label>목표 종료일: <input
					name="enddate" id="enddate" class="form-control"
					class="input-group" placeholder="push" /></label>

			</span>
			
			<div class="btn_group btn-group-justified" role="group"></div>
			
 			<div class="input-group">  
 				<label for="inputFiles">파일첨부</label> 
 				<input type="hidden" id="inputFiles">  
  				<form:hidden path="files" class="form-control" value='<%=request.getRealPath("/uploads/") %>' /> 
				<input type="file" name="multiFile" id="multiFile" />  
  			</div>	 
			
			<div>
				<div class="btn-group" role="group">
					<button class="btn btn-primary btn-block" type="button"
						onclick="addBoard();" style="width: 280px;">퀘스트 등록</button>
				</div>
				<div class="btn-group" role="group">
					<button class="btn btn-warning btn-block" type="button"
						onclick="goBack();" style="width: 280px;">등록 취소</button>
				</div>
			</div>
	</form:form>
	