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
<c:import url="/EmpPageLink.do?link=main/include/src2" /> 


<script type="text/javascript">
	$(document).ready(function() {	
		
		// 달력 모듈 로딩
		init();
 
		
		//이전달
	 
		$(document).on('click', '.dhx_cal_prev_button', function() {
			call_date();
		});
		
		//다음달
		$(document).on('click', '.dhx_cal_next_button', function() {
			call_date();
		});
		
		//다음달
		$(document).on('click', '.dhx_cal_today_button', function() {
			call_date();
		});
	 
	 
	});
	 
</script>

	<style type="text/css" >
		html, body{
			margin:0;
			padding:0;
			height:100%;
			overflow:hidden;
		}

		.dhx_cal_event div.dhx_footer,
		.dhx_cal_event.past_event div.dhx_footer,
		.dhx_cal_event.event_english div.dhx_footer,
		.dhx_cal_event.event_math div.dhx_footer,
		.dhx_cal_event.event_science div.dhx_footer{
			background-color: transparent !important;
		}
		.dhx_cal_event .dhx_body{
			-webkit-transition: opacity 0.1s;
			transition: opacity 0.1s;
			opacity: 0.7;
		}
		.dhx_cal_event .dhx_title{
			line-height: 12px;
		}
		.dhx_cal_event_line:hover,
		.dhx_cal_event:hover .dhx_body,
		.dhx_cal_event.selected .dhx_body,
		.dhx_cal_event.dhx_cal_select_menu .dhx_body{
			opacity: 1;
		}

		.dhx_cal_event.event_math div,
		.dhx_cal_event_line.event_math{
			background-color: #FF5722 !important;
			border-color: #732d16 !important;
		}

		.dhx_cal_event.dhx_cal_editor.event_math{
			background-color: #FF5722 !important;
		}

		.dhx_cal_event_clear.event_math{
			color:#FF5722 !important;
		}

		.dhx_cal_event.event_science div,
		.dhx_cal_event_line.event_science{
			background-color: #0FC4A7 !important;
			border-color: #698490 !important;
		}

		.dhx_cal_event.dhx_cal_editor.event_science{
			background-color: #0FC4A7 !important;
		}

		.dhx_cal_event_clear.event_science{
			color:#0FC4A7 !important;
		}

		.dhx_cal_event.event_english div,
		.dhx_cal_event_line.event_english{
			background-color: #777777 !important;
			border-color: #9575CD !important;
		}

		.dhx_cal_event.dhx_cal_editor.event_english{
			background-color: #684f8c !important;
		}

		.dhx_cal_event_clear.event_english{
			color:#B82594 !important;
		}
	</style>
	
	<style type="text/css" >
		html, body {
			margin: 0px;
			padding: 0px;
			height: 100%;
			overflow: hidden;
		}

		/* #detailPop {
			position: absolute;
			top: 100px;
			left: 200px;
			z-index: 10001;
			display: none;
			background-color: white;
			border: 2px outset gray;
			padding: 20px;
			font-family: Tahoma;
			font-size: 10pt;
		}

		#detailPop label {
			width: 980px;
		} */
	</style>

	<script type="text/javascript" charset="utf-8">
		function init() {
			scheduler.config.time_step = 30;
			scheduler.config.multi_day = true;
			scheduler.locale.labels.section_subject = "Subject";
			scheduler.config.first_hour = 6;
			scheduler.config.limit_time_select = true;
			scheduler.config.details_on_dblclick = true;
			scheduler.config.details_on_create = true;

			scheduler.templates.event_class=function(start, end, event){
				var css = "";

				if(event.subject) // if event has subject property then special class should be assigned
					css += "event_"+event.subject;

				if(event.id == scheduler.getState().select_id){
					css += " selected";
				}
				return css; // default return

				/*
					Note that it is possible to create more complex checks
					events with the same properties could have different CSS classes depending on the current view:

					var mode = scheduler.getState().mode;
					if(mode == "day"){
						// custom logic here
					}
					else {
						// custom logic here
					}
				*/
			};

			/* var subject = [
				{ key: '', label: 'Appointment' },
				{ key: 'english', label: 'English' },
				{ key: 'math', label: 'Math' },
				{ key: 'science', label: 'Science' }
			];

			scheduler.config.lightbox.sections=[
				{name:"description22", height:43, map_to:"text", type:"textarea" , focus:true},
				{name:"subject", height:20, type:"select", options: subject, map_to:"subject" },
				{name:"time", height:72, type:"time", map_to:"auto" }
			]; */

			scheduler.init('scheduler_here', new Date(2021, 9, 01), "month");

			call_date();
			
			/*
			scheduler.parse([
				{ start_date: "2021-09-01 09:00", end_date: "2021-09-03 12:00", text:"[온라인서면평가]", subject: 'english' },
				{ start_date: "2021-09-18 09:00", end_date: "2021-09-18 12:00", text:"[온라인서면평가]", subject: 'english' },
				{ start_date: "2021-09-20 10:00", end_date: "2021-09-21 16:00", text:"[서면평가]", subject: 'math' },
				{ start_date: "2021-09-21 10:00", end_date: "2021-09-23 14:00", text:"[최종평가]", subject: 'science' },
				{ start_date: "2021-09-23 16:00", end_date: "2021-09-23 17:00", text:"[온라인서면평가]", subject: 'english' },
				{ start_date: "2021-09-20 09:00", end_date: "2021-09-22 17:00", text:"[과제접수]" }
			]);
			*/
 
			 
		} 
		
		$(document).on('click', '.gubunData', function() {
    		var ii =  $(this).data('bbrdn_busi_nm');
    		var data_gubun =  $(this).data('gu_bun');
    		
			var ee = $(this).data('pj_ymd');
			$('#dataYear').val(ee);
			$('#dataBbrdnBusiNm').val(ii);
			
			if(data_gubun =='협약체결'){
				fnPopupOpen("/empo/schedule/eMAU00B05Main3.do", "#formYear");
			} else if (data_gubun =='최종평가') {
				fnPopupOpen("/empo/schedule/eMAU00B05MainFinal.do", "#formYear");
			} else if (data_gubun =='서면평가' || data_gubun =='온라인서면평가') {
				fnPopupOpen("/empo/schedule/eMAU00B05MainSE.do", "#formYear");
			} else if (data_gubun =='신청접수') {
				fnPopupOpen("/empo/schedule/eMAU00B05MainApplication.do", "#formYear");
			} else if (data_gubun =='대면평가') {
				fnPopupOpen("/empo/schedule/eMAU00B05MainDAE.do", "#formYear");
			} else if (data_gubun =='특별평가') {
				fnPopupOpen("/empo/schedule/eMAU00B05MainSpec.do", "#formYear");
			} else if (data_gubun =='최종보고서제출') {
				fnPopupOpen("/empo/schedule/eMAU00B05MainReport.do", "#formYear");
			} else if (data_gubun =='서면이의신청평가') {
				fnPopupOpen("/empo/schedule/eMAU00B05MainSEObjection.do", "#formYear");
			} else if (data_gubun =='대면이의신청평가') {
				fnPopupOpen("/empo/schedule/eMAU00B05MainDAEObjection.do", "#formYear");
			} else if (data_gubun =='최종평가이의신청') {
				fnPopupOpen("/empo/schedule/eMAU00B05MainFinalObjection.do", "#formYear");
			} else{
				fnPopupOpen("/empo/schedule/eMAU00B05Main.do", "#formYear");
			} 
			
    	});

		
		function call_date(){
			var data = $(".dhx_cal_date").text();
 
			//달력 초기화
			window.scheduler.clearAll();  
			//달력에 데이터 넣기
			  $.post('/empo/schedule/eMAU00B041Month.do', {searchMonth:data} ).done(function(res) {
				  scheduler.parse(res.list);
				  	var dot_str = "";
					var dot_post =0;  
					var busiYyVal = $('#pjYear').val(); 
					var pmMonthVal = "";
					var bbrdnBusiNmVal = res.list.bbrdnBusiNm; 
					console.log(busiYyVal);
				  $.ajaxSetup({ async:false });
					$.post('/empo/schedule/eMAU00B01EmPjList.do', {busiYy:busiYyVal,pmMonth:pmMonthVal,bbrdnBusiNm:bbrdnBusiNmVal} ).done(function(res) {
						console.log(res) 
			                 
						if(res.list.length == 0){
							data += "<li class=\" \"> </li>\r\n"; 
						}else{
							data += "<li class=\" \">"; 
							var ii = 0
							res.list.forEach(function(row, index) { 
								console.log(row);
								if(ii>0){
									data += "<br>"; 
								}
								
								data += "[<a class='gubunData' data-gu_bun='" + row.pjGubun +"'  data-bbrdn_busi_nm='" + row.bbrdnBusiNm +"' data-pj_ymd='" + $("#mYear").text() + row.pmMonth + "' style='cursor:pointer;'>"+row.pjGubun+"</a>]"; 
								data += "<br>("+row.pjYmdSt+"~"+row.pjYmdEd+")";
								
								ii = ii +1;
								
							});
							data += "</li>\r\n"; 
							
							
						} 
					}).fail(function() {
						alert("실패");
					});
				}).fail(function() {
					alert("실패");
				});
			
		}
		

		
	/* 	var html = function(id) { return document.getElementById(id); }; //just a helper

		scheduler.showLightbox = function(id) {
 
			var ev = scheduler.getEvent(id);
			
			scheduler.startLightbox(id, html("detailPop")); 

			html("description").focus();
			html("description").value = ev.text;
			html("custom1").value = ev.custom1 || "";
			html("custom2").value = ev.custom2 || "";
		}; */

		/* function save_form() {
			var ev = scheduler.getEvent(scheduler.getState().lightbox_id);
			ev.text = html("description").value;
			ev.custom1 = html("custom1").value;
			ev.custom2 = html("custom2").value;

		 	scheduler.endLightbox(true, html("detailPop")); 
		}
		function close_form() {
		 	scheduler.endLightbox(false, html("detailPop")); 
		}

		function delete_event() {
			var event_id = scheduler.getState().lightbox_id;
		 	scheduler.endLightbox(false, html("detailPop")); 
			scheduler.deleteEvent(event_id);
		} */
	</script>

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
				<h3>Schedule</h3>
                 <c:import url="/EmpPageLink.do?link=main/include/top" />  
			</div>
			<!-- 화면 상단 종료 -->
			
			<!-- s :contents_guide -->
			<div class="contents_guide">
				<div class="submenu_guide">
					<ul>
						<!-- 2차메뉴명 -->
						<li><a href="<c:url value='/empo/schedule/eMAU00B02Main.do'/>" >부서스케줄</a></li>
						<li><a href="<c:url value='/empo/schedule/eMAU00B041Main.do'/>" class="active">월간스케줄</a></li>
						<li><a href="<c:url value='/empo/schedule/eMAU00B01Main.do'/>">년간스케줄</a></li>
					</ul>
				</div>
			
					<!-- 
					<div id="detailPop" style="width:90%;height:900px;">
					    <div style="text-align:right;"><input type="button" name="close" value="닫기" id="close" style='width:100px;' onclick="close_form()"></div>
						<label for="description">커스텀 </label><input type="text" name="description" value="" id="description"><br>
						<label for="custom1">Custom 1 </label><input type="text" name="custom1" value="" id="custom1"><br>
						<label for="custom2">Custom 2 </label><input type="text" name="custom2" value="" id="custom2"><br><br>
						<input type="button" name="save" value="Save" id="save" style='width:100px;' onclick="save_form()">
						
						<input type="button" name="delete" value="Delete" id="delete" style='width:100px;' onclick="delete_event()">
					</div> 
					-->
					
					<div id="detailPop">
					</div> 
					
					<div id="scheduler_here" class="dhx_cal_container" style='width:100%; height:100%;'>
						<div class="dhx_cal_navline">
							<div class="dhx_cal_prev_button">&nbsp;</div>
							<div class="dhx_cal_next_button">&nbsp;</div>
							<div class="dhx_cal_today_button"></div>
							<div class="dhx_cal_date"></div> 
							<div class="dhx_cal_tab" name="week_tab" style="right:140px;"></div>
							<div class="dhx_cal_tab" name="month_tab" style="right:76px;"></div>
						</div>
						<div class="dhx_cal_header">
						</div>
						<div class="dhx_cal_data">
						</div>	
						<form id="searchForm" name="searchForm" method="post">
						    <input type="hidden" id="pjYear" name="pjYear" /> 
						    <input type="hidden" id="pjMonthday" name="pjMonthday" /> 
						</form>	
						<form id="formYear" name="formYear">
							<input type="hidden" name="dataYear" id="dataYear" value="" />
							<input type="hidden" name="dataBbrdnBusiNm" id="dataBbrdnBusiNm" value="" />
						</form>
					</div>
		 
			</div>
			<!-- e :contents_guide -->
		</div>
		<!-- e :right_guide -->
	</div>
	<!-- e :wrap -->
</body>
</html>
