<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="java.util.Calendar"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%

	String newDate = request.getParameter("newDate");

	SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");	
	Calendar calendar = Calendar.getInstance();	
	String toDate = sf.format(calendar.getTime());	// 오늘
	int intHour = calendar.get(Calendar.HOUR_OF_DAY);	// 현재시간
	
	// 선택한 날짜가 없으면 스케줄 표시하는 주의 시작일자 구하기
	if ("".equals(newDate)) {	
		newDate = toDate;
	};


	String toDay = newDate.substring(8,10);	// 현재일
	String toMonth = newDate.substring(5,7);	// 현재월

	String strEngMonth = "";
	switch(toMonth) {
		case "01": 
			strEngMonth= "January";
			break;
		case "02": 
			strEngMonth= "February";
			break;
		case "03": 
			strEngMonth= "March";
			break;
		case "04": 
			strEngMonth= "April";
			break;
		case "05": 
			strEngMonth= "May";
			break;
		case "06": 
			strEngMonth= "June";
			break;
		case "07": 
			strEngMonth= "July";
			break;
		case "08": 
			strEngMonth= "August";
			break;
		case "09": 
			strEngMonth= "September";
			break;
		case "10": 
			strEngMonth= "October";
			break;
		case "11": 
			strEngMonth= "November";
			break;
		case "12": 
			strEngMonth= "December";
			break;
	};


	Date date = sf.parse(newDate);
	calendar.setTime(date);
	int intTodayWeek = calendar.get(Calendar.DAY_OF_WEEK); 
	String strKorWeek = "";
	String strEngWeek = "";
	switch(intTodayWeek) {
		case 1: 
			strKorWeek= "일";
			strEngWeek= "Sunday";
			break;
		case 2: 
			strKorWeek= "월"; 
			strEngWeek= "Monday";
			break;
		case 3: 
			strKorWeek= "화"; 
			strEngWeek= "Tuesday";
			break;
		case 4: 
			strKorWeek= "수"; 
			strEngWeek= "Wednesday";
			break;
		case 5: 
			strKorWeek= "목"; 
			strEngWeek= "Thursday";
			break;
		case 6: 
			strKorWeek= "금"; 
			strEngWeek= "Friday";
			break;
		case 7: 
			strKorWeek= "토"; 
			strEngWeek= "Saturday";
			break;
	};
	
	// 어제일자
	calendar.setTime(date);
	calendar.add(Calendar.DATE , -1);
	String strPrevDate = sf.format(calendar.getTime());
	
	// 내일일자
	calendar.setTime(date);
	calendar.add(Calendar.DATE , 1);
	String strNextDate = sf.format(calendar.getTime());

	// 이번주 시작일자
	calendar.setTime(date);
	calendar.add(Calendar.DATE , (intTodayWeek-1)*(-1));
	String strStartDate = sf.format(calendar.getTime());
	
	
%>

<script type="text/javascript">
	$(document).ready(function() {		
		// 팝업 스크롤바를 정의
		$(".scroll").mCustomScrollbar({
			scrollbarPosition : "outside"
			//theme:"dark"
		});
	});
</script>

<ul class="sc_title"> 
	<li><button type="button" class="prev" onclick="fnScheduleDateChange('<%=strPrevDate%>');">이전</button></li>
	<li><strong><%=strEngMonth%>, <%=toDay%> <%=strEngWeek%></strong></li>
	<li><a href="#" class="now" onclick="fnScheduleDateChange('<%=toDate%>');">현재날짜로 돌아가기</a></li>
	<li><button type="button" class="next" onclick="fnScheduleDateChange('<%=strNextDate%>');">다음</button></li>
</ul>

<div class="sc_week2_guide">
	<ul class="week2_tit">
		<li>Sun</li>
		<li>Mon</li>
		<li>Tue</li>
		<li>Wed</li>
		<li>Thu</li>
		<li>Fri</li>
		<li>Sat</li>
	</ul>

	<div class="week2_day">
		<%							
		
			Date startDate = sf.parse(strStartDate);

			for (int i=0; i < 14; i++) {
				calendar.setTime(startDate);
				calendar.add(Calendar.DATE , i);
				String dd = sf.format(calendar.getTime());
				dd = dd.substring(8,10);
				
				if (i == 0) {
					%><ul><%
				}
				else if (i == 7) {
					%>
						</ul>
						<ul>
					<%
				}

					
				//==== class 설명 =====
				//1. today : 오늘 날짜 표시 class
				//2. sc_yes : 해당 날짜에 일정 데이터가 있는 경우 class

				String strClassLi = "";	// li에 추가할 class
				String strClassDiv = "";	// div에 추가할 class								

				// 오늘날짜 표시 class
				if (dd.equals(toDay)) {
					strClassLi = strClassLi + " today";
				}

				// 하루 일정이 있으면 표시
				if (i == 3 || i == 5) {
					strClassLi = strClassLi + " sc_yes";
				}

				// 기간일정이 있으면 기간의 시작일자를 표시하는 class
				if (i == 9) {
					strClassLi = strClassLi + " dot_inform sc_yes";
					strClassDiv = strClassDiv + " sc_start";
				}											
				
				// 기간일정의 가운데 일자를 표시하는 class
				if (i == 10) {
					strClassDiv = strClassDiv + " sc_middle";
				}											

				// 기간일정의 종료일자를 표시하는 class
				if (i == 11) {
					strClassLi = strClassLi + " dot_inform";
					strClassDiv = strClassDiv + " sc_end";
				}

		%>		
				<li class="<%=strClassLi%>" onclick="fnScheduleDateClick();"><div class="<%=strClassDiv%>"><span><%=dd%></span></div></li>
		<%
		
				if (i == 13) {
					%></ul><%
				}
			}
		%>

	</div>
	<!-- e :week2_day -->

	<div class="day_time scroll sbox_h300">

		<%
			for (int i=9; i <= 18; i++) {
				String hh = Integer.toString(i);
				if (hh.length() < 2) hh = "0" + hh;

				String strViewTime1 = hh + ":00";
				String strViewTime2 = hh + ":30";				

				String strTimeDiv = "";
				if (i < 12) {
					strTimeDiv = " AM";
				} else {
					strTimeDiv = " PM";
				}
				
		%>
			<ul>
				<li><%=strViewTime1%></li> <!-- 시간 보여주기 -->
				<li>
					<!-- 일정이 있는 경우 -->
					<% if (i % 2 == 0 && Integer.parseInt(toDay) % 2 == 0) { // 샘플로 작업한 내용입니다. %>
					<div class="time_txt" onclick="fnScheduleDateClick();"> 
						접수마감처리
						<p><%=strViewTime1%> <%=strTimeDiv%> - <%=strViewTime2%> <%=strTimeDiv%></p>
					</div>
					<% } %>

					<% if (i % 2 == 1 && Integer.parseInt(toDay) % 2 == 1) { // 샘플로 작업한 내용입니다.  %>
					<div class="time_txt" onclick="fnScheduleDateClick();"> 
						최종보고서 제출일자 공고
						<p><%=strViewTime1%> <%=strTimeDiv%> - <%=strViewTime2%> <%=strTimeDiv%></p>
					</div>
					<% } %>
				</li>
			</ul>

			<ul>
				<li><%=strViewTime2%></li> <!-- 시간 보여주기 -->
				<li></li> <!-- 일정이 없는 경우 -->
			</ul>
		<%
			}
		%>
	</div>
	<!-- e :day_time -->
</div>