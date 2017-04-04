$(function() {
		$("#STARTDATE, #ENDDATE").datepicker(
				{
					dateFormat : 'yymmdd',
					prevText : '이전 달',
					nextText : '다음 달',
					monthNames : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월',
							'8월', '9월', '10월', '11월', '12월' ],
					monthNamesShort : [ '1월', '2월', '3월', '4월', '5월', '6월',
							'7월', '8월', '9월', '10월', '11월', '12월' ],
					dayNames : [ '일', '월', '화', '수', '목', '금', '토' ],
					dayNamesShort : [ '일', '월', '화', '수', '목', '금', '토' ],
					dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ],
					showMonthAfterYear : true,
					yearSuffix : '년'

				});

	});

	function addBoard() {
		document.getElementById("questFrm").submit();
	}

	function goBack() {
		location.href = "<c:url value='/quest/questList' />";
	}
	function sang() {alert("난이도 상 을 선택 하셨습니다.");}
	function jung() {alert("난이도 중 을 선택 하셨습니다.");}
	function ha() {}
	
	$(document).ready(function(){
	
	});