function questToggle() {
	if ($('input:radio[id="isquest"]').is(":checked") == true && $('input:radio[id="isnormal"]').is(":checked") == false) {
		$("#datepick-div").removeClass("hidden");
		$("#datepick-div").addClass("show");
	} else if ($('input:radio[id="isquest"]').is(":checked") == false && $('input:radio[id="isnormal"]').is(":checked") == true) {
		$("#datepick-div").removeClass("show");
		$("#datepick-div").addClass("hidden");
	} else {
		$("#datepick-div").removeClass("show");
		$("#datepick-div").addClass("hidden");
	}
}