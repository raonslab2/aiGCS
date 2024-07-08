//var wsLink = "ws://13.209.238.3:5010/websocket"; 
var wsLink = "ws://34.47.97.35:5010/websocket";
//var wsLink = "ws://192.168.232.171:5010/websocket";
let socket; 

// script.js (jQuery)
$(document).ready(function() { 
	   
    // When the document is ready
    var chatWindow = $(".message-window");
    
    // Set the scroll position to the bottom
    chatWindow.scrollTop(chatWindow.prop("scrollHeight"));



    initLoad(); 
    
 
    //menu tap
    $(".work-list-tap ul li").click(handleListItemClick);
    
    // select 요소의 변경 이벤트 처리
    $('#twStatus').change(function() {
        // 변경된 값 가져오기
        var selectedValue = $(this).val();
        
        // 변경된 값에 따라 원하는 작업 수행
        console.log('선택된 값:', selectedValue);
      
        
        // 예: 선택된 값을 서버로 전송하여 처리하거나, 선택된 값에 따라 다른 동작 수행
    });

    // 즐겨찾기 버튼 클릭 시 토글
    $('#btnBookmark').click(function(){
        if ($(this).hasClass('not-bookmarked')) {
            // 클래스가 있는 경우
            $(this).removeClass('not-bookmarked');
            $(this).addClass('bookmarked');
           

 
        } else {
            // 클래스가 없는 경우
            $(this).addClass('not-bookmarked');
            $(this).removeClass('bookmarked');
        }
    });


});

 var setBookMark = function(tmDiv) {
 
        $.ajax({
            type: 'POST',
            url: '/gcs/TD0001/setBookMark.do', 
		    data : { 
			        "tmDiv"  : tmDiv 
            },
            success: function(res) {
		       
            },
            error: function(xhr, status, error) {
                alert("등록에 실패했습니다." + error);
            }
        });
};


  var handleListItemClick = function() {
    // 모든 리스트 항목에서 selected 클래스 제거
    $(".work-list-tap ul li").removeClass("selected");
    // 클릭한 리스트 항목에 selected 클래스 추가
    $(this).addClass("selected");

    // 클릭한 리스트 항목의 page-data 값을 가져오기
    var pageData = $(this).attr("page-data");
	selectList(pageData);
    console.log("선택된 항목의 page-data 값:", pageData);
  };

//js first start
var initLoad = function() {
       //get Code - Complete 
       setCode("PROCESS","twStatus");

	//1. data list
	selectList(2);
	
	// msg input 
    $("#message-window").on("click", "a", function() {
        var url = $(this).attr("href");
        window.open(url, "_blank");
        return false; // 기본 동작 방지
    });

    $(".message-input input[type='text']").keypress(function(event) {
        if (event.key === "Enter") {
            var message = $(".message-input input[type='text']").val().trim(); // 값 앞뒤 공백 제거
            addMessage(message, 'sent');
        }
    });

	$("#msgSend").click(function() {
	    var message = $(".message-input textarea").val().trim(); // textarea에서 값 가져오기
	    addMessage(message, 'sent');
	});

};

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


 

var selectList = function(searchDiv) {
   
		// 폼 데이터를 배열로 직렬화
		var formDataArray = $('#chatListForm').serializeArray();
		
		// 추가할 필드를 객체로 생성하여 배열에 추가
		var additionalField = { name: 'searchDiv', value: searchDiv };
		formDataArray.push(additionalField);
		
		// 직렬화된 배열을 AJAX 요청에 사용할 수 있는 형태로 변환
		var formData = $.param(formDataArray);
	
		$.ajax({
			url : '/gcs/TD0001/selectTodayWork905.do'
			, type : 'post'
			, data :formData
		}).done(function(res) { 
			$('#resultList').children().remove();
			$('#chat-room-list').children().remove();
			$('#message-window').children().remove();
			
			$('.pagination').children().remove();
			$('.subTr').remove();
			if(res.totalCnt == '0'){
				;
			}else{
				res.list.forEach(function(row, index) {
					console.log(row)
					if(index==0){
						selectChat(row.twPk);
					}
					$('#chat-room-list').append(pageChatList(row,index));
					//mbCode = row.mbCode;	
				}); 
			}
		}).fail(function() {
			alert("fail");
		});
 
};

