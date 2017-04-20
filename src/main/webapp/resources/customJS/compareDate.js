$(function() {
	$('#qlist').change(function() {
		var originDate = $("#qlist option:selected").text();
		var splitDate = originDate.split('~');
		var selectedOpt = splitDate[1].trim();
		var separateSO = selectedOpt.split('-');
		var qDate = parseInt(separateSO[0] + separateSO[1] + separateSO[2]);
		
		dateCompare(qDate);
	});
});

function dateCompare(qDate) {
							
	var nowDate = new Date().toISOString().substr(0, 10).replace('T', ' ');
	var separateND = nowDate.split('-');
	var lDate = parseInt(separateND[0] + separateND[1] + separateND[2]);
	
	var compareV = parseInt(qDate - lDate);
	
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