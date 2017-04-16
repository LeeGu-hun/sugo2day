
$(function() {
	$('#select-QList').change(function() {
		var selItem = $("#select-QList option:selected").val();
		var selDefault = $("#select-QList option:selected").text();
		console.log(selItem);
		console.log(selDefault)
		
		if(selDefault != "선택하세요") {
			showSelectedList(selItem);
		}
		
		
		
	});
});

function showSelectedList(selItem) {
    $.post("incQList", {
        questcate : selItem
    }, function(jsonResult) {
    	var isEmpty = function(value) {
			if (value == ""
					|| value == null
					|| value == undefined
					|| (value != null
							&& typeof value == "object" && !Object
							.keys(value).length)) {
				return true
			} else {
				return false
			}
		};
    	
    	
    	$("#all-list").removeClass("show");
    	$("#all-list").addClass("hidden");
    	
    	$("#qselected-list").removeClass("hidden");
    	$("#qselected-list").addClass("show");

    	if(!isEmpty(jsonResult)) {
	    	
	    	var html = '<div class="list_wrapper">';
	    		
	    	for(var i = 0 ; i < jsonResult.length ; i++) {
	    		html += '<div class="list_container">';
	    		html += '<div class="pull-right">';
	    		html += '<div class="list_title2">';
	    		html += '<h4 class="lead">' + jsonResult[i].regdate + '</h4>';
	    		html += '</div>';
	    		html += '</div>';
	    		html += '<c:if test="${' + jsonResult[i].files + ' == null}">';
	    		html += '<div style="max-width: 600px;">';
	    		html += '<c:set var="ext" value="${fn:split(' + jsonResult[i].files + ',".")}"/>';
	    		html += '<c:choose>';
	    		html += '<c:when test="${ext[1] eq "jpg" || ext[1] eq "gif" || ext[1] eq "png"}">';
	    		html += "<img class='img-responsive' src='http://localhost:8080/sugo2day/uploads/" + jsonResult[i].files + "'>";
	    		html += '</c:when>';
	    		html += '<c:otherwise>첨부된 사진 없음</c:otherwise>';
	    		html += '</c:choose>';
	    		html += '</div>';
	    		html += '</c:if>';
	    		html += '<br>';
	    		html += '<div style="max-width: 600px;" class="list_content">';
	    		html += '<textarea class="lead" id="content" cols="52" rows="6" style="resize: none; overflow-y:scroll"';
	    		html += 'readonly="readonly">' + jsonResult[i].content + '</textarea>';
	    		html += '<script type="text/javascript">';
	    		html += '$(function() {';
	    		html += '$("#content").val().replace(/\n/g, "<br>");';
	    		html += '});';
	    		html += '</script>';
	    		html += '</div>';
	    		html += '<c:if test="! empty ' + jsonResult[i].startdate + '">';
	    		html += '<div class="list_date">';
	    		html += '<h4 class="lead"> ' + jsonResult[i].startdate + '  부터 ' + jsonResult[i].enddate + '  까지</h4>';
	    		html += '</div>	';
	    		html += '</c:if>';
	    		html += '<div class="pull-left">';
	    		html += '<div class="user_id">';
	    		html += '<h3 class="lead">by <b> ' + jsonResult[i].writer + ' </b></h3>';
	    		html += '</div>';
	    		html += '</div>';
	    		html += '</div>';
	    		html += '</div>';
	    		html += '<div class="fake-size">';
	    		html += '<p>&nbsp;</p>';
	    		html += '</div>';    		
	    	}
	    	html += '</div>';
	    	$('#qselected-list').html(html);   
    	} 
    	
    	if (isEmpty(jsonResult)) {
    		var noQuest = '<h3>선택한 퀘스트 카테고리로 작성한 글이 없습니다.</h3>';
    		$('#qselected-list').html(noQuest);
    	}
    }, 'json');
}    