var pageChatList = function(row, index) { 
    var tmSelect ="";
    if(index == 0){
        tmSelect ="activiti";
    }

    // 날짜를 변경하는 함수를 호출하여 원하는 형식으로 변환합니다.
    var unread = row.tcCount;
    var formattedDate;
        if(unread == 0){
	       formattedDate  = " <span class=\"unread-data unread-circle2\" data-page="+row.twPk+"></span>";
        }else{
	       formattedDate  = " <span class=\"unread-data unread-circle\" data-page="+row.twPk+">"+unread+"</span>";
        } 
        formattedDate += formatDate2(row.twRequestDate); 

   var subject = row.twSubject.length > 20 ? row.twSubject.substring(0, 20) + ".." : row.twSubject;

    // 줄바꿈을 <br> 태그로 변환하여 적용합니다.
    subject = subject.replace(/\n/g, '<br>');

    var data = ""
        + "<div class=\"rawClass chat-room "+tmSelect+"\" data-page="+row.twPk+"  >\r\n"
        + "    <div class=\"room-info \">\r\n" 
        + "        <div class=\"room-info-member \">"+row.mbName+"</div> \r\n"
        + "        <div class=\"room-info-subject \">"+subject+"</div> \r\n"
        + "        <div class=\"time timeList\">"+formattedDate+"</div>\r\n" // 변경된 날짜 형식을 적용합니다.
        + "    </div>\r\n"
        + "</div>";
  
    return $(data);
};

// 날짜를 변경하는 함수 정의
function formatDate(dateString) {
    // JavaScript Date 객체로 변환합니다.
    var date = new Date(dateString);

    // 월과 일을 가져옵니다.
    var month = ("0" + (date.getMonth() + 1)).slice(-2); // 월은 0부터 시작하므로 +1 해줍니다.
    var day = ("0" + date.getDate()).slice(-2);

    // 변경된 날짜 형식을 반환합니다.
    return month + '-' + day;
}

function formatDate2(dateString) {
    var today = new Date(); // 오늘 날짜를 가져옵니다.
    var date = new Date(dateString); // 입력된 날짜를 JavaScript Date 객체로 변환합니다.

    // 만약 입력된 날짜가 오늘 날짜와 같다면 시간을 포함한 형식으로 반환합니다.
    if (date.toDateString() === today.toDateString()) {
        var hours = date.getHours(); // 시간을 가져옵니다.
        var minutes = date.getMinutes(); // 분을 가져옵니다.
        var ampm = hours >= 12 ? '오후' : '오전'; // 오전/오후를 구분합니다.
        hours = hours % 12;
        hours = hours ? hours : 12; // 0시를 12시로 표시합니다.
        minutes = minutes < 10 ? '0' + minutes : minutes; // 분이 한 자리 숫자일 경우 앞에 0을 추가합니다.
        var formattedTime = ampm + ' ' + hours + ':' + minutes; // 시간을 문자열로 조합합니다.
        return formattedTime;
    }

    // 입력된 날짜가 오늘 이전의 날짜인 경우 "어제"로 반환합니다.
    var yesterday = new Date(today);
    yesterday.setDate(today.getDate() - 1); // 오늘 날짜에서 하루를 빼어 어제의 날짜를 가져옵니다.
    if (date.toDateString() === yesterday.toDateString()) {
        return '어제';
    }

    // 그 외의 경우에는 월-일 형식으로 반환합니다.
    var month = ("0" + (date.getMonth() + 1)).slice(-2); // 월은 0부터 시작하므로 +1 해줍니다.
    var day = ("0" + date.getDate()).slice(-2);
    return month + '-' + day;
}

$(document).on("click", ".rawClass", function() {
    // 클릭된 tr 요소에 대한 처리
    // 예를 들어, 클릭된 tr 요소의 데이터를 가져와서 처리하는 등의 작업을 수행할 수 있음
    var twPk = $(this).data("page");
    $("#twPk").val(twPk);
    $("#message-window").empty();

    console.log("Clicked on row with page:", twPk);
    //selectTodayView(twPk);
    selectChat(twPk);
    this.classList.add('activiti'); 
    $(this).siblings().removeClass('activiti');
    $("#message-window").scrollTop($("#message-window")[0].scrollHeight); // 스크롤을 아래로 내림
    if ($(window).width() <= 768) {
        $(".chat-window").css("display", "block");
        $(".chat-window").css("width", "100%");
        $(".chat-list").css("display", "none");
    }
});

