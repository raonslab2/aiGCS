//var wsLink = "ws://13.209.238.3:5010/websocket"; 
var wsLink = "ws://127.0.0.1:5010/websocket";
let socket; 
   $(document).ready(function() {
	    // data-tab 속성의 값에 따라 메뉴 항목에 selected 클래스를 적용
	    $('.menu-item').each(function() {
	        var dataTab = $(this).attr('data-tab');
	        if (dataTab === '0') {
	            $(this).addClass('selected');
	        }
	    });

        // 현재 날짜를 가져오는 함수
        function getCurrentDate() {
            var today = new Date();
            var year = today.getFullYear();
            var month = (today.getMonth() + 1).toString().padStart(2, '0');
            var day = today.getDate().toString().padStart(2, '0');
            //return year + "-" + month + "-" + day;
            return month + "-" + day;
        }

        // 시작일과 종료일 input 요소의 기본값을 오늘 날짜로 설정
        $("#start-date").val(getCurrentDate());
        $("#end-date").val(getCurrentDate());

        //first js Load
        initDataList();

       //get Code - Complete 
       setCode("PROCESS","twStatus");

	    $(".message-input input[type='text']").keypress(function(event) {
	        if (event.key === "Enter") {
	            var message = $(".message-input input[type='text']").val().trim(); // 값 앞뒤 공백 제거
	            addMessage(message, 'sent');
	        }
	    });

	    $("#msgSend").click(function() {
	        var message = $(".message-input input[type='text']").val().trim(); // 값 앞뒤 공백 제거
	        addMessage(message, 'sent');
	    }); 
       
		$("#twStatus").change(function() {
		    // select 요소가 변경되었을 때 실행할 코드를 여기에 작성합니다.
            var selectedTwStatus = $(this).val();
            var selectElement = $('#twStatus'); // <select> 요소 선택
            var twPk = $("#twPk").val();
	        $.ajax({
	            type: 'POST',
	            url: '/gcs/TD0001/updateTwStatus.do', 
			    data: { 
				         "selectedTwStatus"  : selectedTwStatus 
				        ,"twPk"  : twPk 
	            },
	            success: function(res) {
		            $("#twStatus").val("").prop("selected", true);
					selectTodayWork900();
	            },
	            error: function(xhr, status, error) {
	                alert("등록에 실패했습니다." + error);
	            }
	        });
		});

    });

function addMessage(message, sender) {
    var currentTime = new Date().toLocaleTimeString([], {hour: '2-digit', minute:'2-digit'});
    var messageClass = (sender === 'sent') ? 'sent' : 'received';
    
    // HTML 태그 필터링
    var filteredMessage = filterHTMLTags(message);
    var userId = $("#userId").val(); 
var newMessage = '<div style="padding: 10px;" class="message ' + messageClass + '">'
               + '<p style="margin-bottom: 5px;">' + userId + '</p>'
               + '<p style="margin-bottom: 5px;">' + (isLink(filteredMessage) ? '<a href="' + filteredMessage + '" target="_blank">' + filteredMessage + '</a>' : filteredMessage) + '</p>'
               + '<span class="time" style="display: block;">' + currentTime + '</span>'
               + '</div>';

    
    // 링크가 포함된 경우에만 클릭 이벤트를 막습니다.
    if (isLink(filteredMessage)) {
        newMessage = $(newMessage).on('contextmenu', 'a', function(e) {
            e.preventDefault();
        }).prop('outerHTML');
    }
    
    //신규 등록 메세지를 DB 에 저장한다.
     insertChatMsg(filteredMessage);
    
    $("#message-window").append(newMessage);
    $("#message-window").scrollTop($("#message-window")[0].scrollHeight); // 스크롤을 아래로 내림
    $(".message-input input[type='text']").val(""); // 입력값 초기화
    $(".message-input input[type='text']").focus(); // 입력란에 포커스 맞춤

   //서버에 전송
	var userId = $("#userId").val(); 
	var twPk = $("#twPk").val();
	var dlName =userId;
	var str = ""; 
    let tmData ="{\r\n" + 
	 "	\"DATA_STATE\": {\r\n" + 
	 "		\"dlName\": \""+dlName+"\",\r\n" + 
	 "		\"dlPk\": \""+twPk+"\",\r\n" +  
	 "		\"dlAction\": \""+filteredMessage+"\",\r\n" +  
	 "	}\r\n" + 
	 "	\"DATA_GUBUN\": \"USER\",\r\n" + 
	 "	\"DATA_MSG\": \""+filteredMessage+"\",\r\n" + 
	 "	\"DATA_REQUEST\": \"CHAT\"\r\n" + 
	 "}";
     socket.send(tmData);
}

