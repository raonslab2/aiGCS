<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="java.util.Calendar"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.DecimalFormat"%>
<%@ page import="java.text.SimpleDateFormat"%>

<%

	// 스케줄 표시하는 주의 시작일자
	String strStartDate = request.getParameter("startDate");

	SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");	
	Calendar calendar = Calendar.getInstance();
	String strToday = sf.format(calendar.getTime());
	
	// 현재시간
	int intHour = calendar.get(Calendar.HOUR_OF_DAY);

	// 현재 주의 시작일자
	int intNowWeek = calendar.get(Calendar.DAY_OF_WEEK); 		
	calendar.add(Calendar.DATE , (intNowWeek-1)*(-1));
	String strCurrentDate = sf.format(calendar.getTime());

	// 시작일자가 없으면 스케줄 표시하는 주의 시작일자 구하기
	if (strStartDate == null || "null".equals(strStartDate)) {	
		strStartDate = strCurrentDate;
	};

	// 연도 및 월 값 구하기
	Date date = sf.parse(strStartDate);
	String yy = strStartDate.substring(0,4);
	String engMM = date.toString().substring(4,7);	
	
	// 이전주의 시작일
	calendar.setTime(date);
	calendar.add(Calendar.DATE , -7);
	String strPrevDate = sf.format(calendar.getTime());

	// 다음주의 시작일
	calendar.setTime(date);
	calendar.add(Calendar.DATE , 7);
	String strNextDate = sf.format(calendar.getTime());
	
%>


<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>TIPA 스케쥴기반 평가관리시스템</title>
<%@ include file = "../include/src.jsp" %>