$(document).on("click", "#btnBack", function() {
    // 클릭 이벤트 발생 시 실행할 동작을 여기에 작성
    $("#message-window").scrollTop($("#message-window")[0].scrollHeight); // 스크롤을 아래로 내림
    if ($(window).width() <= 768) {
        $(".chat-list").css("display", "block");
        $(".chat-list").css("width", "100%");
        $(".chat-window").css("display", "none");
    }
});

 

var selectChat = function(twPk) {  
	//처음 로딩 할때.
	$("#twPk").val(twPk);
	
	websocketConnect();
	
    //1. 관련 업무내용을 호출한다.
    callRelateView(twPk);

    //2. 채팅 목록을 불러오자
    callChatList(twPk); 

	// 데이터 페이지 속성이 해당하는 요소를 찾습니다.
	var element = document.querySelector('[data-page="'+twPk+'"].unread-circle');
	// 요소가 존재하는 경우에만 변경합니다.
	if (element) {
	    element.innerText = '';
	    element.classList.remove("unread-circle");
	    element.classList.add("unread-circle2");
	}
   
};

function addMessage(message, sender) {
    var currentTime = new Date().toLocaleTimeString([], {hour: '2-digit', minute:'2-digit'});
    var messageClass = (sender === 'sent') ? 'sent' : 'received';
    
    // HTML 태그 필터링
    var filteredMessage = filterHTMLTags(message);

    // 정규 표현식으로 http 또는 https가 나오기 전까지의 문자열을 찾아내어 링크로 변환
	var messageWithLinks = filteredMessage.replace(/(\S*https?:\/\/\S*)/g, function(url) {
	    var urlStartIndex = url.indexOf("http");
	    var urlPart = url.substring(urlStartIndex);
	    return urlStartIndex > 0 ? url.substring(0, urlStartIndex) + '<a href="' + urlPart + '" target="_blank">' + urlPart + '</a>' : '<a href="' + url + '" target="_blank">' + url + '</a>';
	});
	// 줄바꿈을 <br> 태그로 변환하여 추가
	messageWithLinks = messageWithLinks.replace(/\n/g, '<br>');

    var userId = $("#userId").val(); 

	var newMessage = '<div class="message ' + messageClass + '">'
	               + '<p>'+userId+'</p>'
	               + '<div class="message-content">' + messageWithLinks+ '</div>'
	               + '<span class="time">' + currentTime + '</span>'
	               + '</div>';
 
    
    //신규 등록 메세지를 DB 에 저장한다.
     insertChatMsg(messageWithLinks);
    
    $("#message-window").append(newMessage);
    $("#message-window").scrollTop($("#message-window")[0].scrollHeight); // 스크롤을 아래로 내림
	$(".message-input textarea").val(""); // textarea의 값 초기화
	$(".message-input textarea").focus(); // textarea에 포커스 맞춤


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


function filterHTMLTags(text) {
    return text.replace(/</g, '&lt;').replace(/>/g, '&gt;');
} 
function isLink(text) {
    var urlPattern = /^(https?:\/\/)?([\w.]+)\.([a-z]{2,6}\.?)(\/[\w .-]*)*\/?$/;
    return urlPattern.test(text);
}
 
var callRelateView = function(twPk) {
	//list
	  
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
        
        var maxLength = 15; // Maximum allowed characters
        var title = res.result.twSubject.length > maxLength ? res.result.twSubject.substring(0, maxLength) + "..." : res.result.twSubject;

        $("#chatTitle").text(title);

	    var downloadLink = $('<a>', {
	        text: 'Down',
	        href: "/gcs/TD0001/TodayWork901Write.do?twPk="+twPk, // 파일 다운로드 링크
	        download: "Link", // 파일 이름 지정
	        style: 'margin-left: 10px;' // 다운로드 링크 간격 조정
	    });
		var tmUrl = "/gcs/TD0001/TodayWork901Write.do?twPk=" + twPk;
		$("#detailLink").html("<a class=\"detailList\" href='" + tmUrl + "' target='_blank'>VIEW</a>");
  

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
 
// 날짜 및 시간을 가져와서 원하는 형식으로 포맷하는 함수
function formatDate(dateString) {
    var date = new Date(dateString);
    var month = '' + (date.getMonth() + 1);
    var day = '' + date.getDate();
    var hours = date.getHours();
    var minutes = '' + date.getMinutes();
    var ampm = hours >= 12 ? '오후' : '오전'; // 오전 또는 오후 판별

    // 12시간제로 변경
    hours = hours % 12;
    hours = hours ? hours : 12; // 0시를 12시로 변경
    hours = hours < 10 ? '0' + hours : hours;

    if (month.length < 2) 
        month = '0' + month;
    if (day.length < 2) 
        day = '0' + day;
    if (minutes.length < 2) 
        minutes = '0' + minutes;

    return [month, day].join('-') + ' ' + ampm + ' ' + hours + ':' + minutes;
}

var callChatList = function(twPk) {
 
	$.ajax({
		url : '/gcs/TD0001/selectCallChatList.do'
		, type : 'post'
		, data : { "twPk" : twPk }
	}).done(function(res) {
		    if(res.total>0){ 
				res.list.forEach(function(row, index) {
					 var messageClass = (row.messageType == 's') ? 'sent' : 'received'; 
	 
				    // 정규 표현식으로 http 또는 https가 나오기 전까지의 문자열을 찾아내어 링크로 변환
					var messageWithLinks = row.chMessage.replace(/(\S*https?:\/\/\S*)/g, function(url) {
					    var urlStartIndex = url.indexOf("http"); // http:// 또는 https:// 의 시작 인덱스 찾기
					    var urlPart = url.substring(urlStartIndex); // 해당 인덱스부터 끝까지의 부분 가져오기
					    return urlStartIndex > 0 ? url.substring(0, urlStartIndex) + '<a href="' + urlPart + '" target="_blank">' + urlPart + '</a>' : '<a href="' + url + '" target="_blank">' + url + '</a>';
					});
					
					var formattedDate = formatDate(row.coUpdatetime); // 날짜 포맷 변경
					
					var newMessage = '<div class="message ' + messageClass + '" oncontextmenu="handleContextMenu(event)" contenteditable="true">'
					               + '<p>'+row.chUserId+'</p>'
					               + '<p class="messageWithLinks">'+messageWithLinks+'</p>' // 클래스 이름을 올바르게 수정
					               + '<span class="time">' + formattedDate + '</span>'
					               + '</div>';

		  
				    $("#message-window").append(newMessage);
                    $("#message-window").scrollTop($("#message-window")[0].scrollHeight); // 스크롤을 아래로 내림
		          
				}); 
		    }

	}).fail(function() {
		alert("fail");
	});
	
	
    // 우클릭 이벤트를 처리하는 함수
    function handleContextMenu(event) {
        // 클립보드에 복사할 내용 선택
        var messageWithLinks = event.currentTarget.querySelector('.messageWithLinks').textContent;

        // 클립보드에 복사
        navigator.clipboard.writeText(messageWithLinks)
            .then(() => {
                console.log('Text copied to clipboard:', messageWithLinks);
            })
            .catch(err => {
                console.error('Failed to copy text to clipboard:', err);
            });
    }

    // 해당 메시지 요소에 우클릭 이벤트를 추가
	var messageElement = document.querySelector('.messageWithLinks');
	if (messageElement) {
	    messageElement.addEventListener('contextmenu', handleContextMenu);
	} else {
	    //console.error('Element with class "messageWithLinks" not found.');
	}


    
};

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
	
socket.onmessage = function(event) {
    var list = JSON.parse(event.data); 
    console.log(list);
    var receiveId = list.dlName;
    var userId = $("#userId").val();
 
    if(receiveId == userId){
        //addMessage(list.dlAction, 'sent');
        messageClass = 'sent';
    } else {
        //addMessage(list.dlAction, 'received');
        messageClass = 'received';
    }
    var currentTime = new Date().toLocaleTimeString([], {hour: '2-digit', minute:'2-digit'});
    // HTML 태그 필터링
    var filteredMessage = filterHTMLTags(list.dlAction);
    subject = filteredMessage.replace(/\n/g, '<br>');
    
var newMessage = '<div class="message ' + messageClass + '">'
               + '<div>' + receiveId + '</div>'
               + '<div class="message-content">' + subject + '</div>'
               + '<div class="time">' + currentTime + '</div>'
               + '</div>';

 
    $("#message-window").append(newMessage);
    $("#message-window").scrollTop($("#message-window")[0].scrollHeight); // 스크롤을 아래로 내림
    //$(".message-input textarea").val(""); // 입력값 초기화
    //$(".message-input textarea").focus(); // 입력란에 포커스 맞춤
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
  


