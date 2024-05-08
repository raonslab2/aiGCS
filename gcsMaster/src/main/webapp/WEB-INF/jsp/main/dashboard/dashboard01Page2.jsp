<%--
  Class Name : dashboardPage.jsp
  Description : dashboard
  Modification Information
 
      수정일         수정자                   수정내용
    -------    --------    ---------------------------
     2021.07.07   MBA       데시보드 생성
 
    author   : 평가계획관리시스템 MBA
    since    : 2021.07.07
--%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta charset="utf-8">
<title>TIPA 스케쥴기반 평가관리시스템</title>
<%@ page import="java.util.Calendar"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%

	SimpleDateFormat sf = new SimpleDateFormat("yyyy.MM.dd");	
	Calendar calendar = Calendar.getInstance();	
	String toDay = sf.format(calendar.getTime());	// 오늘
	int intTodayWeek = calendar.get(Calendar.DAY_OF_WEEK); 

	String strKorWeek = "";
	switch(intTodayWeek) {
		case 1: strKorWeek= "일"; break;
		case 2: strKorWeek= "월"; break;
		case 3: strKorWeek= "화"; break;
		case 4: strKorWeek= "수"; break;
		case 5: strKorWeek= "목"; break;
		case 6: strKorWeek= "금"; break;
		case 7: strKorWeek= "토"; break;
	}

	// 현재 주의 시작일자
	calendar.add(Calendar.DATE , (intTodayWeek-1)*(-1));
	String weekStartDate = sf.format(calendar.getTime());

%>
<c:import url="/EmpPageLink.do?link=main/include/src" />

<script type="text/javascript">
	$(document).ready(function() {
		$(function() {
			initListSt();
		});
		
	
		// To-Do 일정 추가 버튼
		$(document).on('click', '.btnPopToDoAdd', function() {
			fnPopupAddOpen("/empo/dashboard/eMAU00A0101TODO.do", "");	// ../js/popup.js 참고 
		});

		// 주간 전체보기 추가 버튼
		$(document).on('click', '.btnPopWeekAllView', function() {  
			fnPopupOpen("/empo/dashboard/eMAU00A0101popup.do", "");
			//dashboard0102popup.jsp
		});

		// 일정 Work 보기 버튼
		$(document).on('click', '.btnPopWorkView', function() { 
			fnPopupOpen("/empo/dashboard/eMAU00A01work00101.do", "#formUserRequest");	// ../js/popup.js 참고
		});
		
		// To-Do 일정 보기 버튼
		$(document).on('click', '.btnPopToDoView', function() {
			fnPopupAddOpen("/empo/dashboard/eMAU00A0102TODO.do", "");	// ../js/popup.js 참고
		});
		

		// 오늘 일정 더보기
		$(document).on('click', '.btnScheduleAddView', function() {

			// ajax 등을 이용하여 데이터를 불러온다.
			// 아래는 테스트를 위한 가짜 데이터
			var html = "";		
			
			html = html + '<div class="tnews_list">';
			html = html + '	<a href="#" class="btnPopToDoView">';
			html = html + '		<ul>';
			html = html + '			<li class="tit"><input type="checkbox"> 평가위원회 개최</li>';
			html = html + '			<li>공통투자형 과제 지정 공모1차</li>';
			html = html + '			<li>평가장 505호</li>';
			html = html + '			<li class="date">10:00 AM</li>';
			html = html + '		</ul>';
			html = html + '	</a>';
			html = html + '</div>';
			
			// 스크롤 때문에 이렇게 추가해야 한다.
			$(".scheduleList").find("#mCSB_2").find("#mCSB_2_container").append(html);

			// 스크롤바 하단 이동
			$(".scheduleList").mCustomScrollbar("scrollTo","bottom");
		});


		// Check List 추가 버튼
		$(document).on('click', '.btnCheckListAdd', function() {
			fnPopupOpen("/empo/dashboard/eMAU00A01check00101.do", "");	// ../js/popup.js 참고
		});


		// 알림 삭제
		$(document).on('click', '.btnNoticeDelete', function() {
			if (confirm("선택하신 알림을 삭제하시겠습니까?")) {
				var index = $(this).parent().parent().index();
				alert(index);
				$(".noticeList").find("ul").eq(index).remove();
			}
		});
		
		
	});
	
	
    function noticeDelete(tmStr) { 
	  if (confirm("해당 일정을 삭제하시겠습니까?")) {
		  $.post('/empo/dashboard/deleteNotice.do', {noPk:tmStr} ).done(function(res) {
				if(res.result == "1"){
					alert("삭제되었습니다.");
					$('.' + tmStr).remove();
				}else{
					alert("삭제실패");
				}
				 
				
			}).fail(function() {
				alert("실패");
			});
	  } else {
		  console.log($(this));
		  return false;
	  }
		
    }


	// Tasks 구분별 목록 보기
	function fnTaskListView(div) {
		if ($.trim(div).length > 0) {
			$(".tasks_list").css("display","none");
			$("."+div).css("display","");
		}
		else {
			$(".tasks_list").css("display","");
		}
	}

	// 일자별 Today 일정 보기
	function fnTodayScheduleView(dd) {
		// 선택한 일자의 일정을 ajax 등으로 불러온다.
		// 아래는 테스트를 위한 가짜 데이터
		var html = "";			
		for (var i = 0; i < 4; i++) {
			html = html + '<div class="tnews_list">';
			html = html + '	<a href="#" class="btnPopToDoView">';
			html = html + '		<ul>';
			html = html + '			<li class="tit"><input type="checkbox"> 평가위원회 개최</li>';
			html = html + '			<li>공통투자형 과제 지정 공모1차</li>';
			html = html + '			<li>평가장 505호</li>';
			html = html + '			<li class="date">1'+i+':'+dd.substring(8,10)+' AM</li>';
			html = html + '		</ul>';
			html = html + '	</a>';
			html = html + '</div>';
		}
		
		// 기존 데이터를 삭제한다.
		$(".tnews_list").remove();

		// 스크롤 때문에 이렇게 추가해야 한다.
		$(".scheduleList").find("#mCSB_2").find("#mCSB_2_container").append(html);

		// 스크롤바 하단 이동
		$(".scheduleList").mCustomScrollbar("scrollTo","top");
	}

