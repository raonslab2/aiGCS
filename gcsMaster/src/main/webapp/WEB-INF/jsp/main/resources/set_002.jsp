<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>TIPA 스케쥴기반 평가관리시스템</title>
<%@ include file = "../include/src.jsp" %>


<script type="text/javascript">
	$(document).ready(function() {

		// 지원가능여부 확인 버튼
		$("#btnDivComfirm").click(function() {
			window.location.href = "set_002_02.jsp";
		});
		

		// 사업분서 검색 자동완성 기능
		$("#searchName").autocomplete({
			source: ["경영전략본부","경영전략기획실","경영기획실","전략경영본부","전략경영지원"],
			select: function(event, ui) {
				console.log(ui.item);
			},
		
			focus: function(event, ui) {
				return false;
				//event.preventDefault();
			}
		});

		// 사업부서 선택 버튼
		$("#btnDeptSelect").click(function() {
			fnPopupOpen("set_002_01.jsp", "");	// ../js/popup.js 참고
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

		// 일자별 부서별 팝업창 오픈
		$(".data_list03").click(function() {
			fnPopupOpen("set_002_011.jsp", "");	// ../js/popup.js 참고
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
						<li><a href="set_002.jsp" class="active">가용자원 조회_간사</a></li>
						<!-- <li><a href="set_003.jsp">가용자원 조회_평가장</a></li> -->
					</ul>
				</div>
				
				<div class="btn_guide ar mt-65 mb30">
					<button type="button" class="btn_style01 btn_blue" id="btnDivComfirm">지원가능여부 확인</button>
				</div>
				<!-- s :content_col2 -->
				<div class="content_col2">
					<div class="bbs_write01 w40">
						<ul>
							<li><span>사업부서</span>
							
							<span class="search_box03 input_w80">
								<input type="text" id="searchName" placeholder="사업본부 또는 사업실 입력">
								<button type="submit" class="btn_search01">검색</button>
							</span>
							
							<button type="button" class="btn_style01 btn_gray" id="btnDeptSelect">선택</button>
							</li>

							<li>
								<div class="result_box sbox_h100 scroll">
									<ul class="data_list02" id="searchDeptList">
<!--                                         <li><input type="checkbox"> 협력사업본부 대외협력기획실</li> -->
<!--                                         <li><input type="checkbox"> 협력사업본부 기업협력사업실</li> -->
<!--                                         <li><input type="checkbox"> 성장사업본부 창업성장사업실</li> -->
                                    </ul>
								</div>	
							</li>
						</ul>
					</div>
					<!-- e :bbs_write01 -->
					
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
							<li><span>제외조건</span>
                            	<ul class="data_box01">
									<li><label><input type="checkbox"> 선택안함</label></li>
									<li><label><input type="checkbox"> 사업참여</label></li>
									<li><label><input type="checkbox"> 휴가</label></li>
									<li><label><input type="checkbox"> 응답대기</label></li>
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
						<li><span class="dot wait">응답대기</span> 응답대기</li>
						<li><span class="dot impossible">불가능</span> 불가능</li>
					</ul>
					<!-- e :sort -->

<!-- 					<div class="input_w100 mt50 mb50 date_tit"> -->
<!-- 						조회 결과가 없습니다. -->
<!-- 					</div> -->


					<div class="bbs_calender01">
						<div class="calender_top">
							<div>선택부서별 구분</div>
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
								<div><strong><span>대외협력기획실</span></strong></div>
								<ul class="day_all">
									<li>
										&nbsp;
									</li>
									<li>
										<ul class="data_list03">
											<li><span class="dot possible">가능</span> 홍길순 클릭시 팝업열림</li>
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
										&nbsp;
									</li>
								</ul>
							</div>
							<!-- e :calender_list -->
							<div class="calender_list">
								<div><strong><span>산학혁력사업실</span></strong></div>
								<ul class="day_all">
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
									</li>
									<li>
										&nbsp;
									</li>
								</ul>
							</div>
							<!-- e :calender_list -->
							<div class="calender_list">
								<div><strong><span>기업협력사업실</span></strong></div>
								<ul class="day_all">
									<li>
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
									</li>
								</ul>
							</div>
							<!-- e :calender_list -->
							
						</div>
						<!-- e :calender_all -->
					</div>
					<!-- e :bbs_calender01 -->
				
				</div>
				<!-- e :calender_guide -->
				
					
				<!-- 팝업 띄울 공간 -->
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