var setCode = function(coDiv,setDiv) {
	    var selectElement = $('#'+setDiv); // <select> 요소 선택
        $.ajax({
            type: 'POST',
            url: '/gcs/TD0001/selectTwCode.do', 
		    data : { 
			        "coDiv"  : coDiv 
            },
            success: function(res) {  
						    var option = $('<option>', {
						        value: "",
						        text: "진행상태 변경"
						    }); 
						    // <select> 요소에 <option> 요소를 추가합니다.
						    selectElement.append(option);
					res.list.forEach(function(row, index) {
					    // <option> 요소를 생성합니다.
					    var option = $('<option>', {
					        value: row.coCode,
					        text: row.coCodeName
					    }); 
					    // <select> 요소에 <option> 요소를 추가합니다.
					    selectElement.append(option);
					});
 
            },
            error: function(xhr, status, error) {
                alert("등록에 실패했습니다." + error);
            }
        });
};

//js first start
var initDataList = function() {
	
	var stStrSt = "searchTwRequestDateSt"; 
	setTodayDate(stStrSt,-7);
	var stStrEd = "searchTwRequestDateEd"; 
	setTodayDate(stStrEd,7);
	 
    //today work list load
    selectTodayWork900();

    //work History list
    selectTodayWorkHistoryList();

 
	
	websocketConnect();
	
	//
	sendMessage();
	
};

$(document).on("click", ".rawClass", function() {
    // 클릭된 tr 요소에 대한 처리
    // 예를 들어, 클릭된 tr 요소의 데이터를 가져와서 처리하는 등의 작업을 수행할 수 있음
    var twPk = $(this).data("page");
    $("#twPk").val(twPk);
    console.log("Clicked on row with page:", twPk);
    $("#message-window").empty();
    //center Data View
    selectTodayView(twPk);

    $("#chatBox").empty();
    selectChat(twPk);//

    this.classList.add('activiti'); 
    $(this).siblings().removeClass('activiti');
});

var selectChat = function(twPk) {  
	//처음 로딩 할때.
	$("#twPk").val(twPk);
	
	websocketConnect();
	
    //1. 관련 업무내용을 호출한다.
    callRelateView(twPk);

    //2. 채팅 목록을 불러오자
    callChatList(twPk); 
};

var callChatList = function(twPk) {
 
	$.ajax({
		url : '/gcs/TD0001/selectCallChatList.do'
		, type : 'post'
		, data : { "twPk" : twPk }
	}).done(function(res) {
		    if(res.total>0){ 
				res.list.forEach(function(row, index) {
					 var messageClass = (row.messageType == 's') ? 'sent' : 'received'; 
				
					// 주어진 문자열
					var dateString = row.coUpdatetime; // row.coUpdatetime은 "2024-03-14 13:30:09.0"과 같은 형식의 문자열로 가정합니다.
					
					// Date 객체 생성
					var dateObj = new Date(dateString);
					
					// 월과 시간을 가져와서 포맷에 맞게 조정
					var month = dateObj.getMonth() + 1; // 월은 0부터 시작하므로 1을 더해줍니다.
					var day = dateObj.getDate();
					var hours = dateObj.getHours();
					var minutes = dateObj.getMinutes();
					
					// 포맷에 맞게 문자열 생성
					var formattedTime = (month < 10 ? '0' : '') + month + '-' + (day < 10 ? '0' : '') + day + ' ' + (hours < 10 ? '0' : '') + hours + ':' + (minutes < 10 ? '0' : '') + minutes;

	 
var newMessage = '<div style="padding: 10px; margin-bottom: 10px;" class="message ' + messageClass + '">'
                + '<p style="margin-bottom: 5px;">'+row.chUserId+'</p>'
                + '<p style="margin-bottom: 5px;">'+row.chMessage+'</p>'
                + '<span class="time" style="display: block;">' + formattedTime  + '</span>'
                + '</div>';

		  
				    $("#message-window").append(newMessage);
                    $("#message-window").scrollTop($("#message-window")[0].scrollHeight); // 스크롤을 아래로 내림
		          
				}); 
		    }

	}).fail(function() {
		alert("fail");
	});
    
};

