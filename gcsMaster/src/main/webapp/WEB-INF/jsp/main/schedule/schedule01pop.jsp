<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%

	String yy = request.getParameter("yy");

	Date nowDate = new Date();
	SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
	String strNowDate = sf.format(nowDate);

	if (yy == null || "null".equals(yy)) {
		yy = strNowDate.substring(0,4);
	};

	String engMM = nowDate.toString().substring(4,7);
	String strNowYY = strNowDate.substring(0,4);
	String strNowMM = strNowDate.substring(5,7);

	int intYY = Integer.parseInt(yy);
	String strNextYY = Integer.toString(intYY + 1);
	String strPrevYY = Integer.toString(intYY - 1);

%>

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


		
		// 선택보기 펼치고 닫기
		$("#processList > li").click(function() {
			var index = $(this).index();
			//console.log(index);

			$("#processList > li").each(function(i) {
				
				// 클릭한 단계와 동일하면 하위 단계 펼치기, 선택(active) class 추가
				if (index == i) {
					$("#processList > li").eq(i).find("ul").css("display", "");
					$("#processList > li").eq(i).addClass("active");
				}

				// 클릭한 단계가 아니면 하위단계 감추기, 선택(active) class 삭제, 하위 단계 선택 class 삭제
				else {
					$("#processList > li").eq(i).find("ul").css("display", "none");
					$("#processList > li").eq(i).removeAttr("class");
					$("#processList > li").eq(i).find("ul > li > a").removeAttr("class");
				}
			});
			
		});

		// 선택보기 하위 단계 클릭
		$("#processList > li > ul > li").click(function() {
			
			$(this).parent().find("li > a").removeAttr("class"); // 다른 하위다계 선택 class 삭제
			$(this).find("a").addClass("active");	// 선택한 단계 class (active) 추가
		});



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
	
    function mMonth(tmp) { 
        var tmYear =  $( '#mYear' ).text();
        tmYear = Number(tmYear) + Number(tmp);
        $( '#mYear' ).text( tmYear);
        $( '#pjYear' ).val( tmYear);
        
        
        selectList();
       // $('#mMonth').text(monthData);
      }
    
    function selectList() { 
    	alert(11);
    	var managerListView = function(row) {
    		var data ; 
    		
    	 
    		data = 
    			"<tr data-mbcode='" + row.pjCode + "'>" +
    			"	<td style='height:50px;' class='rowTD' style='cursor: pointer;align:right' >" + row.pjTitle + "</td>" + 
    			"	<td class='rowTD' style='cursor: pointer;align:right' >" + row.pjCode + "</td>" + 
    			"	<td class='rowTD' style='cursor: pointer;align:right' >" + row.pjCateCode1 + "</td>" + 
    			"	<td class='rowTD' style='cursor: pointer;align:right' >3</td>" + 
    			"	<td class='rowTD' style='cursor: pointer;align:right' >4</td>" + 
    			"	<td class='rowTD' style='cursor: pointer;align:right' >5</td>" + 
    			"	<td class='rowTD' style='cursor: pointer;align:right' >6</td>" + 
    			"	<td class='rowTD' style='cursor: pointer;align:right' >7</td>" + 
    			"	<td class='rowTD' style='cursor: pointer;align:right' >8</td>" + 
    			"	<td class='rowTD' style='cursor: pointer;align:right' >9</td>" + 
    			"	<td class='rowTD' style='cursor: pointer;align:right' >10</td>" + 
    			"	<td class='rowTD' style='cursor: pointer;align:right' >11</td>" + 
    			"	<td class='rowTD' style='cursor: pointer;align:right' >12</td>" + 
    			
    		    "</tr>" ;
     
    		    
    
    		return $(data);
    	}
    	 
    	 
    	//목록
    	var searchForm = $('#searchForm').serialize(); 
    	$.post('/empo/schedule/eMAU00B01MainList.do', searchForm).done(function(res) { 
    		$("#resultList").empty();
    		if(res.list == ""){
        		data = 
        			"<tr data-mbcode=''>" +
        			"	<td class='rowTD' style='height:200px;cursor: pointer;align:right' colspan='12' >데이터가 존재하지 않습니다.</td>" +  
        		    "</tr>" ; 
                	
    			//$('#resultList').append(data); 
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
	function fnProcessStepView(code) {
		$(".sc_project > ul > li > div").css("display","none");
		$(".sc_project > ul > li."+code+" > div").css("display","");
	}

	

	// 선택한 일자의 해당 프로세스 하위분류 일정 팝업
	function fnPopProcessView(startDate) { // startDate : 선택한 일자의 월 시작일자, 나머지 변수는 프로그래밍에서 필요한 변수 추가 가능
		fnPopupOpen("schedule_001_01.jsp?startDate="+startDate, "");	// ../js/popup.js 참고
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
				<div class="schedule_guide">
				
					<div class="schedule_all">
						<div class="schedule_top">
							<ul class="sc_title">
								<li><button type="button" class="prev" onclick="mMonth('-1')">이전</button></li> 
								<li><strong><span id="mMonth" name="mMonth" ></span> <span id="mMonth2" name="mMonth2" ></span>, <span id="mYear" name="mYear" ></span></strong></li>
								<li><a href="schedule_001.jsp?yy=2021" class="now">현재날짜로 돌아가기</a></li>
								<li><button type="button" class="next" onclick="mMonth('1')">다음</button></li>
							</ul>
							<ul class="view_btn">
								<li><a href="<c:url value='/'/>empo/schedule/eMAU00B01Main.do" class="active">YEAR</a></li>
								<li><a href="<c:url value='/'/>empo/schedule/eMAU00B02Main.do">MONTH</a></li>
								<li><a href="<c:url value='/'/>empo/schedule/eMAU00B03Main.do">WEEK</a></li>
							</ul>
							<!--<p class="sc_text">※ 프로세스별 상세보기 : 왼쪽 마우스 클릭 / 현황보기 : 오른쪽마우스 클릭</p>-->
							<ul class="condition">
								<li><span class="sc_past"></span> 지난일정</li>
								<li><span class="sc_now"></span> 현재달 진행중</li>
								<li><span class="sc_expect"></span> 예정</li>
								<li><span class="sc_inform"></span> 공고일</li>
							</ul>
							
						</div>
						<!-- e :schedule_top -->
						
						<div class="year_guide">
							
							<div class="year_top">
								<div class="project_top">
									<!-- 검색 form 시작 -->
									<form id="searchForm" name="searchForm" method="post">
									    <input type="hidden" id="pjYear" name="pjYear" /> 
										<ul>
											<li class="ac">
												<!-- 부서검색 -->
												<select id="groupPart1" name="groupPart1" class="input_w26">
													<option value="">전체</option>
												</select>
												
												<select id="groupPart2" name="groupPart2" class="input_w26">
													<option value="">사업부서 전체</option>
												</select> 
											</li>
										</ul>
									</form>
									<!-- 검색 form 종료 -->
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
								<div class="project_list">
									<div class="project_name">
										<strong><a href="p26.jsp">2021년도 중소기업 기술혁신개발사업 (수출지향형) 1차 기술혁신개발사업 (수출지향형) (수출지향형)</a></strong>
                                        <span class="sc_now">진행중</span>  <!-- 사업 진행중(sc_now), 예정(sc_expect), 완료(sc_inform 또는 sc_past)에 따라 class가 달라짐 -->
									</div>
									
									<!--
										========== li class 설명 ==================
										1. 프로젝트 기간 표시 bar 관련 class
											1) bar_start : 프로젝트 기간 표시 bar 시작 class, 시작 li에 한번 추가하면 됨.
											2) bar_end : 프로젝트 기간 표시 bar 종료 class, 종료 li에 한번 추가하면 됨.
											3) bar_middle : 프로젝트 기간 표시 bar 진행 class, 진행중인 모든 li에 추가해야 됨.

										2. 범례 표시 css
											1) 공고일 : dot_inform
											2) 지난일정 : dot_past
											3) 진행중 : dot_now
											4) 예정 : dot_expect

										3. 기간 표시 css - 단계가 기간으로 표시되는 경우
											1) sc_start : 단계 시작 표시 class, 시작 li에 한번 추가
											2) sc_end : 단계 종료 표시 class, 종료 li에 한번 추가
											3) bgyes : 단계 진행 class, 진행중인 모든 li에 추가
											
										4. 프로세스 단계 class 추가 : 하단의 선택보기의 각 프로세스 단계의 코드값 등과 동일한 class명을 추가한다. (proc1, proc2, proc1-1, proc1-2 등)
									-->

									<div class="sc_project">
										<ul>
											<li class=""></li>
											<li class=""></li>
											<li class=""></li>
											<li class=""></li>
										</ul>
										<ul>
											<li class="dot_inform bar_start proc1">
												<div>
													<span onclick="fnPopProcessView('2021-02-01');">1</span>
													<div class="sc_txt">공고</div>
												</div>
											</li>
											<li class="dot_past bar_middle proc1 proc1-1">
												<div>
												<span onclick="fnPopProcessView('2021-02-01');">10</span>
												<div class="sc_txt">접수</div>
												</div>
											</li>
											<li class="dot_now bar_middle proc1 proc1-2">
												<div>
												<span onclick="fnPopProcessView('2021-02-01');">23</span>
												<div class="sc_txt">결과보고</div>
												</div>
											</li>
											<li class="bar_middle"></li>
										</ul>
										<ul>
											<li class="dot_now bar_middle proc2">
												<div>
												<span onclick="fnPopProcessView('2021-03-01');">10</span>
												<div class="sc_txt">접수</div>
												</div>
											</li>
											<li class="dot_now bar_middle proc2">
												<div>
												<span onclick="fnPopProcessView('2021-03-01');">15</span>
												<div class="sc_txt">접수</div>
												</div>
											</li>
											<li class="bar_middle"></li>
											<li class="bar_middle"></li>
										</ul>
										<ul>
											<li class="dot_expect bar_middle">
												<div>
												<span onclick="fnPopProcessView('2021-04-01');">5</span>
												<div class="sc_txt">접수</div>
												</div>
											</li>
											<li class="dot_expect bar_middle">
												<div>
												<span onclick="fnPopProcessView('2021-04-01');">15</span>
												<div class="sc_txt">사업비지급</div>
												</div>
											</li>
											<li class="dot_expect bar_middle">
												<div>
												<span onclick="fnPopProcessView('2021-04-01');">25</span>
												<div class="sc_txt">접수</div>
												</div>
											</li>
											<li class="dot_expect bar_middle">
												<div>
												<span onclick="fnPopProcessView('2021-04-01');">30</span>
												<div class="sc_txt">접수</div>
												</div>
											</li>
										</ul>
										<ul>
											<li class="bar_middle"></li>
											<li class="bar_middle"></li>
											<li class="bar_middle"></li>
											<li class="bar_middle"></li>
										</ul>
										<ul>
											<li class="dot_now  bar_middle proc3">
												<div class="sc_start">
												<span onclick="fnPopProcessView('2021-06-01');">2</span>
												</div>
											</li>
											<li class="dot_now bgyes bar_middle proc3">
												<div>
												<span onclick="fnPopProcessView('2021-06-01');"></span>
												<div class="sc_txt">사업비지급</div>
												</div>
											</li>
											<li class="dot_now bgyes bar_middle proc3">
												<div>
													<span onclick="fnPopProcessView('2021-06-01');"></span>
												</div>
											</li>
											<li class="dot_now  bar_end proc3">
												<div class="sc_end">
												<span onclick="fnPopProcessView('2021-06-01');">27</span>
												</div>
											</li>
										</ul>
										<ul>
											<li class=""></li>
											<li class=""></li>
											<li class=""></li>
											<li class=""></li>
										</ul>
										<ul>
											<li class=""></li>
											<li class=""></li>
											<li class=""></li>
											<li class=""></li>
										</ul>
										<ul>
											<li class=""></li>
											<li class=""></li>
											<li class=""></li>
											<li class=""></li>
										</ul>
										<ul>
											<li class=""></li>
											<li class=""></li>
											<li class=""></li>
											<li class=""></li>
										</ul>
										<ul>
											<li class=""></li>
											<li class=""></li>
											<li class=""></li>
											<li class=""></li>
										</ul>
										<ul>
											<li class=""></li>
											<li class=""></li>
											<li class=""></li>
											<li class=""></li>
										</ul>
									</div>
									<!-- e :sc_project -->
									
								</div>
								<!-- e :project_list -->

							</div>
							<!-- e :project_all -->
						</div>
						<!-- e :year_guide -->
					</div>
					<!-- e :schedule_all -->
				
					<!-- 선택보기 단계 표시 시작 -->
					<div class="process_guide">
						<div class="title">선택보기</div>
						<div class=" scroll sbox_h700">
							<ul class="process_list" id="processList">
								<!-- 
									1. 각 프로세스 단계별 onclick 이벤트 추가
									2. 변수 (proc1, proc2, proc1-1, proc1-2 등)는 각 프로세스 단계를 구별할 수 있는 코드값 등을 입력
									3. 해당 코드값을 일정을 표시하는 li에 class로 추가
								-->
								<li><a href="#" onclick="fnProcessStepView('proc1');">사업공고</a> 
									<ul style="display:none;">
										<li><a href="#" onclick="fnProcessStepView('proc1-1');">사업공고1</a></li>
										<li><a href="#" onclick="fnProcessStepView('proc1-2');">사업공고2</a></li>
									</ul>
								</li>
								<li><a href="#" onclick="fnProcessStepView('proc2');">과제접수</a></li>
								<li><a href="#" onclick="fnProcessStepView('proc3');">사전점검</a></li>
								<li><a href="#" onclick="fnProcessStepView('proc4');">서면평가</a>
									<ul style="display:none;">
										<li><a href="#" onclick="fnProcessStepView('proc4-1');">PMS 내 분과 구성</a></li>
										<li><a href="#" onclick="fnProcessStepView('proc4-2');">평가위원회 구성계획 수립</a></li>
										<li><a href="#" onclick="fnProcessStepView('proc4-3');">평가전문위원구성</a></li>
										<li><a href="#" onclick="fnProcessStepView('proc4-4');">구성결과등록</a></li>
										<li><a href="#" onclick="fnProcessStepView('proc4-5');">평가위원회 개최</a></li>
										<li><a href="#" onclick="fnProcessStepView('proc4-6');">개최공문발송</a></li>
										<li><a href="#" onclick="fnProcessStepView('proc4-7');">위원회개최 및 서류평가</a></li>
									</ul>
								</li>
								<li><a href="#">대면평가</a>
									<ul style="display:none;">
										<li><a href="#">대면평가1</a></li>
										<li><a href="#">대면평가2</a></li>
									</ul>
								</li>
								<li><a href="#">협약</a></li>
								<li><a href="#">사업비지급</a></li>
								<li><a href="#">진도점검</a></li>
								<li><a href="#">계속비지급</a></li>
								<li><a href="#">최종평가</a></li>
								<li><a href="#">정산</a></li>
								<li><a href="#">특별평가</a></li>
								<li><a href="#">협약변경</a></li>
							</ul>
						</div>
					</div>
					<!-- 선택보기 단계 표시 종료 -->
					
					
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
</body>
</html>
