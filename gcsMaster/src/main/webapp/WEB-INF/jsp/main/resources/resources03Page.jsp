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
				<h3>가용자원</h3>

				<c:import url="/EmpPageLink.do?link=main/include/top" />  
			</div>
			<!-- 화면 상단 종료 -->
			
			<!-- s :contents_guide -->
			<div class="contents_guide">
				<div class="submenu_guide">
					<ul>
						<!-- 2차메뉴명 -->
						<li><a href="<c:url value='/empo/resources/eMAU00C01Main.do'/>">분과구성 현황</a></li>
						<li><a href="<c:url value='/empo/resources/eMAU00C02Main.do'/>">가용자원 조회(간사, 평가장)</a></li>
						<li><a href="<c:url value='/empo/resources/eMAU00C03Main.do'/>" class="active">가용자원 조회(평가장) 삭제예정</a></li>
					</ul>
				</div>
				
				<!-- 
				<div class="btn_guide ar mt-65 mb30">
					<button type="button" class="btn_style01 btn_blue" id="btnGoPlaceManage">평가장 관리</button>
				</div> 
				-->
				<!-- s :content_col2 -->
				<!-- <div class="content_col2">
					<div class="bbs_write01 w60">
						<ul>
                            <li><span>기간</span>
								<input type="text" class="inputCalendar" name="searchDate1" id="searchDate1">
								~
								 <input type="text" class="inputCalendar" name="searchDate2" id="searchDate2">
								
								<div class="period">
									<a href="#" class="active">오늘</a>
									<a href="#">7일</a>
									<a href="#">15일</a>
									<a href="#">1개월</a>
									<a href="#">3개월</a>
									<a href="#" class="active">전체</a>
								</div>
								
								
                            </li>
							
                        </ul>
					</div>
					e :bbs_write01
					
                    <div class="bbs_write01 w40">
                        <ul>
                            <li><span>구분</span>
                            	<ul class="data_box01">
									<li><label><input type="checkbox"> 본사</label></li>
									<li><label><input type="checkbox"> 분원1</label></li>
									<li><label><input type="checkbox"> 분원2</label></li>
									<li><label><input type="checkbox"> 외부</label></li>
								</ul>
                            </li>
                        </ul>
                    </div>
					e :bbs_write01
					
					<div class="btn_guide ac mb20 w100">
                        <button type="button" class="btn_style01 sb_style btn_red" id="searchResource" >조회하기</button>
                    </div>
					e :btn_guide
				</div> -->
				<!-- e :content_col2 -->
				
				<!-- s :calender_guide -->
				<div class="calender_guide">
					<div class="tit_date">
						<!-- <span>검색기간</span>  -->
						<strong class="listSearchDate"></strong>
						<button type="button" class="btn_style06 btn_prev01" id="btnListDatePrev">이전</button>
						<button type="button" class="btn_style06 btn_next01" id="btnListDateNext">다음</button> 
						<strong class="listNextDate"></strong>
					</div>
					<!-- e :tit_date -->
					
					<ul class="sort">
						<li><span class="dot possible">가능</span> 가능</li>
						<li><span class="dot impossible">불가능</span> 불가능</li>
					</ul>
					<!-- e :sort -->

					<div class="bbs_calender01">
						<div class="calender_top">
							<div>구분</div>
							<ul class="day_tit">
								<!-- <li><span>Sun</span>6/20</li>
								<li><span>Mon</span>6/21</li>
								<li><span>Tue</span>6/22</li>
								<li><span>Wed</span>6/23</li>	
								<li><span>Thu</span>6/24</li>	
								<li><span>Fri</span>6/25</li>	
								<li><span>Sat</span>6/26</li>	 -->
							</ul>
						</div>
						<!-- e :calender_top -->
						
						<div class="calender_all">
						<!--
							<div class="calender_list">
								<div><strong><span>본원</span></strong></div>
								<ul class="day_all">
									<li>
										&nbsp;
									</li>
									<li>
										<ul class="data_list03">
											<li><span class="dot possible">가능</span> 501</li>
											<li><span class="dot possible">가능</span> 502</li>
											<li><span class="dot impossible">불가능</span> 503</li>
											<li>외 가능2, 불가능2</li>
										</ul>
									</li>
									<li>
										<ul class="data_list03">
											<li><span class="dot possible">가능</span> 501</li>
											<li><span class="dot possible">가능</span> 502</li>
											<li><span class="dot impossible">불가능</span> 503</li>
											<li>외 가능2, 불가능2</li>
										</ul>
									</li>
									<li>
										<ul class="data_list03">
											<li><span class="dot possible">가능</span> 501</li>
											<li><span class="dot possible">가능</span> 502</li>
											<li><span class="dot impossible">불가능</span> 503</li>
											<li>외 가능2, 불가능2</li>
										</ul>
									</li>
									<li>
										<div class="text_possible">전체가능</div>
									</li>
									<li>
										<ul class="data_list03">
											<li><span class="dot possible">가능</span> 501</li>
											<li><span class="dot possible">가능</span> 502</li>
											<li><span class="dot impossible">불가능</span> 503</li>
											<li>외 가능2, 불가능2</li>
										</ul>
									</li>
									<li>
										&nbsp;
									</li>
								</ul>
							</div>
							<div class="calender_list">
								<div><strong><span>분원</span></strong></div>
								<ul class="day_all">
									<li>
										<ul class="data_list03">
											<li><span class="dot possible">가능</span> 501</li>
											<li><span class="dot possible">가능</span> 502</li>
											<li><span class="dot impossible">불가능</span> 503</li>
											<li>외 가능2, 불가능2</li>
										</ul>
									</li>
									<li>
										<div class="text_impossible">전체불가능</div>
									</li>
									<li>
										&nbsp;
									</li>
									<li>
										<ul class="data_list03">
											<li><span class="dot possible">가능</span> 501</li>
											<li><span class="dot possible">가능</span> 502</li>
											<li><span class="dot impossible">불가능</span> 503</li>
											<li>외 가능2, 불가능2</li>
										</ul>
									</li>
									<li>
										<ul class="data_list03">
											<li><span class="dot possible">가능</span> 501</li>
											<li><span class="dot possible">가능</span> 502</li>
											<li><span class="dot impossible">불가능</span> 503</li>
											<li>외 가능2, 불가능2</li>
										</ul>
									</li>
									<li>
										
									</li>
									<li>
										&nbsp;
									</li>
								</ul>
							</div>
							<div class="calender_list">
								<div><strong><span>외부</span></strong></div>
								<ul class="day_all">
									<li>
										&nbsp;
									</li>
									<li>
										<ul class="data_list03">
											<li><span class="dot possible">가능</span> 501</li>
											<li><span class="dot possible">가능</span> 502</li>
											<li><span class="dot impossible">불가능</span> 503</li>
											<li>외 가능2, 불가능2</li>
										</ul>
									</li>
									<li>
										<ul class="data_list03">
											<li><span class="dot possible">가능</span> 501</li>
											<li><span class="dot possible">가능</span> 502</li>
											<li><span class="dot impossible">불가능</span> 503</li>
											<li>외 가능2, 불가능2</li>
										</ul>
									</li>
									<li>
										&nbsp;
									</li>
									<li>
										<div class="text_impossible">전체불가능</div>
									</li>
									<li>
										<ul class="data_list03">
											<li><span class="dot possible">가능</span> 501</li>
											<li><span class="dot possible">가능</span> 502</li>
											<li><span class="dot impossible">불가능</span> 503</li>
											<li>외 가능2, 불가능2</li>
										</ul>
									</li>
									<li>
										<div class="text_possible">전체가능</div>
									</li>
								</ul>
							</div>
							-->							
						</div>
						<!-- e :calender_all -->
					</div>
					<!-- e :bbs_calender01 -->
				
				</div>
				<!-- s :calender_guide -->
				
				<!-- s :popup -->
                <div id="popDateView" class="Layer_popup" style="display:none;">
                    <p class="left01"></p><!--오른쪽 말풍선인경우 class="right01" 변경-->
                    <div class="popup_guide popup_w200 popup_type01">
                        <a href="javascript:void(0)" class="closebtn btnPopDateViewClose">닫기</a>
                        <div class="popup_content">
                            <ul class="data_list03 allList">
                                <!-- <li><span class="dot possible">가능</span> 501</li>
                                <li><span class="dot possible">가능</span> 502</li>
                                <li><span class="dot impossible">불가능</span> 503</li>
								<li><span class="dot possible">가능</span> 501</li>
                                <li><span class="dot possible">가능</span> 502</li>
                                <li><span class="dot impossible">불가능</span> 503</li>
								<li><span class="dot possible">가능</span> 501</li>
                                <li><span class="dot possible">가능</span> 502</li>
                                <li><span class="dot impossible">불가능</span> 503</li> -->
                            </ul>
                        </div>
                        <!-- e :popup_content -->
                    </div>
					
                </div>
                <!-- e :popup -->
				
			</div>
			<!-- e :contents_guide -->
		</div>
		<!-- e :right_guide -->
	</div>
	<!-- e :wrap -->