var callRelateView = function(twPk) {   
	//$('#chatTitle').children().remove();
	$("#chatTitle-window").empty();
	$.ajax({
		url : '/gcs/TD0001/selectTodayWork901Write.do'
		, type : 'post'
		, data : { "twPk" : twPk }
	}).done(function(res) {
        $("#twStatus").val(res.result.twStatus).prop("selected",true); 
        $("#twCategory1").val(res.result.twCategory1);
        $("#twCategory2").val(res.result.twCategory2);
        $("#twRequestDate").val(res.result.twRequestDate); 
        $("#twStartDateExp").val(res.result.twStartDateExp);
        $("#twEndDateExp").val(res.result.twEndDateExp);
        $("#twRequester").text(res.result.twRequester);
        $("#twWorker").text(res.result.twWorker);
        $("#twSubject").val(res.result.twSubject); 

        $("#chatTitle").text(res.result.twSubject);

	    var downloadLink = $('<a>', {
	        text: 'Down',
	        href: "/gcs/TD0001/TodayWork901Write.do?twPk="+twPk, // 파일 다운로드 링크
	        download: "Link", // 파일 이름 지정
	        style: 'margin-left: 10px;' // 다운로드 링크 간격 조정
	    });
		var tmUrl = "/gcs/TD0001/TodayWork901Write.do?twPk=" + twPk;
		$("#detailLink").html("<a class=\"detailList\" href='" + tmUrl + "' target='_blank'>상세보기</a>");
  

        //첨부화일    
        // #attachment-list 안의 모든 내용을 지우기
        $('.file').empty();
        if(res.atachListCnt>0){
			res.attachList.forEach(function(row, index) {
			    console.log(row);
 
			    var filename = row.originalFilename;
				var filePath = row.savedFilePath;
				filePath = filePath.replace('C:', ''); 
				filePath = filePath.replace('D:', ''); 
				filePath = filePath.replace('E:', ''); 
				filePath = filePath.replace('F:', ''); 
			    var downloadLink = $('<a>', {
			        text: 'Down',
			        href: filePath, // 파일 다운로드 링크
			        download: filename, // 파일 이름 지정
			        style: 'margin-left: 10px;' // 다운로드 링크 간격 조정
			    });
			    
			    $("#file"+(index+1)).css({
			        "color": "darkblue", // 진한 색상으로 설정
			        "background-color": "#ADD8E6" // 배경색을 연한 파란색으로 설정
			    }).text(" " + filename).append(downloadLink);
			}); 
        }
	}).fail(function() {
		alert("fail");
	});
    
};

var selectTodayView = function(twPk) {
	//채팅내용
	selectChat(twPk);
	
	$.ajax({
		url : '/gcs/TD0001/selectTodayWork900View.do'
		, type : 'post'
		, data : { "twPk" : twPk}
	}).done(function(res) { 
		   $('#progressStatus').children().remove();
		   var data = ""
				+ " <p class=\"middleRaw\"><strong class=\"title\">분류</strong> "+res.result.twCategory1+"</p>\r\n"
				+ " <p class=\"middleRaw\"><strong class=\"title\">작성자</strong> "+res.result.twRequestDate+" / "+res.result.twRequester+"</p>\r\n"
				+ " <p class=\"middleRaw\"><strong class=\"title\">담당자</strong> "+res.result.twWorker+"</p>\r\n"
				+ " <p class=\"middleRaw\"><strong class=\"title\">제목</strong> "+res.result.twSubject+"</p> ";
		   $('#progressStatus').append(data);
           initializeCKEditor(res.result.twContent); 

	        //첨부화일    
            // #attachment-list 안의 모든 내용을 지우기
            $('.file').empty();
	        if(res.atachListCnt>0){
				res.attachList.forEach(function(row, index) {
				    console.log(row);
	 
				    var filename = row.originalFilename;
					var filePath = row.savedFilePath;
					filePath = filePath.replace('C:', ''); 
					filePath = filePath.replace('D:', ''); 
					filePath = filePath.replace('E:', ''); 
					filePath = filePath.replace('F:', ''); 
				    var downloadLink = $('<a>', {
				        text: 'Down',
				        href: filePath, // 파일 다운로드 링크
				        download: filename, // 파일 이름 지정
				        style: 'margin-left: 10px;' // 다운로드 링크 간격 조정
				    });
				    
				    $("#file"+(index+1)).css({
				        "color": "darkblue", // 진한 색상으로 설정
				        "background-color": "#ADD8E6" // 배경색을 연한 파란색으로 설정
				    }).text(" " + filename).append(downloadLink);
				}); 
	        }

	}).fail(function() {
		alert("fail");
	});
};

