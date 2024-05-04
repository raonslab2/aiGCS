var apiUrl = 'https://translation.googleapis.com/language/translate/v2?key=YOUR_API_KEY';

  $(document).ready(function() {
    // Google Cloud Translation API URL
    
	
	    // data-tab 속성의 값에 따라 메뉴 항목에 selected 클래스를 적용
	    $('.menu-item').each(function() {
	        var dataTab = $(this).attr('data-tab');
	        if (dataTab === '4') {
	            $(this).addClass('selected');
	        }
	    });

        // 현재 날짜를 가져오는 함수
        function getCurrentDate() {
            var today = new Date();
            var year = today.getFullYear();
            var month = (today.getMonth() + 1).toString().padStart(2, '0');
            var day = today.getDate().toString().padStart(2, '0');
            return year + "-" + month + "-" + day;
        }

        // 시작일과 종료일 input 요소의 기본값을 오늘 날짜로 설정
        $("#start-date").val(getCurrentDate());
        $("#end-date").val(getCurrentDate());

        //first js Load
        initDataList();

      // 페이지가 로딩될 때 messageInput 요소에 포커스를 설정
      $("#messageInput").focus();
    });


//js first start
var initDataList = function() {
 
 

	// 스크롤을 맨 아래로 이동
	$('.chat-box').scrollTop($('.chat-box')[0].scrollHeight);
	
	//
	sendMessage();
	
};

$(document).on("click", ".rawClass", function() {
    // 클릭된 tr 요소에 대한 처리
    // 예를 들어, 클릭된 tr 요소의 데이터를 가져와서 처리하는 등의 작업을 수행할 수 있음
 

});

 
 
 

var pageView = function(row) { 
	var requester = row.twRequester;
	var subject = row.twSubject.length > 10 ? row.twSubject.substring(0, 10) + '..' : row.twSubject;
	var requestDate = row.twRequestDate;
	
	var data = "<tr class=\"rawClass\" data-page="+row.twPk+" >\r\n" +
	           "  <td>"+requester+"</td>\r\n" +
	           "  <td>"+subject+"</td>\r\n" +
	           "  <td>"+requestDate+"</td>\r\n" +
	           "</tr>"; 
	return $(data);
};

var paginationView = function(page) {
	 var data = "" ;
 
	 	data = 
		'	<li class="first"><a class="pageClass" data-page="' + page.firstPageNo + '" title="첫 페이지 바로가기"><img src="/images/bbs_prev02.gif" alt="첫 페이지" style="margin: 2px;"></a></li>' +
		'	<li class="prev"><a class="pageClass" data-page="' + (page.currentPageNo-1) + '" title="이전 페이지(1page) 바로가기"><img src="/images/bbs_prev01.gif" alt="이전 페이지" style="margin: 2px;"></a></li>' ;
		
		for (var i=page.firstPageNoOnPageList; i <= page.lastPageNoOnPageList; i++) {
			data = data +
				'<li class=' + i + '><a class="pageClass" data-page="' + i + '" title="' + i + '페이지 바로가기">' + i + '</a></li>' ;
		}
		
		data = data +
			'<li class="next"><a class="pageClass" data-total_page_count="' + page.totalPageCount + '" data-page="' + (page.currentPageNo+1) + '" title="다음 페이지(11page) 바로가기"><img src="/images/bbs_next01.gif" alt="다음 페이지" style="margin: 2px;"></a></li>' +
			'<li class="last"><a class="pageClass" data-page="' + page.lastPageNo + '" title="끝 페이지(67page) 바로가기"><img src="/images/bbs_next02.gif" alt="마지막 페이지" style="margin: 2px;"></a></li>' ;
	 
	return $(data);
 };

$(document).on('click', '.pageClass', function() {
	var page = $(this).data('page');
	var totalPageCnt = $(this).data('total_page_count');
	console.log(totalPageCnt);
	if (page > totalPageCnt) {
		return false;
	}
	if (page == 0) {
		return false;
	}
	$("#page").val(page);
	console.log($("#page").val());
	
	//Data List
	selectTodayWork900();
	
});

//work History list
var selectTodayWorkHistoryList = function() {
	 
  
	
};
//sendMessage
var sendMessage = function() {
    // Send 버튼 클릭 시 이벤트 처리
    var messageInput = $("#messageInput");
 
    $("#sendButton").click(function() {
		if(typeof messageInput == "undefined" || messageInput == "" || messageInput == null){
			console.log("AAAAA");
		}else{
			console.log("BBBBBBB");
			msgTranslate(messageInput,apiUrl);
			console.log("CCCC");
		}
        sendMessage(messageInput);
    });

    // 텍스트 입력 후 엔터 키 누를 때 이벤트 처리
    $("#messageInput").keypress(function(event) {
        if (event.which === 13) { // 엔터 키 코드

			if(typeof messageInput == "undefined" || messageInput == "" || messageInput == null){
				console.log("AAAAA");
			}else{
				console.log("BBBBBBB");
				msgTranslate(messageInput,apiUrl);
				console.log("CCCC");
			}
            sendMessage(messageInput);
        }
    });
 
	// 메시지를 보내는 함수
	function sendMessage(messageInput) {
	    
	    var messageText = messageInput.val().trim(); // 메시지 입력란의 텍스트 가져오기
	
	    if (messageText !== "") {
	        var chatBox = $(".chat-box"); // 채팅 박스 요소 가져오기
	        var messageElement = $('<div class="message sent">' +
	                                '<div class="message-sender">You</div>' +
	                                '<div class="message-text">' + messageText + '</div>' +
	                                '<div class="message-time">' + getCurrentTime() + '</div>' +
	                              '</div>');
	        chatBox.append(messageElement); // 새로운 메시지 요소 추가
	
	        // 채팅 박스를 아래로 스크롤
	        chatBox.scrollTop(chatBox.prop("scrollHeight"));
	
	        // 메시지 입력란 초기화
	        messageInput.val("");
	
	        // 페이지의 모든 세로 스크롤을 아래로 이동
	        $('html, body').animate({ scrollTop: $(document).height() }, "slow");

           $("#messageInput").focus();
	    }
	}
 
 
};

var msgTranslate = function(messageInput,apiUrl) {
    // 번역 요청
    console.log(messageInput.val().trim());
 
	$.ajax({
		url : apiUrl
		, type : 'post'
        , data: {
            q: messageInput.val().trim(),
            source: 'en', // 번역할 언어 (예: 영어)
            target: 'ru' // 번역될 언어 (예: 러시아어)
        }
	}).done(function(res) { 
            // 번역된 결과 처리
            //var translatedText = res.data.translations[0].translatedText;
            //console.log(translatedText);

	}).fail(function() {
		//alert("fail");
	});
 

 
};
    // 현재 시간을 문자열로 반환하는 함수
    function getCurrentTime() {
        var now = new Date();
        var hours = now.getHours();
        var minutes = now.getMinutes();
        var ampm = hours >= 12 ? 'PM' : 'AM';
        hours = hours % 12;
        hours = hours ? hours : 12; // 0시를 12시로 표시
        minutes = minutes < 10 ? '0' + minutes : minutes;
        var currentTime = hours + ':' + minutes + ' ' + ampm;
        return currentTime;
    }

    // 스크롤을 맨 아래로 이동하는 함수
    function scrollToBottom() {
        var chatBox = $(".chat-box");
        chatBox.scrollTop(chatBox[0].scrollHeight);
    }
