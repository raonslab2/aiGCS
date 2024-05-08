<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="java.util.Calendar"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.DecimalFormat"%>
<%@ page import="java.text.SimpleDateFormat"%>

<%

	// 스케줄 표시하는 월의 시작일자
	String strStartDate = request.getParameter("startDate");

	SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");	
	Calendar calendar = Calendar.getInstance();	
	String strCurrentDate = sf.format(calendar.getTime());	// 오늘
	String strCurrentDay = strCurrentDate.substring(8,10);	// 오늘의 날짜 : 달력에 오늘날짜 표시에 사용
	strCurrentDate = strCurrentDate.substring(0,8) + "01";

	// 시작일자가 없으면 스케줄 표시하는 주의 시작일자 구하기
	if (strStartDate == null || "null".equals(strStartDate)) {	
		strStartDate = strCurrentDate;
	};

	// 연도 및 월 값 구하기
	Date date = sf.parse(strStartDate);
	String yy = strStartDate.substring(0,4);
	String engMM = date.toString().substring(4,7);	

	// 시작일자의 요일
	calendar.setTime(date);
	int intStartWeek = calendar.get(Calendar.DAY_OF_WEEK); 	
    int totalDay = calendar.getActualMaximum(Calendar.DAY_OF_MONTH); // 해당월의 끝날짜
	
	// 이전월
	calendar.setTime(date);
	calendar.add(Calendar.MONTH , -1);
	String strPrevDate = sf.format(calendar.getTime());
    int prevTotalDay = calendar.getActualMaximum(Calendar.DAY_OF_MONTH); // 이전월의 끝날짜

	// 다음월
	calendar.setTime(date);
	calendar.add(Calendar.MONTH , 1);
	String strNextDate = sf.format(calendar.getTime());
	
%>


<script type="text/javascript">
	$(document).ready(function() {	
		// 팝업 스크롤바를 정의
		$(".scroll").mCustomScrollbar({
			scrollbarPosition : "outside"
			//theme:"dark"
		});
			
		
		
		// 선택보기 펼치고 닫기
		$("#popProcessList > li").click(function() {
			var index = $(this).index();
			//console.log(index);

			$("#popProcessList > li").each(function(i) {
				
				// 클릭한 단계와 동일하면 하위 단계 펼치기, 선택(active) class 추가
				if (index == i) {
					$("#popProcessList > li").eq(i).find("ul").css("display", "");
					$("#popProcessList > li").eq(i).addClass("active");
				}

				// 클릭한 단계가 아니면 하위단계 감추기, 선택(active) class 삭제, 하위 단계 선택 class 삭제
				else {
					$("#popProcessList > li").eq(i).find("ul").css("display", "none");
					$("#popProcessList > li").eq(i).removeAttr("class");
					$("#popProcessList > li").eq(i).find("ul > li > a").removeAttr("class");
				}
			});
			
		});

		// 선택보기 하위 단계 클릭
		$("#popProcessList > li > ul > li").click(function() {
			
			$(this).parent().find("li > a").removeAttr("class"); // 다른 하위다계 선택 class 삭제
			$(this).find("a").addClass("active");	// 선택한 단계 class (active) 추가
		});
	});

	
	// 월 이전, 다음 버튼
	function fnMonthChange(startDate) {
		window.location.href = "schedule_002.jsp?startDate="+startDate;
	}

	// 선택보기에서 선택한 프로세스 단계만 스케줄 화면에 표시
	function fnPopProcessStepView(code) {
		$(".process_unit > div").css("display","none");
		$(".process_unit > div."+code+"").css("display","");
	}
	

	// 팝업창 월 이동
	function fnPopMonthChange(startDate) { // startDate : 선택한 일자의 월 시작일자, 나머지 변수는 프로그래밍에서 필요한 변수 추가 가능
		fnPopupOpen("schedule_001_01.jsp?startDate="+startDate, "");	// ../js/popup.js 참고
	};
</script>


</head>


