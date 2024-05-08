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


 

<!-- ì¤í¬ë¡¤ë° -->
<link href="../../css/jquery.mCustomScrollbar.css" rel="stylesheet">
<script type="text/javascript" src="../../js/jquery.mCustomScrollbar.concat.min.js"></script>
<script type="text/javascript" src="../../js/scroll.js"></script>

<!-- datepicker -->
<link href="../../css/datepicker.css" rel="stylesheet" type="text/css">
<script src="../../js/datepicker.js"></script>
<script src="../../js/datepicker.ko.js"></script>


<!-- timepicker -->
<link href="../../css/jquery.timepicker.css" rel="stylesheet" type="text/css">
<script src="../../js/jquery.timepicker.js"></script>
</head>

<style>
	.calendar {
		width: 100%;
		height: 700px;
		border: 1px solid #ddd;
		border-collapse: collapse;
		}
		
	.calendar td{ padding: 10px 0.5%; border-bottom: 1px solid #ddd; border-left: 1px solid #ddd; font-weight:300;} {
		width: 100%;
		height: 700px;
		border: 1px solid #444444;
		border-collapse: collapse;
		}
</style>


<script type="text/javascript">
	$(document).ready(function() {	
		$('.inputCalendar').datepicker({
			dateFormat : 'yyyy/mm/dd'		// 날짜 형태 설정		
		});	
		
		$('.timepicker').timepicker({
			timeFormat: 'HH:mm', // 형식
			interval: 10, // 표현 단위 (분)
			minTime: '05',	// 시작시간
			maxTime: '23:50',	// 종료시간
			defaultTime: '',
			startTime: '05:00',	// 시작시간
			dynamic: false,
			dropdown: true,
			scrollbar: true
		});
		
		// 현재월 표시 호출
		//fnNowMonthView();
		
		//달력
		autoReload();
		
		//processList();
		
		// 시작일 및 완료일 입력 팝업의 닫기(X) 클릭
		$(".btnPopDateInputClose").click(function() {
			$("#popDateInput").css("display","none");
		});

	});
	
	
	
	// 현재월(month) 표시 : 상단 월 표시 및 각 사업별 현재월 표시
	function fnNowMonthView() {
		//년도
		var now = new Date();	// 현재 날짜 및 시간
		var year = now.getFullYear();	// 연도
		var month = now.getMonth();	// 월
		
		 
		var m = month;	// 현재월 숫자 변환
		
		var myArray = {1: "JAN", 2: "FEB", 3: "MAR", 4: "APR", 5: "MAY", 6: "JUN", 7: "JUL", 8: "AUG", 9: "SEP", 10: "OCT", 11: "NOV", 12: "DEC"  };
        var monthData = myArray[month]; 
        $( '#mYear' ).text( year);
        $( '#pjYear' ).val( year);
      
        $('#mMonth').text(monthData);
        
        var tmMonth = "";
        if(month<10){
        	tmMonth = "0"+month
        }else{
        	tmMonth = month
        }
        $('#mMonth2').text(tmMonth); 
	 
	}
	
 


	var today = new Date(); //오늘 날짜        
	var date = new Date();
	
	//이전달
	function beforem() //이전 달을 today에 값을 저장
	{ 
		today = new Date(today.getFullYear(), today.getMonth() - 1, today.getDate());
		autoReload(); //만들기
	}
	
	//다음달
	function nextm()  //다음 달을 today에 저장
	{
		today = new Date(today.getFullYear(), today.getMonth() + 1, today.getDate());
		autoReload();
	}
	
	//오늘선택
	function thisMonth(){
		today = new Date();
		autoReload();
	}

	function autoReload()
	{
		//년도
		var now = new Date();	// 현재 날짜 및 시간
		var year = now.getFullYear();	// 연도
		var month = now.getMonth();	// 월 
		var m = month;	// 현재월 숫자 변환 
		
		var nMonth = new Date(today.getFullYear(), today.getMonth(), 1); //현재달의 첫째 날
		var lastDate = new Date(today.getFullYear(), today.getMonth() + 1, 0); //현재 달의 마지막 날
		var tbcal = document.getElementById("calendar"); // 테이블 달력을 만들 테이블
		//var yearmonth = document.getElementById("yearmonth"); //  년도와 월 출력할곳 
		 $( '#yearmonth' ).val( today.getFullYear() + "년 "+ (today.getMonth() + 1) + "월");
			var myArray = {1: "JAN", 2: "FEB", 3: "MAR", 4: "APR", 5: "MAY", 6: "JUN", 7: "JUL", 8: "AUG", 9: "SEP", 10: "OCT", 11: "NOV", 12: "DEC"  };
	        var monthData = myArray[today.getMonth() + 1]; 
	        $( '#mYear' ).text( today.getFullYear());
	        $( '#pjYear' ).val( today.getFullYear());
	      
	        $('#mMonth').text(monthData);
	        
	        var tmMonth = "";
	        if((today.getMonth() + 1)<10){
	        	tmMonth = "0"+(today.getMonth() + 1);
	        }else{
	        	tmMonth = today.getMonth() + 1;
	        }
	        $('#mMonth2').text(tmMonth); 
		
		
		if(today.getMonth()+1==12) //  눌렀을 때 월이 넘어가는 곳
		{
			before.innerHTML=("<"+today.getMonth())+"월";
			next.innerHTML="1월"+">";
			
		}
		else if(today.getMonth()+1==1) //  1월 일 때
		{
			before.innerHTML="<"+"12월";
			next.innerHTML=(today.getMonth()+2)+"월" +">";
		}
		else //   12월 일 때
		{
			before.innerHTML="<"+(today.getMonth())+"월";
			next.innerHTML=(today.getMonth()+2)+"월"+">";
		}


		// 남은 테이블 줄 삭제
		while (tbcal.rows.length > 2) 
		{
			tbcal.deleteRow(tbcal.rows.length - 1);
		}
		var row = null;
		row = tbcal.insertRow();
		var cnt = 0;
		var dayCheck = (nMonth.getDay()==0) ? 7 : nMonth.getDay(); //일요일을 마지막으로 넣기 위해서.

		 // 1일 시작칸 찾기
		for (i = 0; i < (dayCheck-1); i++) 
		{
			cnt = cnt + 1;	//요일값
			cell = row.insertCell();
			
			if (i>4) { //주말
				cell.style.backgroundColor = "#f7f7f7";
			}
		}


		// 달력 출력 
		for (i = 1; i <= lastDate.getDate(); i++) // 1일부터 마지막 일까지
		{  
			cell = row.insertCell();
			
			var str="";
			var day = (i<10) ? "0"+i : i;           
			
	 		console.log(today.getFullYear());
	 		var mon = (today.getMonth()+1);
  			mon = mon < 10 ? '0'+mon : mon;
  			console.log(mon);
  			
			str += "<div class='day2' id='"+day+"' style='height: 20px;'><span class='day1' style='padding: 5px; border-radius: 50%;' data-click_day='" + today.getFullYear() + "/" + mon + "/" + day + "'>"+i+"</span></div>";
			
			str += "<div class='day' style='height: 90px;'></div>"; //나중에 원하는 날에 일정을 넣기위해 id값을 날자로 설정
			cell.innerHTML = str;
			
			cnt = cnt + 1;
			if (cnt % 7 == 6) {//토요일
				var str="";
				str += "<div style='height: 20px;'>"+i+"</div>";
				var day = (i<10) ? "0"+i : i;            	
				str += "<div style='height: 90px;' id='"+day+"'>";
				str += "</div>";
				cell.innerHTML = str;
				cell.style.color = "#009de0";
				cell.style.backgroundColor = "#f7f7f7";                    
			}
			if (cnt % 7 == 0) { //일요일
				var str="";
				str += "<div style='height: 20px;'>"+i+"</div>";
				var day = (i<10) ? "0"+i : i;            	
				str += "<div style='height: 90px;'id='"+day+"'>";
				str += "</div>";
				cell.innerHTML = str;
				row = calendar.insertRow();// 줄 추가
				cell.style.color = "#ed5353";
				cell.style.backgroundColor = "#f7f7f7";
			}
			
			//마지막 날짜가 지나면 일요일까지 칸 그리기 
			if(lastDate.getDate() == i && ((cnt % 7) != 0)){
 
				var add = 7 - (cnt % 7);
				for(var k = 1; k <= add; k++){
					cell = row.insertCell();
					cnt = cnt + 1;
					if (cnt % 7 == 6) {//토요일
						cell.style.backgroundColor = "#f7f7f7";
					}
					if (cnt % 7 == 0) { //일요일
						cell.style.backgroundColor = "#f7f7f7";
					}
					
					/* 다음달 미리 보니.?
					var str="";
					str += "<div>"+k+"</div>";
					var day = (i<10) ? "0"+k : i;            	
					str += "<div id='"+day+"'>";
					str += "</div>";
					cell.innerHTML = str;
					*/
				}
			}
			
			//오늘날짜배경색
			if( today.getFullYear() == date.getFullYear() && today.getMonth() == date.getMonth() && i==date.getDate() )
			{
				cell.style.backgroundColor = "#e2f3da"; //오늘날짜배경색
			}
			
			//마지막 날짜가 지나면 일요일까지 칸 그리기
			if(lastDate.getDate() == i && ((cnt % 7) != 0)){
				var add = 7 - (cnt % 7);
				for(var k = 1; k <= add; k++){
					cell = row.insertCell();
					cnt = cnt + 1;
					if (cnt % 7 == 6) {//토요일
						cell.style.backgroundColor = "#f7f7f7";
					}
					if (cnt % 7 == 0) { //일요일
						cell.style.backgroundColor = "#f7f7f7";
					}
				}
			}
			  
		}
		
		/*
        $( '#mYear' ).text( year);
        $( '#pjYear' ).val( year);
      
        $('#mMonth').text(monthData);
        */
        
        var tmYear = $('#mYear').text();
        var tmMonth = $('#mMonth2').text();
        var searchMonthVal = tmYear+"-"+tmMonth;
     
		$.post('/empo/schedule/selectMonthList.do', {searchMonth:searchMonthVal} ).done(function(res) {
			res.list.forEach(function(row, index) {  
				//$('#resultProcess').append(managerListView(row));
				var noticeInDay = row.noInDay;
				noticeInDay = noticeInDay.replace("-", "/");
				console.log(noticeInDay);
				var noInDate = new Date(noticeInDay);
				console.log(noInDate);
				var hours = ('0' + noInDate.getHours()).slice(-2);
				var minutes = ('0' + noInDate.getMinutes()).slice(-2);
				
				console.log(hours)
				console.log(minutes)
				//원하는 날짜 영역에 내용 추가하기
				var tdId = row.noDay; //1일
				var str = "";
				if(document.getElementById(tdId).innerHTML !=""){ 
					str += "<br>";  
				} 
				
				var rowTitle = "";
				if (row.noTitle.length > 12 ) {
					rowTitle = row.noTitle.substring(0, 11) + "...";
				} else {
					rowTitle = row.noTitle;
				}
				
				
				console.log(rowTitle)
				console.log(row)
				str += "<a class='scheduleDetail' id='no" + row.noPk + "' data-no_pk='" + row.noPk + "'>" + hours + ":" + minutes + " " + rowTitle + "</a>";   
				document.getElementById(tdId).innerHTML = document.getElementById(tdId).innerHTML+str;    
				
				$('.scheduleDetail').css("cursor", "pointer");
			});
			
		}).fail(function() {
			alert("실패");
		});
		
		
		/* 
		//원하는 날짜 영역에 내용 추가하기
		var tdId = "20"; //1일
		var str = "";
		str += "09:00 분과구성1";
		str += "<br>12:00 분과구성2 \n"; 
		document.getElementById(tdId).innerHTML = str;
		*/
		 
	}
	
	var clickDay;
	$(document).on('mouseenter', '.day1', function(e) {
		clickDay = $(this).data('click_day');
		$(this).css('background-color', 'pink');
		var divTop = $(this).offset().top - 40; // 상단 좌표 위치 안맞을시 e.pageY 
		var divLeft =  $(this).offset().left+30; // 좌측 좌표 위치 안맞을시 e.pageX
		
		//console.log(e.target)
		/* console.log(e.relatedTarget);
		console.log(e.toElement); */
		$("#popDateInput").css("top",divTop);
		$("#popDateInput").css("left",divLeft);
		$("#popDateInput").css("display","block");
		
	});
	
	$(document).on('mouseout', '.month_guide', function(e) {
		if(!$(e.target).hasClass('day1') && !$(e.target).hasClass('day2')) {
			$('.day1').css('background-color', '');
			$("#popDateInput").css("display","none");
		} 
	});
	
	$(document).on('click', '.btnPopDateInputSave', function() {
 		var day1 = new Date(clickDay);
 		console.log(day1)
 		var day = day1.getDate();
  		day = day < 10 ? '0'+day : day;
  		
  		/* if($("#" + day).children('a').length >= 4) {
  			alert("일정은 4개까지만 등록이 가능합니다.");
  			$("#popDateInput").css("display","none");
  			return false;
  		} */
  		
 		var week = ['일', '월', '화', '수', '목', '금', '토'];
		
		var clickDateDay = week[new Date(day1).getDay()]; 
		console.log(clickDateDay);
		$("#clickDate").val(clickDay);
		$("#clickDay").val(clickDateDay);
		
		$("#clickTime").val("");
		$("#noPk").val("");
		$("#noTitle").val("");
		$("#noText").val("");
		$("#noEtc").val("");
		
		$("#mode").val("insert");
		
 		fnPopupOpen("/empo/schedule/scheduleInsertPopup.do", "#popupForm");
	});
	
	$(document).on('click', '.scheduleDetail', function() {
		var noPk = $(this).data('no_pk');
		$("#mode").val("edit");
		
		$.post("/empo/schedule/scheduleDetail.do", { "noPk" : noPk }).done(function(res) {
			var day1 = new Date(res.list.noInday);
			
			var mon = (day1.getMonth()+1);
  			mon = mon < 10 ? '0'+mon : mon;
  			var day = day1.getDate();
  			day = day < 10 ? '0'+day : day;
  			var hours = ('0' + day1.getHours()).slice(-2);
			var minutes = ('0' + day1.getMinutes()).slice(-2);
			
	 		var week = ['일', '월', '화', '수', '목', '금', '토'];
			
			var clickDateDay = week[new Date(day1).getDay()]; 
			var dataDay = day1.getFullYear() + '/' + mon + '/' +  day;
			console.log(dataDay);
			var dataTime = hours + ":" + minutes;
			console.log(clickDateDay);
			console.log(dataTime);
			$("#clickDate").val(dataDay);
			$("#clickTime").val(dataTime);
			$("#clickDay").val(clickDateDay);
			$("#noPk").val(res.list.noPk);
			$("#noTitle").val(res.list.noTitle);
			$("#noText").val(res.list.noText);
			$("#noEtc").val(res.list.noEtc);
			
			console.log(res.list);
			fnPopupOpen("/empo/schedule/scheduleInsertPopup.do", "#popupForm");
		});
		
	});
	
 
