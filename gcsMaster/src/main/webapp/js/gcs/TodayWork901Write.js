$(document).ready(function() {
    // data-tab 속성의 값에 따라 메뉴 항목에 selected 클래스를 적용
    $('.menu-item').each(function() {
        var dataTab = $(this).attr('data-tab');
        if (dataTab === '1') {
            $(this).addClass('selected');
        }
    });

	//js first start
	initDataList(); 
	
	//button click event
    $("#btnList").click(function(){
        // 페이지 이동
        window.location.href = " /gcs/TD0001/TodayWork901.do"; //page move
    });

	//button click event
    $("#btnWrite").click(function(){
        // 페이지 이동
        window.location.href = " /gcs/TD0001/TodayWork901Write.do"; //page move
    });


}); 

    $('#submitBtn').click(function() {
        var form = new FormData($('#searchForm')[0]);
		// 변수 추가 ;
		form.append('twContent2', CKEDITOR.instances['twContent'].getData()); 
        $.ajax({
            type: 'POST',
            url: '/gcs/TD0001/insertTodayWork901Write.do',
            processData: false,
            contentType: false,
            data: form,
            success: function(res) { 
                alert("Success");
                // 페이지 이동
                window.location.href = "/gcs/TD0001/TodayWork901.do"; // 페이지 이동
            },
            error: function(xhr, status, error) {
                alert("등록에 실패했습니다." + error);
            }
        });
    });
	
//js first start
var initDataList = function() {
	
	 //searchList
	 var tmUserId = "twRequester";
     userList(tmUserId);
	 var tmUserId2 = "twWorker";
     userList(tmUserId2);
	 var tmUserId3 = "twWorker2";
     userList(tmUserId3);

    //get Code - Complete 
    setCode("PROCESS","twStatus");

 
	var twPk = $("#twPk").val();
	if(typeof twPk == "undefined" || twPk == "" || twPk == null){
		;
	}else{
		selectDataView(twPk);
	} 
	 
	//Default setting to today's date
	var stStr = "twRequestDate"; 
	setTodayDate(stStr);
	var twStartDateExp = "twStartDateExp"; 
	setTodayDate(twStartDateExp);
	var twEndDateExp = "twEndDateExp"; 
	setTodayDate(twEndDateExp);
	
 
	
    // Going to work 버튼 클릭 이벤트 처리
    $("button[data-page='1']").click(function(){
        // twCategory1 입력란에 "출근" 텍스트 삽입
        $("#twCategory1").val("go to work");
        $("#twCategory2").val("Workplans"); 
        $("#twSubject").val("Report what needs to be done today.");
        
        initializeCKEditor("Here's what I have planned for today: <p>1. ㅇㅇㅇ</p>  <p>2. 000</p> <p>3. ㅇㅇㅇㅇ</p> <p>That is all.</p>")
    });

    $("button[data-page='2']").click(function(){
        // twCategory1 입력란에 "출근" 텍스트 삽입
        $("#twCategory1").val("go to work");
        $("#twCategory2").val("Workplans"); 
        $("#twSubject").val("[Like this] Please proceed with your work.");
        
        initializeCKEditor("This is detailed work information.: <p>1. ㅇㅇㅇ</p>  <p>2. 000</p> <p>3. ㅇㅇㅇㅇ</p> <p>That is all.</p>")
    });


    $("button[data-page='3']").click(function(){
        // twCategory1 입력란에 "출근" 텍스트 삽입
        $("#twCategory1").val("request");
        $("#twCategory2").val("Working"); 
        $("#twSubject").val("Let's summarize what we did today.");
        
        initializeCKEditor("Here's what we did today: <p>1. ㅇㅇㅇ</p>  <p>2. 000</p> <p>3. ㅇㅇㅇㅇ</p> <p>That is all.</p>")
    });

	// 버튼 클릭 시
	$('.btnLike').click(function(){
	    // 해당 클래스를 가진 모든 버튼에서 active 클래스 제거
	    $('.btnLike').removeClass('active');
	    // 클릭한 버튼에 active 클래스 추가
	    $(this).addClass('active');
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

var userList = function(tmUserId) {
	
 
	$.ajax({
		url : '/gcs/TD0001/userList.do'
		, type : 'post'
		, data : { 
			        "userId"  : tmUserId 
                 }
	}).done(function(res) { 
        // 여기서는 받은 데이터를 <select> 요소에 추가합니다.
        var selectElement = $('#'+tmUserId); // <select> 요소 선택

        // 기존의 <option> 요소들을 모두 제거합니다.
        selectElement.empty();
        selectElement.append($('<option>', {
            value: 'ALL',
            text: 'ALL'
        }));
			// 받은 데이터를 반복하며 <option> 요소를 생성하여 <select> 요소에 추가합니다.
			res.list.forEach(function(row, index) {
			    console.log(row);
			
			    // <option> 요소를 생성합니다.
			    var option = $('<option>', {
			        value: row.userId,
			        text: row.mbName
			    });
			
			    // 만약 선택되어야 할 값이면 'selected' 속성을 추가합니다.
			    if (row.userId === res.userId) {
			        option.attr('selected', 'selected');
			    }
			
			    // <select> 요소에 <option> 요소를 추가합니다.
			    selectElement.append(option);
			});
			
			 

	}).fail(function() {
		alert("실패");
	});
	
};

var selectDataView = function(twPk) {
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
        $("#twRequester").val(res.result.twRequester).prop("selected",true);
        $("#twWorker").val(res.result.twWorker).prop("selected",true);
        $("#twWorker2").val(res.result.twWorker2).prop("selected",true);
        $("#twSubject").val(res.result.twSubject); 
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

function initializeCKEditor(existingText) {
	
    if (CKEDITOR.instances['twContent']) {
        CKEDITOR.instances['twContent'].destroy();
    }
    // CKEditor 적용
    CKEDITOR.replace('twContent', {
        // 에디터 설정
        // 플러그인, 스타일 등을 추가할 수 있습니다.
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

 
 
   
  // 오늘 날짜를 가져오는 함수
  function getCurrentDate() {
    const today = new Date();
    const year = today.getFullYear();
    let month = today.getMonth() + 1;
    let day = today.getDate();

    // 달과 날짜가 한 자리 수일 경우 두 자리로 변환
    month = month < 10 ? '0' + month : month;
    day = day < 10 ? '0' + day : day;

    return year + '-' + month + '-' + day;
  }

function setTodayDate(stStr) {
    // 현재 날짜를 가져오기
    var today = new Date();

    // 오늘 날짜를 YYYY-MM-DD 형식의 문자열로 변환
    var yyyy = today.getFullYear();
    var mm = String(today.getMonth() + 1).padStart(2, '0'); // 0부터 시작하므로 +1 필요
    var dd = String(today.getDate()).padStart(2, '0');

    var formattedDate = yyyy + '-' + mm + '-' + dd;

    // input 요소에 오늘 날짜 설정
    $("#"+stStr).val(formattedDate);
}
 