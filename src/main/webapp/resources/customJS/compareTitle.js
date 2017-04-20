$(function() {
	$('#q_title').blur(function() {
		var arrT = new Array();
		var chkVal = $(".fCheckSel");
		
		for(i=0; i<chkVal.length; i++) {
			arrT[i] = chkVal[i].value;
		}				
		console.log("blur시점 // 이미 작성된 qTitle : " + arrT);
		
		var inputT = $("#q_title").val().toString();
		console.log("blur시점 // 현재 입력한 qTitle : " + inputT);
		
		var chkResult = parseInt(arrT.indexOf(inputT));
		console.log(chkResult + " : 양수=글작성x / 음수=글작성o");
	
		checkTitleResult(chkResult);
	});			
});

function checkTitleResult(chkResult) {
	if(chkResult >= 0) {
		$("#warn-msg-div").removeClass("hidden");
		$("#warn-msg-div").addClass("show");
		$("#reg-q-btn").attr('disabled', "disabled");
		
		var msg = '주의! 존재하는 퀘스트 제목입니다. 다른 제목으로 작성해주세요';
		$('#warn-msg').html(msg);				
	} else {
		$("#warn-msg-div").removeClass("show");
		$("#warn-msg-div").addClass("hidden");
		$("#reg-q-btn").removeAttr('disabled');
	}
}