$(function() {
	$('#qlist').change(function() {
		var originDate = $("#qlist option:selected").text();
		var splitDate = originDate.split('~');
		var selectedOpt = splitDate[1].trim();
		var separateSO = selectedOpt.split('-');
		var qDate = parseInt(separateSO[0] + separateSO[1] + separateSO[2]);
		console.log(qDate + " = 선택한 퀘스트의 EndDate를 parseInt");
		
		dateCompare(qDate);
	});
});

function dateCompare(qDate) {
							
	var nowDate = new Date().toISOString().substr(0, 10).replace('T', ' ');
	console.log(nowDate + " = 지금시간 yyyy-mm-dd 형식")
	var separateND = nowDate.split('-');
	var lDate = parseInt(separateND[0] + separateND[1] + separateND[2]);
	console.log(lDate + " = 글 작성하는 지금 시간 parseInt 후");
	
	var compareV = parseInt(qDate - lDate);
	console.log(compareV + " = enddate - nowdate")
	
	if(compareV < 0) {
		$("#warn-msg-div").removeClass("hidden");
		$("#warn-msg-div").addClass("show");
		$("#letter-reg-btn").attr('disabled', "disabled");
		
		var msg = '주의! 이미 종료된 퀘스트입니다. 선택한 퀘스트 관련 글을 작성할 수 없습니다.';
		$('#warn-msg').html(msg);
	} else {
		$("#warn-msg-div").removeClass("show");
		$("#warn-msg-div").addClass("hidden");
		$("#letter-reg-btn").removeAttr('disabled');
	}	
}	