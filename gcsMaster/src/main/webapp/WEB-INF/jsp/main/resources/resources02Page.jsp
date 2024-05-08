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
<c:import url="/EmpPageLink.do?link=main/include/src" /> 

</head>

<body>
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
				<h3>가용자원</h3>
                 <c:import url="/EmpPageLink.do?link=main/include/top" />  
			</div>
			<!-- 화면 상단 종료 -->
			
			<!-- s :contents_guide -->
			<div class="contents_guide">
				<div class="submenu_guide">
					<ul>
						<!-- 2차메뉴명 -->
						<li><a href="<c:url value='/empo/resources/eMAU00C01Main.do'/>">분과구성 현황</a></li>
						<li><a href="<c:url value='/empo/resources/eMAU00C02Main.do'/>" class="active">가용자원 조회(간사, 평가장)</a></li>
						<%-- <li><a href="<c:url value='/empo/resources/eMAU00C03Main.do'/>">가용자원 조회(평가장) 삭제예정</a></li> --%>
					</ul>
				</div>
				
				<!-- <div class="btn_guide ar mt-65 mb30">
					<button type="button" class="btn_style01 btn_blue" id="btnDivComfirm">지원가능여부 확인</button>
				</div> -->
	 
				
				<!-- s :calender_guide -->
				<div class="calender_guide">
					<div class="tit_date">
						<span>검색기간</span> 
						<strong class="listSearchDate">2021.06.22 ~ 2021.06.28</strong>
						<button type="button" class="btn_style06 btn_prev01" id="btnListDatePrev">이전</button>
						<button type="button" class="btn_style06 btn_next01" id="btnListDateNext">다음</button> 
						<strong class="listNextDate">2021.06.29 ~ 2021.07.05</strong>
					</div>
					<!-- e :tit_date -->
					
					<ul class="sort">
						<li><span class="dot possible">가능</span> 가능</li>
						<li><span class="dot wait">응답대기</span> 응답대기</li>
						<li><span class="dot impossible">불가능</span> 불가능</li>
					</ul>
					<!-- e :sort -->

