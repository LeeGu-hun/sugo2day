			
function changeShow(num, stat){
	if ($('input:radio[name="stat"]').is(':checked') == true) {
		var num = num;
		var stat = stat;
	}

	console.log("변경할 글의 번호 = " + num);
	console.log("변경할 공개여부 = " + stat);
	
    $.ajax({
        url: 'letterOnpriv',
		type: 'POST',
		data: { 'num': num, 
				'isprivate': stat
		},
		dataType: 'json',
		success: function(responseData, textStatus, jqXHR) {
        	console.log(responseData);
        	console.log(textStatus);
        	console.log(jqXHR.status);
    	},
    	error: function(jqXHR, textStatus, errorThrown) {
    		var errorMsg = 'status(code): ' + jqXHR.status + '\n';
		        errorMsg += 'statusText: ' + jqXHR.statusText + '\n';
		        errorMsg += 'responseText: ' + jqXHR.responseText + '\n';
		        errorMsg += 'textStatus: ' + textStatus + '\n';
		        errorMsg += 'errorThrown: ' + errorThrown;
		    console.log(errorMsg);    
		        
    	}
    });
}			