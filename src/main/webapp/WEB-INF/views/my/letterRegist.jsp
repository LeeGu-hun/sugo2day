<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<div class="wrap_letterReg">

<form:form commandName="letter" class="form-horizontal"
	enctype="multipart/form-data" action="letterWrite" method="post">
	
<fieldset>
	<dl class="list_set">
		<dt class="tit_set">	
			<label>글 종류</label>
		</dt>	
		<dd class="txt_set">
			<div class="input-group" style="width: 200px;">
				<input type="radio" name="isquest" id="isnormal" value="일반글"
					checked="checked" onclick="questToggle()">
				<label> 일반글</label>		
				<input type="radio" name="isquest" id="isquest" value="퀘스트글"
					onclick="questToggle()">
				<label> 퀘스트글</label>		
			</div>
		</dd>
	</dl>		

	<dl class="list_set">
		<dt class="tit_set">
			<label>공개여부</label>
		</dt>
		<dd class="txt_set">	
			<div class="input-group" style="width: 200px;">
				<input type="radio" name="isprivate" id="isprivate" value="공개글" checked="checked">
				<label> 공개글</label>
				<input type="radio" name="isprivate" id="isprivate" value="비공개">
				<label> 비공개글</label>
			</div>
		</dd>
	</dl>		
	
	<dl class="list_set">
		<dt class="tit_set">		    
			<label>글쓴이</label>
		</dt>
		<dd class="txt_set">		
			<div class="input-group" style="width: 200px;">
				<form:input path="writer" value="${sessionScope.authInfo.name }"
					class="form-control" placeholder="" readonly="true" />
			</div>
		</dd>
	</dl>		

	<dl class="list_set">
		<dt class="tit_set">
			<label>제목</label>
		</dt>
		<dd class="txt_set">			
			<div class="input-group" style="width: 200px;">
				<form:input path="subject" class="form-control" placeholder="너무 길게 적지마" />
				<form:errors path="subject" />
			</div>
		</dd>
	</dl>		
	
	<dl class="list_set">
		<dt class="tit_set">
			<label>내용</label>
		</dt>	
		<dd class="txt_set">
			<div class="input-group">
				<form:textarea path="content" class="form-control" cols="60" rows="8"
					style="resize: none;" placeholder="4000자 이내로 적어봐" />
				<form:errors path="content" />
			</div>
		</dd>
	</dl>		
	
	<div id="datepick-div" class="hidden">
		<dl class="list_set">
			<dt class="tit_set">
				<label>기간</label>
			</dt>
			<dd class="txt_set">
				<div class="input-group1">
					<div class="input-append date form_startdate">
						<input size="16" type="text" id="startdate" name="startdate" placeholder="목표 시작일" readonly />
						<span class="add-on"><i class="icon-th"></i></span>
					</div>
					<script type="text/javascript">
						$("#startdate").datetimepicker({
							format: "yyyy-mm-dd hh:ii:ss",
							autoclose: true,
							pickerPosition: "bottom-right"
						});
					</script>
				</div>
				<span class="txt-at"> - </span>
				<div class="input-group2">	
					<div class="input-append date form_enddate">
						<input size="16" type="text" id="enddate" name="enddate" placeholder="목표 종료일" readonly />
						<span class="add-on"><i class="icon-th"></i></span>
					</div>
					<script type="text/javascript">
						$('#enddate').datetimepicker({
							format: "yyyy-mm-dd hh:ii:ss",
							autoclose: true,
							pickerPosition: "bottom-right"
						});
					</script>
				</div>
			</dd>
		</dl>		
	</div>
	
	<dl class="list_set">
		<dt class="tit_set">	
			<label for="inputFiles">파일첨부</label>
		</dt>	
		<dd class="txt_set">
			<input type="hidden" id="inputFiles">
			<form:hidden path="upDir" class="form-control"
				value='<%=request.getRealPath("/uploads/")%>' />
			<input type="file" name="multiFile" id="multiFile" />
		</dd>
	</dl>		
	
	<hr>

	<div class="btn_group btn-group-justified center-block" role="group"
		style="max-width: 210px; ">
		<div class="btn-group" role="group">
			<button class="btn btn-primary btn-block" type="submit"
				style="width: 100px;">글 등록</button>
		</div>
		<div class="btn-group" role="group">
			<button class="btn btn-warning btn-block" type="button"
				style="width: 100px;"onclick="goBack();">등록 취소</button>
		</div>
	</div>
</fieldset>	
</form:form>
</div>
