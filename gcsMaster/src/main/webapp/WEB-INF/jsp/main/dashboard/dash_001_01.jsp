<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="java.util.Calendar"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%

	SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");	
	Calendar calendar = Calendar.getInstance();	
	String toDate = sf.format(calendar.getTime());	// 오늘	
	
	int intTodayWeek = calendar.get(Calendar.DAY_OF_WEEK); 
	String strKorWeek = "";
	switch(intTodayWeek) {
		case 1: 
			strKorWeek= "일";
			break;
		case 2: 
			strKorWeek= "월"; 
			break;
		case 3: 
			strKorWeek= "화"; 
			break;
		case 4: 
			strKorWeek= "수"; 
			break;
		case 5: 
			strKorWeek= "목"; 
			break;
		case 6: 
			strKorWeek= "금"; 
			break;
		case 7: 
			strKorWeek= "토"; 
			break;
	};
	
%>

<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>TIPA 스케쥴기반 평가관리시스템</title>
<%@ include file = "../include/src.jsp" %>

<script type="text/javascript">
	$(document).ready(function() {	

		// Check List 삭제 버튼
		$(".btnCheckListDelete").click(function() {
			if ($("input[name=chkList]:checkbox:checked").length == 0) {
				alert("Check List에서 삭제할 정보를 선택해 주세요.");
				return false;
			} else {
				// check List 삭제 프로세스 삽입
				alert("Check List 삭제 진행됩니다.");
				return false;
			}
		});

		// Check List 추가 버튼
		$(".btnCheckListAdd").click(function() {
			fnPopupOpen("check_001_01.jsp", "");	// ../js/popup.js 참고
		});
		
		// To-Do 일정 추가 버튼
		$(".btnToDoAdd").click(function() {
			fnPopupAddOpen("todo_001.jsp", "");	// ../js/popup.js 참고
		});
		
		// 프로세스 현황 팝업 오픈
		$(".progress_guide > ul > li > span").css("cursor","pointer");
		$(".progress_guide > ul > li > span").click(function(e) {

			var w = window.innerWidth;
			//console.log(w);

			// 마우스 클릭 위치 가져오기
			var divTop = e.clientY - 55; // 상단 좌표 위치 안맞을시 e.pageY 
			var divLeft = e.clientX + 10; // 좌측 좌표 위치 안맞을시 e.pageX
			
			if ((w - divLeft) < 700) {	// 피드백 영역에서는 메뉴의 말풍선이 오른쪽으로 보이게 설정 변경
				divLeft = divLeft - 640;
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

		
		// 스케줄 날짜 및 일정 표시 함수
		fnScheduleDateChange('<%=toDate%>');
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

	// 스케줄 날짜 및 일정 표시 함수
	function fnScheduleDateChange(newDate) {
		//alert(newDate);
		$.ajax({
			url:'dash_001_01_schedule.jsp',
			data : 'newDate='+newDate,
			type:'POST',
			dataType:'html',
			success:function(data){
				$(".day_guide").html(data);

			},error:function(a,b,c){
				console.log(a,b,c);
			}
		});
	}

	
	// 스케줄 날짜 클릭
	function fnScheduleDateClick() {
		fnPopupOpen("dash_001_02.jsp", "");	// ../js/popup.js 참고
	}

	// 스케줄 일정 클릭
	function fnScheduleListClick() {
		fnPopupOpen("dash_001_02.jsp", "");	// ../js/popup.js 참고
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
			<div class="contents_guide ">
				<div class="dashboard_guide dashboard_detail">
					
					<h4>
                        <strong>Today</strong> <%=toDate.replace("-",".")%><span>(<%=strKorWeek%>)</span>
                        <b>
							<select>
								<option>담당사업</option>
								<option>소속부서 전체</option>
								<option>사업 전체</option>
							</select>
						</b>
                    </h4>
					
					<div class="tasks_guide">
						<h5>Tasks</h5>
						
						<div class="btn_guide ar">
							<a href="../EMAU00B01/schedule_001.jsp" class="btn_style02 btn_white sb_style ">년도별 보기</a>
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

						<div class="tasks_list_all scroll sbox_h600">
							
							<!-- 
								tasks_list : 사업별 목록 class
								active : 활성화된 사업목록 class
							-->
							<div class="tasks_list active taskTopNow"> <!-- 진행중 class : taskTopNow -->
								
								<!-- 사업 설명 -->
								<ul class="tasks_info">
									<li class="date">05.16 2021</li>
									<li class="progress">접수마감 <strong class="txt_now">10</strong>일전</li>
									<li class="tit">2021년 생활혁신형 기술혁신개발사업 수출지향형 1차 시행계획 공고</li>
									<li class="t_period">2021.02.10 ~ 2021.03.10</li>
								</ul>

								<!-- 사업진행상황 -->
								<div class="progress_guide">
									<div class="tit_txt">STATUS <strong>접수</strong> | 완료일 <strong>D-22</strong> (21.05.31)</div>
									<ul>
										<li><span class="bg_past"></span>
											<p>사업공고</p>
											<em>(21.5.01)</em>
										</li>
										<li><span class="bg_now"></span>
											<p>접수기간</p>
											<em>(21.5.01 ~ 21.05.31)</em>
										</li>
										<li><span></span>
											<p>서면평가</p>
											<em>(21.5.01)<br>홍보 6/22</em>
										</li>
										<li><span></span>
											<p>대명평가</p>
											<em>(21.5.01)<br>홍보 6/22</em>
										</li>
										<li><span></span>
											<p>협약</p>
											<em>(21.5.01 ~ 21.05.31)</em>
										</li>
										<li><span></span>
											<p>사업비지급</p>
											<em>(21.5.01 ~ 21.05.31)</em>
										</li>
										<li><span></span>
											<p>진도점검</p>
											<em>(21.5.01 ~ 21.05.31)</em>
										</li>
										<li><span></span>
											<p>최종점검</p>
											<em>(21.5.01 ~ 21.05.31)</em>
										</li>
									</ul>
								</div>
								<!-- e :progress_guide -->
							</div>
							<!-- e :tasks_list -->
							
							<div class="tasks_list taskTopExpect"> <!-- 예정 class : taskTopExpect -->
								<ul class="tasks_info">
									<li class="date">05.16 2021</li>
									<li class="progress">서면평가 <strong class="txt_now">5</strong>일전</li>
									<li class="tit">2021년 생활혁신형 기술혁신개발사업 수출지향형 1차 시행계획 공고</li>
									<li class="t_period">2021.02.10 ~ 2021.03.10</li>
								</ul>
								<div class="progress_guide">
									<div class="tit_txt">STATUS <strong>서면평</strong> | 완료일 <strong>D-7</strong> (21.05.31)</div>
									<ul>
										<li><span class="bg_past"></span>
											<p>사업공고</p>
											<em>(21.5.01)</em>
										</li>
										<li><span class="bg_past"></span>
											<p>접수기간</p>
											<em>(21.5.01 ~ 21.05.31)</em>
										</li>
										<li><span class="bg_now"></span>
											<p>서면평가</p>
											<em>(21.5.01)<br>홍보 6/22</em>
										</li>
										<li><span></span>
											<p>대명평가</p>
											<em>(21.5.01)<br>홍보 6/22</em>
										</li>
										<li><span></span>
											<p>협약</p>
											<em>(21.5.01 ~ 21.05.31)</em>
										</li>
										<li><span></span>
											<p>사업비지급</p>
											<em>(21.5.01 ~ 21.05.31)</em>
										</li>
										<li><span></span>
											<p>진도점검</p>
											<em>(21.5.01 ~ 21.05.31)</em>
										</li>
										<li><span></span>
											<p>최종점검</p>
											<em>(21.5.01 ~ 21.05.31)</em>
										</li>
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
									<div class="tit_txt">STATUS <strong>사업공고</strong> | 완료일 <strong>D-22</strong> (21.05.31)</div>
									<ul>
										<li><span></span>
											<p>사업공고</p>
											<em>(21.5.01)</em>
										</li>
										<li><span></span>
											<p>접수기간</p>
											<em>(21.5.01 ~ 21.05.31)</em>
										</li>
										<li><span></span>
											<p>서면평가</p>
											<em>(21.5.01)<br>홍보 6/22</em>
										</li>
										<li><span></span>
											<p>대명평가</p>
											<em>(21.5.01)<br>홍보 6/22</em>
										</li>
										<li><span></span>
											<p>협약</p>
											<em>(21.5.01 ~ 21.05.31)</em>
										</li>
										<li><span></span>
											<p>사업비지급</p>
											<em>(21.5.01 ~ 21.05.31)</em>
										</li>
										<li><span></span>
											<p>진도점검</p>
											<em>(21.5.01 ~ 21.05.31)</em>
										</li>
										<li><span></span>
											<p>최종점검</p>
											<em>(21.5.01 ~ 21.05.31)</em>
										</li>
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
									<div class="tit_txt">STATUS <strong>최종점검</strong> | 완료일 <strong>D+12</strong> (21.05.31)</div>
									<ul>
										<li><span class="bg_past"></span>
											<p>사업공고</p>
											<em>(21.5.01)</em>
										</li>
										<li><span class="bg_past"></span>
											<p>접수기간</p>
											<em>(21.5.01 ~ 21.05.31)</em>
										</li>
										<li><span class="bg_past"></span>
											<p>서면평가</p>
											<em>(21.5.01)<br>홍보 6/22</em>
										</li>
										<li><span class="bg_past"></span>
											<p>대명평가</p>
											<em>(21.5.01)<br>홍보 6/22</em>
										</li>
										<li><span class="bg_past"></span>
											<p>협약</p>
											<em>(21.5.01 ~ 21.05.31)</em>
										</li>
										<li><span class="bg_past"></span>
											<p>사업비지급</p>
											<em>(21.5.01 ~ 21.05.31)</em>
										</li>
										<li><span class="bg_past"></span>
											<p>진도점검</p>
											<em>(21.5.01 ~ 21.05.31)</em>
										</li>
										<li><span class="bg_past"></span>
											<p>최종점검</p>
											<em>(21.5.01 ~ 21.05.31)</em>
										</li>
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
									<div class="tit_txt">STATUS <strong>사업공고</strong> | 완료일 <strong>D-0</strong> (21.05.31)</div>
									<ul>
										<li><span class="bg_now"></span>
											<p>사업공고</p>
											<em>(21.5.01)</em>
										</li>
										<li><span></span>
											<p>접수기간</p>
											<em>(21.5.01 ~ 21.05.31)</em>
										</li>
										<li><span></span>
											<p>서면평가</p>
											<em>(21.5.01)<br>홍보 6/22</em>
										</li>
										<li><span></span>
											<p>대명평가</p>
											<em>(21.5.01)<br>홍보 6/22</em>
										</li>
										<li><span></span>
											<p>협약</p>
											<em>(21.5.01 ~ 21.05.31)</em>
										</li>
										<li><span></span>
											<p>사업비지급</p>
											<em>(21.5.01 ~ 21.05.31)</em>
										</li>
										<li><span></span>
											<p>진도점검</p>
											<em>(21.5.01 ~ 21.05.31)</em>
										</li>
										<li><span></span>
											<p>최종점검</p>
											<em>(21.5.01 ~ 21.05.31)</em>
										</li>
									</ul>
								</div>
								<!-- e :progress_guide -->
							</div>
							<!-- e :tasks_list -->
						</div>
						<!-- e :tasks_list_all -->
						
					</div>
					<!-- e :tasks_guide -->
					
					<div class="check_guide">
						
						<div class="check_list">
							<h5>Check List</h5>
							
							<div class="btn_guide ar">
								<a href="#" class="btn_style02 btn_white sb_style btnCheckListDelete">삭제</a>
								<a href="#" class="btn_style02 btn_blue sb_style btnCheckListAdd">추가</a>
							</div>
							<ul class="scroll sbox_h150">
								<li><input type="checkbox" name="chkList" checked> <span class="line_yes">공고별 특성등록 및 특이사항 확인</span></li> <!-- line_yes : 제목에 라인 그어줌 -->
								<li><input type="checkbox" name="chkList" checked> <span class="line_yes">평가표 갱신 요청 및 확인</span></li>
								<li><input type="checkbox" name="chkList"> <span>접수마감처리</span></li>
								<li><input type="checkbox" name="chkList"> <span>자동제출여부확인</span></li>
								<li><input type="checkbox" name="chkList"> <span>중복성 검토 확인</span></li>
								<li><input type="checkbox" name="chkList"> <span>접수마감처리</span></li>
								<li><input type="checkbox" name="chkList"> <span>자동제출여부확인</span></li>
								<li><input type="checkbox" name="chkList"> <span>중복성 검토 확인</span></li>
							</ul>
						</div>
						
						<div class="btn_todo_add">
							<a href="#" class="btnToDoAdd"><span>TO-DO 일정추가</span></a>
						</div>
						
						<!-- s : 주간 스케줄 표 -->
						<div class="day_guide"> <!-- fnScheduleDateChange() 함수 호출로 자동 표시 : ajax 처리 dash_001_01_schedule.jsp 파일 -->							
						</div>
						<!-- e :day_guide -->
						
					</div>
					<!-- e :check_guide -->
					
				</div>
				<!-- e :dashboard_guide -->
				
				<!-- s: 프로세스 현황 팝업 -->
				<%@ include file = "dash_001_03.jsp" %>
                <!-- e :popup -->
					
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