</script>

</head>

<body>
	<form id="popupForm">
		<input type="hidden" id="dtlAncmNm" name="dtlAncmNm" />
		<input type="hidden" id="bisiYy" name="bisiYy" />
	</form>
	
	<!-- s :wrap -->
	<div id="wrap">
		<!-- s :lnb_guide -->
		<div class="lnb_guide">
			<c:import url="/EmpPageLink.do?link=main/include/menu" />  
		</div>
		<!-- e :lnb_guide -->
			
		<!-- s :right_guide -->
		<div class="right_guide">
			<!-- 화면 상단 시작 -->
			<div class="top_guide">

				<!-- 1차 메뉴명 -->
				<h3>Dashboard</h3>
                <c:import url="/EmpPageLink.do?link=main/include/top" />  
			</div>
			<!-- 화면 상단 종료 -->
			
			<!-- s :contents_guide -->
			<div class="contents_guide">
				<div class="dashboard_guide"> 
					<div class="tasks_guide2">
						<h4>연도별 통계    
						<select id="pjYear" name="pjYear">
						</select>
						<!-- 사업명 검색 -->
						<span class="search_box03 input_w30">
							<input type="text" id="searchName" placeholder="세부사업명 입력">
							<button type="button" class="btn_search01" id="pjSearch">검색</button>
						</span>
						</h4>
								<!-- 검색 form 시작 -->
								<form id="searchForm" name="searchForm" method="post">
									<input type="hidden" id="page" name="page" value="" />
						 
								</form>
								<!-- 검색 form 종료 -->
						<div class="btn_guide ar">  
							<a href="<c:url value='/empo/dashboard/eMAU00A01Main.do'/>" class="btn_style02 btn_white sb_style ">통계정보</a>
						</div>
						<div class="bbs_list2" style="margin-top:17px;">
		                	<table id="bbs_list1"> 
								<colgroup>
									<col width = "5%">
									<col width = "">
									<col width = "10%">
									<col width = "10%">
									<col width = "10%">
									<col width = "10%">
									<col width = "10%">
									<col width = "10%">   
								</colgroup>
								<thead>
								<tr> 
								  <th scope="col">사업년도</th>
								  <th scope="col">세부사업</th>
								  <th scope="col">내역사업</th>
								  <th scope="col">내내역사업</th>
								  <th scope="col">협약체결(건)</th>
								  <th scope="col">과제(진행중)</th>
								  <th scope="col">최종보고서제출</th> 
								  <th scope="col">최종평가</th> 
								</tr>
								</thead>
								<tbody id="resultList"> 
								</tbody>
							</table> 
						</div>
					<!-- e : bbs_list -->
					<div class="bbs_page">
						<ul class="pagination">
						</ul>
					</div>
						 <!--
						<div class="tasks_top" >
						   
						    <div id="resultProcessSum"></div>
						  
						</div>
						 -->
						<div class="tasks_list_all scroll sbox_h650">
                            <div id="resultProcess">
                            </div>
						</div>
						<!-- e :tasks_list_all -->
						
					</div> 
					<!-- e :tasks_guide -->
					
					<div class="news_guide">
						<h4>알림을 확인하세요</h4>
						<div class="news_all">
							<div class="news_list_all scroll sbox_h750 noticeList">  
							  <div id="resultNotice"></div>
							</div>
							<!-- e :news_list_all -->
							<div class="news_more"><a href="#" class="btnNoticeAddView"><span>알림 더보기</span></a></div>
						</div>
						<!-- e :news_all -->
					</div>
					<!-- e :news_guide -->
					
				</div>
				<!-- e :dashboard_guide -->
					
				<!-- 팝업 띄울 공간 -->
				<div id="divPopup" class="overlay"></div>
				<div id="divAddPopup" class="overlay"></div>
			</div>
			<!-- e :contents_guide -->
		</div>
		<!-- e :right_guide -->
	</div>
	<!-- e :wrap -->
