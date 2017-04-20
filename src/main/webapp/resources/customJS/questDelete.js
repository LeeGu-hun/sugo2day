function questDelete(num, isprivate, title) {
	var qtitle = title;
	var qnum = num;
	var qisprivate = isprivate
	
	console.log(qtitle + " = 삭제할 글의 타이틀");
	console.log(qnum + " = 삭제할 글의 번호")
	console.log(qisprivate + " = 삭제할 글의 공개여부")
	
	if(qisprivate == 'Y') {
		alert('비공개 퀘스트만 삭제할 수 있습니다!');
	} 
	
	if(qisprivate == 'N') {
		deleteQ(qtitle);
	}
}	
	
function deleteQ(qtitle) {
	if($('input:checkbox[name="q-del-chk"]').is(':checked') == false) {
		alert("퀘스트 삭제 확인을 하지 않았습니다.");
	} else {	
		console.log(qtitle + " = 삭제할 글의 title");
		
		$.post("questDelete", {
			gTitle : qtitle
		}, function(data) {
			alert("글 삭제를 완료했습니다");
			window.location.reload(true);
		});		
	}
}