</body>
<script>
;(function() {
	// 달력 입력 datepicker 설정
	$('.inputCalendar').datepicker({
		dateFormat : 'yyyy.mm.dd'		// 날짜 형태 설정		
	});	

	// 기간검색 버튼 클릭
	$(".period > a").click(function() {

		$(".period > a").removeClass("active");
		$(this).addClass("active");
		
		var searchDate1 = "";
		var searchDate2 = "";
		var dateDiv = $(this).index();
		var now = new Date();
		
		var yy = now.getFullYear();
		var mm = ('0' + (now.getMonth() + 1)).slice(-2);
		var dd = ('0' + now.getDate()).slice(-2);
		searchDate2 = yy + '.' + mm  + '.' + dd;

		if (dateDiv == "0") {	// 오늘
			searchDate1 = searchDate2;
		}

		else if (dateDiv == "1") {	// 7일
			var d = new Date(now.setDate(now.getDate() - 6));
			var yy = d.getFullYear();
			var mm = ('0' + (d.getMonth() + 1)).slice(-2);
			var dd = ('0' + d.getDate()).slice(-2);
			searchDate1 = yy + '.' + mm  + '.' + dd;
		}

		else if (dateDiv == "2") {	// 15일
			var d = new Date(now.setDate(now.getDate() - 14));
			var yy = d.getFullYear();
			var mm = ('0' + (d.getMonth() + 1)).slice(-2);
			var dd = ('0' + d.getDate()).slice(-2);
			searchDate1 = yy + '.' + mm  + '.' + dd;
		}

		else if (dateDiv == "3") {	// 1개월
			d = new Date(now.setMonth(now.getMonth() - 1));
			var yy = d.getFullYear();
			var mm = ('0' + (d.getMonth() + 1)).slice(-2);
			var dd = ('0' + d.getDate()).slice(-2);
			searchDate1 = yy + '.' + mm  + '.' + dd;
		}

		else if (dateDiv == "4") {	// 5개월
			d = new Date(now.setMonth(now.getMonth() - 3));
			var yy = d.getFullYear();
			var mm = ('0' + (d.getMonth() + 1)).slice(-2);
			var dd = ('0' + d.getDate()).slice(-2);
			searchDate1 = yy + '.' + mm  + '.' + dd;
		}

		else {	// 전체
			searchDate1 = "";
			searchDate2 = "";
		}

		$("#searchDate1").val(searchDate1);
		//$("#searchDate2").val(searchDate2);
		
		$('.inputCalendar').each(function(index) {
	        var thisData = $(this).val();

	        if ($.trim(thisData).length > 0) {
		        var date = new Date(thisData); // 화면에 표시되는 날짜 형태에 따라 변환
		            
		        $(this).data('datepicker').selectDate(new Date(date.getFullYear(), date.getMonth(), date.getDate()));
	    	}
		});
	});

	
	// 목록 날짜 이전 버튼
	$("#btnListDatePrev").click(function() {
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

		var endDate = yy1 + '.' + mm1  + '.' + dd1;
		var startDate = yy2 + '.' + mm2  + '.' + dd2;
		
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
		
		var dateDayArr = new Array();
		var paramArr = new Array();
		$('.day_tit').children().remove();
		while(weekStartDate.getTime() <= weekEndDate.getTime()) {
			var mon = (weekStartDate.getMonth()+1);
  			mon = mon < 10 ? '0'+mon : mon;
  			var day = weekStartDate.getDate();
  			day = day < 10 ? '0'+day : day;
  			
  			var paramDay1 = weekStartDate.getFullYear() + '-' + mon + '-' +  day + ' 00:00';
			var paramDay2 = weekStartDate.getFullYear() + '-' + mon + '-' +  day + ' 23:59';
			console.log(paramDay1);
			console.log(paramDay2);
			
  			var week = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];
			
			var searchDateStartDay = week[new Date(weekStartDate).getDay()];
			console.log(searchDateStartDay);
			
			$('.day_tit').append($("<li><span>" + searchDateStartDay + "</span>" + mon + "/" + day + "</li>"));
			
			var data = { "dateStart" : paramDay1 , "dateEnd" : paramDay2 , "day" : searchDateStartDay}
			paramArr.push(data);
			dateDayArr.push(weekStartDate.getFullYear() + '-' + mon + '-' +  day);
  			weekStartDate.setDate(weekStartDate.getDate() + 1);
  			
		}  
		console.log(paramArr);
		$.ajax({
			url : "/empo/resource/isUsePlace.do"
			, type : 'post'
			, data : JSON.stringify(paramArr)
			, async : false
			, contentType : "application/json; charset=utf-8"
		}).done(function(res) {
			$('.rowPlaceList').remove();
			var use = 0;
			var unUse = 0;
			var rowAddrCode = "";
			res.list.forEach(function(row1, index) {
				row1.forEach(function(row2, index) {
					if (rowAddrCode != row2.addrCode) {
						use = 0;
						unUse = 0;			
					} 
					rowAddrCode = row2.addrCode;
					
					if (row2.dateDay == "Sun") {
						if ($('.' + row2.addrCode).find('.sun').children('li').length > 2) {
							if (row2.paPk == "") {
								use += 1
								if ($('.outsideSun' + row2.addrCode).length > 0) {
									$('.outsideSun' + row2.addrCode).remove();	
								}
								$('.' + row2.addrCode).find('.sun').append($("<li class='rowPlaceList outsideSun" + row2.addrCode + "'>외 가능" + use + ", 불가능" + unUse + "</li>"));
							} else {
								unUse += 1
								$('.outsideSun').remove();
								$('.' + row2.addrCode).find('.sun').append($("<li class='rowPlaceList outsideSun" + row2.addrCode + "'>외 가능" + use + ", 불가능" + unUse + "</li>"));
							}
						} else {
							row2.dateList = dateDayArr[0];
							$('.' + row2.addrCode).find('.sun').append(isUsePlace(row2));	
						}
					} else if (row2.dateDay == "Mon") {
						if ($('.' + row2.addrCode).find('.mon').children('li').length > 2) {
							if (row2.paPk == "") {
								use += 1
								if ($('.outsideMon' + row2.addrCode).length > 0) {
									$('.outsideMon' + row2.addrCode).remove();	
								}
								$('.' + row2.addrCode).find('.mon').append($("<li class='rowPlaceList outsideMon" + row2.addrCode + "'>외 가능" + use + ", 불가능" + unUse + "</li>"));
							} else {
								unUse += 1
								$('.outsideMon' + row2.addrCode).remove();
								$('.' + row2.addrCode).find('.mon').append($("<li class='rowPlaceList outsideMon" + row2.addrCode + "'>외 가능" + use + ", 불가능" + unUse + "</li>"));
							}
						} else {
							row2.dateList = dateDayArr[1];
							$('.' + row2.addrCode).find('.mon').append(isUsePlace(row2));
						}
					} else if (row2.dateDay == "Tue") {
						if ($('.' + row2.addrCode).find('.tue').children('li').length > 2) {
							if (row2.paPk == "") {
								use += 1
								$('.outsideTue' + row2.addrCode).remove();
								$('.' + row2.addrCode).find('.tue').append($("<li class='rowPlaceList outsideTue" + row2.addrCode + "'>외 가능" + use + ", 불가능" + unUse + "</li>"));
							} else {
								unUse += 1
								$('.outsideTue' + row2.addrCode).remove();
								$('.' + row2.addrCode).find('.tue').append($("<li class='rowPlaceList outsideTue" + row2.addrCode + "'>외 가능" + use + ", 불가능" + unUse + "</li>"));
							}
						} else {
							row2.dateList = dateDayArr[2];
							$('.' + row2.addrCode).find('.tue').append(isUsePlace(row2));	
						}
					} else if (row2.dateDay == "Wed") {
						if ($('.' + row2.addrCode).find('.wed').children('li').length > 2) {
							if (row2.paPk == "") {
								use += 1
								$('.outsideWed' + row2.addrCode).remove();
								$('.' + row2.addrCode).find('.wed').append($("<li class='rowPlaceList outsideWed" + row2.addrCode + "'>외 가능" + use + ", 불가능" + unUse + "</li>"));
							} else {
								unUse += 1
								$('.outsideWed' + row2.addrCode).remove();
								$('.' + row2.addrCode).find('.wed').append($("<li class='rowPlaceList outsideWed" + row2.addrCode + "'>외 가능" + use + ", 불가능" + unUse + "</li>"));
							}
						} else {
							row2.dateList = dateDayArr[3];
							$('.' + row2.addrCode).find('.wed').append(isUsePlace(row2));	
						}
						
					} else if (row2.dateDay == "Thu") {
						if ($('.' + row2.addrCode).find('.thu').children('li').length > 2) {
							if (row2.paPk == "") {
								use += 1
								$('.outsideThu' + row2.addrCode).remove();
								$('.' + row2.addrCode).find('.thu').append($("<li class='rowPlaceList outsideThu" + row2.addrCode + "'>외 가능" + use + ", 불가능" + unUse + "</li>"));
							} else {
								unUse += 1
								$('.outsideThu' + row2.addrCode).remove();
								$('.' + row2.addrCode).find('.thu').append($("<li class='rowPlaceList outsideThu" + row2.addrCode + "'>외 가능" + use + ", 불가능" + unUse + "</li>"));
							}
						} else {
							row2.dateList = dateDayArr[4];
							$('.' + row2.addrCode).find('.thu').append(isUsePlace(row2));	
						}
						
					} else if (row2.dateDay == "Fri") {
						if ($('.' + row2.addrCode).find('.fri').children('li').length > 2) {
							if (row2.paPk == "") {
								use += 1
								$('.outsideFri' + row2.addrCode).remove();
								$('.' + row2.addrCode).find('.fri').append($("<li class='rowPlaceList outsideFri" + row2.addrCode + "'>외 가능" + use + ", 불가능" + unUse + "</li>"));
							} else {
								unUse += 1
								$('.outsideFri' + row2.addrCode).remove();
								$('.' + row2.addrCode).find('.fri').append($("<li class='rowPlaceList outsideFri" + row2.addrCode + "'>외 가능" + use + ", 불가능" + unUse + "</li>"));
							}
						} else {
							row2.dateList = dateDayArr[5];
							$('.' + row2.addrCode).find('.fri').append(isUsePlace(row2));
						}
						
					} else if (row2.dateDay == "Sat") {
						if ($('.' + row2.addrCode).find('.sat').children('li').length > 2) {
							if (row2.paPk == "") {
								use += 1
								$('.outsideSat' + row2.addrCode).remove();
								$('.' + row2.addrCode).find('.sat').append($("<li class='rowPlaceList outsideSat" + row2.addrCode + "'>외 가능" + use + ", 불가능" + unUse + "</li>"));
							} else {
								unUse += 1
								$('.outsideSat' + row2.addrCode).remove();
								$('.' + row2.addrCode).find('.sat').append($("<li class='rowPlaceList outsideSat" + row2.addrCode + "'>외 가능" + use + ", 불가능" + unUse + "</li>"));
							}
						} else {
							row2.dateList = dateDayArr[6];
							$('.' + row2.addrCode).find('.sat').append(isUsePlace(row2));	
						}
						
					} 
							
				})
			});
		});
		
		var prevPeriod = startDate + " ~ " + endDate;

		$(".listSearchDate").text(prevPeriod);
		$(".listNextDate").text(listSearchDate);

	});
	
	// 목록 날짜 다음 버튼
	$("#btnListDateNext").click(function() {
		var listSearchDate = $(".listSearchDate").text();
		var listNextDate = $(".listNextDate").text();
		
		var prevDate = listNextDate.substring(0,10);
		//console.log(prevDate);
		
		var nextDate = listNextDate.substring(13,23);
		//console.log(nextDate);
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

		var startDate = yy1 + '.' + mm1  + '.' + dd1;
		var endDate = yy2 + '.' + mm2  + '.' + dd2;
		
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
		
		var dateDayArr = new Array();
		var paramArr = new Array();
		$('.day_tit').children().remove();
		while(weekStartDate.getTime() <= weekEndDate.getTime()) {
			
			var mon = (weekStartDate.getMonth()+1);
  			mon = mon < 10 ? '0'+mon : mon;
  			var day = weekStartDate.getDate();
  			day = day < 10 ? '0'+day : day;
  			
  			var paramDay1 = weekStartDate.getFullYear() + '-' + mon + '-' +  day + ' 00:00';
			var paramDay2 = weekStartDate.getFullYear() + '-' + mon + '-' +  day + ' 23:59';
			console.log(paramDay1);
			console.log(paramDay2);
  			
			var week = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];
			
			var searchDateStartDay = week[new Date(weekStartDate).getDay()];
			console.log(searchDateStartDay);
			
			$('.day_tit').append($("<li><span>" + searchDateStartDay + "</span>" + mon + "/" + day + "</li>"));
			
			var data = { "dateStart" : paramDay1 , "dateEnd" : paramDay2 , "day" : searchDateStartDay}
			paramArr.push(data);
			dateDayArr.push(weekStartDate.getFullYear() + '-' + mon + '-' +  day);
  			weekStartDate.setDate(weekStartDate.getDate() + 1);
  			
		}  
		console.log(paramArr);
		$.ajax({
			url : "/empo/resource/isUsePlace.do"
			, type : 'post'
			, data : JSON.stringify(paramArr)
			, async : false
			, contentType : "application/json; charset=utf-8"
		}).done(function(res) {
			$('.rowPlaceList').remove();
			var use = 0;
			var unUse = 0;
			var rowAddrCode = "";
			res.list.forEach(function(row1, index) {
				row1.forEach(function(row2, index) {
					if (rowAddrCode != row2.addrCode) {
						use = 0;
						unUse = 0;			
					} 
					rowAddrCode = row2.addrCode;
					
					if (row2.dateDay == "Sun") {
						if ($('.' + row2.addrCode).find('.sun').children('li').length > 2) {
							if (row2.paPk == "") {
								use += 1
								if ($('.outsideSun' + row2.addrCode).length > 0) {
									$('.outsideSun' + row2.addrCode).remove();	
								}
								$('.' + row2.addrCode).find('.sun').append($("<li class='rowPlaceList outsideSun" + row2.addrCode + "'>외 가능" + use + ", 불가능" + unUse + "</li>"));
							} else {
								unUse += 1
								$('.outsideSun').remove();
								$('.' + row2.addrCode).find('.sun').append($("<li class='rowPlaceList outsideSun" + row2.addrCode + "'>외 가능" + use + ", 불가능" + unUse + "</li>"));
							}
						} else {
							row2.dateList = dateDayArr[0];
							$('.' + row2.addrCode).find('.sun').append(isUsePlace(row2));	
						}
					} else if (row2.dateDay == "Mon") {
						if ($('.' + row2.addrCode).find('.mon').children('li').length > 2) {
							if (row2.paPk == "") {
								use += 1
								if ($('.outsideMon' + row2.addrCode).length > 0) {
									$('.outsideMon' + row2.addrCode).remove();	
								}
								$('.' + row2.addrCode).find('.mon').append($("<li class='rowPlaceList outsideMon" + row2.addrCode + "'>외 가능" + use + ", 불가능" + unUse + "</li>"));
							} else {
								unUse += 1
								$('.outsideMon' + row2.addrCode).remove();
								$('.' + row2.addrCode).find('.mon').append($("<li class='rowPlaceList outsideMon" + row2.addrCode + "'>외 가능" + use + ", 불가능" + unUse + "</li>"));
							}
						} else {
							row2.dateList = dateDayArr[1];
							$('.' + row2.addrCode).find('.mon').append(isUsePlace(row2));
						}
					} else if (row2.dateDay == "Tue") {
						if ($('.' + row2.addrCode).find('.tue').children('li').length > 2) {
							if (row2.paPk == "") {
								use += 1
								$('.outsideTue' + row2.addrCode).remove();
								$('.' + row2.addrCode).find('.tue').append($("<li class='rowPlaceList outsideTue" + row2.addrCode + "'>외 가능" + use + ", 불가능" + unUse + "</li>"));
							} else {
								unUse += 1
								$('.outsideTue' + row2.addrCode).remove();
								$('.' + row2.addrCode).find('.tue').append($("<li class='rowPlaceList outsideTue" + row2.addrCode + "'>외 가능" + use + ", 불가능" + unUse + "</li>"));
							}
						} else {
							row2.dateList = dateDayArr[2];
							$('.' + row2.addrCode).find('.tue').append(isUsePlace(row2));	
						}
					} else if (row2.dateDay == "Wed") {
						if ($('.' + row2.addrCode).find('.wed').children('li').length > 2) {
							if (row2.paPk == "") {
								use += 1
								$('.outsideWed' + row2.addrCode).remove();
								$('.' + row2.addrCode).find('.wed').append($("<li class='rowPlaceList outsideWed" + row2.addrCode + "'>외 가능" + use + ", 불가능" + unUse + "</li>"));
							} else {
								unUse += 1
								$('.outsideWed' + row2.addrCode).remove();
								$('.' + row2.addrCode).find('.wed').append($("<li class='rowPlaceList outsideWed" + row2.addrCode + "'>외 가능" + use + ", 불가능" + unUse + "</li>"));
							}
						} else {
							row2.dateList = dateDayArr[3];
							$('.' + row2.addrCode).find('.wed').append(isUsePlace(row2));	
						}
						
					} else if (row2.dateDay == "Thu") {
						if ($('.' + row2.addrCode).find('.thu').children('li').length > 2) {
							if (row2.paPk == "") {
								use += 1
								$('.outsideThu' + row2.addrCode).remove();
								$('.' + row2.addrCode).find('.thu').append($("<li class='rowPlaceList outsideThu" + row2.addrCode + "'>외 가능" + use + ", 불가능" + unUse + "</li>"));
							} else {
								unUse += 1
								$('.outsideThu' + row2.addrCode).remove();
								$('.' + row2.addrCode).find('.thu').append($("<li class='rowPlaceList outsideThu" + row2.addrCode + "'>외 가능" + use + ", 불가능" + unUse + "</li>"));
							}
						} else {
							row2.dateList = dateDayArr[4];
							$('.' + row2.addrCode).find('.thu').append(isUsePlace(row2));	
						}
						
					} else if (row2.dateDay == "Fri") {
						if ($('.' + row2.addrCode).find('.fri').children('li').length > 2) {
							if (row2.paPk == "") {
								use += 1
								$('.outsideFri' + row2.addrCode).remove();
								$('.' + row2.addrCode).find('.fri').append($("<li class='rowPlaceList outsideFri" + row2.addrCode + "'>외 가능" + use + ", 불가능" + unUse + "</li>"));
							} else {
								unUse += 1
								$('.outsideFri' + row2.addrCode).remove();
								$('.' + row2.addrCode).find('.fri').append($("<li class='rowPlaceList outsideFri" + row2.addrCode + "'>외 가능" + use + ", 불가능" + unUse + "</li>"));
							}
						} else {
							row2.dateList = dateDayArr[5];
							$('.' + row2.addrCode).find('.fri').append(isUsePlace(row2));
						}
						
					} else if (row2.dateDay == "Sat") {
						if ($('.' + row2.addrCode).find('.sat').children('li').length > 2) {
							if (row2.paPk == "") {
								use += 1
								$('.outsideSat' + row2.addrCode).remove();
								$('.' + row2.addrCode).find('.sat').append($("<li class='rowPlaceList outsideSat" + row2.addrCode + "'>외 가능" + use + ", 불가능" + unUse + "</li>"));
							} else {
								unUse += 1
								$('.outsideSat' + row2.addrCode).remove();
								$('.' + row2.addrCode).find('.sat').append($("<li class='rowPlaceList outsideSat" + row2.addrCode + "'>외 가능" + use + ", 불가능" + unUse + "</li>"));
							}
						} else {
							row2.dateList = dateDayArr[6];
							$('.' + row2.addrCode).find('.sat').append(isUsePlace(row2));	
						}
						
					} 
							
				})
			});
		});
		
		var nextPeriod = startDate + " ~ " + endDate;
		$(".listSearchDate").text(listNextDate);
		$(".listNextDate").text(nextPeriod);
	});
	
	// 시작일 및 완료일 입력 팝업의 닫기(X) 클릭
	$(".btnPopDateViewClose").click(function() {
		$("#popDateView").css("display","none");
	});
	
	
	// 평가장 관리 이동 버튼
	$("#btnGoPlaceManage").click(function() {
		window.location.href = "/empo/resources/eMAU00C03manage.do";
	});
	
	// 조회하기 버튼
	$("#searchResource").click(function() {
		var condition = $('input:checkbox[name="condition"]').val();
		
		$('input:checkbox[name="checkField"]').each(function(index, row) {
			if ($(row).is(":checked")) {
				$('.' + $(row).val()).css('display', '');
			} else {
				var grmCode = $(row).val();
				$('.' + $(row).val()).css('display', 'none');
			}
		});
		
		if($('input[name="checkField"]:checked').length == 0) {
			$('input:checkbox[name="checkField"]').each(function(index, row) {
				$('.' + $(row).val()).css('display', '');
			});
		}
		
		var searchDateStart = $("#searchDate1").val();
		
		console.log(searchDateStart);
		var d = new Date(searchDateStart);
		console.log(d);
		var nowDayOfWeek = d.getDay();
		var nowDay = d.getDate();
		var nowMonth = d.getMonth();
		var nowYear = d.getYear();
		nowYear += (nowYear < 2000) ? 1900 : 0;
		
		var weekStartDate = new Date(nowYear, nowMonth, nowDay - nowDayOfWeek);
		console.log(weekStartDate);
		var weekEndDate = new Date(nowYear, nowMonth, nowDay + (6 - nowDayOfWeek));
		console.log(weekEndDate);
		
		var yy = weekStartDate.getFullYear();
		var mm = ('0' + (weekStartDate.getMonth() + 1)).slice(-2);
		var dd = ('0' + weekStartDate.getDate()).slice(-2);
		searchDate1 = yy + '.' + mm  + '.' + dd;

		var yy = weekEndDate.getFullYear();
		var mm = ('0' + (weekEndDate.getMonth() + 1)).slice(-2);
		var dd = ('0' + weekEndDate.getDate()).slice(-2);
		searchDate2 = yy + '.' + mm  + '.' + dd;
		$('.listSearchDate').text(searchDate1 + " ~ " + searchDate2);
		
		var dateDayArr = new Array();
		var paramArr = new Array();
		$('.day_tit').children().remove();
		while(weekStartDate.getTime() <= weekEndDate.getTime()) {
			
			var mon = (weekStartDate.getMonth()+1);
  			mon = mon < 10 ? '0'+mon : mon;
  			var day = weekStartDate.getDate();
  			day = day < 10 ? '0'+day : day;
  			
  			var paramDay1 = weekStartDate.getFullYear() + '-' + mon + '-' +  day + ' 00:00';
			var paramDay2 = weekStartDate.getFullYear() + '-' + mon + '-' +  day + ' 23:59';
			console.log(paramDay1);
			console.log(paramDay2);
  			
			var week = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];
			
			var searchDateStartDay = week[new Date(weekStartDate).getDay()];
			console.log(searchDateStartDay);
			
			$('.day_tit').append($("<li><span>" + searchDateStartDay + "</span>" + mon + "/" + day + "</li>"));
			
			var data = { "dateStart" : paramDay1 , "dateEnd" : paramDay2 , "day" : searchDateStartDay}
			paramArr.push(data);
			dateDayArr.push(weekStartDate.getFullYear() + '-' + mon + '-' +  day);
  			weekStartDate.setDate(weekStartDate.getDate() + 1);
  			
		}  
		console.log(paramArr);
		$.ajax({
			url : "/empo/resource/isUsePlace.do"
			, type : 'post'
			, data : JSON.stringify(paramArr)
			, async : false
			, contentType : "application/json; charset=utf-8"
		}).done(function(res) {
			$('.rowPlaceList').remove();
			var use = 0;
			var unUse = 0;
			var rowAddrCode = "";
			res.list.forEach(function(row1, index) {
				row1.forEach(function(row2, index) {
					if (rowAddrCode != row2.addrCode) {
						use = 0;
						unUse = 0;			
					} 
					rowAddrCode = row2.addrCode;
					
					if (row2.dateDay == "Sun") {
						if ($('.' + row2.addrCode).find('.sun').children('li').length > 2) {
							if (row2.paPk == "") {
								use += 1
								if ($('.outsideSun' + row2.addrCode).length > 0) {
									$('.outsideSun' + row2.addrCode).remove();	
								}
								$('.' + row2.addrCode).find('.sun').append($("<li class='rowPlaceList outsideSun" + row2.addrCode + "'>외 가능" + use + ", 불가능" + unUse + "</li>"));
							} else {
								unUse += 1
								$('.outsideSun').remove();
								$('.' + row2.addrCode).find('.sun').append($("<li class='rowPlaceList outsideSun" + row2.addrCode + "'>외 가능" + use + ", 불가능" + unUse + "</li>"));
							}
						} else {
							row2.dateList = dateDayArr[0];
							$('.' + row2.addrCode).find('.sun').append(isUsePlace(row2));	
						}
					} else if (row2.dateDay == "Mon") {
						if ($('.' + row2.addrCode).find('.mon').children('li').length > 2) {
							if (row2.paPk == "") {
								use += 1
								if ($('.outsideMon' + row2.addrCode).length > 0) {
									$('.outsideMon' + row2.addrCode).remove();	
								}
								$('.' + row2.addrCode).find('.mon').append($("<li class='rowPlaceList outsideMon" + row2.addrCode + "'>외 가능" + use + ", 불가능" + unUse + "</li>"));
							} else {
								unUse += 1
								$('.outsideMon' + row2.addrCode).remove();
								$('.' + row2.addrCode).find('.mon').append($("<li class='rowPlaceList outsideMon" + row2.addrCode + "'>외 가능" + use + ", 불가능" + unUse + "</li>"));
							}
						} else {
							row2.dateList = dateDayArr[1];
							$('.' + row2.addrCode).find('.mon').append(isUsePlace(row2));
						}
					} else if (row2.dateDay == "Tue") {
						if ($('.' + row2.addrCode).find('.tue').children('li').length > 2) {
							if (row2.paPk == "") {
								use += 1
								$('.outsideTue' + row2.addrCode).remove();
								$('.' + row2.addrCode).find('.tue').append($("<li class='rowPlaceList outsideTue" + row2.addrCode + "'>외 가능" + use + ", 불가능" + unUse + "</li>"));
							} else {
								unUse += 1
								$('.outsideTue' + row2.addrCode).remove();
								$('.' + row2.addrCode).find('.tue').append($("<li class='rowPlaceList outsideTue" + row2.addrCode + "'>외 가능" + use + ", 불가능" + unUse + "</li>"));
							}
						} else {
							row2.dateList = dateDayArr[2];
							$('.' + row2.addrCode).find('.tue').append(isUsePlace(row2));	
						}
					} else if (row2.dateDay == "Wed") {
						if ($('.' + row2.addrCode).find('.wed').children('li').length > 2) {
							if (row2.paPk == "") {
								use += 1
								$('.outsideWed' + row2.addrCode).remove();
								$('.' + row2.addrCode).find('.wed').append($("<li class='rowPlaceList outsideWed" + row2.addrCode + "'>외 가능" + use + ", 불가능" + unUse + "</li>"));
							} else {
								unUse += 1
								$('.outsideWed' + row2.addrCode).remove();
								$('.' + row2.addrCode).find('.wed').append($("<li class='rowPlaceList outsideWed" + row2.addrCode + "'>외 가능" + use + ", 불가능" + unUse + "</li>"));
							}
						} else {
							row2.dateList = dateDayArr[3];
							$('.' + row2.addrCode).find('.wed').append(isUsePlace(row2));	
						}
						
					} else if (row2.dateDay == "Thu") {
						if ($('.' + row2.addrCode).find('.thu').children('li').length > 2) {
							if (row2.paPk == "") {
								use += 1
								$('.outsideThu' + row2.addrCode).remove();
								$('.' + row2.addrCode).find('.thu').append($("<li class='rowPlaceList outsideThu" + row2.addrCode + "'>외 가능" + use + ", 불가능" + unUse + "</li>"));
							} else {
								unUse += 1
								$('.outsideThu' + row2.addrCode).remove();
								$('.' + row2.addrCode).find('.thu').append($("<li class='rowPlaceList outsideThu" + row2.addrCode + "'>외 가능" + use + ", 불가능" + unUse + "</li>"));
							}
						} else {
							row2.dateList = dateDayArr[4];
							$('.' + row2.addrCode).find('.thu').append(isUsePlace(row2));	
						}
						
					} else if (row2.dateDay == "Fri") {
						if ($('.' + row2.addrCode).find('.fri').children('li').length > 2) {
							if (row2.paPk == "") {
								use += 1
								$('.outsideFri' + row2.addrCode).remove();
								$('.' + row2.addrCode).find('.fri').append($("<li class='rowPlaceList outsideFri" + row2.addrCode + "'>외 가능" + use + ", 불가능" + unUse + "</li>"));
							} else {
								unUse += 1
								$('.outsideFri' + row2.addrCode).remove();
								$('.' + row2.addrCode).find('.fri').append($("<li class='rowPlaceList outsideFri" + row2.addrCode + "'>외 가능" + use + ", 불가능" + unUse + "</li>"));
							}
						} else {
							row2.dateList = dateDayArr[5];
							$('.' + row2.addrCode).find('.fri').append(isUsePlace(row2));
						}
						
					} else if (row2.dateDay == "Sat") {
						if ($('.' + row2.addrCode).find('.sat').children('li').length > 2) {
							if (row2.paPk == "") {
								use += 1
								$('.outsideSat' + row2.addrCode).remove();
								$('.' + row2.addrCode).find('.sat').append($("<li class='rowPlaceList outsideSat" + row2.addrCode + "'>외 가능" + use + ", 불가능" + unUse + "</li>"));
							} else {
								unUse += 1
								$('.outsideSat' + row2.addrCode).remove();
								$('.' + row2.addrCode).find('.sat').append($("<li class='rowPlaceList outsideSat" + row2.addrCode + "'>외 가능" + use + ", 불가능" + unUse + "</li>"));
							}
						} else {
							row2.dateList = dateDayArr[6];
							$('.' + row2.addrCode).find('.sat').append(isUsePlace(row2));	
						}
						
					} 
							
				})
			});
		});
		
		var yy = weekEndDate.getFullYear();
		var mm = ('0' + (weekEndDate.getMonth() + 1)).slice(-2);
		var dd = ('0' + (weekEndDate.getDate() + 1)).slice(-2);
		searchDate1 = yy + '.' + mm  + '.' + dd;
		console.log(searchDate1)
		
		var d = new Date(weekEndDate.setDate(weekEndDate.getDate() + 6));
		var yy = d.getFullYear();
		var mm = ('0' + (d.getMonth() + 1)).slice(-2);
		var dd = ('0' + (d.getDate() + 1)).slice(-2);
		searchDate2 = yy + '.' + mm  + '.' + dd; 
		
		$('.listNextDate').text(searchDate1 + " ~ " + searchDate2); 
		
	});
	
	$(function() {
		initList();
	});
	
	var areaListView = function(row) {
		var data = 
			'<div class="calender_list ' + row.addrCode + '">' + 
			'	<div><strong><span>' + row.addrName + '</span></strong></div>' + 
			'	<ul class="day_all">' +
			'		<li>' +
			'			<ul class="data_list03 ulRow sun" data-addr_code="' + row.addrCode + '" data-addr_name="' + row.addrName + '">' +
			'			</ul>' +
			'		</li>' +
			'		<li>' +
			'			<ul class="data_list03 ulRow mon" data-addr_code="' + row.addrCode + '" data-addr_name="' + row.addrName + '">' +
			'			</ul>' +
			'		</li>' +
			'		<li>' +
			'			<ul class="data_list03 ulRow tue" data-addr_code="' + row.addrCode + '" data-addr_name="' + row.addrName + '">' +
			'			</ul>' +
			'		</li>' +
			'		<li>' +
			'			<ul class="data_list03 ulRow wed" data-addr_code="' + row.addrCode + '" data-addr_name="' + row.addrName + '">' +
			'			</ul>' +
			'		</li>' +
			'		<li>' +
			'			<ul class="data_list03 ulRow thu" data-addr_code="' + row.addrCode + '" data-addr_name="' + row.addrName + '">' +
			'			</ul>' +
			'		</li>' +
			'		<li>' +
			'			<ul class="data_list03 ulRow fri" data-addr_code="' + row.addrCode + '" data-addr_name="' + row.addrName + '">' +
			'			</ul>' +
			'		</li>' +
			'		<li>' +
			'			<ul class="data_list03 ulRow sat" data-addr_code="' + row.addrCode + '" data-addr_name="' + row.addrName + '">' +
			'			</ul>' +
			'		</li>' +
			'	</ul>' +
			'</div>' ;
			
		return $(data);
	}
	
	$(document).on('click', '.ulRow', function(e) {
		var selectAddrCode = $(this).data('addr_code');
		console.log(selectAddrCode);
		var dateDay = $(this).find('li').data('date_day');
		console.log(dateDay);
		
		$.post("/empo/resource/selectAreaDetail.do", { "addrCode" : selectAddrCode, "dateDay" : dateDay }).done(function(res) {
			console.log(res.list);
			$('.allList').find('li').remove();
			res.list.forEach(function(row, index) {
				$('.allList').append(isUsePlace(row));
			});
			// 마우스 클릭 위치 가져오기
			var divTop = e.pageY - 50; // 상단 좌표 위치 안맞을시 e.pageY 
			var divLeft = e.pageX + 20; // 좌측 좌표 위치 안맞을시 e.pageX

			$("#popDateView").css("top",divTop);
			$("#popDateView").css("left",divLeft);
			$("#popDateView").css("display","block");
		}) 
	});
	
	var isUsePlace = function(row) {
		console.log(row);
		var data = "";
		if (row.paPk == "") {
			data = '<li class="rowPlaceList" data-date_day="' + row.dateList + '"><span class="dot possible">가능</span> ' + row.vuTitle + '</li>' ;	
		} else {
			data = '<li class="rowPlaceList" data-date_day="' + row.dateList + '"><span class="dot impossible">가능</span> ' + row.vuTitle + '</li>' ;
		}
		
		return $(data);
	}
	
	var initList = function() {
		var now = new Date();
		
		var yy = now.getFullYear();
		var mm = ('0' + (now.getMonth() + 1)).slice(-2);
		var dd = ('0' + now.getDate()).slice(-2);
		$('#searchDate1').val(yy + '.' + mm  + '.' + dd);
		
		$('.inputCalendar').each(function(index) {
	        var thisData = $(this).val();

	        if ($.trim(thisData).length > 0) {
		        var date = new Date(thisData); // 화면에 표시되는 날짜 형태에 따라 변환
		            
		        $(this).data('datepicker').selectDate(new Date(date.getFullYear(), date.getMonth(), date.getDate()));
	    	}
		});
		
		$.post("/empo/resources/selectAreaCateList.do").done(function(res) {
			res.list.forEach( function(row, index) {
				$(".data_box01").append($("<li><label><input type='checkbox' name='checkField' value='" + row.addrCode + "'> " + row.addrName + "</label></li>"))
			});
		});
		
		$.post("/empo/resources/areaList.do").done(function(res) {
			res.list.forEach(function(row, index) {
				$('.calender_all').append(areaListView(row));
			});
			
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
			searchDate1 = yy + '.' + mm  + '.' + dd;

			var yy = weekEndDate.getFullYear();
			var mm = ('0' + (weekEndDate.getMonth() + 1)).slice(-2);
			var dd = ('0' + weekEndDate.getDate()).slice(-2);
			searchDate2 = yy + '.' + mm  + '.' + dd;
			$('.listSearchDate').text(searchDate1 + " ~ " + searchDate2);
			
			console.log(weekStartDate.getTime())
			console.log(weekEndDate.getTime())
			var paramArr = new Array();
			var dateDayArr = new Array();
			
			while(weekStartDate.getTime() <= weekEndDate.getTime()) {
				var mon = (weekStartDate.getMonth()+1);
	  			mon = mon < 10 ? '0'+mon : mon;
	  			var day = weekStartDate.getDate();
	  			day = day < 10 ? '0'+day : day;
	  			
	  			var paramDay1 = weekStartDate.getFullYear() + '-' + mon + '-' +  day + ' 00:00';
				var paramDay2 = weekStartDate.getFullYear() + '-' + mon + '-' +  day + ' 23:59';
				console.log(paramDay1);
				console.log(paramDay2);
				
	  			var week = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];
			
				var searchDateStartDay = week[new Date(weekStartDate).getDay()];
				console.log(searchDateStartDay);
				$('.day_tit').append($("<li><span>" + searchDateStartDay + "</span>" + mon + "/" + day + "</li>"));
				
				var data = { "dateStart" : paramDay1 , "dateEnd" : paramDay2 , "day" : searchDateStartDay}
				paramArr.push(data);
				dateDayArr.push(weekStartDate.getFullYear() + '-' + mon + '-' +  day);
	  			weekStartDate.setDate(weekStartDate.getDate() + 1);
	  			
			} 
			
			console.log(paramArr);
			console.log(dateDayArr);
			$.ajax({
				url : "/empo/resource/isUsePlace.do"
				, type : 'post'
				, data : JSON.stringify(paramArr)
				, async : false
				, contentType : "application/json; charset=utf-8"
			}).done(function(res) {
				$('.rowPlaceList').remove();
				var use = 0;
				var unUse = 0;
				var rowAddrCode = "";
				var rowDateDay = "";
				res.list.forEach(function(row1, index) {
					row1.forEach(function(row2, index) {
						console.log(row2.dateList);
						if (rowAddrCode != row2.addrCode) {
							use = 0;
							unUse = 0;			
						} 
						if (rowDateDay != row2.dateDay) {
							use = 0;
							unUse = 0;			
						} 
						rowAddrCode = row2.addrCode;
						rowDateDay = row2.dateDay
						if (row2.dateDay == "Sun") {
							if ($('.' + row2.addrCode).find('.sun').children('li').length > 2) {
								if (row2.paPk == "") {
									use += 1
									if ($('.outsideSun' + row2.addrCode).length > 0) {
										$('.outsideSun' + row2.addrCode).remove();	
									}
									$('.' + row2.addrCode).find('.sun').append($("<li class='rowPlaceList outsideSun" + row2.addrCode + "'>외 가능" + use + ", 불가능" + unUse + "</li>"));
								} else {
									unUse += 1
									$('.outsideSun').remove();
									$('.' + row2.addrCode).find('.sun').append($("<li class='rowPlaceList outsideSun" + row2.addrCode + "'>외 가능" + use + ", 불가능" + unUse + "</li>"));
								}
							} else {
								row2.dateList = dateDayArr[0];
								$('.' + row2.addrCode).find('.sun').append(isUsePlace(row2));	
							}
						} else if (row2.dateDay == "Mon") {
							if ($('.' + row2.addrCode).find('.mon').children('li').length > 2) {
								if (row2.paPk == "") {
									use += 1
									if ($('.outsideMon' + row2.addrCode).length > 0) {
										$('.outsideMon' + row2.addrCode).remove();	
									}
									$('.' + row2.addrCode).find('.mon').append($("<li class='rowPlaceList outsideMon" + row2.addrCode + "'>외 가능" + use + ", 불가능" + unUse + "</li>"));
								} else {
									unUse += 1
									$('.outsideMon' + row2.addrCode).remove();
									$('.' + row2.addrCode).find('.mon').append($("<li class='rowPlaceList outsideMon" + row2.addrCode + "'>외 가능" + use + ", 불가능" + unUse + "</li>"));
								}
							} else {
								row2.dateList = dateDayArr[1];
								$('.' + row2.addrCode).find('.mon').append(isUsePlace(row2));
							}
						} else if (row2.dateDay == "Tue") {
							if ($('.' + row2.addrCode).find('.tue').children('li').length > 2) {
								if (row2.paPk == "") {
									use += 1
									$('.outsideTue' + row2.addrCode).remove();
									$('.' + row2.addrCode).find('.tue').append($("<li class='rowPlaceList outsideTue" + row2.addrCode + "'>외 가능" + use + ", 불가능" + unUse + "</li>"));
								} else {
									unUse += 1
									$('.outsideTue' + row2.addrCode).remove();
									$('.' + row2.addrCode).find('.tue').append($("<li class='rowPlaceList outsideTue" + row2.addrCode + "'>외 가능" + use + ", 불가능" + unUse + "</li>"));
								}
							} else {
								row2.dateList = dateDayArr[2];
								$('.' + row2.addrCode).find('.tue').append(isUsePlace(row2));	
							}
						} else if (row2.dateDay == "Wed") {
							if ($('.' + row2.addrCode).find('.wed').children('li').length > 2) {
								if (row2.paPk == "") {
									use += 1
									$('.outsideWed' + row2.addrCode).remove();
									$('.' + row2.addrCode).find('.wed').append($("<li class='rowPlaceList outsideWed" + row2.addrCode + "'>외 가능" + use + ", 불가능" + unUse + "</li>"));
								} else {
									unUse += 1
									$('.outsideWed' + row2.addrCode).remove();
									$('.' + row2.addrCode).find('.wed').append($("<li class='rowPlaceList outsideWed" + row2.addrCode + "'>외 가능" + use + ", 불가능" + unUse + "</li>"));
								}
							} else {
								row2.dateList = dateDayArr[3];
								$('.' + row2.addrCode).find('.wed').append(isUsePlace(row2));	
							}
							
						} else if (row2.dateDay == "Thu") {
							if ($('.' + row2.addrCode).find('.thu').children('li').length > 2) {
								if (row2.paPk == "") {
									use += 1
									$('.outsideThu' + row2.addrCode).remove();
									$('.' + row2.addrCode).find('.thu').append($("<li class='rowPlaceList outsideThu" + row2.addrCode + "'>외 가능" + use + ", 불가능" + unUse + "</li>"));
								} else {
									unUse += 1
									$('.outsideThu' + row2.addrCode).remove();
									$('.' + row2.addrCode).find('.thu').append($("<li class='rowPlaceList outsideThu" + row2.addrCode + "'>외 가능" + use + ", 불가능" + unUse + "</li>"));
								}
							} else {
								row2.dateList = dateDayArr[4];
								$('.' + row2.addrCode).find('.thu').append(isUsePlace(row2));	
							}
							
						} else if (row2.dateDay == "Fri") {
							if ($('.' + row2.addrCode).find('.fri').children('li').length > 2) {
								if (row2.paPk == "") {
									use += 1
									$('.outsideFri' + row2.addrCode).remove();
									$('.' + row2.addrCode).find('.fri').append($("<li class='rowPlaceList outsideFri" + row2.addrCode + "'>외 가능" + use + ", 불가능" + unUse + "</li>"));
								} else {
									unUse += 1
									$('.outsideFri' + row2.addrCode).remove();
									$('.' + row2.addrCode).find('.fri').append($("<li class='rowPlaceList outsideFri" + row2.addrCode + "'>외 가능" + use + ", 불가능" + unUse + "</li>"));
								}
							} else {
								row2.dateList = dateDayArr[5];
								$('.' + row2.addrCode).find('.fri').append(isUsePlace(row2));
							}
							
						} else if (row2.dateDay == "Sat") {
							if ($('.' + row2.addrCode).find('.sat').children('li').length > 2) {
								if (row2.paPk == "") {
									use += 1
									$('.outsideSat' + row2.addrCode).remove();
									$('.' + row2.addrCode).find('.sat').append($("<li class='rowPlaceList outsideSat" + row2.addrCode + "'>외 가능" + use + ", 불가능" + unUse + "</li>"));
								} else {
									unUse += 1
									$('.outsideSat' + row2.addrCode).remove();
									$('.' + row2.addrCode).find('.sat').append($("<li class='rowPlaceList outsideSat" + row2.addrCode + "'>외 가능" + use + ", 불가능" + unUse + "</li>"));
								}
							} else {
								row2.dateList = dateDayArr[6];
								$('.' + row2.addrCode).find('.sat').append(isUsePlace(row2));	
							}
							
						} 
								
					})
				});
			});
			
			var yy = weekEndDate.getFullYear();
			var mm = ('0' + (weekEndDate.getMonth() + 1)).slice(-2);
			var dd = ('0' + (weekEndDate.getDate() + 1)).slice(-2);
			searchDate1 = yy + '.' + mm  + '.' + dd;
			console.log(searchDate1)
			
			var d = new Date(weekEndDate.setDate(weekEndDate.getDate() + 6));
			var yy = d.getFullYear();
			var mm = ('0' + (d.getMonth() + 1)).slice(-2);
			var dd = ('0' + (d.getDate() + 1)).slice(-2);
			searchDate2 = yy + '.' + mm  + '.' + dd; 
			
			$('.listNextDate').text(searchDate1 + " ~ " + searchDate2); 
			console.log(searchDate1);
			console.log(searchDate2);
			
			
			/* $.post("/empo/resource/selectAreaList2.do").done(function(res) {
				console.log(res.list);
				res.list.forEach(function(row, index) {
					$('.' + row.addrCode).find('.sun').append(isUsePlace(row));
					$('.' + row.addrCode).find('.mon').append(isUsePlace(row));
					$('.' + row.addrCode).find('.tue').append(isUsePlace(row));
					$('.' + row.addrCode).find('.wed').append(isUsePlace(row));
					$('.' + row.addrCode).find('.thu').append(isUsePlace(row));
					$('.' + row.addrCode).find('.fri').append(isUsePlace(row));
					$('.' + row.addrCode).find('.sat').append(isUsePlace(row));
				});
			}); 
			
			// 일자별, 구분별 팝업 오픈
			$(".day_all > li").css("cursor","pointer");
			
			$(".day_all > li").click(function(e) {

				// 마우스 클릭 위치 가져오기
				var divTop = e.pageY - 50; // 상단 좌표 위치 안맞을시 e.pageY 
				var divLeft = e.pageX + 20; // 좌측 좌표 위치 안맞을시 e.pageX

				$("#popDateView").css("top",divTop);
				$("#popDateView").css("left",divLeft);
				$("#popDateView").css("display","block");
			}); */
		});
		
		
		
	}
})();
</script>
</html>
