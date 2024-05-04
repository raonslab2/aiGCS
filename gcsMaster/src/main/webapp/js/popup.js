
//--------------------------------------------------------------------------------------//
//	Function fnPopupOpen(팝업 URL, 팝업화면에 넣길 변수가 정의된 form id) : 팝업화면 오픈	//
//----------------------------------------------------------------------------------=---//
function fnPopupOpen(url, form) {
	
	var data; // 팝업에 넘길 데이터를 담을 변수 정의

	if ($.trim(form).length > 0) {	// 팝업에 넘길 변수가 정의된 form 이 있으면
		var data = $(form).serializeArray(); // 변수에 각 값을 담는다.
	}

	//console.log(data);

	var obj = $("#divPopup");	// 팝업을 보여줄 div 설정
	obj.css("height","100%");	// div의 높이를 100% 설정
	
	obj.load(url, data, function( response, status, xhr ) {	// 팝업정보를 불러온다.
		if ( status == "error" ) {			
			var msg = "다음과 같은 에러가 발생했습니다.\n동일한 에러가 발생하면 시스템 관리자에게 문의하세요.\n\n";
			alert(msg + xhr.status + " " + xhr.statusText);
		} else {

		}

	});
}


function fnPopupClose() {	// 팝업을 닫는다.
	var obj = $("#divPopup");	// 닫을 팝업을 담고 있는 div 설정
	obj.html("");				// 해당 div html 값 삭제
	obj.css("height","0%");		// 해당 div 높이 0% 설정

	$(".ui-timepicker-container").remove(); // 팝업 timepicker kill
}



function fnPopupAddOpen(url, form) {
	
	var data; // 팝업에 넘길 데이터를 담을 변수 정의

	if ($.trim(form).length > 0) {	// 팝업에 넘길 변수가 정의된 form 이 있으면
		var data = $(form).serializeArray(); // 변수에 각 값을 담는다.
	}

	//console.log(data);

	var obj = $("#divAddPopup");	// 팝업을 보여줄 div 설정
	obj.css("height","100%");	// div의 높이를 100% 설정

	obj.load(url, data, function( response, status, xhr ) {	// 팝업정보를 불러온다.
		if ( status == "error" ) {			
			var msg = "다음과 같은 에러가 발생했습니다.\n동일한 에러가 발생하면 시스템 관리자에게 문의하세요.\n\n";
			alert(msg + xhr.status + " " + xhr.statusText);
		} else {

		}

	});
}


function fnPopupAddClose() {	// 팝업을 닫는다.
	var obj = $("#divAddPopup");	// 닫을 팝업을 담고 있는 div 설정
	obj.html("");				// 해당 div html 값 삭제
	obj.css("height","0%");		// 해당 div 높이 0% 설정

	$(".ui-timepicker-container").remove(); // 팝업 timepicker kill
}