</script>



<body  >
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
				<h3>Schedule</h3>
                <c:import url="/EmpPageLink.do?link=main/include/top" />  
			</div>
			<!-- 화면 상단 종료 --> 
			
			<!-- s :contents_guide -->
			<div class="contents_guide">
				<div class="submenu_guide">
					<ul>
						<!-- 2차메뉴명 -->
						<li><a href="<c:url value='/empo/schedule/eMAU00B02Main.do'/>" class="active">부서스케줄</a></li>
						<li><a href="<c:url value='/empo/schedule/eMAU00B041Main.do'/>" >월간스케줄</a></li>
						<li><a href="<c:url value='/empo/schedule/eMAU00B01Main.do'/>">연간스케줄</a></li>
					</ul>
				</div>
			
			
				<div class="schedule_guide"> 				
					<div class="schedule_all2">
						<div class="schedule_top">
							<ul class="sc_title">
							<input type="hidden" id="yearmonth" >
								<li><button type="button" id="before" class="prev" onclick="beforem()">이전</button></li> 
								<li><strong><span id="mMonth" name="mMonth" ></span> <span id="mMonth2" name="mMonth2" ></span>, <span id="mYear" name="mYear" ></span></strong></li>
								<li><a href="javascript:thisMonth()" class="now">현재날짜로 돌아가기</a></li>
								<li><button type="button" id="next" class="next" onclick="nextm()">다음</button>
								 
								</li>
							</ul>
							<ul class="view_btn"> 
							</ul>
							<p class="sc_sel"> 
							</p>
							
							
						</div>
						<!-- e :schedule_top --> 
						<div id="yearmonth"></div>
						<div class="month_guide"> 
								<table align="center" id="calendar" class="calendar">
									<tr style="height:1px;hidden">
										<td> 
										</td>
										<td colspan="4" align="center">
										
										</td>
										<td> 
										</td>
										<td>
									 
										</td>
									</tr>
									<tr style="">
										<td width="14%" style="font-weight:bold;text-align: center;height:45px; font-size: 18px;">MON </td>
										<td width="14%" style="font-weight:bold;text-align: center; font-size: 18px;">TUE</td>
										<td width="14%" style="font-weight:bold;text-align: center; font-size: 18px;">WED</td>
										<td width="14%" style="font-weight:bold;text-align: center; font-size: 18px;">THU</td>
										<td width="14%" style="font-weight:bold;text-align: center; font-size: 18px;">FRI</td>
										<td width="14%" style="font-weight:bold;text-align: center; font-size: 18px;"><font color="#009de0">SAT</font></td>
										<td width="14%" style="font-weight:bold;text-align: center; font-size: 18px;"><font color="#ed5353">SUN</font></td>
									</tr>
								</table> 
						</div>
						<!-- e :month_guide -->
					</div> 
				</div>
				<!-- e :schedule_guide -->
					
			</div>
			<!-- e :contents_guide -->
			
			 <!-- s : 시작일, 완료일 입력 레이어 시작 -->
               <div id="popDateInput" class="Layer_popup">
                    <p class="left01"></p><!-- 왼쪽 말풍선인경우 class="left01" 변경 -->
					<div class="btn_guide ac">
						<button type="button" class="btn_style05 btn_red btnPopDateInputSave" style="margin-top: 30px; margin-left: 10px;">일정등록</button>
					</div>
                </div>
                

				<form id="popupForm">
					<input type="hidden" name="clickDate" id="clickDate" value="" />
					<input type="hidden" name="clickTime" id="clickTime" value="" />
					<input type="hidden" name="clickDay" id="clickDay" value="" />
					<input type="hidden" name="noPk" id="noPk" value="" />
					<input type="hidden" name="noText" id="noText" value="" />
					<input type="hidden" name="noTitle" id="noTitle" value="" />
					<input type="hidden" name="noEtc" id="noEtc" value="" />
					<input type="hidden" name="scheduleMode" id="scheduleMode" value="month" />
					<input type="hidden" name="mode" id="mode" value="" />
				</form>
				<!-- 팝업 띄울 공간 -->
                <div id="divPopup" class="overlay">
				</div>
		</div>
		<!-- e :right_guide -->
	</div>
	<!-- e :wrap -->
</body>
</html>
