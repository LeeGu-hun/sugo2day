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

/* Letter 공개/비공개 설정 */			
function changeLShow(num, stat) {
	if ($('input:radio[name="stat"]').is(':checked') == true) {
		var cNum = num;
		var cStat = stat;
	}

	console.log("변경할 글의 번호 = " + num);
	console.log("변경할 공개여부 = " + stat);
	
	$.post("letterChangePriv", {
		num: cNum,
		isprivate : cStat
	}, function(data) {
		alert("공개여부 변경 완료");
		window.location.reload(true);
	});	
}			