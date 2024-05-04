$(document).ready(function() {
    // data-tab 속성의 값에 따라 메뉴 항목에 selected 클래스를 적용
    $('.menu-item').each(function() {
        var dataTab = $(this).attr('data-tab');
        if (dataTab === '4') {
            $(this).addClass('selected');
        }
    });

	//js first start
	initDataList(); 
	
	//button click event
    $("#btnList").click(function(){
        // 페이지 이동
        window.location.href = "/gcs/TD0001/TodayWork901.do"; //page move
    });

	//button click event
    $("#btnWrite").click(function(){
        // 페이지 이동
        window.location.href = "/gcs/TD0001/TodayWork901Write.do"; //page move
    });
}); 


	
//js first start
var initDataList = function() {
	
	//data List
	 searchList();
	
};

var searchList = function() {
	 var form = $('#searchForm').serialize();

	$.ajax({
		url : '/gcs/TD0001/selectTodayWork901List.do'
		, type : 'post'
		, data :form
	}).done(function(res) { 
		$('#resultList').children().remove();
		$('.pagination').children().remove();
		$('.subTr').remove();
		if(res.totalCnt == '0'){
			var data =  "<tr class='subTr'><td colspan='11' style='height:100px;text-align:center;'>No data available.</td></tr>" ;
			$('#resultList').append(data);
			$('.pagination').append(paginationView(res.paginationInfo));
			
			$('.' + res.paginationInfo.currentPageNo ).addClass("active");
			$('.pagination > li').css('cursor', 'pointer');
		}else{
			res.list.forEach(function(row, index) {
				console.log(row)
				$('#resultList').append(pageView(row));
				//mbCode = row.mbCode;	
			});
			$('.pagination').children().remove();
			$('.pagination').append(paginationView(res.paginationInfo));
			$('.' + res.paginationInfo.currentPageNo ).addClass("active");
			$('.pagination > li').css('cursor', 'pointer');
		}
	}).fail(function() {
		alert("실패");
	});
	
};

var pageView = function(row) {  
	// 버튼 스타일 적용
      var data = ""
			+ "<tr>\r\n"
			+ "	<td class=\"center\">"+row.twPk+"</td>\r\n"
			//+ "	<td class=\"left\">"+row.twProjectId+"</td>\r\n"
			+ "	<td class=\"center\">"+row.twCategory1+"</td>\r\n"
			+ "	<td class=\"center\">"+row.twCategory2+"</td>\r\n"
			+ "	<td class=\"center\">"+row.twSubject+"</td>  \r\n"
			+ "	<td class=\"center\"><span class=\"btnRound\">"+row.twStatus+"</span></td>  \r\n"
			+ "	<td class=\"center\">\r\n"
			+ "	 "+row.twRequestDate+"<br>\r\n" 
			+ "	 "+row.twRequester+"\r\n" 
			+ "	</td>    \r\n" 
			+ "	<td class=\"center\">"+row.twWorker+"</td>  \r\n"
			+ "	<td class=\"center\">"+formatDate(row.twUpdatetime)+"</td>  \r\n"
			+ "	<td class=\"center\">   \r\n" 
			+ "	<div class=\"submit-image2 viewClass\" id=\"submitBtn2\" data-pk='"+row.twPk+"'>VIEW</div> \r\n"  
			+ "	<div class=\"submit-image editClass\" id=\"submitBtn\" data-pk='"+row.twPk+"'>EDIT</div> \r\n" 
			+ "	</td>   \r\n" 
			+ "</tr>"; 
	   return $(data);
};

	$(document).on('click', '.viewClass', function() {
		//n....page
		var twPk = $(this).data('pk'); 
        alert(twPk);
 
	});
	
	$(document).on('click', '.editClass', function() {
		//n....page
		var twPk = $(this).data('pk'); 
        window.location.href = "/gcs/TD0001/TodayWork901Write.do?twPk="+twPk;
 
	});

function formatDate(inputDate) {
    var date = new Date(inputDate);
    var year = date.getFullYear().toString().slice(2);
    var month = ('0' + (date.getMonth() + 1)).slice(-2);
    var day = ('0' + date.getDate()).slice(-2);
    var hours = ('0' + date.getHours()).slice(-2);
    var minutes = ('0' + date.getMinutes()).slice(-2);
    return year + '-' + month + '-' + day + ' ' + hours + ':' + minutes;
}


var paginationView = function(page) {
	 var data = "" ;
 
	 	data = 
		'	<li class="first"><a class="pageClass" data-page="' + page.firstPageNo + '" title="첫 페이지 바로가기"><img src="/images/bbs_prev02.gif" alt="첫 페이지" style="margin: 10px;"></a></li>' +
		'	<li class="prev"><a class="pageClass" data-page="' + (page.currentPageNo-1) + '" title="이전 페이지(1page) 바로가기"><img src="/images/bbs_prev01.gif" alt="이전 페이지" style="margin: 10px;"></a></li>' ;
		
		for (var i=page.firstPageNoOnPageList; i <= page.lastPageNoOnPageList; i++) {
			data = data +
				'<li class=' + i + '><a class="pageClass" data-page="' + i + '" title="' + i + '페이지 바로가기">' + i + '</a></li>' ;
		}
		
		data = data +
			'<li class="next"><a class="pageClass" data-total_page_count="' + page.totalPageCount + '" data-page="' + (page.currentPageNo+1) + '" title="다음 페이지(11page) 바로가기"><img src="/images/bbs_next01.gif" alt="다음 페이지" style="margin: 10px;"></a></li>' +
			'<li class="last"><a class="pageClass" data-page="' + page.lastPageNo + '" title="끝 페이지(67page) 바로가기"><img src="/images/bbs_next02.gif" alt="마지막 페이지" style="margin: 10px;"></a></li>' ;
	 
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
	searchList();
	
});
 