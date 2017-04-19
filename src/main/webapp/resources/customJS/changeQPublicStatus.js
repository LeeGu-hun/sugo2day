/* Letter 공개/비공개 설정 */			
function changeShow(num, stat){
	if ($('input:radio[name="stat"]').is(':checked') == true) {
		var cNum = num;
		var cStat = stat;
	}

	console.log("변경할 글의 번호 = " + num);
	console.log("변경할 공개여부 = " + stat);
	
	$.post("questChangePriv", {
		num: cNum,
		isprivate : cStat
	}, function(jsonResult) {
		alert("해당글은" + cStat + "로 변환되었습니다");
	}, 'json');
	/* 추후, 공개/비공개 상태 전환 여부 알려주기 추가 */
}			