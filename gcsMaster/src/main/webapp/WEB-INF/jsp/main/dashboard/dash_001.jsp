<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

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

<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>TIPA 스케쥴기반 평가관리시스템</title>
<%@ include file = "../include/src.jsp" %>

<script type="text/javascript">
	$(document).ready(function() {
	
		// To-Do 일정 추가 버튼
		$(document).on('click', '.btnPopToDoAdd', function() {
			fnPopupAddOpen("todo_001.jsp", "");	// ../js/popup.js 참고
		});

		// 주간 전체보기 추가 버튼
		$(document).on('click', '.btnPopWeekAllView', function() {
			fnPopupOpen("dash_001_02.jsp", "");	// ../js/popup.js 참고
		});

		// 일정 Work 보기 버튼
		$(document).on('click', '.btnPopWorkView', function() {
			fnPopupOpen("work_001_01.jsp", "");	// ../js/popup.js 참고
		});
		
		// To-Do 일정 보기 버튼
		$(document).on('click', '.btnPopToDoView', function() {
			fnPopupAddOpen("todo_002.jsp", "");	// ../js/popup.js 참고
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
			fnPopupOpen("check_001_01.jsp", "");	// ../js/popup.js 참고
		});


		// 알림 삭제
		$(document).on('click', '.btnNoticeDelete', function() {
			if (confirm("선택하신 알림을 삭제하시겠습니까?")) {
				var index = $(this).parent().parent().index();
				$(".noticeList").find("ul").eq(index).remove();
			}
		});

		// 알림 더보기
		$(document).on('click', '.btnNoticeAddView', function() {
			// ajax 등을 이용하여 데이터를 불러온다.
			// 아래는 테스트를 위한 가짜 데이터
			var html = "";			
			html = html + '<ul>';
			html = html + '	<li class="al_time">30분전</li>';
			html = html + '	<li class="tit">분과구성 등록_BM개발과제 1단계</li>';
			html = html + '	<li class="data_txt01">2021년도 소상공인 자영업자를 위한 생활혁신형 기술개발사업’BM개발과제(1단계 BM기획)</li>';
			html = html + '	<li class="data_txt02">평가장 본사 502호</li>';
			html = html + '	<li class="btn_del"><a href="#" class="btnNoticeDelete">삭제</a></li>';
			html = html + '</ul>';
			
			// 스크롤 때문에 이렇게 추가해야 한다.
			$(".noticeList").find("#mCSB_4").find("#mCSB_4_container").append(html);

			// 스크롤바 하단 이동
			$(".noticeList").mCustomScrollbar("scrollTo","bottom");
		});

		
	});


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
				<h3>Dashboard</h3>

				<%@ include file = "../include/top.jsp" %>
			</div>
			<!-- 화면 상단 종료 -->
			
			<!-- s :contents_guide -->
			<div class="contents_guide">
				<div class="dashboard_guide">
				
					<div class="tasks_guide">
						<h4>Tasks 
							<select>
								<option>담당사업</option>
								<option>소속부서 전체</option>
								<option>사업 전체</option>
							</select>
						</h4>
						<div class="btn_guide ar">
							<a href="dash_001_01.jsp" class="btn_style02 btn_white sb_style ">전체보기</a>
						</div>
						<div class="tasks_top">
							<ul>
								<li><a href="#" onclick="fnTaskListView('taskTopNow');"> <!-- 진행중 class : taskTopNow -->
										<span>진행중</span>
										<strong>3건</strong>
									</a>
								</li>
								<li><a href="#" onclick="fnTaskListView('taskTopExpect');"> <!-- 예정 class : taskTopExpect -->
										<span>예정</span>
										<strong>2건</strong>
									</a>
								</li>
								<li><a href="#" onclick="fnTaskListView('taskTopPast');"> <!-- 완료 class : taskTopPast -->
										<span>완료</span>
										<strong>1건</strong>
									</a>
								</li>
								<li><a href="#" onclick="fnTaskListView('');"> <!-- 전체 class :  -->
										<span>전체</span>
										<strong>6건</strong>
									</a>
								</li>
							</ul>
						</div>
						<div class="tasks_list_all scroll sbox_h650">
							<div class="tasks_list taskTopNow"> <!-- 진행중 class : taskTopNow -->
								<ul class="tasks_info">
									<li class="date">05.16 2021</li>
									<li class="progress">접수마감 <strong class="txt_now">10</strong>일전</li>
									<li class="tit">2021년 생활혁신형 기술혁신개발사업 수출지향형 1차 시행계획 공고</li>
									<li class="t_period">2021.02.10 ~ 2021.03.10</li>
								</ul>
								<div class="progress_guide">
									<h5>Progress</h5>
									<ul>
										<li><span class="bg_past"></span></li>
										<li><span class="bg_now"></span>
											<div>접수기간 (21.5.01 ~ 21.05.31)</div>
										</li>
										<li><span></span></li>
										<li><span></span></li>
										<li><span></span></li>
										<li><span></span></li>
										<li><span></span></li>
										<li><span></span></li>
									</ul>
								</div>
								<!-- e :progress_guide -->
							</div>
							<!-- e :tasks_list -->
							
							<div class="tasks_list taskTopExpect"> <!-- 예정 class : taskTopExpect -->
								<ul class="tasks_info">
									<li class="date">05.16 2021</li>
									<li class="progress">사업시작 <strong class="txt_expect">20</strong>일전</li>
									<li class="tit">2021년 생활혁신형 기술혁신개발사업 수출지향형 1차</li>
									<li class="t_period">2021.02.10 ~ 2021.03.10</li>
								</ul>
								<div class="progress_guide">
									<h5>Progress</h5>
									<ul>
										<li><span></span><div>공고 (21.5.01 ~ 21.05.31)</div></li>
										<li><span></span></li>
										<li><span></span></li>
										<li><span></span></li>
										<li><span></span></li>
										<li><span></span></li>
										<li><span></span></li>
										<li><span></span></li>
									</ul>
								</div>
								<!-- e :progress_guide -->
							</div>
							<!-- e :tasks_list -->
							
							<div class="tasks_list taskTopPast"> <!-- 완료 class : taskTopPast -->
								<ul class="tasks_info">
									<li class="date">05.16 2021</li>
									<li class="progress">최종점검완료 <strong class="txt_past">-10</strong>일</li>
									<li class="tit">2021년 생활혁신형 기술혁신개발사업 수출지향형 1차</li>
									<li class="t_period">2021.02.10 ~ 2021.03.10</li>
								</ul>
								<div class="progress_guide">
									<h5>Progress</h5>
									<ul>
										<li><span class="bg_past"></span></li>
										<li><span class="bg_past"></span></li>
										<li><span class="bg_past"></span></li>
										<li><span class="bg_past"></span></li>
										<li><span class="bg_past"></span></li>
										<li><span class="bg_past"></span></li>
										<li><span class="bg_past"></span></li>
										<li><span class="bg_past"></span><!--<div>최종점검 (21.5.01 ~ 21.05.31)</div>--></li>
									</ul>
								</div>
								<!-- e :progress_guide -->
							</div>
							<!-- e :tasks_list -->
							
							<div class="tasks_list taskTopExpect"> <!-- 예정 class : taskTopExpect -->
								<ul class="tasks_info">
									<li class="date">05.16 2021</li>
									<li class="progress">공고 <strong class="txt_inform">0</strong>일전</li>
									<li class="tit">2021년 생활혁신형 기술혁신개발사업 수출지향형 1차</li>
									<li class="t_period">2021.02.10 ~ 2021.03.10</li>
								</ul>
								<div class="progress_guide">
									<h5>Progress</h5>
									<ul>
										<li><span class="bg_now"></span>
										<div>공고 (21.7.07)</div>
										</li>
										<li><span></span></li>
										<li><span></span></li>
										<li><span></span></li>
										<li><span></span></li>
										<li><span></span></li>
										<li><span></span></li>
										<li><span></span></li>
									</ul>
								</div>
								<!-- e :progress_guide -->
							</div>
							<!-- e :tasks_list -->
						</div>
						<!-- e :tasks_list_all -->
						
					</div>
					<!-- e :tasks_guide -->
					
					<div class="today_guide">
						<h4>
							<strong>Today</strong> <%=toDay%><span>(<%=strKorWeek%>)</span>
							<a href="#" class="sc_add btnPopToDoAdd">일정추가</a>
						</h4>
						
						<div class="btn_guide ar">
							<a href="#" class="btn_style02 btn_white sb_style btnPopWeekAllView">주간 전체보기</a>
						</div>
						
						<div class="today_all">
							<ul class="today_top">
							
									<%	
										
										Date date = sf.parse(weekStartDate);

										for (int i=0; i < 7; i++) {
											calendar.setTime(date);
											calendar.add(Calendar.DATE , i);
											String topDate = sf.format(calendar.getTime());
											String viewDate = topDate.substring(8,10);

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
											<!-- sc_yes : 일정이 있는 날짜를 표시하는 class -->
											<li onclick="fnTodayScheduleView('<%=topDate%>');"<% if (i > 1 && i < 5 ) {%>class="sc_yes"<%}%>> 
												<span><%=viewWeek%></span>
												<strong  <% if (topDate.equals(toDay)) {%>class="today"<%}%>><%=viewDate%></strong>
											</li>
									<%
										}
									%>
							</ul>
							
							<div class="today_news_all scroll sbox_h450 scheduleList">
								<div class="notice"><a href="#" class="btnPopWorkView">담당간사 지원요청 <span>10분 전</span></a></div>
								<div class="notice"><a href="#" class="btnPopWorkView">분과구성 협의회 <span>3:00 PM</span></a></div>
								<div class="tnews_list">
									<a href="#" class="btnPopToDoView">
										<ul>
											<li class="tit"><input type="checkbox"> 평가위원회 개최</li>
											<li>공통투자형 과제 지정 공모1차</li>
											<li>평가장 505호</li>
											<li class="date">10:00 AM</li>
										</ul>
									</a>
								</div>
								<div class="tnews_list">
									<a href="#" class="btnPopToDoView">
										<ul>
											<li class="tit"><input type="checkbox"> 평가위원회 개최</li>
											<li>공통투자형 과제 지정 공모1차</li>
											<li class="date">10:00 AM</li>
										</ul>
									</a>
								</div>
								<div class="tnews_list">
									<a href="#" class="btnPopToDoView">
										<ul>
											<li class="tit"><input type="checkbox"> 평가위원회 개최</li>
											<li>공통투자형 과제 지정 공모1차</li>
											<li>평가장 505호</li>
											<li class="date">10:00 AM</li>
										</ul>
									</a>
								</div>
								
							</div>
							<div class="sc_more"><a href="#" class="btnScheduleAddView"><span>오늘 일정 더보기</span></a></div>
						
						</div>
						<!-- e :today_all -->
						
						<h4>Check List</h4>
							
                        <div class="btn_guide ar">
							<a href="#" class="btn_style02 btn_blue sb_style btnCheckListAdd">추가</a>
                        </div>
						
						<div class="check_list scroll sbox_h150">
							<ul>
								<li><input type="checkbox" checked> <span class="line_yes">공고별 특성등록 및 특이사항 확인</span></li>
								<li><input type="checkbox" checked> <span class="line_yes">평가표 갱신 요청 및 확인</span></li>
								<li><input type="checkbox"> <span>접수마감처리</span></li>
								<li><input type="checkbox"> <span>자동제출여부확인</span></li>
								<li><input type="checkbox"> <span>중복성 검토 확인</span></li>
								<li><input type="checkbox"> <span>접수마감처리</span></li>
								<li><input type="checkbox"> <span>자동제출여부확인</span></li>
								<li><input type="checkbox"> <span>중복성 검토 확인</span></li>
							</ul>
						</div>
						
					</div>
					<!-- e :today_guide -->
					
					<div class="news_guide">
						<h4>알림을 확인하세요</h4>
						<div class="news_all">
							<div class="news_list_all scroll sbox_h750 noticeList">
								<ul>
									<li class="al_time not_read">10분전</li>
									<li class="tit">담당간사 지원요청 </li>
									<li class="date">요청일자 : 5/20(목), 5/21(금)</li>
									<li class="data_txt01">2021년도 소상공인 자영업자를 위한 생활혁신형 기술개발사업’BM개발과제(1단계 BM기획)</li>
									<li class="btn_del"><a href="#" class="btnNoticeDelete">삭제</a></li>
								</ul>
								
								<ul>
									<li class="al_time">30분전</li>
									<li class="tit">분과구성 등록_BM개발과제 1단계</li>
									<li class="data_txt01">2021년도 소상공인 자영업자를 위한 생활혁신형 기술개발사업’BM개발과제(1단계 BM기획)</li>
									<li class="data_txt02">평가장 본사 502호</li>
									<li class="btn_del"><a href="#" class="btnNoticeDelete">삭제</a></li>
								</ul>
								
								<ul>
									<li class="al_time">1일전</li>
									<li class="tit">분과구성 등록_BM개발과제 1단계</li>
									<li class="data_txt01">2021년도 소상공인 자영업자를 위한 생활혁신형 기술개발사업’BM개발과제(1단계 BM기획) 2021년도 소상공인 자영업자를 위한 생활혁신형 기술개발사업’BM개발과제(1단계 BM기획)</li>
									<li class="data_txt02">평가장 본사 502호</li>
									<li class="btn_del"><a href="#" class="btnNoticeDelete">삭제</a></li>
								</ul>
								
								<ul>
									<li class="al_time">3일전</li>
									<li class="tit">분과구성 등록_BM개발과제 1단계</li>
									<li class="data_txt01">2021년도 소상공인 자영업자를 위한 생활혁신형 기술개발사업’BM개발과제(1단계 BM기획)</li>
									<li class="data_txt02">평가장 본사 502호</li>
									<li class="btn_del"><a href="#" class="btnNoticeDelete">삭제</a></li>
								</ul>
								
								<ul>
									<li class="al_time">30분전</li>
									<li class="tit">분과구성 등록_BM개발과제 1단계</li>
									<li class="data_txt01">2021년도 소상공인 자영업자를 위한 생활혁신형 기술개발사업’BM개발과제(1단계 BM기획)</li>
									<li class="data_txt02">평가장 본사 502호</li>
									<li class="btn_del"><a href="#" class="btnNoticeDelete">삭제</a></li>
								</ul>
								
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
</body>
</html>
