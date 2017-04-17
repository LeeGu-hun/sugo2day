/* Null Check */
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

/* Select option Get */
$(function() {
	$('#select-QList').change(function() {
		var selItem = $("#select-QList option:selected").val();
		var selDefault = $("#select-QList option:selected").text();
		console.log(selItem);
		console.log(selDefault);
				
		if(selDefault != "선택하세요") {
			showSelectedList(selItem);
		}	
	});
});


function showSelectedList(selItem) {
		
    $.post("incQList", {
        questcate : selItem
    }, function(jsonResult) {
    	    	
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
	    		var splitData = '' + jsonResult[i].files + ''; 
	    		var splitImagePath =  splitData.split('.');
	    		console.log(splitImagePath[1]);
	    		if(!isEmpty(jsonResult[i].files)) {
	    			if (splitImagePath[1] != 'jpg' && splitImagePath[1] != 'gif' && splitImagePath[1] != 'png') {	
	 	    			html += '<div style="max-width: 550px; margin-left: auto; margin-right: auto;">';
	 	    			html += '<h5>허용되는 사진 포맷은 jpg, gif, png 입니다.</h5>'
	 	    			html += '</div>';
	    			} else if(!isEmpty(jsonResult[i].files)){
	    				html += '<div style="max-width: 550px; margin-left: auto; margin-right: auto;">';
	    				html += "<img class='img-responsive' src='http://localhost:8080/sugo2day/uploads/" + jsonResult[i].files + "'>";
	    				html += '</div>';
	    			}	
	    		} else if (isEmpty(jsonResult[i].files)) {
	    			html += '<div style="max-width: 550px; margin-left: auto; margin-right: auto;">';
	    			html += '<h5>등록된 사진이 없거나 잘못된 포맷입니다.</h5>';
	    			html += '</div>';
	    		} 
	    		
	    		
	    		
	    		html += '<br>';
	    		
	    		html += '<div style="max-width: 550px; margin-left: auto; margin-right: auto;" class="list_content">';
	    		html += '<textarea class="lead" id="content" cols="52" rows="6" style="resize: none; overflow-y:scroll"';
	    		html += 'readonly="readonly">' + jsonResult[i].content + '</textarea>';
	    		html += '<script type="text/javascript">';
	    		html += '$(function() {';
	    		html += '$("#content").val().replace(/\n/g, "<br>");';
	    		html += '});';
	    		html += '</script>';
	    		html += '</div>';
	    		
	    		html += '<div class="list_date">';
	    		html += '<h4 class="lead"> ' + jsonResult[i].startdate + '  부터 ' + jsonResult[i].enddate + '  까지</h4>';
	    		html += '</div>	';
	    		
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
    	} else if (isEmpty(jsonResult)) {
    		var noQuest = '<h3>선택한 퀘스트 카테고리로 작성한 글이 없습니다.</h3>';
    		$('#qselected-list').html(noQuest);
    	}
    }, 'json');
}    