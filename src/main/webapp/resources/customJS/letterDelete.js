function letterDelete(num, isprivate) {
	var lnum = parseInt(num);
	var lisprivate = isprivate
	
	console.log(lnum + " = 삭제할 글의 번호")
	console.log(lisprivate + " = 삭제할 글의 공개여부")
	
	if(lisprivate == 'Y') {
		alert('비공개 게시글만 삭제할 수 있습니다!');
	} 
	
	if(lisprivate == 'N') {
		deleteL(lnum);
	}
}	
	
function deleteL(lnum) {
	if($('input:checkbox[name="l-del-chk"]').is(':checked') == false) {
		alert("게시글 삭제 확인을 하지 않았습니다.");
	} else {		
		$.post("letterDelete", {
			gNum : lnum
		}, function(data) {
			alert("글 삭제를 완료했습니다");
			window.location.reload(true);
		});		
	}
}