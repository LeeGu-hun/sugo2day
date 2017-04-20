<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="wrap_questReg" style="width: 500px;">

<form:form commandName="quest" class="form-horizontal"
	action="questWrite" method="post">
	
	<fieldset>	
		<!-- 퀘스트 제목 -->
		<div class="hidden">
			<c:if test="${empty quests }">
				<h6>quests 못가져왔다</h6>
			</c:if>
			<c:if test="${!empty quests }">
				<h6>quests 가져왔다</h6>
				<c:forEach var="fquest" items="${quests }">
					<input type="checkbox" value="${fquest.q_title }" class="fCheckSel">
				</c:forEach>
			</c:if>
		</div>
		<div class="input-group" style="width: 200px;">
			<input type="text" id="q_title" name="q_title"
				class="form-control"  placeholder="퀘스트 타이틀을 입력하세요"/>
		</div>		
			
		<div id="warn-msg-div"class="hidden">				
			<span id="warn-msg" class="label label-danger label-large"
				style="padding-left: 10px;"></span>
		</div>
			
		<!-- 글쓴이 숨기기 -->
		<div class="hidden">
			<div class="input-group" style="width: 200px;">
				<input type="hidden" name="q_writer" value="${sessionScope.authInfo.name }"
					class="form-control" readonly />
			</div>
		</div>
			
		<!-- 본문 내용 -->		
		<div class="content-area" style="margin-top: 10px;">
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
				<input type="radio" name="q_isprivate" id="q_isprivate_y" value="Y" checked="checked">
				<label for="q_isprivate_y"> 공개</label>
				<span style="padding-left: 5px;"></span>
				<input type="radio" name="q_isprivate" id="q_isprivate_n" value="N">
				<label for="q_isprivate_n"> 비공개</label>
			</div>
		</div>		
		
		<!-- Date picker -->
		<div id="datepick-div">
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
		
		<div id="letter-bottom" class="pull-right">
		<div class="clearfix"></div>
		
		   	<div class="pull-right">
		   		<button id="reg-q-btn" class="btn btn-default btn-warning" type="submit" style="height: 35px;">등록</button>
		   	</div>
	    </div>
	    <div class="clearfix"></div>   
	    
		<hr>
	</fieldset>	
</form:form>
</div>