<script type="text/javascript">
	$(document).ready(function() {		
		
		
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
		$(".sc_view01").css("cursor","pointer");
		$(".sc_view01").click(function(e) {

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

	
	// 주 이전, 다음 버튼
	function fnWeekChange(startDate) {
		window.location.href = "schedule_003.jsp?startDate="+startDate;
	}

	// 선택보기에서 선택한 프로세스 단계만 스케줄 화면에 표시
	function fnProcessStepView(code) {
		$(".process_view > ul > li").css("display","none");
		$(".process_view > ul > li."+code+"").css("display","");
	}
</script>

</head>

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
								<li><button type="button" class="prev" onclick="fnWeekChange('<%=strPrevDate%>');">이전</button></li>
								<li><strong><%=engMM%>., <%=yy%></strong></li>
								<li><a href="schedule_003.jsp?startDate=<%=strCurrentDate%>" class="now">현재날짜로 돌아가기</a></li>
								<li><button type="button" class="next" onclick="fnWeekChange('<%=strNextDate%>');">다음</button></li>
							</ul>
							<ul class="view_btn">
								<li><a href="schedule_001.jsp">YEAR</a></li>
								<li><a href="schedule_002.jsp">MONTH</a></li>
								<li><a href="schedule_003.jsp" class="active">WEEK</a></li>
							</ul>
							<p class="sc_sel">
								<select>
									<option>담당사업</option>
									<option>사업부서 전체</option>
									<option>전체 사업</option>
								</select>
							</p>
							
							
						</div>
						<!-- e :schedule_top -->
						
						<div class="week_guide">
							<div class="week_top">
								<div>시간</div>
								<ul class="day_tit">
									<%																			
										for (int i=0; i < 7; i++) {
											calendar.setTime(date);
											calendar.add(Calendar.DATE , i);
											String topDate = sf.format(calendar.getTime());
											String viewDate = topDate.substring(5,10).replace("-","/");

											String viewWeek = "";
											switch(i) {
												case 0: viewWeek= "Sun"; break;
												case 1: viewWeek= "Mon"; break;
												case 2: viewWeek= "Tue"; break;
												case 3: viewWeek= "Wed"; break;
												case 4: viewWeek= "Thu"; break;
												case 5: viewWeek= "Fri"; break;
												case 6: viewWeek= "Sat"; break;
											}

									%>
											<li <% if (topDate.equals(strToday)) {%>class="today"<%}%>><%=viewWeek%><span><%=viewDate%></span></li>
									<%
										}
									%>
								</ul>
							</div>
							<!-- e :week_top -->

									
							<!--
								========== li class 설명 ==================
								1. 범례 표시 css
									1) 공고일 : view_inform
									2) 지난일정 : view_past
									3) 진행중 : view_now
									4) 예정 : view_expect

								2. 프로세스 시작 관련 class
									1) process_start1 : 일요일에 시작
									2) process_start2 : 월요일에 시작
									3) process_start3 : 화요일에 시작
									4) process_start4 : 수요일에 시작
									5) process_start5 : 목요일에 시작
									6) process_start6 : 금요일에 시작
									7) process_start7 : 토요일에 시작

								3. 프로세스 기간 관련 class
									1) process_len1 : 시작일과 같은날 종료
									2) process_len2 : 시작일 + 1일에 종료
									3) process_len3 : 시작일 + 2일에 종료
									4) process_len4 : 시작일 + 3일에 종료
									5) process_len5 : 시작일 + 4일에 종료
									6) process_len6 : 시작일 + 5일에 종료
									7) process_len7 : 시작일 + 6일에 종료
									
								4. 프로세스 단계 class 추가 : 하단의 선택보기의 각 프로세스 단계의 코드값 등과 동일한 class명을 추가한다. (proc1, proc2, proc1-1, proc1-2 등)
							-->
							
							<div class="time_all scroll sbox_h700">
								<div class="time_list">
									<div class="time_view">
										<span>09:00 AM</span> 
										<span>18:00 PM</span>
									</div>

									<div class="process_view">
										<!-- 사업별 ul 설정, 프로세스 단계별 li 설정 -->
										<ul>										
											<li class="sc_view01 view_inform process_start1 process_len2 proc1 proc1-1">
												<strong>PMS내 분과구성</strong>
												<span>중소기업 기술혁신개발사업 (수출지향형) 2차중소기업 기술혁신개발사업 (수출지향형) 2차중소기업 기술혁신개발사업 (수출지향형) 2차중소기업 기술혁신개발사업 (수출지향형) 2차중소기업 기술혁신개발사업 (수출지향형) 2차</span>
											</li>
											<li class="sc_view01 view_inform process_start3 process_len3 proc1 proc1-2">
												<strong>PMS내 분과구성</strong>
												<span>중소기업 기술혁신개발사업 (수출지향형) 2차중소기업 기술혁신개발사업 (수출지향형) 2차중소기업 기술혁신개발사업 (수출지향형) 2차중소기업 기술혁신개발사업 (수출지향형) 2차중소기업 기술혁신개발사업 (수출지향형) 2차</span>
											</li>
											<li class="sc_view01 view_inform process_start7 process_len1 proc1 proc1-3">
												<strong>PMS내 분과구성</strong>
												<span>중소기업 기술혁신개발사업 (수출지향형) 2차중소기업 기술혁신개발사업 (수출지향형) 2차중소기업 기술혁신개발사업 (수출지향형) 2차중소기업 기술혁신개발사업 (수출지향형) 2차중소기업 기술혁신개발사업 (수출지향형) 2차</span>
											</li>
										</ul>
										
										<!-- 사업별 ul 설정, 프로세스 단계별 li 설정 -->
										<ul>										
											<li class="sc_view01 view_now process_start7 process_len1 proc2">
												<strong>평가위원회 구성계획 수립, 평가전문위원 구성 평가위원회 구성계획 수립, 평가전문위원 구성 </strong>
												<span>중소기업 기술혁신개발사업 (수출지향형) 2차</span>
											</li>
										</ul>
										
										<!-- 사업별 ul 설정, 프로세스 단계별 li 설정 -->
										<ul>						
											<li class="sc_view01 view_past process_start4 process_len3 proc3">
												<strong>구성결과 등록</strong>
												<span>중소기업 기술혁신개발사업 (수출지향형) 2차</span>
											</li>
										</ul>

										<!-- 사업별 ul 설정, 프로세스 단계별 li 설정 -->
										<ul>		
											<li class="sc_view01 view_expect process_start3 process_len4 proc4">
												<strong>서면평가</strong>
												<span>중소기업 기술혁신개발사업 (수출지향형) 2차 중소기업 기술혁신개발사업 (수출지향형) 2차 중소기업 기술혁신개발사업 (수출지향형) 2차</span>
											</li>
										</ul>
									</div>
								</div>
								<!-- e :time_list -->

								<%
									for (int i=9; i <= 18; i++) {
										String hh = Integer.toString(i);
										if (hh.length() < 2) hh = "0" + hh;

										String strViewTime = hh + ":00";

										if (i < 12) {
											strViewTime = strViewTime + " AM";
										} else {
											strViewTime = strViewTime + " PM";
										}

										
								%>

										<div class="time_list  <% if (i == intHour) {%>ing_time<%}%>"> <!-- 현재 시간 표시 class : ing_time -->
											<div class="time_view">
												<span><%=strViewTime%></span> 
											</div>
											
											<div class="process_view">
												
												<!-- 사업별 ul 설정, 프로세스 단계별 li 설정 -->
												<ul>										
													<li class="sc_view01 view_inform process_start1 process_len1 proc4  proc4-1">
														<strong>평가위원회 구성계획 수립, 평가전문위원 구성 평가위원회 구성계획 수립, 평가전문위원 구성 </strong>
														<span>중소기업 기술혁신개발사업 (수출지향형) 2차</span>
													</li>									
													<li class="sc_view01 view_inform process_start2 process_len2 proc4  proc4-2">
														<strong>평가위원회 구성계획 수립, 평가전문위원 구성 평가위원회 구성계획 수립, 평가전문위원 구성 </strong>
														<span>중소기업 기술혁신개발사업 (수출지향형) 2차</span>
													</li>								
													<li class="sc_view01 view_inform process_start6 process_len1 proc4  proc4-3">
														<strong>평가전문위원 구성 </strong>
														<span>중소기업 기술혁신개발사업 (수출지향형) 2차</span>
													</li>
												</ul>

												<!-- 사업별 ul 설정, 프로세스 단계별 li 설정 -->
												<ul>										
													<li class="sc_view01 view_now process_start3 process_len3 proc4 proc4-4">
														<strong>평가위원회 구성계획 수립, 평가전문위원 구성 평가위원회 구성계획 수립, 평가전문위원 구성 </strong>
														<span>중소기업 기술혁신개발사업 (수출지향형) 2차</span>
													</li>
												</ul>

												<!-- 사업별 ul 설정, 프로세스 단계별 li 설정 -->
												<ul>							
													<li class="sc_view01 view_expect process_start7 process_len1 proc4 proc4-5">
														<strong>평가위원회 구성계획 수립, 평가전문위원 구성 평가위원회 구성계획 수립, 평가전문위원 구성 </strong>
														<span>중소기업 기술혁신개발사업 (수출지향형) 2차</span>
													</li>
												</ul>
											</div>
										</div>
								<%
									}
								%>
							</div>
						</div>
						
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
									3. 해당 코드값을 일정을 표시하는 ul에 class로 추가
								-->
								<li><a href="#" onclick="fnProcessStepView('proc1');">사업공고</a> 
									<ul style="display:none;">
										<li><a href="#" onclick="fnProcessStepView('proc1-1');">사업공고1</a></li>
										<li><a href="#" onclick="fnProcessStepView('proc1-2');">사업공고2</a></li>
										<li><a href="#" onclick="fnProcessStepView('proc1-3');">사업공고3</a></li>
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
