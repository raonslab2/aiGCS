<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
 

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

<script type="text/javascript">
	$(document).ready(function() {		
		
		// 현재월 표시 호출
		fnNowMonthView();

		//processList();
		
		// 프로세스 현황 팝업 오픈
		$(".sc_txt").css("cursor","pointer");
		$(".sc_txt").click(function(e) {

			var w = window.innerWidth;
			//console.log(w);

			// 마우스 클릭 위치 가져오기
			var divTop = e.clientY - 50; // 상단 좌표 위치 안맞을시 e.pageY 
			var divLeft = e.clientX + 20; // 좌측 좌표 위치 안맞을시 e.pageX
			
			if ((w - divLeft) < 700) {	// 피드백 영역에서는 메뉴의 말풍선이 오른쪽으로 보이게 설정 변경
				divLeft = divLeft - 650;
				$("#popupProcessState > p").removeClass("left01");
				$("#popupProcessState > p").addClass("right02");
			} else {
				$("#popupProcessState > p").removeClass("right02");
				$("#popupProcessState > p").addClass("left01");
			}

			$("#popupProcessState").css("top",divTop);
			$("#popupProcessState").css("left",divLeft);
			$("#popupProcessState").css("display","block");
		});
	
	});

	// 현재월(month) 표시 : 상단 월 표시 및 각 사업별 현재월 표시
	function fnNowMonthView() { 
		//년도
		var now = new Date();	// 현재 날짜 및 시간
		var year = now.getFullYear();	// 연도
		var month = (now.getMonth()+1);	// 월
		
		 
		var m = month;	// 현재월 숫자 변환
		
		var myArray = {1: "JAN", 2: "FEB", 3: "MAR", 4: "APR", 5: "MAY", 6: "JUN", 7: "JUL", 8: "AUG", 9: "SEP", 10: "OCT", 11: "NOV", 12: "DEC"  };
        var monthData = myArray[month]; 
        $( '#mYear' ).text( year);
        $( '#pjYear' ).val( year);
      
        $('#mMonth').text(monthData); 
        $('#pjMonthday').val(year+"-"+month +"-01");
        
        
        var tmMonth = "";
        if(month<10){
        	tmMonth = "0"+month
        }else{
        	tmMonth = month
        }
        $('#mMonth2').text(tmMonth); 
        
           
        //목록
        selectList();
        
		// 상단 월 영력에 현재월 표시
		$(".month > li").eq(now.getMonth()).addClass("ing_month");	

	 
	}
	
    function mMonth(tmp) { 
    	
        var tmYear =  $( '#mYear' ).text();
        tmYear = Number(tmYear) + Number(tmp);
        $( '#mYear' ).text( tmYear);
        $( '#pjYear' ).val( tmYear);
        
        
        
        
        selectList();
       // $('#mMonth').text(monthData);
      }
    
    function selectList() {  
    	var managerListView = function(row) {
    		console.log(row); 
    		var data ;
  
    	 
         
    		var arrDay = new Array(); 
    		var arrDayName = new Array(); 
    		 
    	 
    	 
    		var now = new Date();
    		
    		//예정 진행중 완료
    		var ing_str ="";
    		if(row.pjEnd != null){
    			var d = new Date(row.pjEnd);   
    			if(Number(d.getMonth()) >= Number(now.getMonth())){ 
    				ing_str = "<span class=\"sc_now\">진행중</span>";
    			}else{ 
    				ing_str = "<span class=\"sc_now\">종료</span>";
    			}
      
    		 
    			
    		}else{
    			ing_str = "<span class=\"sc_expect\">예정</span>";
    		}
    	 
    		
    		
    		data ="								<div class=\"project_list\">\r\n" + 
			"									<div class=\"project_name\" style='text-align:center'>\r\n" + 
			"										<strong><span style='color:red;'>[" + row.brdnBusiNm + "]</span><br><a style='padding-left: 10px; color:blue;' href=\"#\">"+row.bbrdnBusiNm+"</a></strong>\r\n" + 
			"                                     "+ing_str+"  \r\n" + 
			"									</div> \r\n" + 
			"									<div class=\"sc_project \">\r\n" ;
			var tmLine = 0;
			 
			
			var dot_str = "";
			var dot_post =0;  
			var busiYyVal      = $('#pjYear').val(); 
			//var pmMonthVal     = $('#mMonth2').text();	
			var pmMonthVal = "";
			var bbrdnBusiNmVal = row.bbrdnBusiNm; 
		 
			for (var i = 0; i < 12; i++) { 
				if(now.getMonth()==i){
					data += " <ul class=\"ing_month \" >\r\n " ;
					dot_str = "dot_now";
					dot_post = 1;
				}else{
					data += " <ul class=\" \" >\r\n " ;
					if(dot_post==1){
						dot_str = "dot_expect";
					}else{
						dot_str = "dot_past";
					}
				}
				
				
				
				if(i<10){
					pmMonthVal = "0"+(i+1);
				}
				
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
				 
				
				data += " </ul>\r\n "
			};
			
		 
 
       data +="							 " + 
		   "									</div> \r\n" + 
		   "									\r\n" + 
		   "								</div>";
		   
    		return $(data);
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
    	
    	//목록
    	var searchForm = $('#searchForm').serialize(); 
    	$.post('/empo/schedule/eMAU00B01MainList.do', searchForm).done(function(res) { 
    		$("#resultList").empty();
    		if(res.list == ""){
        		data = 
        			"<div data-mbcode=''>" +
        			"	<ud class='rowTD' style='height:200px;cursor: pointer;align:right' colspan='12' >데이터가 존재하지 않습니다.</ul>" +  
        		    "</div>" ; 
                	
    			 $('#resultList').append(data); 
    		} 
    		
    		res.list.forEach(function(row, index) { 
               // alert("row::"+row);
    			$('#resultList').append(managerListView(row)); 
    		}); 
    	}).fail(function() {
    		alert("실패4");
    	});
      }


	// 연도 이전, 다음 버튼
	function fnYearChange(yy) {
		window.location.href = "schedule_001.jsp?yy="+yy;
	}

	// 선택보기에서 선택한 프로세스 단계만 스케줄 화면에 표시
	/* function fnProcessStepView(code) {
		$(".sc_project > ul > li > div").css("display","none");
		$(".sc_project > ul > li."+code+" > div").css("display","");
	} */
	
	
	

	// 선택한 일자의 해당 프로세스 하위분류 일정 팝업
	function fnPopProcessView(startDate ) { // startDate : 선택한 일자의 월 시작일자, 나머지 변수는 프로그래밍에서 필요한 변수 추가 가능
 
 
		fnPopupOpen("/EmpPageLink.do?link=main/schedule/schedule0101Page", "");	// ../js/popup.js 참고
	}; 
	
	 
	
	
	
</script>

 
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
						<li><a href="<c:url value='/empo/schedule/eMAU00B041Main.do'/>" >월간스케줄</a></li>
						<li><a href="<c:url value='/empo/schedule/eMAU00B01Main.do'/>" class="active">연간스케줄</a></li>
					</ul>
				</div>
			
				<div class="schedule_guide"> 
					<div class="schedule_all2">
						<div class="schedule_top">
							<ul class="sc_title">
								<li><button type="button" class="prev" onclick="mMonth('-1')">이전</button></li> 
								<li><strong><span id="mMonth" name="mMonth" ></span> <span id="mMonth2" name="mMonth2" ></span>, <span id="mYear" name="mYear" ></span></strong></li>
								<li><a href="schedule_001.jsp?yy=2021" class="now">현재날짜로 돌아가기</a></li>
								<li><button type="button" class="next" onclick="mMonth('1')">다음</button></li>
							</ul>
							<ul class="view_btn"> 
							</ul>
							<ul>
                              <li>
									<!-- 검색 form 시작 -->
									<form id="searchForm" name="searchForm" method="post">
									    <input type="hidden" id="pjYear" name="pjYear" /> 
									    <input type="hidden" id="pjMonthday" name="pjMonthday" /> 
									 
									</form>
									<!-- 검색 form 종료 -->
                              </li>
							</ul>
							<!--<p class="sc_text">※ 프로세스별 상세보기 : 왼쪽 마우스 클릭 / 현황보기 : 오른쪽마우스 클릭</p>-->
							<ul class="condition"> 
							</ul>
							
						</div>
						<!-- e :schedule_top -->
						
						<div class="year_guide">
							
							<div class="year_top">
								<div class="project_top">
                                    <strong>  </strong>
								</div>
								<ul class="month">
									<li>1월</li>
									<li>2월</li>
									<li>3월</li>
									<li>4월</li>
									<li>5월</li>
									<li>6월</li>
									<li>7월</li>
									<li>8월</li>
									<li>9월</li>
									<li>10월</li>
									<li>11월</li>
									<li>12월</li>
								</ul>
							</div>
							<!-- e :year_top -->
 
							<div class="project_all scroll sbox_h700"  id="resultList">  
							</div> 
							<!-- e :project_all -->
						</div>
						<!-- e :year_guide -->
					</div>
					<!-- e :schedule_all -->
				
					<!-- 선택보기 단계 표시 시작 
					<div class="process_guide">
						<div class="title">선택보기</div>
						<div class=" scroll sbox_h700">
						</div>
					</div>
					-->
					<!-- 선택보기 단계 표시 종료 -->
					<form id="formYear" name="formYear">
								<input type="hidden" name="dataYear" id="dataYear" value="" />
								<input type="hidden" name="dataBbrdnBusiNm" id="dataBbrdnBusiNm" value="" />
					</form>
					
				</div>
				<!-- e :schedule_guide -->
					
				<!-- s: 프로세스 현황 팝업 -->
				<c:import url="/EmpPageLink.do?link=main/schedule/schedule0101Page" />  
                <!-- e :popup -->
				
				<!-- 상세일정 팝업 띄울 공간 -->
                <div id="divPopup" class="overlay">
				</div>

			</div>
			<!-- e :contents_guide -->
		</div>
		<!-- e :right_guide -->
	</div>
	<!-- e :wrap -->
	
<script>
;(function() {
	
	$(function() { 
		$('#groupPart1').change( groupCode ); 
		initList();
	});
	
	// 서브 그룹
	var groupCode = function() {
		var el = $(this);
		var data = el.val();
		var id = el.attr('id');
		
		if (id == 'groupPart1') {
			$('#groupPart2').children('option:not(:first)').remove();
			
			$.get( '/empo/auth/eMAU00F01SearchSubOption.do', { "grpCode" : data } ).done(function(res) {
				res.list.forEach( function(row, index) { 
					var option = $('<option value="'+ row.grmCode +'">'+ row.grmName +'</option>');
					$('#groupPart2').append(option);
				})
			}).fail(function() {
				alert("실패")
			});
		}
		
	}
	
	var initList = function() {
		
		//부서정보 호출
		$.post('/empo/auth/eMAU00F01SearchFirstOption.do').done(function(res) {
			res.list.forEach( function(row, index) {
				var option = $('<option value="'+ row.grmCode +'">'+ row.grmName +'</option>');
				$('#groupPart1').append(option);
			})
		}).fail(function() {
			alert("실패");
		});
	}
	
})();

</script>
</body>
</html>
