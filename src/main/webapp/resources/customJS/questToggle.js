function questToggle() {
	var q = $('input:checkbox[id="qsel"]').val();
		if ($('input:checkbox[id="qsel"]').is(":checked") == true) {
			q = "퀘스트글";
			console.log(q);
			$("#qlist-space").removeClass("hidden");
			$("#qlist-space").addClass("show");
			$("#datepick-div").removeClass("hidden");
			$("#datepick-div").addClass("show");
		} 
		
		if ($('input:checkbox[id="qsel"]').is(":checked") == false) {
			q = "일반글";
			console.log(q);
			$("#qlist-space").removeClass("show");
			$("#qlist-space").addClass("hidden");
			$("#datepick-div").removeClass("show");
			$("#datepick-div").addClass("hidden");
		}
		
}