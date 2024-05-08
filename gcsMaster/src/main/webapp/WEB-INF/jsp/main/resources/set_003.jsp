<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>TIPA 스케쥴기반 평가관리시스템</title>
<%@ include file = "../include/src.jsp" %>
<script type="text/javascript">
	$(document).ready(function() {

		// 평가장 관리 이동 버튼
		$("#btnGoPlaceManage").click(function() {
			window.location.href = "set_003_03.jsp";
		});
		
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
				d = new Date(now.setMonth(now.getMonth() - 5));
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
			$("#searchDate2").val(searchDate2);
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

			var prevPeriod = startDate + " ~ " + endDate;

			$(".listSearchDate").text(prevPeriod);
			$(".listNextDate").text(listSearchDate);

		});
		
		// 목록 날짜 다음 버튼
		$("#btnListDateNext").click(function() {
			var listSearchDate = $(".listSearchDate").text();
			var listNextDate = $(".listNextDate").text();

			var nextDate = listNextDate.substring(13,23);
			//console.log(nextDate);

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

			var nextPeriod = startDate + " ~ " + endDate;

			$(".listSearchDate").text(listNextDate);
			$(".listNextDate").text(nextPeriod);
		});


		// 일자별, 구분별 팝업 오픈
		$(".day_all > li").css("cursor","pointer");
		$(".day_all > li").click(function(e) {

			// 마우스 클릭 위치 가져오기
			var divTop = e.clientY - 50; // 상단 좌표 위치 안맞을시 e.pageY 
			var divLeft = e.clientX + 20; // 좌측 좌표 위치 안맞을시 e.pageX

			$("#popDateView").css("top",divTop);
			$("#popDateView").css("left",divLeft);
			$("#popDateView").css("display","block");
		});

		// 시작일 및 완료일 입력 팝업의 닫기(X) 클릭
		$(".btnPopDateViewClose").click(function() {
			$("#popDateView").css("display","none");
		});
	});



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
				<h3>가용자원</h3>

				<%@ include file = "../include/top.jsp" %>
			</div>
			<!-- 화면 상단 종료 -->
			
			<!-- s :contents_guide -->
			<div class="contents_guide">
				<div class="submenu_guide">
					<ul>
						<!-- 2차메뉴명 -->
						<li><a href="set_001.jsp">분과구성 현황</a></li>
						<li><a href="set_002.jsp">가용자원 조회_간사</a></li>
						<li><a href="set_003.jsp" class="active">가용자원 조회_평가장</a></li>
					</ul>
				</div>
				
				<div class="btn_guide ar mt-65 mb30">
					<button type="button" class="btn_style01 btn_blue" id="btnGoPlaceManage">평가장 관리</button>
				</div>
				<!-- s :content_col2 -->
				<div class="content_col2">
					<div class="bbs_write01 w60">
						<ul>
                            <li><span>기간</span>
								<input type="text" class="inputCalendar" name="searchDate1" id="searchDate1">
								~
								<input type="text" class="inputCalendar" name="searchDate2" id="searchDate2">

								<div class="period">
									<a href="#">오늘</a>
									<a href="#">7일</a>
									<a href="#">15일</a>
									<a href="#">1개월</a>
									<a href="#">5개월</a>
									<a href="#" class="active">전체</a>
								</div>
                            </li>
							
                        </ul>
					</div>
					<!-- e :bbs_write01 -->
					
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
					<!-- e :bbs_write01 -->
					
					<div class="btn_guide ac mb20 w100">
                        <button type="button" class="btn_style01 sb_style btn_red">조회하기</button>
                    </div>
					<!-- e :btn_guide -->
				</div>
				<!-- e :content_col2 -->
				
				<!-- s :calender_guide -->
				<div class="calender_guide">
					<div class="tit_date">
						<span>검색기간</span> 
						<strong class="listSearchDate">2021.06.22 ~ 2021.06.28</strong>
						<button type="button" class="btn_style06 btn_prev01" id="btnListDatePrev">이전</button>
						<button type="button" class="btn_style06 btn_next01" id="btnListDateNext">다음</button> 
						<strong class="listNextDate">2021.06.29 ~ 2021.07.05</strong>
					</div>
					<!-- e :tit_date -->
					
					<ul class="sort">
						<li><span class="dot possible">가능</span> 가능</li>
						<li><span class="dot impossible">불가능</span> 불가능</li>
					</ul>
					<!-- e :sort -->
					

					<div class="input_w100 mt50 mb50 date_tit">
						가용 가능한 평가장을 조회해 주세요.
					</div>

					<div class="bbs_calender01">
						<div class="calender_top">
							<div>구분</div>
							<ul class="day_tit">
								<li><span>Sun</span>6/20</li>
								<li><span>Mon</span>6/21</li>
								<li><span>Tue</span>6/22</li>
								<li><span>Wed</span>6/23</li>	
								<li><span>Thu</span>6/24</li>	
								<li><span>Fri</span>6/25</li>	
								<li><span>Sat</span>6/26</li>	
							</ul>
						</div>
						<!-- e :calender_top -->
						
						<div class="calender_all">
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
							<!-- e :calender_list -->
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
							<!-- e :calender_list -->
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
							<!-- e :calender_list -->
							
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
                            <ul class="data_list03">
                                <li><span class="dot possible">가능</span> 501</li>
                                <li><span class="dot possible">가능</span> 502</li>
                                <li><span class="dot impossible">불가능</span> 503</li>
								<li><span class="dot possible">가능</span> 501</li>
                                <li><span class="dot possible">가능</span> 502</li>
                                <li><span class="dot impossible">불가능</span> 503</li>
								<li><span class="dot possible">가능</span> 501</li>
                                <li><span class="dot possible">가능</span> 502</li>
                                <li><span class="dot impossible">불가능</span> 503</li>
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
</html>
