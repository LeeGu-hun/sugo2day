<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="wrap_letterReg" style="width: 500px;">
<form:form commandName="letter" class="form-horizontal"
	enctype="multipart/form-data" action="letterWrite" method="post">
	
	<fieldset>		
		<!-- 퀘스트 카테고리 -->
		<!-- option 값을 db에서 가져와서 forEach로 뿌려주는게 가장 좋지만 보류 -->
		<c:if test="${!empty quests}">
		<div id="quest-cate">
			<div id="qtype-space">
				<input type="checkbox" name="l_isquest" id="qsel" value="Y"
					onclick="questToggle()">
				<label for="qsel">Quest</label>
				
				<div id="qlist-space" class="pull-right hidden">
					<select name="l_questcate" id="qlist" style="width: 300px;" required="required">
							<c:forEach var="quest" items="${quests }">
									<option value="${quest.q_title }">
									${quest.q_title } // 기간: ${quest.q_startdate } ~ ${quest.q_enddate }</option>
							</c:forEach>
						
					</select>
				</div>			
			</div>				
		</div>
		</c:if>	
		
		<!-- 공개여부는 숨기기 // 기본값 : 공개글 -->
		<div class="show">	
			<div class="input-group" style="width: 200px;">
				<input type="radio" name="l_isprivate" id="l_isprivate_y" value="Y" checked="checked">
				<label for="l_isprivate_y"> 공개글</label>
				<span style="padding-left: 5px;"></span>
				<input type="radio" name="l_isprivate" id="l_isprivate_n" value="N">
				<label for="l_isprivate_n"> 비공개글</label>
			</div>
		</div>		
		
		<!-- 글쓴이도 숨기기 -->
		<div class="hidden">
			<div class="input-group" style="width: 200px;">
				<form:input path="l_writer" value="${sessionScope.authInfo.name }"
					class="form-control" readonly="true" />
			</div>
		</div>
			
		<!-- 본문 내용 -->		
		<div class="content-area">
			<form:textarea path="l_content" id="l_content" cols="80" rows="8" style="resize: none; overflow-y:scroll;"
					placeholder="4000자 이내로 적어봐" required="true" />
		</div>
		<script type="text/javascript">
			$(function() {
				$('#q_content').val().replace(/\n/g, "<br>");
			});	
		</script>
		
				
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