<!-- 					<div class="input_w100 mt50 mb50 date_tit"> -->
<!-- 						조회 결과가 없습니다. -->
<!-- 					</div> -->
					
					<form id="popupForm">
						<input type="hidden" id="dataGrmCode" name="dataGrmCode" />
						<input type="hidden" id="dataGrmName" name="dataGrmName" />
					</form>

					<div class="bbs_calender01">
						<div class="calender_top">
							<div>선택부서별 구분</div>
							<ul class="day_tit">
								<!-- <li><span>Sun</span>6/20</li>
								<li><span>Mon</span>6/21</li>
								<li><span>Tue</span>6/22</li>
								<li><span>Wed</span>6/23</li>	
								<li><span>Thu</span>6/24</li>	
								<li><span>Fri</span>6/25</li>	
								<li><span>Sat</span>6/26</li>	 -->
							</ul>
						</div>
						<!-- e :calender_top -->
						
						<div class="calender_all">
							<!-- <div class="calender_list">
								<div><strong><span>대외협력기획실</span></strong></div>
								<ul class="day_all">
									<li>
										&nbsp;
									</li>
									<li>
										<ul class="data_list03">
											<li><span class="dot possible">가능</span> 홍길순 클릭시 팝업열림</li>
											<li><span class="dot wait">응답대기</span> 김철수</li>
											<li><span class="dot impossible">불가능</span> 최영희</li>
											<li>외 가능2, 대기2, 불가능2</li>
										</ul>
									</li>
									<li>
										<ul class="data_list03">
											<li><span class="dot possible">가능</span> 홍길순</li>
											<li><span class="dot wait">응답대기</span> 김철수</li>
											<li><span class="dot impossible">불가능</span> 최영희</li>
											<li>외 가능2, 대기2, 불가능2</li>
										</ul>
									</li>
									<li>
										<ul class="data_list03">
											<li><span class="dot possible">가능</span> 홍길순</li>
											<li><span class="dot wait">응답대기</span> 김철수</li>
											<li><span class="dot impossible">불가능</span> 최영희</li>
											<li>외 가능2, 대기2, 불가능2</li>
										</ul>
									</li>
									<li>
										<ul class="data_list03">
											<li><span class="dot possible">가능</span> 홍길순</li>
											<li><span class="dot wait">응답대기</span> 김철수</li>
											<li><span class="dot impossible">불가능</span> 최영희</li>
											<li>외 가능2, 대기2, 불가능2</li>
										</ul>
									</li>
									<li>
										<ul class="data_list03">
											<li><span class="dot possible">가능</span> 홍길순</li>
											<li><span class="dot wait">응답대기</span> 김철수</li>
											<li><span class="dot impossible">불가능</span> 최영희</li>
											<li>외 가능2, 대기2, 불가능2</li>
										</ul>
									</li>
									<li>
										&nbsp;
									</li>
								</ul>
							</div>
							<div class="calender_list">
								<div><strong><span>산학혁력사업실</span></strong></div>
								<ul class="day_all">
									<li>
										<ul class="data_list03">
											<li><span class="dot possible">가능</span> 홍길순</li>
											<li><span class="dot wait">응답대기</span> 김철수</li>
											<li><span class="dot impossible">불가능</span> 최영희</li>
											<li>외 가능2, 대기2, 불가능2</li>
										</ul>
									</li>
									<li>
										<ul class="data_list03">
											<li><span class="dot possible">가능</span> 홍길순</li>
											<li><span class="dot wait">응답대기</span> 김철수</li>
											<li><span class="dot impossible">불가능</span> 최영희</li>
											<li>외 가능2, 대기2, 불가능2</li>
										</ul>
									</li>
									<li>
										<ul class="data_list03">
											<li><span class="dot possible">가능</span> 홍길순</li>
											<li><span class="dot wait">응답대기</span> 김철수</li>
											<li><span class="dot impossible">불가능</span> 최영희</li>
											<li>외 가능2, 대기2, 불가능2</li>
										</ul>
									</li>
									<li>
										<ul class="data_list03">
											<li><span class="dot possible">가능</span> 홍길순</li>
											<li><span class="dot wait">응답대기</span> 김철수</li>
											<li><span class="dot impossible">불가능</span> 최영희</li>
											<li>외 가능2, 대기2, 불가능2</li>
										</ul>
									</li>
									<li>
										<ul class="data_list03">
											<li><span class="dot possible">가능</span> 홍길순</li>
											<li><span class="dot wait">응답대기</span> 김철수</li>
											<li><span class="dot impossible">불가능</span> 최영희</li>
											<li>외 가능2, 대기2, 불가능2</li>
										</ul>
									</li>
									<li>
										<ul class="data_list03">
											<li><span class="dot possible">가능</span> 홍길순</li>
											<li><span class="dot wait">응답대기</span> 김철수</li>
											<li><span class="dot impossible">불가능</span> 최영희</li>
											<li>외 가능2, 대기2, 불가능2</li>
										</ul>
									</li>
									<li>
										&nbsp;
									</li>
								</ul>
							</div>
							<div class="calender_list">
								<div><strong><span>기업협력사업실</span></strong></div>
								<ul class="day_all">
									<li>
										&nbsp;
									</li>
									<li>
										<ul class="data_list03">
											<li><span class="dot possible">가능</span> 홍길순</li>
											<li><span class="dot wait">응답대기</span> 김철수</li>
											<li><span class="dot impossible">불가능</span> 최영희</li>
											<li>외 가능2, 대기2, 불가능2</li>
										</ul>
									</li>
									<li>
										<ul class="data_list03">
											<li><span class="dot possible">가능</span> 홍길순</li>
											<li><span class="dot wait">응답대기</span> 김철수</li>
											<li><span class="dot impossible">불가능</span> 최영희</li>
											<li>외 가능2, 대기2, 불가능2</li>
										</ul>
									</li>
									<li>
										<ul class="data_list03">
											<li><span class="dot possible">가능</span> 홍길순</li>
											<li><span class="dot wait">응답대기</span> 김철수</li>
											<li><span class="dot impossible">불가능</span> 최영희</li>
											<li>외 가능2, 대기2, 불가능2</li>
										</ul>
									</li>
									<li>
										<ul class="data_list03">
											<li><span class="dot possible">가능</span> 홍길순</li>
											<li><span class="dot wait">응답대기</span> 김철수</li>
											<li><span class="dot impossible">불가능</span> 최영희</li>
											<li>외 가능2, 대기2, 불가능2</li>
										</ul>
									</li>
									<li>
										<ul class="data_list03">
											<li><span class="dot possible">가능</span> 홍길순</li>
											<li><span class="dot wait">응답대기</span> 김철수</li>
											<li><span class="dot impossible">불가능</span> 최영희</li>
											<li>외 가능2, 대기2, 불가능2</li>
										</ul>
									</li>
									<li>
										<ul class="data_list03">
											<li><span class="dot possible">가능</span> 홍길순</li>
											<li><span class="dot wait">응답대기</span> 김철수</li>
											<li><span class="dot impossible">불가능</span> 최영희</li>
											<li>외 가능2, 대기2, 불가능2</li>
										</ul>
									</li>
								</ul>
							</div> -->
							
						</div>
						<!-- e :calender_all -->
					</div>
					<!-- e :bbs_calender01 -->
				
				</div>
				<!-- e :calender_guide -->
				
					
				<!-- 팝업 띄울 공간 -->
                <div id="divPopup" class="overlay">
				</div>
				
			</div>
			<!-- e :contents_guide -->

		</div>
		<!-- e :right_guide -->
	</div>
	<!-- e :wrap -->

