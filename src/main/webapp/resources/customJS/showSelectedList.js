$(function() {
	$('select').change(function() {
		var selItem = $("#select-QList option:selected").val();
		console.log(selItem);
		showSelectedList(selItem);
	});
});

function showSelectedList(selItem) {
    $.post("incQList", {
        questcate : selItem
    }, function(result) {
    	$.post("./incQList.jsp", {
    		QSletters: result,
    	}, function(htmlResult) {
    		$('#qselected-list').html(htmlResult);
    	});
    }	
}
