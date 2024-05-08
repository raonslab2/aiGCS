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


<script type="text/javascript">
	$(document).ready(function() {	
		// 팝업 스크롤바를 정의
		$(".scroll").mCustomScrollbar({
			scrollbarPosition : "outside"
			//theme:"dark"
		});
		
		// To-Do 일정 추가 버튼
		$(document).on('click', '.btnPopWeekToDoAdd', function() {
			alert(11);
			fnPopupAddOpen("todo_001.jsp", "");	// ../js/popup.js 참고
		});
		

		// 일정 제목 클릭 : 취소선 처리
		$(document).on('click', '.sc_view01 > strong', function() {
			alert(22);
			var l = $(this).attr("class");

			if (l == "line_yes") {	// 취소선이 있으면 처리
				$(this).removeClass("line_yes");
			}
			else {	// 취소선이 없으면 처리
				$(this).addClass("line_yes");
			}
		});
		 

		// 일정 상세정보 커서 변경
		$(".sc_view01").css("cursor","pointer");
	});

		

	// 팝업창 주 이동
	function fnPopWeekChange(startDate) { // startDate : 선택한 일자의 주 시작일자, 나머지 변수는 프로그래밍에서 필요한 변수 추가 가능
		fnPopupOpen("dash_001_02.jsp?startDate="+startDate, "");	// ../js/popup.js 참고
	};

	// 일정 상세정보 클릭하면 ToDo 보기 화면
	function fnPopToDoView() {
		fnPopupAddOpen("todo_002.jsp", "");	// ../js/popup.js 참고
	}
</script>


</head>


<div class="popup_guide popup_w1200">	
	<div class="popup_content">

		<div class="schedule_guide">
		
			<div class="schedule_all1">
				<div class="dashboard_guide dashboard_detail">
					<h4>
						<strong>Today</strong> <%=strToday.replace("-",".")%><span>(<%=strKorWeek%>)</span>
						<button type="button" class="prev" onclick="fnPopWeekChange('<%=strPrevDate%>');">이전</button>
						<button type="button" class="next" onclick="fnPopWeekChange('<%=strNextDate%>');">다음</button>
						<a href="#" class="sc_add btnPopWeekToDoAdd">일정추가</a>
					</h4>
					
					<a href="javascript:void(0)" class="closebtn4" onclick="fnPopupClose()">닫기</a>		
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
										<strong class="line_yes"><input type="checkbox" class="chkSubject"> PMS내 분과구성</strong>
										<span onclick="fnPopToDoView();">중소기업 기술혁신개발사업 (수출지향형) 2차중소기업 기술혁신개발사업 (수출지향형) 2차중소기업 기술혁신개발사업 (수출지향형) 2차중소기업 기술혁신개발사업 (수출지향형) 2차중소기업 기술혁신개발사업 (수출지향형) 2차</span>
									</li>
									<li class="sc_view01 view_inform process_start3 process_len3 proc1 proc1-2">
										<strong><input type="checkbox" class="chkSubject"> PMS내 분과구성</strong>
										<span onclick="fnPopToDoView();">중소기업 기술혁신개발사업 (수출지향형) 2차중소기업 기술혁신개발사업 (수출지향형) 2차중소기업 기술혁신개발사업 (수출지향형) 2차중소기업 기술혁신개발사업 (수출지향형) 2차중소기업 기술혁신개발사업 (수출지향형) 2차</span>
									</li>
									<li class="sc_view01 view_inform process_start7 process_len1 proc1 proc1-3">
										<strong><input type="checkbox" class="chkSubject"> PMS내 분과구성</strong>
										<span onclick="fnPopToDoView();">중소기업 기술혁신개발사업 (수출지향형) 2차중소기업 기술혁신개발사업 (수출지향형) 2차중소기업 기술혁신개발사업 (수출지향형) 2차중소기업 기술혁신개발사업 (수출지향형) 2차중소기업 기술혁신개발사업 (수출지향형) 2차</span>
									</li>
								</ul>
								
								<!-- 사업별 ul 설정, 프로세스 단계별 li 설정 -->
								<ul>										
									<li class="sc_view01 view_now process_start7 process_len1 proc2">
										<strong><input type="checkbox" class="chkSubject"> 평가위원회 구성계획 수립, 평가전문위원 구성 평가위원회 구성계획 수립, 평가전문위원 구성 </strong>
										<span onclick="fnPopToDoView();">중소기업 기술혁신개발사업 (수출지향형) 2차</span>
									</li>
								</ul>
								
								<!-- 사업별 ul 설정, 프로세스 단계별 li 설정 -->
								<ul>						
									<li class="sc_view01 view_past process_start4 process_len3 proc3">
										<strong><input type="checkbox" class="chkSubject"> 구성결과 등록</strong>
										<span onclick="fnPopToDoView();">중소기업 기술혁신개발사업 (수출지향형) 2차</span>
									</li>
								</ul>

								<!-- 사업별 ul 설정, 프로세스 단계별 li 설정 -->
								<ul>		
									<li class="sc_view01 view_expect process_start3 process_len4 proc4">
										<strong><input type="checkbox" class="chkSubject"> 서면평가</strong>
										<span onclick="fnPopToDoView();">중소기업 기술혁신개발사업 (수출지향형) 2차 중소기업 기술혁신개발사업 (수출지향형) 2차 중소기업 기술혁신개발사업 (수출지향형) 2차</span>
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
												<strong><input type="checkbox" class="chkSubject"> 평가위원회 구성계획 수립, 평가전문위원 구성 평가위원회 구성계획 수립, 평가전문위원 구성 </strong>
												<span onclick="fnPopToDoView();">중소기업 기술혁신개발사업 (수출지향형) 2차</span>
											</li>									
											<li class="sc_view01 view_inform process_start2 process_len2 proc4  proc4-2">
												<strong><input type="checkbox" class="chkSubject"> 평가위원회 구성계획 수립, 평가전문위원 구성 평가위원회 구성계획 수립, 평가전문위원 구성 </strong>
												<span onclick="fnPopToDoView();">중소기업 기술혁신개발사업 (수출지향형) 2차</span>
											</li>								
											<li class="sc_view01 view_inform process_start6 process_len1 proc4  proc4-3">
												<strong><input type="checkbox" class="chkSubject"> 평가전문위원 구성 </strong>
												<span onclick="fnPopToDoView();">중소기업 기술혁신개발사업 (수출지향형) 2차</span>
											</li>
										</ul>

										<!-- 사업별 ul 설정, 프로세스 단계별 li 설정 -->
										<ul>										
											<li class="sc_view01 view_now process_start3 process_len3 proc4 proc4-4">
												<strong><input type="checkbox" class="chkSubject"> 평가위원회 구성계획 수립, 평가전문위원 구성 평가위원회 구성계획 수립, 평가전문위원 구성 </strong>
												<span onclick="fnPopToDoView();">중소기업 기술혁신개발사업 (수출지향형) 2차</span>
											</li>
										</ul>

										<!-- 사업별 ul 설정, 프로세스 단계별 li 설정 -->
										<ul>							
											<li class="sc_view01 view_expect process_start7 process_len1 proc4 proc4-5">
												<strong><input type="checkbox" class="chkSubject"> 평가위원회 구성계획 수립, 평가전문위원 구성 평가위원회 구성계획 수립, 평가전문위원 구성 </strong>
												<span onclick="fnPopToDoView();">중소기업 기술혁신개발사업 (수출지향형) 2차</span>
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
		</div>
		<!-- e :schedule_guide -->
			
	</div>

</div>