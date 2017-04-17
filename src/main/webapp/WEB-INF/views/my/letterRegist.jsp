<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<div class="wrap_letterReg" style="width: 500px;">
<form:form commandName="letter" class="form-horizontal"
	enctype="multipart/form-data" action="letterWrite" method="post">
	
	<fieldset>		
		<!-- 퀘스트 카테고리 -->
		<!-- option 값을 db에서 가져와서 forEach로 뿌려주는게 가장 좋지만 보류 -->
		<div id="quest-cate">
			<div id="qtype-space">
				<input type="checkbox" name="isquest" id="qsel" value="퀘스트글"
					onclick="questToggle()">
				<label>Quest</label>
				<div id="qlist-space" class="pull-right hidden">
					<select name="questcate" id="qlist" style="width: 300px;" required="required">
						<option selected="selected">선택하세요</option>
						<option value="걷기">30분 걷기</option>
						<option value="줄넘기">줄넘기 100개</option>
						<option value="달리기">1km 달리기</option>
					</select>
				</div>			
			</div>				
		</div>
	
		
		<!-- 공개여부는 숨기기 // 기본값 : 공개글 -->
		<div class="hidden">	
			<div class="input-group" style="width: 200px;">
				<input type="radio" name="isprivate" id="isprivate" value="공개글" checked="checked">
				<label> 공개글</label>
				<input type="radio" name="isprivate" id="isprivate" value="비공개">
				<label> 비공개글</label>
			</div>
		</div>		
		
		<!-- 글쓴이도 숨기기 -->
		<div class="hidden">
			<div class="input-group" style="width: 200px;">
				<form:input path="writer" value="${sessionScope.authInfo.name }"
					class="form-control" readonly="true" />
			</div>
		</div>
			
		<!-- 본문 내용 -->		
		<div class="content-area">
			<form:textarea path="content" id="content" cols="80" rows="8" style="resize: none; overflow-y:scroll;"
					placeholder="4000자 이내로 적어봐" required="true" />
		</div>
		<script type="text/javascript">
			$(function() {
				$('#content').val().replace(/\n/g, "<br>");
			});	
		</script>
		
		<!-- Date picker -->
		<div id="datepick-div" class="hidden">
		    <div class="form-group pull-left" style="margin: 0;">
				<div class="input-group date" id="startdate">
					<input size="16" type="text" class="form-control" name="startdate"
						placeholder="목표 시작일" />
					<span class="input-group-addon">
                   		<span class="glyphicon glyphicon-calendar"></span>
              		</span>	
				</div>
			</div>	
	
			<span class="txt-at"> - </span>
			
			<div class="form-group" style="margin: 0;">
				<div class="input-group date" id="enddate">	
					<input size="16" type="text" class="form-control" name="enddate"
						placeholder="목표 종료일" />
					<span class="input-group-addon">
                   		<span class="glyphicon glyphicon-calendar"></span>
              			</span>	
              		</div>	
			</div>
			<script type="text/javascript">
				$(function() {
					$('#startdate').datetimepicker({
						locale: 'ko',
						format: 'L',
						defaultDate: new Date()
					});
					
					$('#enddate').datetimepicker({
						locale: 'ko',
						format: 'L',
						defaultDate: new Date()
					});
				});	
			</script>
			<div class="fake-size-bottom">
				<p>&nbsp;</p>
			</div>	
		</div>		
		
		<div id="letter-bottom" class="pull-right">
		<div class="clearfix"></div>
			<div class="pull-left">
				<div class="filebox bs3-primary preview-image">
					<input type="hidden" id="inputFiles">
					<form:hidden path="upDir" class="form-control"
						value='<%=request.getRealPath("/uploads/")%>' />
		        	<input class="upload-name" value="파일선택" disabled="disabled" style="width: 200px;">
		        	<label for="multiFile">사진선택</label> 
		           	<input type="file" name="multiFile" id="multiFile" class="upload-hidden"> 
		    	</div>
		    </div>	
		   	<div class="pull-right">
		   		<button class="btn btn-default btn-warning" type="submit" style="height: 35px;">등록</button>
		   	</div>
	    </div>
	    <div class="clearfix"></div>   
	    
		<hr>
	</fieldset>	
</form:form>
</div>
