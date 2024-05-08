<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

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



<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>TIPA 스케쥴기반 평가관리시스템</title>
<%@ include file = "../include/src.jsp" %>

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
		var mm = "<%=strNowMM%>";	// 현재월
		var m = parseInt(mm)-1;	// 현재월 숫자 변환

		// 상단 월 영력에 현재월 표시
		$(".month > li").eq(m).addClass("ing_month");	

		// 하단 사업 영역에 현재월 표시
		$(".sc_project").each(function(index) {
			$(this).find("ul").eq(m).addClass("ing_month")
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
			<%@ include file = "../include/menu.jsp" %>
		</div>
		<!-- e :lnb_guide -->
			
		<!-- s :right_guide -->
		<div class="right_guide">

			<!-- 화면 상단 시작 -->
			<div class="top_guide">

				<!-- 1차 메뉴명 -->
				<h3>Schedule</h3>

				<%@ include file = "../include/top.jsp" %>
			</div>
			<!-- 화면 상단 종료 -->
			
			<!-- s :contents_guide -->
			<div class="contents_guide">
				<div class="schedule_guide">
				
					<div class="schedule_all">
						<div class="schedule_top">
							<ul class="sc_title">
								<li><button type="button" class="prev" onclick="fnYearChange('<%=strPrevYY%>');">이전</button></li>
								<li><strong><%=engMM%>., <%=yy%></strong></li>
								<li><a href="schedule_001.jsp?yy=<%=strNowYY%>" class="now">현재날짜로 돌아가기</a></li>
								<li><button type="button" class="next" onclick="fnYearChange('<%=strNextYY%>');">다음</button></li>
							</ul>
							<ul class="view_btn">
								<li><a href="schedule_001.jsp" class="active">YEAR</a></li>
								<li><a href="schedule_002.jsp">MONTH</a></li>
								<li><a href="schedule_003.jsp">WEEK</a></li>
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
									<select class="input_w100">
										<option>담당사업</option>
										<option selected>사업부서 전체</option>
										<option>사업 전체</option>
									</select>
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

							
							<div class="project_all scroll sbox_h700">
								
								<div class="project_list">
									<div class="project_name">
										<strong><a href="p26.jsp">2021년도 중소기업 기술혁신개발사업 (수출지향형) 1차 기술혁신개발사업 (수출지향형) (수출지향형)</a></strong>
                                        <span class="sc_now">진행중</span>  <!-- 사업 진행중(sc_now), 예정(sc_expect), 완료(sc_inform 또는 sc_past)에 따라 class가 달라짐 -->
									</div> 
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
									
								</div>
								<!-- e :project_list -->
										
								<div class="project_list">
									<div class="project_name">
										<strong><a href="#">2021년도 중소기업 기술혁신개발사업 (수출지향형) 2차</a></strong>
                                        <span class="sc_expect">예정</span>
									</div>
									<div class="sc_project">
										<ul>
											<li class="bar_middle"></li>
											<li class="bar_middle"></li>
											<li class="bar_middle"></li>
											<li class="bar_middle"></li>
										</ul>
										<ul>
											<li class="bar_middle"></li>
											<li class="bar_middle"></li>
											<li class="bar_end"></li>
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
											<li class="bar_start"></li>
										</ul>
										<ul>
											<li class="bar_middle"></li>
											<li class="bar_middle"></li>
											<li class="bar_middle"></li>
											<li class="bar_middle"></li>
										</ul>
										<ul>
											<li class="bar_end"></li>
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
											<li class="bar_start"></li>
											<li class="bar_middle"></li>
										</ul>
										<ul>
											<li class="bar_middle"></li>
											<li class="bar_middle"></li>
											<li class="bar_middle"></li>
											<li class="bar_middle"></li>
										</ul>
									</div>
									<!-- e :sc_project -->
									
								</div>
								<!-- e :project_list -->
								
								<div class="project_list">
									<div class="project_name">
										<strong><a href="#">2021년도 중소기업 기술혁신개발사업 (수출지향형) 3차</a></strong>
                                        <span class="sc_inform">완료</span>
									</div>
									<div class="sc_project">
										<ul>
											<li class="dot_inform bar_middle proc1">
												<div>
													<span onclick="fnPopProcessView('2021-01-01');">1</span>
													<div class="sc_txt">공고</div>
												</div>
											</li>
											<li class="dot_past bar_middle proc1 proc1-1">
												<div>
												<span>10</span>
												<div class="sc_txt">접수</div>
												</div>
											</li>
											<li class="dot_now bar_middle proc1 proc1-2">
												<div>
												<span>23</span>
												<div class="sc_txt">결과보고</div>
												</div>
											</li>
											<li class="bar_middle"></li>
										</ul>
										<ul>
											<li class="dot_now bar_middle proc2">
												<div>
												<span>10</span>
												<div class="sc_txt">접수</div>
												</div>
											</li>
											<li class="dot_now bar_middle proc2">
												<div>
												<span>10</span>
												<div class="sc_txt">접수</div>
												</div>
											</li>
											<li class="bar_middle"></li>
											<li class="bar_middle"></li>
										</ul>
										<ul>
											<li class="dot_expect bar_middle">
												<div>
												<span>5</span>
												<div class="sc_txt">접수</div>
												</div>
											</li>
											<li class="dot_expect bar_middle">
												<div>
												<span>15</span>
												<div class="sc_txt">사업비지급</div>
												</div>
											</li>
											<li class="dot_expect bar_middle">
												<div>
												<span>25</span>
												<div class="sc_txt">접수</div>
												</div>
											</li>
											<li class="dot_expect bar_middle">
												<div>
												<span>30</span>
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
												<span>2</span>
												</div>
											</li>
											<li class="dot_now bgyes bar_middle proc3">
												<div>
												<span></span>
												<div class="sc_txt">사업비지급</div>
												</div>
											</li>
											<li class="dot_now bgyes bar_middle proc3">
												<div>
													<span></span>
												</div>
											</li>
											<li class="dot_now  bar_end proc3">
												<div class="sc_end">
												<span>27</span>
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
								
								<div class="project_list">
									<div class="project_name">
										<strong><a href="#">2021년도 중소기업 기술혁신개발사업 (수출지향형) 1차 기술혁신개발사업</a></strong>
                                        <span class="sc_past">완료</span>
									</div>
									<div class="sc_project">
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
											<li class="dot_inform bar_start proc1">
												<div>
													<span>1</span>
													<div class="sc_txt">공고</div>
												</div>
											</li>
											<li class="dot_past bar_middle proc1 proc1-1">
												<div>
												<span>10</span>
												<div class="sc_txt">접수</div>
												</div>
											</li>
											<li class="dot_now bar_middle proc1 proc1-2">
												<div>
												<span>23</span>
												<div class="sc_txt">결과보고</div>
												</div>
											</li>
											<li class="bar_middle"></li>
										</ul>
										<ul>
											<li class="dot_now bar_middle proc2">
												<div>
												<span>10</span>
												<div class="sc_txt">접수</div>
												</div>
											</li>
											<li class="dot_now bar_middle proc2">
												<div>
												<span>10</span>
												<div class="sc_txt">접수</div>
												</div>
											</li>
											<li class="bar_middle"></li>
											<li class="bar_middle"></li>
										</ul>
										<ul>
											<li class="dot_expect bar_middle">
												<div>
												<span>5</span>
												<div class="sc_txt">접수</div>
												</div>
											</li>
											<li class="dot_expect bar_middle">
												<div>
												<span>15</span>
												<div class="sc_txt">사업비지급</div>
												</div>
											</li>
											<li class="dot_expect bar_middle">
												<div>
												<span>25</span>
												<div class="sc_txt">접수</div>
												</div>
											</li>
											<li class="dot_expect bar_middle">
												<div>
												<span>30</span>
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
												<span>2</span>
												</div>
											</li>
											<li class="dot_now bgyes bar_middle proc3">
												<div>
												<span></span>
												<div class="sc_txt">사업비지급</div>
												</div>
											</li>
											<li class="dot_now bgyes bar_middle proc3">
												<div>
													<span></span>
												</div>
											</li>
											<li class="dot_now  bar_end proc3">
												<div class="sc_end">
												<span>27</span>
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
									</div>
									<!-- e :sc_project -->
									
								</div>
								<!-- e :project_list -->
								
								<div class="project_list">
									<div class="project_name">
										<strong><a href="#">2021년도 중소기업 기술혁신개발사업</a></strong>
                                        <span class="sc_expect">예정</span>
									</div>
									<div class="sc_project">
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
										<ul>
											<li class=""></li>
											<li class=""></li>
											<li class=""></li>
											<li class=""></li>
										</ul>
										<ul>
											<li class="dot_inform bar_start proc1">
												<div>
													<span>1</span>
													<div class="sc_txt">공고</div>
												</div>
											</li>
											<li class="dot_past bar_middle proc1 proc1-1">
												<div>
												<span>10</span>
												<div class="sc_txt">접수</div>
												</div>
											</li>
											<li class="dot_now bar_middle proc1 proc1-2">
												<div>
												<span>23</span>
												<div class="sc_txt">결과보고</div>
												</div>
											</li>
											<li class="bar_middle"></li>
										</ul>
										<ul>
											<li class="dot_now bar_middle proc2">
												<div>
												<span>10</span>
												<div class="sc_txt">접수</div>
												</div>
											</li>
											<li class="dot_now bar_middle proc2">
												<div>
												<span>10</span>
												<div class="sc_txt">접수</div>
												</div>
											</li>
											<li class="bar_middle"></li>
											<li class="bar_middle"></li>
										</ul>
										<ul>
											<li class="dot_expect bar_middle">
												<div>
												<span>5</span>
												<div class="sc_txt">접수</div>
												</div>
											</li>
											<li class="dot_expect bar_middle">
												<div>
												<span>15</span>
												<div class="sc_txt">사업비지급</div>
												</div>
											</li>
											<li class="dot_expect bar_middle">
												<div>
												<span>25</span>
												<div class="sc_txt">접수</div>
												</div>
											</li>
											<li class="dot_expect bar_middle">
												<div>
												<span>30</span>
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
												<span>2</span>
												</div>
											</li>
											<li class="dot_now bgyes bar_middle proc3">
												<div>
												<span></span>
												<div class="sc_txt">사업비지급</div>
												</div>
											</li>
											<li class="dot_now bgyes bar_middle proc3">
												<div>
													<span></span>
												</div>
											</li>
											<li class="dot_now  bar_middle proc3">
												<div class="sc_end">
												<span>27</span>
												</div>
											</li>
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
				<%@ include file = "schedule_001_02.jsp" %>
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