<script>
;(function() { 
	
	// 알림 더보기
	$(document).on('click', '.btnNoticeAddView', function() {
		//var formSer = $('#searchForm').serialize(); 
		//var searchTodayVal = getToday();
		var now = new Date();
		var after7 = new Date();
		var nowDate = after7.getDate();
		after7.setDate(nowDate + 7);
		var yearB = now.getFullYear();
		var monthB = now.getMonth() + 1;    //1월이 0으로 되기때문에 +1을 함.
	    var dateB = now.getDate();
		
	    var yearA = after7.getFullYear();
	    var monthA = after7.getMonth() + 1;    //1월이 0으로 되기때문에 +1을 함.
	    var dateA = after7.getDate();
	    
	    monthB = monthB >=10 ? monthB : "0" + monthB;
	    dateB  = dateB  >= 10 ? dateB : "0" + dateB;
	    var hours = ('0' + now.getHours()).slice(-2);
		var minutes = ('0' + now.getMinutes()).slice(-2);
		
	    monthA = monthA >=10 ? monthA : "0" + monthA;
	    dateA  = dateA  >= 10 ? dateA : "0" + dateA;
	    
	    console.log(now);
	    console.log(after7)
	     // ""을 빼면 year + month (숫자+숫자) 됨.. ex) 2018 + 12 = 2030이 리턴됨.
		var beforeDate = ""+yearB +"-"+ monthB +"-"+ dateB + " " + hours + ":" + minutes; 
		var afterDate = ""+yearA +"-"+ monthA +"-"+ dateA + " 23:59"; 
		//today = 
		//console.log(today);
		$.post('/empo/dashboard/selectNotice.do', {searchStart:beforeDate , searchEnd:afterDate, noticeRow : $(".noticeRow").length } ).done(function(res) {
			//alert(res.list);
			res.list.forEach(function(row, index) {  				
				var noInday = new Date(row.noInday);
				console.log(now.getDate());
				console.log(noInday.getDate());
				var minus = "";
				var rtnMessage = "";
				if (now.getFullYear() < noInday.getFullYear()) {
					minus = 31+noInday.getDate() - now.getDate();
					rtnMessage = minus + "일 전";
				}
				else if (now.getMonth() < noInday.getMonth()) {
					var lastDay = new Date(now.getFullYear(), now.getMonth() + 1, 0).getDate();
					minus = lastDay+noInday.getDate() - now.getDate();
					rtnMessage = minus + "일 전";
				}
				else if (now.getDate() < noInday.getDate()) {
					minus = noInday.getDate() - now.getDate()
					rtnMessage = minus + "일 전";
				}
				else if (now.getDate() == noInday.getDate()) {
					var nowTime = now.getTime();
					var noIndayTime = noInday.getTime();
					if (nowTime < noIndayTime) {
						sec = parseInt(noIndayTime - nowTime) / 1000;
						day = parseInt(sec/60/60/24);
						sec = (sec - (day * 60 * 60 * 24));
						hour = parseInt(sec/60/60);
						sec = (sec - (hour*60));
						min = parseInt(sec/60);
						sec = parseInt(sec-(min*60));
						
						if (hour > 0 ) {
							rtnMessage = hour + "시간 전";
						} else if (min > 0) {
							rtnMessage = min + "분 전";
						} else if (sec > 0) {
							rtnMessage = sec + "초 전";
						}
					}				
				}
				
				console.log(rtnMessage);
				
				row.rtnMessage = rtnMessage; 
				if (row.noTitle == "RPA 알림") {
					row.rtnMessage = "RPA 자료요청 완료";
				} 
				$('#resultNotice').append(managerNoticeView(row)); 
			});
			
		}).fail(function() {
			alert("실패");
		});
		/* // ajax 등을 이용하여 데이터를 불러온다.
		// 아래는 테스트를 위한 가짜 데이터
		var html = "";			
		html = html + '<ul>';
		html = html + '	<li class="al_time">30분전</li>';
		html = html + '	<li class="tit">분과구성 등록_BM개발과제 1단계</li>';
		html = html + '	<li class="data_txt01">2021년도 소상공인 자영업자를 위한 생활혁신형 기술개발사업’BM개발과제(1단계 BM기획)</li>';
		html = html + '	<li class="data_txt02">평가장 본사 502호</li>';
		html = html + '	<li class="btn_del"><a href="#" onclick="noticeDelete()" >삭제</a></li>';
		html = html + '</ul>';
		
		// 스크롤 때문에 이렇게 추가해야 한다.
		$(".noticeList").find("#mCSB_4").find("#mCSB_4_container").append(html);

		// 스크롤바 하단 이동
		$(".noticeList").mCustomScrollbar("scrollTo","bottom"); */
	});
	
	$(document).on('click', '.rowSub', function() {
		$("#dtlAncmNm").val($(this).data('dtl_ancm_nm'));
		$("#bisiYy").val($(this).data('bisi_yy'));
		
		fnPopupOpen("/empo/dashboard/dashboardWork.do", "#popupForm");
	});
	
	$(function() {
		
		//프로세스 목록 출력
		initList(); 
		
		//담당간사 지원요청
		selectPjRequest();
		
		//알림
		selectNotice();
		
	});
	 
    
	$('#searchGubun').change(function() {
		var el = $(this);
		var data = el.val();
		var id = el.attr('id');
		 
		initList(); 
		
	});
	 
	var initList = function() {
		$("#page").val("");
		var formSer = $('#searchForm').serialize();
  
		$.post('/empo/dashboard/eMAU00A0101Sum.do', formSer).done(function(res) {
			$('#resultList').children().remove();
			$('.pagination').children().remove();
			$('.subTr').remove();  

			if(res.totalCnt == '0'){
				var data =  "<tr class='subTr'><td colspan='7' style='height:100px;'>자료가 존재하지 않습니다.</td></tr>" ;
				$('#resultList').append(data);
				$('.pagination').append(paginationView(res.paginationInfo));
				
				$('.' + res.paginationInfo.currentPageNo ).addClass("active");
				$('.pagination > li').css('cursor', 'pointer');
				
			}else{ 
				res.list.forEach(function(row, index) {
					console.log(row)
					$('#resultList').append(projectListView(row)); 
				});
				
				$('.pagination').append(paginationView(res.paginationInfo));
				
				$('.' + res.paginationInfo.currentPageNo ).addClass("active");
				$('.pagination > li').css('cursor', 'pointer');
			} 
			
		}).fail(function() {
			alert("실패");
		});
		 
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
	 } 
	
	var projectListView = function(row) {
		var data = 
			'<tr class="subTr rowSub" style="cursor:pointer;" data-bisi_yy="' + row.bisiYy + '" data-dtl_ancm_nm="' + row.dtlAncmNm + '">' +
			/* '	<td ><input type="checkbox" class="checkRow" ></td>' + */
			/* '	<td class="subRow" data-pj_code=' + row.pjCode +  '>' + row.pjCode + '</td>' +*/
			'	<td class="subRow"> ' + row.bisiYy + '</td>' +
			'	<td class="subRow">' + row.dtlAncmNm + '</td>' +
			'	<td class="subRow">' + row.brdnBusiNm + '</td>' +
			'	<td class="subRow">' + row.bbrdnBusiNm + '</td>' +
			'	<td class="subRow">' + row.agreCntrYnY + '</td>' +
			'	<td class="subRow">' + row.lastSbjtPrgSeNm + '</td>' +
			'	<td class="subRow">' + row.lastRptpSubmYn + '</td>' +
			'	<td class="subRow">' + row.lastEvalYmd + '</td>' +
			'</tr>' ;
			
			return $(data);
	} 
	
	var managerSumView = function(row) { 
		var data  = "<td>"+row.pjYy+"</td> ";
		
		return $(data);
	}
	
	var managerCheckList = function(row) {
		var data; 
		
		//data = "<li><input type=\"checkbox\" checked> <span class=\"line_yes\">"+row.clTitle+"</span></li>"; 	
		data = "<li><input type=\"checkbox\"> <span>"+row.clTitle+"</span></li>";
		return $(data);
	}
	
	var managerListView = function(row,i) {
 		
   
		var searchTodayVal = getToday();
		var searchPjCodeVal = row.pjCode; 
        var pcName = "";
        var pcDayStart = "";
        var pcDayEnd = "";
        $.ajaxSetup({ async:false });
		$.post('/empo/dashboard/eMAU00A0101TaskDetail.do', {searchToday:searchTodayVal,searchPjCode:searchPjCodeVal} ).done(function(res) {
			console.log(res) 
			//첫번째 checkList 출력
			if(i == 0){
				if (res.checkList != null) {
					res.checkList.forEach(function(row2, index2) {  
						$('#resultCheckList').append(managerCheckList(row2));
					});	
				}
			}
				
			res.list.forEach(function(row, index) {  
				//$('#resultProcess').append(managerListView(row));
				pcName     = row.pcName;
				pcCode     = row.pcCode; 
				pcDayStart = row.pcDayStart;
				pcDayEnd   = row.pcDayEnd;
				 
			});
			
		}).fail(function() {
			alert("실패");
		});
		
	    var stDate = new Date(getToday());  
	    var endDate = new Date(pcDayStart); 
	    
	    var btMs  = endDate.getTime() - stDate.getTime();
	    var btDay = btMs / (1000*60*60*24)
		 
	    
	    
		var tmStr = "";
	    //alert(row.empjPsList[1].pcName);
	    for (var i = 1; i <= 8; i++) {
	    	if(i == 2){
	    		tmStr = tmStr +" <li><span class=\"bg_now\"></span>\r\n" + 
				"				   <div>"+ pcName +" ("+pcDayStart+" ~ "+ pcDayEnd+")</div>\r\n" + 
				"				  </li>";
	    	}else{
	    		tmStr = tmStr + "<li><span></span></li>\r\n";
	    	}
	    	
		}
	   
		
		data = "				 <div class=\"tasks_list taskTopNow\" id=\"processList\" name=\"processList\"> <!-- 진행중 class : taskTopNow -->\r\n" + 
		"								<ul class=\"tasks_info\">\r\n" + 
		"									<li class=\"date\">"+row.pcdayStart+"</li>\r\n" + 
		"									<li class=\"progress\">"+pcName+" <strong class=\"txt_now\">"+btDay+"</strong>일전</li>\r\n" + 
		"									<li class=\"tit\">"+row.pjTitle+"</li>\r\n" + 
		"									<li class=\"t_period\">"+row.pjStart+" ~ "+row.pjEnd+"</li>\r\n" + 
		"								</ul>\r\n" + 
		"								<div class=\"progress_guide\">\r\n" + 
		"									<h5>Progress</h5>\r\n" + 
		"									<ul>\r\n" + 
		tmStr +
		"									</ul>\r\n" + 
		"								</div>\r\n" +  
		"							</div>";
     
		return $(data);
		 
	}
	
	//담당간사 지원요청
	var selectPjRequest = function() {
		//var formSer = $('#searchForm').serialize(); 
		var searchTodayVal = getToday();
		$.post('/empo/dashboard/selectPjRequest.do', {searchToday:searchTodayVal} ).done(function(res) { 
			//$('#requestCnt').append(res.listCnt);  
			res.list.forEach(function(row, index) {  				
				$('#userRequest').append(selectRequestView(row)); 
			}); 
		 
			
		}).fail(function() {
			alert("실패");
		});
	}
	
	var selectRequestView = function(row) {
		var data; 
		
	    var stDate = new Date(getToday());  
	    var endDate = new Date(row.pjInDate); 
	    
	    var btMs  = endDate.getTime() - stDate.getTime();
	    var btDay = btMs / (1000*60*60*24)
	     
	    //팝업
	    $('#gsPk').val(row.gsPk); 
		data = "<div class=\"notice\"><a href=\"#\" class=\"btnPopWorkView\">담당간사 지원요청 <span>요청건수 ( <span>"+btDay+"일전</span> ) </span></a></div>";
	 
		
		return $(data);
	}
	
	
	
	var selectNotice = function() {
		//var formSer = $('#searchForm').serialize(); 
		//var searchTodayVal = getToday();
		var now = new Date();
		var after7 = new Date();
		var nowDate = after7.getDate();
		after7.setDate(nowDate + 30);
		var yearB = now.getFullYear();
		var monthB = now.getMonth() + 1;    //1월이 0으로 되기때문에 +1을 함.
	    var dateB = now.getDate();
		
	    var yearA = after7.getFullYear();
	    var monthA = after7.getMonth() + 1;    //1월이 0으로 되기때문에 +1을 함.
	    var dateA = after7.getDate();
	    
	    monthB = monthB >=10 ? monthB : "0" + monthB;
	    dateB  = dateB  >= 10 ? dateB : "0" + dateB;
	    var hours = ('0' + now.getHours()).slice(-2);
		var minutes = ('0' + now.getMinutes()).slice(-2);
		
	    monthA = monthA >=10 ? monthA : "0" + monthA;
	    dateA  = dateA  >= 10 ? dateA : "0" + dateA;
	    
	    console.log(now);
	    console.log(after7)
	     // ""을 빼면 year + month (숫자+숫자) 됨.. ex) 2018 + 12 = 2030이 리턴됨.
		var beforeDate = ""+yearB +"-"+ monthB +"-"+ dateB + " " + hours + ":" + minutes; 
		var afterDate = ""+yearA +"-"+ monthA +"-"+ dateA + " 23:59"; 
		//today = 
		//console.log(today);
		$.post('/empo/dashboard/selectNotice.do', {searchStart:beforeDate , searchEnd:afterDate} ).done(function(res) {
			//alert(res.list);
			res.list.forEach(function(row, index) {  				
				var noInday = new Date(row.noInday);
				console.log(now.getDate());
				console.log(noInday.getDate());
				var minus = "";
				var rtnMessage = "";
				if (now.getFullYear() < noInday.getFullYear()) {
					minus = 31+noInday.getDate() - now.getDate();
					rtnMessage = minus + "일 전";
				}
				else if (now.getMonth() < noInday.getMonth()) {
					var lastDay = new Date(now.getFullYear(), now.getMonth() + 1, 0).getDate();
					minus = lastDay+noInday.getDate() - now.getDate();
					rtnMessage = minus + "일 전";
				}
				else if (now.getDate() < noInday.getDate()) {
					minus = noInday.getDate() - now.getDate()
					rtnMessage = minus + "일 전";
				}
				else if (now.getDate() == noInday.getDate()) {
					var nowTime = now.getTime();
					var noIndayTime = noInday.getTime();
					if (nowTime < noIndayTime) {
						sec = parseInt(noIndayTime - nowTime) / 1000;
						day = parseInt(sec/60/60/24);
						sec = (sec - (day * 60 * 60 * 24));
						hour = parseInt(sec/60/60);
						sec = (sec - (hour*60));
						min = parseInt(sec/60);
						sec = parseInt(sec-(min*60));
						
						if (hour > 0 ) {
							rtnMessage = hour + "시간 전";
						} else if (min > 0) {
							rtnMessage = min + "분 전";
						} else if (sec > 0) {
							rtnMessage = sec + "초 전";
						}
					}				
				}
				
				console.log(rtnMessage);
				
				row.rtnMessage = rtnMessage; 
				if (row.noTitle == "RPA 알림") {
					row.rtnMessage = "RPA 자료요청 완료";
				} 
				
				$('#resultNotice').append(managerNoticeView(row)); 
			});
			
		}).fail(function() {
			alert("실패");
		});
	}
	
	var managerNoticeView = function(row) {
		console.log(row);
		var data = "";
		if (row.rtnMessage == "RPA 자료요청 완료") {
			data = "	 <ul class='noticeRow " + row.noPk + "'>\r\n" + 
			"				 <li class=\"al_time not_read\">" + row.rtnMessage + "</li>\r\n" + 
			"				 <li class=\"tit\">"+row.noTitle+"</li>\r\n" + 
			"				 <li class=\"date\">완료일자 : "+row.noWriteDate+"</li>\r\n" + 
			"				 <li class=\"data_txt01\">"+row.noText+"</li>\r\n" + 
			"				 <li class=\"btn_del\"><a href=\"#\" onclick=\"noticeDelete("+row.noPk+")\">삭제</a></li>\r\n" + 
			"		     </ul>";
		} else {
			data = "	 <ul class='noticeRow " + row.noPk + "'>\r\n" + 
			"				 <li class=\"al_time not_read\">" + row.rtnMessage + "</li>\r\n" + 
			"				 <li class=\"tit\">"+row.noTitle+"</li>\r\n" + 
			"				 <li class=\"date\">요청일자 : "+row.noInday+"</li>\r\n" + 
			"				 <li class=\"data_txt01\">"+row.noText+"</li>\r\n" + 
			"				 <li class=\"btn_del\"><a href=\"#\" onclick=\"noticeDelete("+row.noPk+")\">삭제</a></li>\r\n" + 
			"		     </ul>";	
		}
		
		return $(data);	
	}
	
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
		
		var formSer = $('#searchForm').serialize();
		
		$.ajax({
			url : '/empo/dashboard/eMAU00A0101Sum.do'
			, type : 'post'
			, data :formSer
		}).done(function(res) { 
			console.log(res);
			$('#resultList').children().remove();
			$('.pagination').children().remove();
			//목록 출력
			res.list.forEach(function(row, index) {
				
				$('#resultList').append(projectListView(row));
				//pjCode = row.pjCode;
			});
			
			$('.pagination').append(paginationView(res.paginationInfo));
			
			$('.' + res.paginationInfo.currentPageNo ).addClass("active");
			$('.pagination > li').css('cursor', 'pointer');
			
		}).fail(function() {
			alert("실패");
		});
		
	});
	
	 
	
	function getToday(){
	    var now = new Date();
	    var year = now.getFullYear();
	    var month = now.getMonth() + 1;    //1월이 0으로 되기때문에 +1을 함.
	    var date = now.getDate();

	    month = month >=10 ? month : "0" + month;
	    date  = date  >= 10 ? date : "0" + date;
	     // ""을 빼면 year + month (숫자+숫자) 됨.. ex) 2018 + 12 = 2030이 리턴됨.
		var hours = ('0' + now.getHours()).slice(-2);
		var minutes = ('0' + now.getMinutes()).slice(-2);
	    //console.log(""+year + month + date);
	    return today = ""+year +"-"+ month +"-"+ date; 
	}
})();
</script>
</body>
</html>