function filterHTMLTags(text) {
    return text.replace(/</g, '&lt;').replace(/>/g, '&gt;');
} 
function isLink(text) {
    var urlPattern = /^(https?:\/\/)?([\w.]+)\.([a-z]{2,6}\.?)(\/[\w .-]*)*\/?$/;
    return urlPattern.test(text);
}

var insertChatMsg = function(msg,twPk) {  
	var twPk = $("#twPk").val();
	$.ajax({
		url : '/gcs/TD0001/insertChatMsg.do'
		, type : 'post'
		, data : { 
			 "twPk" : twPk 
		   , "msg" : msg 
		 }
	}).done(function(res) {
     
	}).fail(function() {
		alert("fail");
	});
};

function initializeCKEditor(existingText) {
    if (CKEDITOR.instances['twContent']) {
        CKEDITOR.instances['twContent'].destroy();
    }
    // CKEditor 적용
    CKEDITOR.replace('twContent', {
        // 에디터 설정
        // 플러그인, 스타일 등을 추가할 수 있습니다.
        height: '450px', // 원하는 높이로 설정하세요. 예: '400px'
        on: {
            instanceReady: function (evt) {
                // 에디터 내용을 가져옵니다.
                var editor = evt.editor;
                
                // 기존 텍스트를 가져옵니다. 여기서는 샘플로 "1. ㅇㅇㅇ\n2. 000\n3. ㅇㅇㅇㅇ"을 사용합니다.
                // var existingText = "1. ㅇㅇㅇ\n2. 000\n3. ㅇㅇㅇㅇ";

                // 에디터에 기존 텍스트를 설정합니다.
                editor.setData(existingText);
            }
        }
    });
}


//today work list load
var selectTodayWork900 = function() {
	 
	var form = $('#searchTodayForm').serialize();

	$.ajax({
		url : '/gcs/TD0001/selectTodayWork900.do'
		, type : 'post'
		, data :form
	}).done(function(res) { 
		$('#resultList').children().remove();
		$('.pagination').children().remove();
		$('.subTr').remove();
		if(res.totalCnt == '0'){
			var data =  "<tr class='subTr'><td colspan='3' style='height:100px;text-align:center;'>No data available.</td></tr>" ;
			$('#resultList').append(data);
			$('.pagination').append(paginationView(res.paginationInfo));
			
			$('.' + res.paginationInfo.currentPageNo ).addClass("active");
			$('.pagination > li').css('cursor', 'pointer');
		}else{
			res.list.forEach(function(row, index) {
				console.log(row)
				if(index==0){
					//view detail
					selectTodayView(row.twPk);
				}
				$('#resultList').append(pageView(row,index));
				//mbCode = row.mbCode;	
			});
			$('.pagination').children().remove();
			$('.pagination').append(paginationView(res.paginationInfo));
			$('.' + res.paginationInfo.currentPageNo ).addClass("active");
			$('.pagination > li').css('cursor', 'pointer');
		}
	}).fail(function() {
		alert("fail");
	});
};

var pageView = function(row,index) { 
	var requester = row.twRequester;
	var subject = row.twSubject.length > 30 ? row.twSubject.substring(0, 30) + '..' : row.twSubject;
	
	// 주어진 날짜
	var fullDate = row.twRequestDate;
	
	// 날짜를 JavaScript Date 객체로 변환
	var dateObj = new Date(fullDate);
	
	// 월과 일을 가져와서 원하는 형식으로 표시
	var formattedDate = ('0' + (dateObj.getMonth() + 1)).slice(-2) + '-' + ('0' + dateObj.getDate()).slice(-2);
		
	var tmIndex = "";
    if(index==0){
       tmIndex = "activiti"; 
    }
	
	var data = "<tr class=\"rawClass "+tmIndex+"\" data-page="+row.twPk+" >\r\n" +
	          // "  <td>"+requester+"</td>\r\n" +
	           "  <td>"+subject+"</td>\r\n" +
	           "  <td>"+formattedDate+"</td>\r\n" +
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
    $("#sendButton").click(function() {
        sendMessage();
    });

    // 텍스트 입력 후 엔터 키 누를 때 이벤트 처리
    $("#messageInput").keypress(function(event) {
        if (event.which === 13) { // 엔터 키 코드
            sendMessage();
        }
    });

    // 메시지를 보내는 함수
    function sendMessage() {
        var messageInput = $("#messageInput");
        var messageText = messageInput.val().trim(); // 입력된 메시지 내용

        if (messageText !== "") { // 입력된 내용이 비어 있지 않으면
            var chatBox = $(".chat-box"); // 클래스로 변경
            var messageElement = $('<div class="message sent">' +
                                    '<div class="message-text">' + messageText + '</div>' +
                                    '<div class="message-time">' + getCurrentTime() + '</div>' +
                                  '</div>');
            chatBox.append(messageElement);

            // 스크롤을 맨 아래로 이동
            scrollToBottom();

            // 입력창 초기화
            messageInput.val("");
        }
    }

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
 
};