</body>
<script>
;(function() {
	// 사업부서 선택 버튼
	/* $("#btnDeptSelect").click(function() {
		fnPopupOpen("/empo/resources/eMAU00C02DEPTPOPUP.do", "");	// ../js/popup.js 참고
	}); */
	
	// 목록 날짜 다음 버튼
	$("#btnListDateNext").click(function() {
		var listSearchDate = $(".listSearchDate").text();
		var listNextDate = $(".listNextDate").text();

		var prevDate = listNextDate.substring(0,10);
		//console.log(prevDate);
	   
		
		var nextDate = listNextDate.substring(13,23);
		//console.log(nextDate);
		var prevD = new Date(prevDate);
		var d = new Date(nextDate);
		var d1 = new Date(d.setDate(d.getDate() + 1));
		var d2 = new Date(d.setDate(d.getDate() + 6));

		var yy1 = d1.getFullYear();
		var mm1 = ('0' + (d1.getMonth() + 1)).slice(-2);
		var dd1 = ('0' + d1.getDate()).slice(-2);

		var yy2 = d2.getFullYear();
		var mm2 = ('0' + (d2.getMonth() + 1)).slice(-2);
		var dd2 = ('0' + d2.getDate()).slice(-2);

		var startDate = yy1 + '.' + mm1  + '.' + dd1;
		var endDate = yy2 + '.' + mm2  + '.' + dd2;
		
		//console.log(startDate);
		//console.log(endDate);
		var nowDayOfWeek = prevD.getDay();
		var nowDay = prevD.getDate();
		var nowMonth = prevD.getMonth();
		var nowYear = prevD.getYear();
		nowYear += (nowYear < 2000) ? 1900 : 0;
		
		var weekStartDate = new Date(nowYear, nowMonth, nowDay - nowDayOfWeek);
		console.log(weekStartDate);
		var weekEndDate = new Date(nowYear, nowMonth, nowDay + (6 - nowDayOfWeek));
		console.log(weekEndDate);
		
		var dateDayArr = new Array();
		var paramArr = new Array();
		$('.day_tit').children().remove();
		while(weekStartDate.getTime() <= weekEndDate.getTime()) {
			
			var mon = (weekStartDate.getMonth()+1);
  			mon = mon < 10 ? '0'+mon : mon;
  			var day = weekStartDate.getDate();
  			day = day < 10 ? '0'+day : day;
  			
  			var paramDay1 = weekStartDate.getFullYear() + '-' + mon + '-' +  day + ' 00:00';
			var paramDay2 = weekStartDate.getFullYear() + '-' + mon + '-' +  day + ' 23:59';
			console.log(paramDay1);
			console.log(paramDay2);
  			
			var week = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];
			
			var searchDateStartDay = week[new Date(weekStartDate).getDay()];
			console.log(searchDateStartDay);
			
			$('.day_tit').append($("<li><span>" + searchDateStartDay + "</span>" + mon + "/" + day + "</li>"));
			
			var data = { "dateStart" : paramDay1 , "dateEnd" : paramDay2 , "day" : searchDateStartDay}
			paramArr.push(data);
			dateDayArr.push(weekStartDate.getFullYear() + '-' + mon + '-' +  day);
  			weekStartDate.setDate(weekStartDate.getDate() + 1);
  			
		}  
		
		//console.log(startDate);
		//console.log(endDate);

		var nextPeriod = startDate + " ~ " + endDate;

		$(".listSearchDate").text(listNextDate);
		$(".listNextDate").text(nextPeriod);
		
		weekLoad(prevDate,nextDate);
	});
	
	// 목록 날짜 이전 버튼
	$("#btnListDatePrev").click(function() {
		var listSearchDate = $(".listSearchDate").text();
		var listNextDate = $(".listNextDate").text();
		
		var prevDate = listSearchDate.substring(0,10);
		//console.log(prevDate);
		
		var d = new Date(prevDate);
		var d1 = new Date(d.setDate(d.getDate() - 1));
		var d2 = new Date(d.setDate(d.getDate() - 6));

		var yy1 = d1.getFullYear();
		var mm1 = ('0' + (d1.getMonth() + 1)).slice(-2);
		var dd1 = ('0' + d1.getDate()).slice(-2);

		var yy2 = d2.getFullYear();
		var mm2 = ('0' + (d2.getMonth() + 1)).slice(-2);
		var dd2 = ('0' + d2.getDate()).slice(-2);

		var endDate = yy1 + '.' + mm1  + '.' + dd1;
		var startDate = yy2 + '.' + mm2  + '.' + dd2;
		
		//console.log(startDate);
		//console.log(endDate);
		
		var nowDayOfWeek = d.getDay();
		var nowDay = d.getDate();
		var nowMonth = d.getMonth();
		var nowYear = d.getYear();
		nowYear += (nowYear < 2000) ? 1900 : 0;
		
		var weekStartDate = new Date(nowYear, nowMonth, nowDay - nowDayOfWeek);
		console.log(weekStartDate);
		var weekEndDate = new Date(nowYear, nowMonth, nowDay + (6 - nowDayOfWeek));
		console.log(weekEndDate);
		
		var dateDayArr = new Array();
		var paramArr = new Array();
		$('.day_tit').children().remove();
		while(weekStartDate.getTime() <= weekEndDate.getTime()) {
			var mon = (weekStartDate.getMonth()+1);
  			mon = mon < 10 ? '0'+mon : mon;
  			var day = weekStartDate.getDate();
  			day = day < 10 ? '0'+day : day;
  			
  			var paramDay1 = weekStartDate.getFullYear() + '-' + mon + '-' +  day + ' 00:00';
			var paramDay2 = weekStartDate.getFullYear() + '-' + mon + '-' +  day + ' 23:59';
			console.log(paramDay1);
			console.log(paramDay2);
			
  			var week = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];
			
			var searchDateStartDay = week[new Date(weekStartDate).getDay()];
			console.log(searchDateStartDay);
			
			$('.day_tit').append($("<li><span>" + searchDateStartDay + "</span>" + mon + "/" + day + "</li>"));
			
			var data = { "dateStart" : paramDay1 , "dateEnd" : paramDay2 , "day" : searchDateStartDay}
			paramArr.push(data);
			dateDayArr.push(weekStartDate.getFullYear() + '-' + mon + '-' +  day);
  			weekStartDate.setDate(weekStartDate.getDate() + 1);
  			
		}  

		var prevPeriod = startDate + " ~ " + endDate;

		$(".listSearchDate").text(prevPeriod);
		$(".listNextDate").text(listSearchDate);
		 
		weekLoad(startDate,endDate);

	});
	
	// 달력 입력 datepicker 설정
	$('.inputCalendar').datepicker({
		dateFormat : 'yyyy.mm.dd'		// 날짜 형태 설정		
	});	
	
	// 기간검색 버튼 클릭
	$(".period > a").click(function() {

		$(".period > a").removeClass("active");
		$(this).addClass("active");
		
		var searchDate1 = "";
		var searchDate2 = "";
		var dateDiv = $(this).index();
		var now = new Date();
		
		var yy = now.getFullYear();
		var mm = ('0' + (now.getMonth() + 1)).slice(-2);
		var dd = ('0' + (now.getDate() + 1)).slice(-2);
		searchDate2 = yy + '.' + mm  + '.' + dd;

		if (dateDiv == "0") {	// 오늘
			searchDate1 = searchDate2;
		}

		else if (dateDiv == "1") {	// 7일
			var d = new Date(now.setDate(now.getDate() - 6));
			var yy = d.getFullYear();
			var mm = ('0' + (d.getMonth() + 1)).slice(-2);
			var dd = ('0' + d.getDate()).slice(-2);
			searchDate1 = yy + '.' + mm  + '.' + dd;
		}

		else if (dateDiv == "2") {	// 15일
			var d = new Date(now.setDate(now.getDate() - 14));
			var yy = d.getFullYear();
			var mm = ('0' + (d.getMonth() + 1)).slice(-2);
			var dd = ('0' + d.getDate()).slice(-2);
			searchDate1 = yy + '.' + mm  + '.' + dd;
		}

		else if (dateDiv == "3") {	// 1개월
			d = new Date(now.setMonth(now.getMonth() - 1));
			var yy = d.getFullYear();
			var mm = ('0' + (d.getMonth() + 1)).slice(-2);
			var dd = ('0' + d.getDate()).slice(-2);
			searchDate1 = yy + '.' + mm  + '.' + dd;
		}

		else if (dateDiv == "4") {	// 5개월
			d = new Date(now.setMonth(now.getMonth() - 3));
			var yy = d.getFullYear();
			var mm = ('0' + (d.getMonth() + 1)).slice(-2);
			var dd = ('0' + d.getDate()).slice(-2);
			searchDate1 = yy + '.' + mm  + '.' + dd;
		}

		else {	// 전체
			searchDate1 = "";
			searchDate2 = "";
		}

		$("#searchDate1").val(searchDate1);
		$("#searchDate2").val(searchDate2);
	});
	
	$(document).on('click', '.btnPopDelete', function(){
		$(this).parent().remove();
	});
	
	// 사업부서 검색 자동완성 기능
	$("#searchName").autocomplete({
		source: function(request, response) {
			$.post('/empo/resources/autocomplete.do', {'searchName' : $('#searchName').val() }).done(function(res) {
				 
				console.log(res.list)
				var list = [];
				res.list.forEach(function(row) {
					list.push(row.grmName);
				})
				console.log(list);
				response(list);
			}).fail(function() {
			});
		},
		
		select: function(event, ui) {
			console.log(ui.item);
		},
	
		focus: function(event, ui) {
			return false;
			//event.preventDefault();
		}
	});
	
	// 지원가능여부 확인 버튼
	$("#btnDivComfirm").click(function() {  
	//	window.location.href = "/empo/resources/eMAU00C0201Main.do";
	});
	
	function oneCheck(element){
		
		var obj = document.getElementsByName("conditon");
		
		 for(var i=0; i<obj.length; i++){
		        if(obj[i] != element){
		            obj[i].checked = false;
		        }
		 }
	}
	
    function weekLoad(searchDate1,searchDate2){
    	$(".lowData").remove();
    	 
		
    	$.post("/empo/resources/memberInfo.do",{searchDateSt:searchDate1,searchDateEd:searchDate2}).done(function(res) {
    		res.list.forEach(function(row, index) {
    			var tmWeek = "";
    			if(row.pjWeek == 0){
    				tmWeek = ".mon";
    			}else if(row.pjWeek == 1){
    				tmWeek = ".tue";
    			}else if(row.pjWeek == 2){
    				tmWeek = ".wed";
    			}else if(row.pjWeek == 3){
    				tmWeek = ".thu";
    			}else if(row.pjWeek == 4){
    				tmWeek = ".fri";
    			}else if(row.pjWeek == 5){
    				tmWeek = ".sat";
    			}else if(row.pjWeek == 6){
    				tmWeek = ".sun";
    			}

    			$('.' + row.grmCode).find(tmWeek).append($('<li class="lowData"><span class="dot possible">가능</span> ' + row.mbName + '('+row.plcNm+')</li>'));
    	 
    		});
    		
    	}).fail(function() {
    		alert("실패");
    	}); 
	}
	

	
	var dataListView = function(row) {
		var data = 
			'<li class="subRow" id="grmName">' +
			'	<input type="checkbox" name="checkField" value="'+ row.grmCode + '">' + row.grmName + '' +
			'	<button type="button" class="btnPopDelete"> X </button>' +
			'</li>' ;

		return $(data);
	}
	
	// 사업명 검색버튼 클릭
	$("#searchDept").click(function() {
		var grmName = $("#searchName").val();
		$.ajax({
			type : "POST",
			url : "/empo/resources/searchGrmName.do",
			data : {
				'grmName' : grmName
			}
		}).done(function(res) {
						
			if ($('input[name="checkField"]').length > 0) { 
				res.list.forEach(function(row1, index) {
					var rtn = "";		
					$('input[name="checkField"]').filter(function(index, row2) {
						if (row1.grmCode == $(row2).val()) {
							rtn = "isData";							
							return false;
						}
					});
					
					if (rtn == "") {
						$('.data_list02').append(dataListView(row1));
					}
					 
				});
			} else {
				res.list.forEach(function(row1, index) {
					$('.data_list02').append(dataListView(row1));
				});
			}
			
		}).fail(function() {
			alert('실패')
		});
	});
	
	// 조회하기 버튼
	$("#searchResource").click(function() {
		var condition = $('input:checkbox[name="condition"]').val();
		$(".calender_list").each(function(index, row) {
			$(row).css("display", "none");
		});
		
		$('input:checkbox[name="checkField"]').each(function(index, row) {
			if ($(row).is(":checked")) {
				$('.' + $(row).val()).css('display', '');
			} else {
				var grmCode = $(row).val();
				$('.' + $(row).val()).css('display', 'none');
			}
		});
		
		if($('input[name="checkField"]:checked').length == 0) {
			$(".calender_list").each(function(index, row) {
				$(row).css("display", "");
			});
		}
		
		var searchDateStart = $("#searchDate1").val();
		
		console.log(searchDateStart);
		var d = new Date(searchDateStart);
		console.log(d);
		var nowDayOfWeek = d.getDay();
		var nowDay = d.getDate();
		var nowMonth = d.getMonth();
		var nowYear = d.getYear();
		nowYear += (nowYear < 2000) ? 1900 : 0;
		
		var weekStartDate = new Date(nowYear, nowMonth, nowDay - nowDayOfWeek);
		console.log(weekStartDate);
		var weekEndDate = new Date(nowYear, nowMonth, nowDay + (6 - nowDayOfWeek));
		console.log(weekEndDate);
		
		var yy = weekStartDate.getFullYear();
		var mm = ('0' + (weekStartDate.getMonth() + 1)).slice(-2);
		var dd = ('0' + weekStartDate.getDate()).slice(-2);
		searchDate1 = yy + '.' + mm  + '.' + dd;

		var yy = weekEndDate.getFullYear();
		var mm = ('0' + (weekEndDate.getMonth() + 1)).slice(-2);
		var dd = ('0' + weekEndDate.getDate()).slice(-2);
		searchDate2 = yy + '.' + mm  + '.' + dd;
		$('.listSearchDate').text(searchDate1 + " ~ " + searchDate2);
		
		var dateDayArr = new Array();
		var paramArr = new Array();
		$('.day_tit').children().remove();
		while(weekStartDate.getTime() <= weekEndDate.getTime()) {
			
			var mon = (weekStartDate.getMonth()+1);
  			mon = mon < 10 ? '0'+mon : mon;
  			var day = weekStartDate.getDate();
  			day = day < 10 ? '0'+day : day;
  			
  			var paramDay1 = weekStartDate.getFullYear() + '-' + mon + '-' +  day + ' 00:00';
			var paramDay2 = weekStartDate.getFullYear() + '-' + mon + '-' +  day + ' 23:59';
			console.log(paramDay1);
			console.log(paramDay2);
  			
			var week = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];
			
			var searchDateStartDay = week[new Date(weekStartDate).getDay()];
			console.log(searchDateStartDay);
			
			$('.day_tit').append($("<li><span>" + searchDateStartDay + "</span>" + mon + "/" + day + "</li>"));
			
			var data = { "dateStart" : paramDay1 , "dateEnd" : paramDay2 , "day" : searchDateStartDay}
			paramArr.push(data);
			dateDayArr.push(weekStartDate.getFullYear() + '-' + mon + '-' +  day);
  			weekStartDate.setDate(weekStartDate.getDate() + 1);
  			
		}  
		
		var yy = weekEndDate.getFullYear();
		var mm = ('0' + (weekEndDate.getMonth() + 1)).slice(-2);
		var dd = ('0' + (weekEndDate.getDate() + 1)).slice(-2);
		searchDate1 = yy + '.' + mm  + '.' + dd;
		console.log(searchDate1)
		
		var d = new Date(weekEndDate.setDate(weekEndDate.getDate() + 6));
		var yy = d.getFullYear();
		var mm = ('0' + (d.getMonth() + 1)).slice(-2);
		var dd = ('0' + (d.getDate() + 1)).slice(-2);
		searchDate2 = yy + '.' + mm  + '.' + dd; 
		
		$('.listNextDate').text(searchDate1 + " ~ " + searchDate2); 
	});
	
	$(document).on('click', '.data_list03', function() {
		$("#dataGrmCode").val($(this).data('grm_code'));
		$("#dataGrmName").val($(this).data('grm_name'));
		
		fnPopupOpen("/empo/resources/eMAU00C02USERPOPUP.do", "#popupForm");
	});
	
	$(function() {
		initList();
	});
	
	var grmListView = function(row) {
		var data = 
			'<div class="calender_list ' + row.grmCode + '">' + 
			'	<div><strong><span>' + row.grmName + '</span></strong></div>' + 
			'	<ul class="day_all">' +
			'		<li>' +
			'			<ul class="data_list03 sun" data-grm_code="' + row.grmCode + '" data-grm_name="' + row.grmName + '">' +
			'			</ul>' +
			'		</li>' +
			'		<li>' +
			'			<ul class="data_list03 mon" data-grm_code="' + row.grmCode + '" data-grm_name="' + row.grmName + '">' +
			'			</ul>' +
			'		</li>' +
			'		<li>' +
			'			<ul class="data_list03 tue" data-grm_code="' + row.grmCode + '" data-grm_name="' + row.grmName + '">' +
			'			</ul>' +
			'		</li>' +
			'		<li>' +
			'			<ul class="data_list03 wed" data-grm_code="' + row.grmCode + '" data-grm_name="' + row.grmName + '">' +
			'			</ul>' +
			'		</li>' +
			'		<li>' +
			'			<ul class="data_list03 thu" data-grm_code="' + row.grmCode + '" data-grm_name="' + row.grmName + '">' +
			'			</ul>' +
			'		</li>' +
			'		<li>' +
			'			<ul class="data_list03 fri" data-grm_code="' + row.grmCode + '" data-grm_name="' + row.grmName + '">' +
			'			</ul>' +
			'		</li>' +
			'		<li>' +
			'			<ul class="data_list03 sat" data-grm_code="' + row.grmCode + '" data-grm_name="' + row.grmName + '">' +
			'			</ul>' +
			'		</li>' +
			'	</ul>' +
			'</div>' ;
			
		return $(data);
	}
	
	var initList = function() {
		var now = new Date();
		
		var yy = now.getFullYear();
		var mm = ('0' + (now.getMonth() + 1)).slice(-2);
		var dd = ('0' + now.getDate()).slice(-2);
		$('#searchDate1').val(yy + '.' + mm  + '.' + dd);
		
		$.post("/empo/resources/grmInfo.do").done(function(res) {
			console.log(res.list);
			res.list.forEach(function(row, index) {
				$('.calender_all').append(grmListView(row));
			});
			
			var searchDate1 = "";
			var searchDate2 = "";
			
			var now = new Date();
			var nowDayOfWeek = now.getDay();
			var nowDay = now.getDate();
			var nowMonth = now.getMonth();
			var nowYear = now.getYear();
			nowYear += (nowYear < 2000) ? 1900 : 0;
			
			var weekStartDate = new Date(nowYear, nowMonth, nowDay - nowDayOfWeek);
			console.log(weekStartDate);
			var weekEndDate = new Date(nowYear, nowMonth, nowDay + (6 - nowDayOfWeek));
			console.log(weekEndDate);
			

			
			var yy = weekStartDate.getFullYear();
			var mm = ('0' + (weekStartDate.getMonth() + 1)).slice(-2);
			var dd = ('0' + weekStartDate.getDate()).slice(-2);
			searchDate1 = yy + '.' + mm  + '.' + dd;

			var yy = weekEndDate.getFullYear();
			var mm = ('0' + (weekEndDate.getMonth() + 1)).slice(-2);
			var dd = ('0' + weekEndDate.getDate()).slice(-2);
			searchDate2 = yy + '.' + mm  + '.' + dd;
			$('.listSearchDate').text(searchDate1 + " ~ " + searchDate2);
			
			console.log(weekStartDate.getTime())
			console.log(weekEndDate.getTime())
			var paramArr = new Array();
			var dateDayArr = new Array();
			
			while(weekStartDate.getTime() <= weekEndDate.getTime()) {
				var mon = (weekStartDate.getMonth()+1);
	  			mon = mon < 10 ? '0'+mon : mon;
	  			var day = weekStartDate.getDate();
	  			day = day < 10 ? '0'+day : day;
	  			
	  			var paramDay1 = weekStartDate.getFullYear() + '-' + mon + '-' +  day + ' 00:00';
				var paramDay2 = weekStartDate.getFullYear() + '-' + mon + '-' +  day + ' 23:59';
				console.log(paramDay1);
				console.log(paramDay2);
				
	  			var week = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];
			
				var searchDateStartDay = week[new Date(weekStartDate).getDay()];
				console.log(searchDateStartDay);
				$('.day_tit').append($("<li><span>" + searchDateStartDay + "</span>" + mon + "/" + day + "</li>"));
				
				var data = { "dateStart" : paramDay1 , "dateEnd" : paramDay2 , "day" : searchDateStartDay}
				paramArr.push(data);
				dateDayArr.push(weekStartDate.getFullYear() + '-' + mon + '-' +  day);
	  			weekStartDate.setDate(weekStartDate.getDate() + 1);
	  			
			}  
			//간사정보
			weekLoad(searchDate1,searchDate2);
			 
		 
			var yy = weekEndDate.getFullYear();
			var mm = ('0' + (weekEndDate.getMonth() + 1)).slice(-2);
			var dd = ('0' + (weekEndDate.getDate() + 1)).slice(-2);
			searchDate1 = yy + '.' + mm  + '.' + dd;
			console.log(searchDate1)
			
			var d = new Date(weekEndDate.setDate(weekEndDate.getDate() + 6));
			var yy = d.getFullYear();
			var mm = ('0' + (d.getMonth() + 1)).slice(-2);
			var dd = ('0' + (d.getDate() + 1)).slice(-2);
			searchDate2 = yy + '.' + mm  + '.' + dd; 
			
			$('.listNextDate').text(searchDate1 + " ~ " + searchDate2); 
			
		}).fail(function() {
			alert("실패");
		});
	}
})();
</script>
</html>
