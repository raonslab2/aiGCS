$(document).ready(function(){
    // data-tab 속성의 값에 따라 메뉴 항목에 selected 클래스를 적용
    $('.menu-item').each(function() {
        var dataTab = $(this).attr('data-tab');
        if (dataTab === '3') {
            $(this).addClass('selected');
        }
    });

	var calendar = new FullCalendar.Calendar(calendarEl, {
	    height: '600px', // 적절한 높이로 설정
	    // 나머지 설정...
	});
});