function setTodayDate(stStr, tmDay) {
    // 현재 날짜를 가져오기
    var today = new Date();

    // tmDay가 0이면 오늘 날짜, -7이면 7일 이전 날짜를 계산
    if (tmDay !== 0 && tmDay !== undefined) {
        today.setDate(today.getDate() + tmDay);
    }

    // 오늘 날짜를 YYYY-MM-DD 형식의 문자열로 변환
    var yyyy = today.getFullYear();
    var mm = String(today.getMonth() + 1).padStart(2, '0'); // 0부터 시작하므로 +1 필요
    var dd = String(today.getDate()).padStart(2, '0');

    var formattedDate = yyyy + '-' + mm + '-' + dd;

    // input 요소에 날짜 설정
    $("#" + stStr).val(formattedDate);
}


// WebSocket 연결을 닫는 함수
function closeWebSocket() {
    if (socket !== undefined && socket.readyState === WebSocket.OPEN) {
        socket.close();
        console.log('socket.close ');
    }else{
        console.log('socket.undefined ');
    }
}

function websocketConnect() {
	closeWebSocket(); // 기존 WebSocket 연결 닫기
	
	socket = new WebSocket(wsLink);


	socket.onopen = function(event) {
			var userId = $("#userId").val(); 
			var twPk = $("#twPk").val(); 
		socket.send("{\"DATA_GUBUN\":\"USER\",\"DATA_ID\":\""+userId+"\",\"TW_PK\":\""+twPk+"\",\"DATA_REQUEST\":\"OPEN\"}");
	    console.log('Connected to WebSocket server');
	};
	
	socket.onmessage = function(e) {
		var list = JSON.parse(event.data); 
		console.log(list);
		var userId = $("#userId").val();
		if(userId==list.dlName){
			//addMessage(list.dlAction, 'sent');
			messageClass = 'sent';
		}else{
			//addMessage(list.dlAction, 'received');
			messageClass = 'received';
		}
		var currentTime = new Date().toLocaleTimeString([], {hour: '2-digit', minute:'2-digit'});
	    // HTML 태그 필터링
	    var filteredMessage = filterHTMLTags(list.dlAction);
	    
var newMessage = '<div style="padding: 10px;" class="message ' + messageClass + '">'
               + '<p style="margin-bottom: 5px;">' + list.dlName + '</p>'
               + '<p style="margin-bottom: 5px;">' + (isLink(filteredMessage) ? '<a href="' + filteredMessage + '" target="_blank">' + filteredMessage + '</a>' : filteredMessage) + '</p>'
               + '<span class="time">' + currentTime + '</span>'
               + '</div>';

     
	    $("#message-window").append(newMessage);
	    $("#message-window").scrollTop($("#message-window")[0].scrollHeight); // 스크롤을 아래로 내림
	    $(".message-input input[type='text']").val(""); // 입력값 초기화
	    $(".message-input input[type='text']").focus(); // 입력란에 포커스 맞춤
		console.log(list.dlAction);
	};
	
	socket.onclose = function(e) {
		//$("#dialog2").prepend('Web Socket closed');
		//$('#responseText').val('Web Socket closed : ' + e.reason);
		//console.log('Socket is closed. Reconnect will be attempted in 1 second.', e.reason);
		//setTimeout(function() {
		//	websocketConnect();
		//}, 1000);
	};
	
	socket.onerror = function(err) {
		//console.error('Socket encountered error: ', err.message, 'Closing socket'); 
		setTimeout(function() {
			websocketConnect();
		}, 5000);
	};
};
  
