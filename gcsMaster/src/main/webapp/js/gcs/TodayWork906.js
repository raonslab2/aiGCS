// script.js (jQuery)
$(document).ready(function() { 
    // When the document is ready
    var chatWindow = $(".message-window");
    
    // Set the scroll position to the bottom
    chatWindow.scrollTop(chatWindow.prop("scrollHeight"));

    initLoad(); 
});

//js first start
var initLoad = function() {
	//1. data list
	selectList();
	
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
            var message = $(".message-input input[type='text']").val().trim(); // 값 앞뒤 공백 제거
            addMessage(message, 'sent');
        });
   





	
};

var selectList = function() {
  
		var form = $('#chatListForm').serialize();
	
		$.ajax({
			url : '/gcs/TD0001/selectTodayWork905.do'
			, type : 'post'
			, data :form
		}).done(function(res) { 
			$('#resultList').children().remove();
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

var pageChatList = function(row,index) { 
	    var tmSelect ="";
        if(index == 0){
	       tmSelect ="activiti";
        }
		var data =""
				+ "<div class=\"rawClass chat-room "+tmSelect+"\" data-page="+row.twPk+"  >\r\n"
				+ "	<img src=\"/images/profile1.jpg\" alt=\"Profile Image\">\r\n"
				+ "	<div class=\"room-info \">\r\n"
				+ "		<span>"+row.twSubject+"</span> \r\n"
				+ "		<span class=\"time\">"+row.twRequestDate+"</span>\r\n"
				+ "	</div>\r\n"
				+ "</div>";
	return $(data);
};

$(document).on("click", ".rawClass", function() {
    // 클릭된 tr 요소에 대한 처리
    // 예를 들어, 클릭된 tr 요소의 데이터를 가져와서 처리하는 등의 작업을 수행할 수 있음
    var twPk = $(this).data("page");
    console.log("Clicked on row with page:", twPk);
    //selectTodayView(twPk);
    selectChat(twPk);
    this.classList.add('activiti'); 
    $(this).siblings().removeClass('activiti');
});


var selectChat = function(twPk) {  
    //관련 업무내용을 호출한다.
    callRelateView(twPk);
    
};

function addMessage(message, sender) {
    var currentTime = new Date().toLocaleTimeString([], {hour: '2-digit', minute:'2-digit'});
    var messageClass = (sender === 'sent') ? 'sent' : 'received';
    
    // HTML 태그 필터링
    var filteredMessage = filterHTMLTags(message);
    
    var newMessage = '<div class="message ' + messageClass + '">'
                   + '<p>' + (isLink(filteredMessage) ? '<a href="' + filteredMessage + '" target="_blank">' + filteredMessage + '</a>' : filteredMessage) + '</p>'
                   + '<span class="time">' + currentTime + '</span>'
                   + '</div>';
    
    // 링크가 포함된 경우에만 클릭 이벤트를 막습니다.
    if (isLink(filteredMessage)) {
        newMessage = $(newMessage).on('contextmenu', 'a', function(e) {
            e.preventDefault();
        }).prop('outerHTML');
    }
    
    $("#message-window").append(newMessage);
    $("#message-window").scrollTop($("#message-window")[0].scrollHeight); // 스크롤을 아래로 내림
    $(".message-input input[type='text']").val(""); // 입력값 초기화
    $(".message-input input[type='text']").focus(); // 입력란에 포커스 맞춤
}


function filterHTMLTags(text) {
    return text.replace(/</g, '&lt;').replace(/>/g, '&gt;');
} 
function isLink(text) {
    var urlPattern = /^(https?:\/\/)?([\w.]+)\.([a-z]{2,6}\.?)(\/[\w .-]*)*\/?$/;
    return urlPattern.test(text);
}
 
var callRelateView = function(twPk) {  
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
		$("#detailLink").html("<a href='" + tmUrl + "' target='_blank'>Detail Info</a>");
  

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


