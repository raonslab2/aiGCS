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
				<h3>Schedule</h3>
                 <c:import url="/EmpPageLink.do?link=main/include/top" />  
			</div>
			<!-- 화면 상단 종료 -->
			
			<!-- s :contents_guide -->
			<div class="contents_guide">
				<div class="schedule_guide">
				
					<div class="schedule_all2">
						<div class="schedule_top">
							<ul class="sc_title">
							     <input type="hidden" name="setday" id="setday"/>
								<li><button type="button" class="prev" onclick="mMonth('-1')">이전</button></li> 
								<li><strong><span id="mMonth" name="mMonth" ></span> <span id="mMonth2" name="mMonth2" ></span>, <span id="mYear" name="mYear" ></span></strong></li>
								<li><a class="now">현재날짜로 돌아가기</a></li>
								<li><button type="button" class="next" onclick="mMonth('1')">다음</button></li>
							</ul>
							<ul class="view_btn">
								<li><a href="<c:url value='/'/>empo/schedule/eMAU00B01Main.do" >YEAR</a></li>
								<li><a href="<c:url value='/'/>empo/schedule/eMAU00B02Main.do">MONTH</a></li>
								<li><a href="<c:url value='/'/>empo/schedule/eMAU00B03Main.do" class="active">WEEK</a></li>
								<li><a href="<c:url value='/'/>empo/schedule/eMAU00B04Main.do">과제(상세)</a></li>
							</ul> 
	 
							
							<!-- <p class="sc_sel" >
								<strong class="listSearchDate">2021.01.01 ~ 2021.01.01</strong>
								<li style="margin-top:3px;margin-left:5px;"><button type="button" class="btn_style06 btn_prev01" id="btnListDatePrev">이전</button></li>
								<li style="margin-top:3px;"><button type="button" class="btn_style06 btn_next01" id="btnListDateNext">다음</button></li> 
								<strong class="listNextDate">2021.01.01</strong>
							</p>  -->
							
							
						</div>
				<!-- s :calender_guide -->
				<div class="calender_guide2">  
					<div class="tit_date">
						<!-- <span>검색기간</span>  -->
						<strong class="listSearchDate"></strong>
						<button type="button" class="btn_style06 btn_prev01" id="btnListDatePrev">이전</button>
						<button type="button" class="btn_style06 btn_next01" id="btnListDateNext">다음</button> 
						<strong class="listNextDate"></strong>
					</div>

					<div class="bbs_calender01">
						<div class="calender_top">
							<div>시간</div>
							<ul class="day_tit">
								<!-- <li><span>Sun</span>6/20</li>
								<li><span>Mon</span>6/21</li>
								<li><span>Tue</span>6/22</li>
								<li><span>Wed</span>6/23</li>	
								<li><span>Thu</span>6/24</li>	
								<li><span>Fri</span>6/25</li>	
								<li><span>Sat</span>6/26</li>	-->
							</ul>
						</div>
						<!-- e :calender_top -->
						
						<div class="calender_all">
							<div class="calender_list">
								<div class="time_view">
									<span>09:00 AM ~ </span> <br> 
									<span>18:00 PM</span>
								</div>
								<ul class="day_all 8">
									<!-- <li class="noData">
										&nbsp;
									</li>
									<li class="noData">
										&nbsp;
									</li>
									<li class="noData">
										&nbsp;
									</li>
									<li class="noData">
										&nbsp;
									</li>
									<li class="noData">
										&nbsp;
									</li>
									<li class="noData">
										&nbsp;
									</li>
									<li class="noData">
										&nbsp;
									</li> -->
								</ul>
							</div>
							<!-- e :calender_list -->
							<div class="calender_list">
								<div class="time_view">
									<span>09:00 AM</span> 
								</div>
								<ul class="day_all 9">
									<!-- <li class="noData">
										&nbsp;
									</li>
									<li class="noData">
										&nbsp;
									</li>
									<li class="noData">
										&nbsp;
									</li>
									<li class="noData">
										&nbsp;
									</li>
									<li class="noData">
										&nbsp;
									</li>
									<li class="noData">
										&nbsp;
									</li>
									<li class="noData">
										&nbsp;
									</li> -->
								</ul>
							</div>
							<div class="calender_list">
								<div class="time_view">
									<span>10:00 AM</span> 
								</div>
								<ul class="day_all 10">
									<!-- <li>
										&nbsp;
									</li>
									<li>
										&nbsp;
									</li>
									<li>
										&nbsp;
									</li>
									<li>
										&nbsp;
									</li>
									<li>
										&nbsp;
									</li>
									<li>
										&nbsp;
									</li>
									<li>
										&nbsp;
									</li> -->
								</ul>
							</div>
							<!-- e :calender_list -->
							
							<!-- e :calender_list -->
							<div class="calender_list">
								<div class="time_view">
									<span>11:00 AM</span> 
								</div>
								<ul class="day_all 11">
									<!-- <li>
										&nbsp;
									</li>
									<li>
										<ul class="data_list03">
											<li>09:00 평가장 본사 503호</li>
											<li>09:00 평가장 본사 503호</li>
											<li>09:00 평가장 본사 503호</li>
											<li>외 가능2, 대기2, 불가능2</li>
										</ul>
									</li>
									<li>
										<ul class="data_list03">
											<li>09:00 평가장 본사 503호</li>
											<li>09:00 평가장 본사 503호</li>
											<li>09:00 평가장 본사 503호</li>
											<li>외 가능2, 대기2, 불가능2</li>
										</ul>
									</li>
									<li>
										<ul class="data_list03">
											<li>09:00 평가장 본사 503호</li>
											<li>09:00 평가장 본사 503호</li>
											<li>09:00 평가장 본사 503호</li>
											<li>외 가능2, 대기2, 불가능2</li>
										</ul>
									</li>
									<li>
										<ul class="data_list03">
											<li>09:00 평가장 본사 503호</li>
											<li>09:00 평가장 본사 503호</li>
											<li>09:00 평가장 본사 503호</li>
											<li>외 가능2, 대기2, 불가능2</li>
										</ul>
									</li>
									<li>
										<ul class="data_list03">
											<li>09:00 평가장 본사 503호</li>
											<li>09:00 평가장 본사 503호</li>
											<li>09:00 평가장 본사 503호</li>
											<li>외 가능2, 대기2, 불가능2</li>
										</ul>
									</li>
									<li>
										<ul class="data_list03">
											<li>09:00 평가장 본사 503호</li>
											<li>09:00 평가장 본사 503호</li>
											<li>09:00 평가장 본사 503호</li>
											<li>외 가능2, 대기2, 불가능2</li>
										</ul>
									</li> -->
								</ul>
							</div>
							<!-- e :calender_list -->
							
							<!-- e :calender_list -->
							<div class="calender_list">
								<div class="time_view">
									<span>12:00 AM</span> 
								</div>
								<ul class="day_all 12">
									<!-- <li>
										&nbsp;
									</li>
									<li>
										<ul class="data_list03">
											<li>09:00 평가장 본사 503호</li>
											<li>09:00 평가장 본사 503호</li>
											<li>09:00 평가장 본사 503호</li>
											<li>외 가능2, 대기2, 불가능2</li>
										</ul>
									</li>
									<li>
										<ul class="data_list03">
											<li>09:00 평가장 본사 503호</li>
											<li>09:00 평가장 본사 503호</li>
											<li>09:00 평가장 본사 503호</li>
											<li>외 가능2, 대기2, 불가능2</li>
										</ul>
									</li>
									<li>
										<ul class="data_list03">
											<li>09:00 평가장 본사 503호</li>
											<li>09:00 평가장 본사 503호</li>
											<li>09:00 평가장 본사 503호</li>
											<li>외 가능2, 대기2, 불가능2</li>
										</ul>
									</li>
									<li>
										<ul class="data_list03">
											<li>09:00 평가장 본사 503호</li>
											<li>09:00 평가장 본사 503호</li>
											<li>09:00 평가장 본사 503호</li>
											<li>외 가능2, 대기2, 불가능2</li>
										</ul>
									</li>
									<li>
										<ul class="data_list03">
											<li>09:00 평가장 본사 503호</li>
											<li>09:00 평가장 본사 503호</li>
											<li>09:00 평가장 본사 503호</li>
											<li>외 가능2, 대기2, 불가능2</li>
										</ul>
									</li>
									<li>
										<ul class="data_list03">
											<li>09:00 평가장 본사 503호</li>
											<li>09:00 평가장 본사 503호</li>
											<li>09:00 평가장 본사 503호</li>
											<li>외 가능2, 대기2, 불가능2</li>
										</ul>
									</li> -->
								</ul>
							</div>
							<!-- e :calender_list -->
							
							<!-- e :calender_list -->
							<div class="calender_list">
								<div class="time_view">
									<span>13:00 PM</span> 
								</div>
								<ul class="day_all 13">
								<!-- 	<li>
										&nbsp;
									</li>
									<li>
										<ul class="data_list03">
											<li>09:00 평가장 본사 503호</li>
											<li>09:00 평가장 본사 503호</li>
											<li>09:00 평가장 본사 503호</li>
											<li>외 가능2, 대기2, 불가능2</li>
										</ul>
									</li>
									<li>
										<ul class="data_list03">
											<li>09:00 평가장 본사 503호</li>
											<li>09:00 평가장 본사 503호</li>
											<li>09:00 평가장 본사 503호</li>
											<li>외 가능2, 대기2, 불가능2</li>
										</ul>
									</li>
									<li>
										<ul class="data_list03">
											<li>09:00 평가장 본사 503호</li>
											<li>09:00 평가장 본사 503호</li>
											<li>09:00 평가장 본사 503호</li>
											<li>외 가능2, 대기2, 불가능2</li>
										</ul>
									</li>
									<li>
										<ul class="data_list03">
											<li>09:00 평가장 본사 503호</li>
											<li>09:00 평가장 본사 503호</li>
											<li>09:00 평가장 본사 503호</li>
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
									</li> -->
								</ul>
							</div>
							<!-- e :calender_list -->
							
							<!-- e :calender_list -->
							<div class="calender_list">
								<div class="time_view">
									<span>14:00 PM</span> 
								</div>
								<ul class="day_all 14">
								<!-- 	<li>
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
									</li> -->
								</ul>
							</div>
							<!-- e :calender_list -->
							
							<!-- e :calender_list -->
							<div class="calender_list">
								<div class="time_view">
									<span>15:00 PM</span> 
								</div>
								<ul class="day_all 15">
									<!-- <li>
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
									</li> -->
								</ul>
							</div>
							<!-- e :calender_list -->
							
							<!-- e :calender_list -->
							<div class="calender_list">
								<div class="time_view">
									<span>16:00 PM</span> 
								</div>
								<ul class="day_all 16">
									<!-- <li>
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
									</li> -->
								</ul>
							</div>
							<!-- e :calender_list -->	
							
							<!-- e :calender_list -->
							<div class="calender_list">
								<div class="time_view">
									<span>17:00 PM</span> 
								</div>
								<ul class="day_all 17">
									<!-- <li>
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
									</li> -->
								</ul>
							</div>
							<!-- e :calender_list -->			
							
						</div>
						<!-- e :calender_all -->
					</div>
					<!-- e :bbs_calender01 -->
				
				</div>
				<!-- e :calender_guide -->
				 <div id="popDateInput" class="Layer_popup">
                    <p class="left01"></p><!-- 왼쪽 말풍선인경우 class="left01" 변경 -->
					<div class="btn_guide ac">
						<button type="button" class="btn_style05 btn_red btnPopDateInputSave" style="margin-top: 30px; margin-left: 10px;">일정등록</button>
					</div>
                </div>
						
					</div>
					<!-- e :schedule_all -->
				
			 
					
					
				</div>
				<!-- e :schedule_guide -->
					
				<!-- s: 프로세스 현황 팝업 --> 
				<c:import url="/EmpPageLink.do?link=main/schedule/schedule0301Page" />
                <!-- e :popup -->

				<form id="popupForm">
					<input type="hidden" name="clickDate" id="clickDate" value="" />
					<input type="hidden" name="clickTime" id="clickTime" value="" />
					<input type="hidden" name="clickDay" id="clickDay" value="" />
					<input type="hidden" name="noPk" id="noPk" value="" />
					<input type="hidden" name="noText" id="noText" value="" />
					<input type="hidden" name="noTitle" id="noTitle" value="" />
					<input type="hidden" name="noEtc" id="noEtc" value="" />
					<input type="hidden" name="scheduleMode" id="scheduleMode" value="week" />
					<input type="hidden" name="mode" id="mode" value="" />
				</form>
				
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
<script type="text/javascript">
;(function() {
	$("#btnListDatePrev").click(function() {
		$('.day1').css('background-color', '');
		$("#popDateInput").css("display","none");
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

		var endDate = yy1 + '/' + mm1  + '/' + dd1;
		var startDate = yy2 + '/' + mm2  + '/' + dd2;
		
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
		
		$('.day_tit').children().remove();
		$('.scheduleLi').remove();
		while(weekStartDate.getTime() <= weekEndDate.getTime()) {
			var mon = (weekStartDate.getMonth()+1);
  			mon = mon < 10 ? '0'+mon : mon;
  			var day = weekStartDate.getDate();
  			day = day < 10 ? '0'+day : day;
			
  			var week = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];
			
			var searchDateStartDay = week[new Date(weekStartDate).getDay()];
			console.log(searchDateStartDay);
			
			$('.day_tit').append($("<li class='day1' style='padding-bottom: 0px;'><strong class='day2' data-click_day='" + weekStartDate.getFullYear() + "/" + mon + "/" + day + "'>" + searchDateStartDay + "<br/>" + mon + "/" + day + "</strong></li>"));
			$('.day2').css('cursor', 'pointer');
			
			var defaultData = { "day" : day }
			for (var i=8; i<18; i++) {
				if (i == 8) {
					defaultData.time = "all";	
				} else if (i == 9) {
					defaultData.time = "0" + i;
				} else {
					defaultData.time = i;
				}
				
				console.log(defaultData);
				$('.'+i).append(defaultView(defaultData));
			}
  			weekStartDate.setDate(weekStartDate.getDate() + 1);
  			
		}  
		
		var allHtml = "";
		var hourHtml = "";
		$.post('/empo/schedule/scheduleWeekList.do', { "searchDate1" : startDate, "searchDate2" : endDate} ).done(function(res) {
        	console.log(res.list);
        	res.list.forEach(function(row, index) {
        		var dataDate = new Date(row.noInDay);
        		
        		var dd1 = ('0' + dataDate.getDate()).slice(-2);
        		console.log(dd1);
        		var hours = ('0' + dataDate.getHours()).slice(-2);
        		var minutes = ('0' + dataDate.getMinutes()).slice(-2);
        		
        		var rowTitle = "";
				if (row.noTitle.length > 12 ) {
					rowTitle = row.noTitle.substring(0, 11) + "...";
				} else {
					rowTitle = row.noTitle;
				}
				
				allHtml = $('#'+dd1+"all").html();
				hourHtml = $('#'+dd1+hours).html(); 
				var dataRow = "<li><a class='scheduleDetail no" + row.noPk + "' data-no_pk='" + row.noPk + "'>" + hours + ":" + minutes + " " + rowTitle + "</a></li>"
				
        		$('#'+dd1+"all").html(allHtml + dataRow);
        		$('#'+dd1+hours).html(hourHtml + dataRow);
        	});
        });
		
		var prevPeriod = startDate + " ~ " + endDate;

		$(".listSearchDate").text(prevPeriod);
		$(".listNextDate").text(listSearchDate);
	});
	
	// 목록 날짜 다음 버튼
	$("#btnListDateNext").click(function() {
		$('.day1').css('background-color', '');
		$("#popDateInput").css("display","none");
		var listSearchDate = $(".listSearchDate").text();
		var listNextDate = $(".listNextDate").text();
		
		var prevDate = listNextDate.substring(0,10);
		console.log(prevDate);
		
		var nextDate = listNextDate.substring(13,23);
		console.log(nextDate);
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

		var startDate = yy1 + '/' + mm1  + '/' + dd1;
		var endDate = yy2 + '/' + mm2  + '/' + dd2;
		
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
		
		$('.day_tit').children().remove();
		$('.scheduleLi').remove();
		while(weekStartDate.getTime() <= weekEndDate.getTime()) {
			
			var mon = (weekStartDate.getMonth()+1);
  			mon = mon < 10 ? '0'+mon : mon;
  			var day = weekStartDate.getDate();
  			day = day < 10 ? '0'+day : day;
  			
			var week = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];
			
			var searchDateStartDay = week[new Date(weekStartDate).getDay()];
			console.log(searchDateStartDay);
			$('.day_tit').append($("<li class='day1' style='padding-bottom: 0px;'><strong class='day2' data-click_day='" + weekStartDate.getFullYear() + "/" + mon + "/" + day + "'>" + searchDateStartDay + "<br/>" + mon + "/" + day + "</strong></li>"));
			$('.day2').css('cursor', 'pointer');
			
			var defaultData = { "day" : day }
			for (var i=8; i<18; i++) {
				if (i == 8) {
					defaultData.time = "all";	
				} else if (i == 9) {
					defaultData.time = "0" + i;
				} else {
					defaultData.time = i;
				}
				
				console.log(defaultData);
				$('.'+i).append(defaultView(defaultData));
			}
  			weekStartDate.setDate(weekStartDate.getDate() + 1);
  			
		}  
		
		var allHtml = "";
		var hourHtml = "";
		$.post('/empo/schedule/scheduleWeekList.do', { "searchDate1" : prevDate, "searchDate2" : nextDate} ).done(function(res) {
        	console.log(res.list);
        	res.list.forEach(function(row, index) {
        		var dataDate = new Date(row.noInDay);
        		
        		var dd1 = ('0' + dataDate.getDate()).slice(-2);
        		console.log(dd1);
        		var hours = ('0' + dataDate.getHours()).slice(-2);
        		var minutes = ('0' + dataDate.getMinutes()).slice(-2);
        		
        		var rowTitle = "";
				if (row.noTitle.length > 12 ) {
					rowTitle = row.noTitle.substring(0, 11) + "...";
				} else {
					rowTitle = row.noTitle;
				}
				
				allHtml = $('#'+dd1+"all").html();
				hourHtml = $('#'+dd1+hours).html(); 
				var dataRow = "<li><a class='scheduleDetail no" + row.noPk + "' data-no_pk='" + row.noPk + "'>" + hours + ":" + minutes + " " + rowTitle + "</a></li>"
				
        		$('#'+dd1+"all").html(allHtml + dataRow);
        		$('#'+dd1+hours).html(hourHtml + dataRow);
        	});
        });
		
		var nextPeriod = startDate + " ~ " + endDate;
		$(".listSearchDate").text(listNextDate);
		$(".listNextDate").text(nextPeriod);
	});
	
	var clickDay;
	$(document).on('mouseenter', '.day2', function(e) {
		clickDay = $(this).data('click_day');
		console.log(clickDay);
		$('.day1').css('background-color', '');
		$(this).parent().css('background-color', 'pink');
		var divTop = $(this).children().offset().top - 30; // 상단 좌표 위치 안맞을시 e.pageY 
		var divLeft =  $(this).children().offset().left+30; // 좌측 좌표 위치 안맞을시 e.pageX
		
		//console.log(e.target)
		/* console.log(e.relatedTarget);
		console.log(e.toElement); */
		$("#popDateInput").css("top",divTop);
		$("#popDateInput").css("left",divLeft);
		$("#popDateInput").css("display","block");
		
	});
	
	$(document).on('mouseout', '.bbs_calender01', function(e) {
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
			var dataDay = day1.getFullYear() + '/' + mon + '/' +  day
			var dataTime = hours + ":" + minutes
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
	
	$('.now').click(function() {
		$('.day_tit').children().remove();
		$('.scheduleLi').remove();
		initList();
	});
	
	$(function() {
		//주간 날짜 구하기	
		getWeek();
		initList();
	  
		
	});
	
	var defaultView = function(row) {
		var data = "";
			data = "<li class='scheduleLi'><ul class='data_list03' id='" + row.day + row.time + "'></ul></li>"
		return $(data);
		
	}
	
	var initList = function() {
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
		searchDate1 = yy + '/' + mm  + '/' + dd;

		var yy = weekEndDate.getFullYear();
		var mm = ('0' + (weekEndDate.getMonth() + 1)).slice(-2);
		var dd = ('0' + weekEndDate.getDate()).slice(-2);
		searchDate2 = yy + '/' + mm  + '/' + dd;
		$('.listSearchDate').text(searchDate1 + " ~ " + searchDate2);
		
		while(weekStartDate.getTime() <= weekEndDate.getTime()) {
			var mon = (weekStartDate.getMonth()+1);
  			mon = mon < 10 ? '0'+mon : mon;
  			var day = weekStartDate.getDate();
  			day = day < 10 ? '0'+day : day;
  			
  			var week = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];
			
			var searchDateStartDay = week[new Date(weekStartDate).getDay()];
			console.log(searchDateStartDay);
			$('.day_tit').append($("<li class='day1' style='padding-bottom: 0px;'><strong class='day2' data-click_day='" + weekStartDate.getFullYear() + "/" + mon + "/" + day + "'>" + searchDateStartDay + "<br/>" + mon + "/" + day + "</strong></li>"));
			$('.day2').css('cursor', 'pointer');
			
			var defaultData = { "day" : day }
			for (var i=8; i<18; i++) {
				if (i == 8) {
					defaultData.time = "all";	
				} else if (i == 9) {
					defaultData.time = "0" + i;
				} else {
					defaultData.time = i;
				}
				
				console.log(defaultData);
				$('.'+i).append(defaultView(defaultData));
			}
  			weekStartDate.setDate(weekStartDate.getDate() + 1);
  			
		} 
		console.log(searchDate1);
		console.log(searchDate2);
		
		var allHtml = "";
		var hourHtml = "";
		$.post('/empo/schedule/scheduleWeekList.do', { "searchDate1" : searchDate1, "searchDate2" : searchDate2} ).done(function(res) {
        	console.log(res.list);
        	res.list.forEach(function(row, index) {
        		var dataDate = new Date(row.noInDay);
        		
        		var dd1 = ('0' + dataDate.getDate()).slice(-2);
        		console.log(dd1);
        		var hours = ('0' + dataDate.getHours()).slice(-2);
        		var minutes = ('0' + dataDate.getMinutes()).slice(-2);
        		
        		var rowTitle = "";
				if (row.noTitle.length > 12 ) {
					rowTitle = row.noTitle.substring(0, 11) + "...";
				} else {
					rowTitle = row.noTitle;
				}
				
				allHtml = $('#'+dd1+"all").html();
				hourHtml = $('#'+dd1+hours).html(); 
				var dataRow = "<li><a class='scheduleDetail no" + row.noPk + "' data-no_pk='" + row.noPk + "'>" + hours + ":" + minutes + " " + rowTitle + "</a></li>"
				
        		$('#'+dd1+"all").html(allHtml + dataRow);
        		$('#'+dd1+hours).html(hourHtml + dataRow);
        	});
        });
		
		var yy = weekEndDate.getFullYear();
		var mm = ('0' + (weekEndDate.getMonth() + 1)).slice(-2);
		var dd = ('0' + (weekEndDate.getDate() + 1)).slice(-2);
		searchDate1 = yy + '/' + mm  + '/' + dd;
		
		var d = new Date(weekEndDate.setDate(weekEndDate.getDate() + 6));
		var yy = d.getFullYear();
		var mm = ('0' + (d.getMonth() + 1)).slice(-2);
		var dd = ('0' + (d.getDate() + 1)).slice(-2);
		searchDate2 = yy + '/' + mm  + '/' + dd; 
		
		$('.listNextDate').text(searchDate1 + " ~ " + searchDate2); 
		$('.now').css('cursor', 'pointer');
        
		//processList();

		/* // 프로세스 현황 팝업 오픈
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
		}); */
	}
	
	function mMonth(tmp) { 
        //주간 세팅
        getWeek(tmp);
        selectList();
	}
	
	function getWeek(tmDay){ 
     	
    	//var currentDay = new Date(); 
    	var setDay =  $( '#setday' ).val();
    	if(setDay ==""){
    		var now = new Date();	// 현재 날짜 및 시간
    		var year = now.getFullYear();	// 연도
    		var month = now.getMonth()+1;	// 월
    		var day = now.getDate();
    		setDay = year+"/"+month+"/"+day;
    		$( '#setday' ).val(setDay);
    	}
    	
 
    	var loadDt = new Date(setDay);
    	
    	var currentDay = new Date(setDay);
    	
    	if(tmDay == -1){
    		currentDay = new Date(Date.parse(loadDt) - 7 * 1000 * 60 * 60 * 24); //일주일전
    	}else if(tmDay == 1){
    		currentDay = new Date(Date.parse(loadDt) + 7 * 1000 * 60 * 60 * 24); //일주일후
    	} 
    	 
    	
    	var theYear = currentDay.getFullYear();
    	var theMonth = currentDay.getMonth();
    	var theDate  = currentDay.getDate();
    	var theDayOfWeek = currentDay.getDay();
    	
    	//날짜
    	$( '#setday' ).val(theYear+"-"+(theMonth+1)+"-"+theDate);
    	
		var m = theMonth+1;	// 현재월 숫자 변환
		
		var myArray = {1: "JAN", 2: "FEB", 3: "MAR", 4: "APR", 5: "MAY", 6: "JUN", 7: "JUL", 8: "AUG", 9: "SEP", 10: "OCT", 11: "NOV", 12: "DEC"  };
        var monthData = myArray[m]; 
        $( '#mYear' ).text( theYear)
        $('#mMonth').text(monthData);
      
        
        var tmMonth = ""; 
        if((theMonth+1)<10){
        	tmMonth = "0"+(theMonth+1)
        }else{
        	tmMonth = theMonth+1
        }
        $('#mMonth2').text(tmMonth); 
     
    	var thisWeek = [];
    	 
    	 $('.setweek').remove();
    	for(var i=0; i<7; i++) {
    	  var resultDay = new Date(theYear, theMonth, theDate + (i - theDayOfWeek));
    	  var yyyy = resultDay.getFullYear();
    	  var mm = Number(resultDay.getMonth()) + 1;
    	  var dd = resultDay.getDate();
    	 
    	  mm = String(mm).length === 1 ? '0' + mm : mm;
    	  dd = String(dd).length === 1 ? '0' + dd : dd;
    	 
    	  thisWeek[i] = yyyy + '-' + mm + '-' + dd;
    	    
    	  var tmWeek = "";
    	  if(i == 0){
    		  tmWeek = "Sun"; 
    	  }else if(i == 1){
    		  tmWeek = "Mon"; 
    	  }else if(i == 2){
    		  tmWeek = "Tue"; 
    	  }else if(i == 3){
    		  tmWeek = "Wed"; 
    	  }else if(i == 4){
    		  tmWeek = "Thu"; 
    	  }else if(i == 5){
    		  tmWeek = "Fri"; 
    	  }else if(i == 6){
    		  tmWeek = "Sat"; 
    	  }
    	   
    	  $('#day_tit').append("<li class='setweek'>"+tmWeek+"<span>"+mm+"/"+dd+"</span></li>");
    	} 
    	
    }
	
})();
	
	
	
 
	
    
	 
    function selectList() {  
    	
    }

    
    
	/* // 주 이전, 다음 버튼
	function fnWeekChange(startDate) {
		window.location.href = "schedule_003.jsp?startDate="+startDate;
	} */

	/* $(document).on('click', 'input[name="processRow"]', function() {
		var code = $(this).data('pc_code');
		$(".sc_project > ul > li > div").css("display","none");
		$(".sc_project > ul > li."+code+" > div").css("display","");
	});
	
	var processListView = function(row) {
		console.log(row)
		var data ;
		
		if (row.pcPCode == 0) {
			data = '<li><a name="processRow" data-pc_code=' + row.pcCode + ' href="#">' + row.pcName + '</a><li>' ;	
		} else {
			data = '<li><a name="processRow" data-pc_code=' + row.pcCode + ' href="#">' + row.pcName + '</a></li>' ;
		}
			
		return $(data);
	}
	
	var getTree = function(process) {
		process.forEach(function(row) {
			row.subs = [];
		    if (row.pcPCode != "0") {
		    	var parentRow = process.find(obj => obj.pcCode == row.pcPCode);
		    	parentRow.subs.push(row);
		    }
		});
		return process.filter(obj => obj.pcPCode == '0');
	}
	
	var addSubs = function(parentDiv, subs) {
		var ul = $("<ul>");
		if( parentDiv.hasClass('processTree') ) {
			ul.addClass("process_list")
            ul.attr('id', 'processList');
        }
		
		subs.forEach( function(row) {
			if (row.pcPCode != 0) {
				ul.css('display', 'none');
			}
			if(row.subs.length > 0) {
				row.subLength = row.subs.length;	
			}
			
            var li = processListView(row);
            ul.append(li);
            if ( row.subs.length > 0 ) {
                addSubs( li, row.subs );
            }
        });
		
		parentDiv.append(ul);
	}
	
	var processList = function() {
		$("#mCSB_2_container").addClass('processTree');
		
		$.post('/empo/process/eMAU00D02ProcessList.do').done(function(res) {
			console.log(res.list);
			var subs = getTree(res.list);
			addSubs( $('.processTree'), subs );
			
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
			
		}).fail(function() {
			alert("실패");
		});
		
	} */
</script>
</html>
