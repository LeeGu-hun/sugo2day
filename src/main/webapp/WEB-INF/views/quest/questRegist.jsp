<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<div class="wrap_questReg" style="width: 500px;">
<form:form commandName="quest" class="form-horizontal"
	action="questWrite" method="post">
	
	<fieldset>	
		<div class="input-group" style="width: 200px;">
				<input type="text" id="q_title" name="q_title"
					class="form-control"  placeholder="퀘스트 타이틀을 입력하세요"/>
			</div>
		<br/>

		<!-- 글쓴이 숨기기 -->
		<div class="hidden">
			<div class="input-group" style="width: 200px;">
				<input type="hidden" name="q_writer" value="${sessionScope.authInfo.name }"
					class="form-control" readonly />
			</div>
		</div>
			
		<!-- 본문 내용 -->		
		<div class="content-area">
			<form:textarea path="q_descript" id="q_descript" cols="80" rows="8" style="resize: none; overflow-y:scroll;"
					placeholder="어떠한 내용의 퀘스트인지 설명해" required="true" />
		</div>
		<script type="text/javascript">
			$(function() {
				$('#q_descript').val().replace(/\n/g, "<br>");
			});	
		</script>
		
		
		
		<!-- 공개여부 // 기본값 : 공개글 -->
		<div class="show">	
			<div class="input-group" style="width: 200px;">
				<input type="radio" name="q_isprivate" id="q_isprivate" value="공개글" checked="checked">
				<label> 공개글</label>
				<input type="radio" name="q_isprivate" id="q_isprivate" value="공개글">
				<label> 비공개글</label>
			</div>
		</div>		
		
		<!-- Date picker -->
		<div id="datepick-div" class="hidden">
		    <div class="form-group pull-left" style="margin: 0;">
				<div class="input-group date" id="startdate">
					<input size="16" type="text" class="form-control" name="q_startdate"
						placeholder="목표 시작일" />
					<span class="input-group-addon">
                   		<span class="glyphicon glyphicon-calendar"></span>
              		</span>	
				</div>
			</div>	
	
			<span class="txt-at"> - </span>
			
			<div class="form-group" style="margin: 0;">
				<div class="input-group date" id="enddate">	
					<input size="16" type="text" class="form-control" name="q_enddate"
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
		
		<!-- Ajax 처리 필요.. 18 -->
		<div style="width: 550px;">
			<select id="q_maincate" name="q_maincate" style="width: 150px;">
				<option value="0" selected="selected">대분류</option>
				<option value="1">운동</option>
				<option value="2">공부</option>
				<option value="3">저축</option>
			</select>
			<span style="padding-left: 5px;"></span>
			<select id="q_subcate" name="q_subcate" style="width: 150px;"></select>
		</div>				
	
	
		<div id="letter-bottom" class="pull-right">
		<div class="clearfix"></div>
		
		   	<div class="pull-right">
		   		<button class="btn btn-default btn-warning" type="submit" style="height: 35px;">등록</button>
		   	</div>
	    </div>
	    <div class="clearfix"></div>   
	    
		<hr>
	</fieldset>	
</form:form>
</div>
