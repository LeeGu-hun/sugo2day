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
		var selItemT = $("#select-QList option:selected").val();
		console.log(selItemT + " = l_questcate");
		
		if(selItemT != "X") {
			showSelectedList(selItemT);
		}	
	});
});


function showSelectedList(selItemT) {
		
    $.post("incQList", {
      title : selItemT
   }, function(jsonResult) {
    	    	
    	$("#all-list").removeClass("show");
    	$("#all-list").addClass("hidden");
    	$("#letter-manage").removeClass("show");
    	$("#letter-manage").addClass("hidden");
    	
    	$("#qselected-list").removeClass("hidden");
    	$("#qselected-list").addClass("show");

    	if(!isEmpty(jsonResult)) {
	    	
	    	var html = '';
	    		
	    	for(var i = 0 ; i < jsonResult.length ; i++) {
	    		html += '<div class="list_wrapper">';
	    		html += '<div class="list_container">';
	    		html += '<div>';
	    		html += '<div class="pull-left">';
	    		html +=	'<h4 class="lead" style="padding-left: 10px;">Quest : ' + jsonResult[i].l_questcate + '</h4>';
	    		html += '</div>';	    		
	    		html += '</div>';
	    		var splitData = '' + jsonResult[i].l_files + ''; 
	    		var splitImagePath =  splitData.split('.');
	    		console.log(splitImagePath[1]);
	    		if(!isEmpty(jsonResult[i].l_files)) {
	    			if (splitImagePath[1] != 'jpg' && splitImagePath[1] != 'gif' && splitImagePath[1] != 'png') {	
	 	    			html += '<div style="max-width: 550px; margin-left: auto; margin-right: auto;">';
	 	    			html += '<br>';
		    			html += '<br>';
	 	    			html += '<h5>허용되는 사진 포맷은 jpg, gif, png 입니다.</h5>'
	 	    			html += '</div>';
	    			} else if(!isEmpty(jsonResult[i].l_files)){
	    				html += '<br>';
	    				html += '<br>';
	    				html += '<div style="max-width: 550px; margin-left: auto; margin-right: auto;">';
	    				html += "<img class='img-responsive' src='http://localhost:8080/sugo2day/uploads/" + jsonResult[i].l_files + "'>";
	    				html += '</div>';
	    			}	
	    		} else if (isEmpty(jsonResult[i].l_files)) {
	    			html += '<div style="max-width: 550px; margin-left: auto; margin-right: auto;">';
	    			html += '<br>';
	    			html += '<br>';
	    			html += '<h5>등록된 사진이 없습니다</h5>';
	    			html += '</div>';
	    		} 
	    		
	    		html += '<br>';
	    		
	    		html += '<div style="max-width: 550px; margin-left: auto; margin-right: auto;" class="list_content">';
	    		html += '<textarea class="lead" id="content" cols="52" rows="6" style="resize: none; overflow-y:scroll"';
	    		html += 'readonly="readonly">' + jsonResult[i].l_content + '</textarea>';
	    		html += '<script type="text/javascript">';
	    		html += '$(function() {';
	    		html += '$("#content").val().replace(/\n/g, "<br>");';
	    		html += '});';
	    		html += '</script>';
	    		html += '</div>';
	    		
	    		html += '<div class="pull-right">';
	    		html += '<div class="user_id">';
	    		html += '<h3 class="lead">by <b> ' + jsonResult[i].l_writer + ' </b></h3>';
	    		html += '</div>';
	    		html += '</div>';
	    		html += '</div>';
	    		html += '</div>';
	    		html += '<div class="fake-size">';
	    		html += '<p>&nbsp;</p>';
	    		html += '</div>';    		
	    		html += '</div>';
	    	}
	    	$('#qselected-list').html(html);   
    	} else if (isEmpty(jsonResult)) {
    		var noQuest = '<h3>선택한 퀘스트 카테고리로 작성한 글이 없습니다.</h3>';
    		$('#qselected-list').html(noQuest);
    	}
    }, 'json');
}    