<div class="popup_guide popup_w1200">	
	<div class="popup_content">

		<div class="schedule_guide">
		
			<div class="schedule_all">
				<div class="schedule_top">
					<ul class="sc_title">
						<li><button type="button" class="prev" onclick="fnPopMonthChange('<%=strPrevDate%>');">이전</button></li>
						<li><strong><%=engMM%>., <%=yy%></strong></li>
						<li><a href="#" class="now"  onclick="fnPopMonthChange('<%=strCurrentDate%>');">현재날짜로 돌아가기</a></li>
						<li><button type="button" class="next" onclick="fnPopMonthChange('<%=strNextDate%>');">다음</button></li>
					</ul>
					<div class="project_tit">중소기업 기술혁신개발사업 (수출지향형) 2차 </div>					

					<a href="javascript:void(0)" class="closebtn4" onclick="fnPopupClose()">닫기</a>					
				</div>
				<!-- e :schedule_top -->
				
				<div class="month_guide">
					<ul class="week_tit">
						<li>SUN</li>
						<li>MON</li>
						<li>TUE</li>
						<li>WED</li>
						<li>THU</li>
						<li>FRI</li>
						<li>SAT</li>
					</ul>
					
							
					<div class="day_all scroll sbox_h700 ">
						<ul>
							<li><span class="inactive">27</span></li>
							<li><span class="inactive">28</span></li>
							<li><span class="inactive">29</span></li>
							<li><span class="inactive">30</span></li>
							<li><span>1</span></li>
							<li><span>2</span></li>
							<li><span>3</span></li>
						</ul>
						
						<!-- 
							======== 주별 높이 변경 ===============
							int ulHeight = 40 + (65 * 4);
							
							주별 사업의 갯수 1개 : int ulHeight = 40 + (65 * 1);
							주별 사업의 갯수 2개 : int ulHeight = 40 + (65 * 2);
							주별 사업의 갯수 3개 : int ulHeight = 40 + (65 * 3);
							주별 사업의 갯수 4개 : int ulHeight = 40 + (65 * 4);
							주별 사업의 갯수 5개 : int ulHeight = 40 + (65 * 5);
							.....
							주별 사업의 갯수 n개 : int ulHeight = 40 + (65 * n);
						-->
						<%
							int ulHeight = 40 + (65 * 4);
						%>
						<ul style="height: <%=ulHeight%>px;"> <!-- 주별 사업의 갯수가 4개인 경우 -->
							<li><span>4</span></li>
							<li><span class="today">5</span></li> <!-- 현재일 표시 class : today -->
							<li><span>6</span></li>
							<li><span>7</span></li>
							<li><span>8</span></li>
							<li><span>8</span></li>
							<li><span>10</span></li>

							
							<!--
								========== 각 사업 단계 div의  class 설명 ==================
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


							<!-- 주별 전체 사업 일정 div 시작 : 반드시 달력의 주 시작 태그 ul 안에 넣어주고, 일자 표시 li 밑에 넣어주세요. -->
							<div class="process_view">	

								<!-- 각 사업별 div 시작-->
								<div class="process_unit">	
									<!-- 각 사업의 단계 div 시작 -->
									<div class="sc_view01 view_past process_start1 process_len1 proc1 proc1-1">	
										<strong>PMS내 분과구성1</strong>
										<span>중소기업 기술혁신개발사업 (수출지향형) 2차</span>
									</div>
									<!-- 각 사업의 단계 div 종료 -->
									
									<!-- 각 사업의 단계 div 시작 -->
									<div class="sc_view01 view_now process_start3 process_len2 proc1 proc1-2">
										<strong>PMS내 분과구성2</strong>
										<span>중소기업 기술혁신개발사업 (수출지향형) 2차</span>
									</div>
									<!-- 각 사업의 단계 div 종료 -->
									
									<!-- 각 사업의 단계 div 시작 -->
									<div class="sc_view01 view_expect process_start7 process_len1 proc1 proc1-3">
										<strong>PMS내 분과구성3</strong>
										<span>중소기업 기술혁신개발사업 (수출지향형) 2차</span>
									</div>
									<!-- 각 사업의 단계 div 종료 -->
								</div>
								<!-- 각 사업별 div 종료 -->

								<!-- 각 사업별 div 시작-->
								<div class="process_unit">
									<!-- 각 사업의 단계 div 시작 -->
									<div class="sc_view01 view_inform process_start1 process_len3 proc2">
										<strong>PMS내 분과구성</strong>
										<span>중소기업 기술혁신개발사업 (수출지향형) 2차</span>
									</div>
									<!-- 각 사업의 단계 div 종료 -->
									
									<!-- 각 사업의 단계 div 시작 -->
									<div class="sc_view01 view_expect process_start5 process_len3 proc3">
										<strong>PMS내 분과구성</strong>
										<span>중소기업 기술혁신개발사업 (수출지향형) 2차</span>
									</div>
								</div>
								<!-- 각 사업별 div 종료 -->

								<!-- 각 사업별 div 시작-->
								<div class="process_unit">
									<!-- 각 사업의 단계 div 시작 -->
									<div class="sc_view01 view_now process_start2 process_len2 proc4  proc4-1">
										<strong>PMS내 분과구성</strong>
										<span>중소기업 기술혁신개발사업 (수출지향형) 2차</span>
									</div>
									<!-- 각 사업의 단계 div 종료 -->
									
									<!-- 각 사업의 단계 div 시작 -->
									<div class="sc_view01 view_expect process_start4 process_len3 proc4  proc4-2">
										<strong>PMS내 분과구성</strong>
										<span>중소기업 기술혁신개발사업 (수출지향형) 2차</span>
									</div>
									<!-- 각 사업의 단계 div 종료 -->
								</div>
								<!-- 각 사업별 div 종료 -->

								<!-- 각 사업별 div 시작-->
								<div class="process_unit">
									<!-- 각 사업의 단계 div 시작 -->
									<div class="sc_view01 view_inform process_start1 process_len7 proc4  proc4-3">
										<strong>PMS내 분과구성</strong>
										<span>중소기업 기술혁신개발사업 (수출지향형) 2차</span>
									</div>
									<!-- 각 사업의 단계 div 종료 -->
								</div>
								<!-- 각 사업별 div 종료 -->
							</div>
						</ul>

						<ul>
							<li><span>11</span></li>
							<li><span>12</span></li>
							<li><span>13</span></li>
							<li><span>14</span></li>
							<li><span>15</span></li>
							<li><span>16</span></li>
							<li><span>17</span></li>
						</ul>
						<ul>
							<li><span>18</span></li>
							<li><span>19</span></li>
							<li><span>20</span></li>
							<li><span>21</span></li>
							<li><span>22</span></li>
							<li><span>23</span></li>
							<li><span>24</span></li>
						</ul>
						<ul>
							<li><span>25</span></li>
							<li><span>26</span></li>
							<li><span>27</span></li>
							<li><span>28</span></li>
							<li><span>29</span></li>
							<li><span>30</span></li>
							<li><span>31</span></li>
						</ul>
					</div>
					
					
				</div>
				<!-- e :month_guide -->
			</div>
			<!-- e :schedule_all -->
		
			<!-- 선택보기 단계 표시 시작 -->
			<div class="process_guide">
				<div class="title">선택보기</div>
				<div class=" scroll sbox_h700">
					<ul class="process_list" id="popProcessList">
						<!-- 
							1. 각 프로세스 단계별 onclick 이벤트 추가
							2. 변수 (proc1, proc2, proc1-1, proc1-2 등)는 각 프로세스 단계를 구별할 수 있는 코드값 등을 입력
							3. 해당 코드값을 일정을 표시하는 ul에 class로 추가
						-->
						<li><a href="#" onclick="fnPopProcessStepView('proc1');">사업공고</a> 
							<ul style="display:none;">
								<li><a href="#" onclick="fnPopProcessStepView('proc1-1');">사업공고1</a></li>
								<li><a href="#" onclick="fnPopProcessStepView('proc1-2');">사업공고2</a></li>
								<li><a href="#" onclick="fnPopProcessStepView('proc1-3');">사업공고3</a></li>
							</ul>
						</li>
						<li><a href="#" onclick="fnPopProcessStepView('proc2');">과제접수</a></li>
						<li><a href="#" onclick="fnPopProcessStepView('proc3');">사전점검</a></li>
						<li><a href="#" onclick="fnPopProcessStepView('proc4');">서면평가</a>
							<ul style="display:none;">
								<li><a href="#" onclick="fnPopProcessStepView('proc4-1');">PMS 내 분과 구성</a></li>
								<li><a href="#" onclick="fnPopProcessStepView('proc4-2');">평가위원회 구성계획 수립</a></li>
								<li><a href="#" onclick="fnPopProcessStepView('proc4-3');">평가전문위원구성</a></li>
								<li><a href="#" onclick="fnPopProcessStepView('proc4-4');">구성결과등록</a></li>
								<li><a href="#" onclick="fnPopProcessStepView('proc4-5');">평가위원회 개최</a></li>
								<li><a href="#" onclick="fnPopProcessStepView('proc4-6');">개최공문발송</a></li>
								<li><a href="#" onclick="fnPopProcessStepView('proc4-7');">위원회개최 및 서류평가</a></li>
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

	</div>

</div>