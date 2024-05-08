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

<!-- ì¤í¬ë¡¤ë° -->
<link href="../../css/jquery.mCustomScrollbar.css" rel="stylesheet">
<script type="text/javascript" src="../../js/jquery.mCustomScrollbar.concat.min.js"></script>
<script type="text/javascript" src="../../js/scroll.js"></script>

<!-- datepicker -->
<link href="../../css/datepicker.css" rel="stylesheet" type="text/css">
<script src="../../js/datepicker.js"></script>
<script src="../../js/datepicker.ko.js"></script>


<!-- timepicker -->
<link href="../../css/jquery.timepicker.css" rel="stylesheet" type="text/css">
<script src="../../js/jquery.timepicker.js"></script>


<script type="text/javascript">
	$(document).ready(function() {	
		
		// 현재월 표시 호출
		fnNowMonthView();
		
		
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


	});
	
	// 현재월(month) 표시 : 상단 월 표시 및 각 사업별 현재월 표시
	function fnNowMonthView() {
		//년도
		var now = new Date();	// 현재 날짜 및 시간
		var year = now.getFullYear();	// 연도
		var month = now.getMonth();	// 월
		
		 
		var m = month;	// 현재월 숫자 변환
		
		var myArray = {1: "JAN", 2: "FEB", 3: "MAR", 4: "APR", 5: "MAY", 6: "JUN", 7: "JUL", 8: "AUG", 9: "SEP", 10: "OCT", 11: "NOV", 12: "DEC"  };
        var monthData = myArray[month]; 
        $( '#mYear' ).text( year);
        $( '#pjYear' ).val( year);
      
        $('#mMonth').text(monthData);
        
        var tmMonth = "";
        if(month<10){
        	tmMonth = "0"+month
        }else{
        	tmMonth = month
        }
        $('#mMonth2').text(tmMonth); 
	 
	}
	
    function mMonth(tmp) { 
        var tmYear =  $( '#mYear' ).text();
        tmYear = Number(tmYear) + Number(tmp);
        $( '#mYear' ).text( tmYear);
        $( '#pjYear' ).val( tmYear);
        
        
        selectList();
       // $('#mMonth').text(monthData);
      }


	
	// 주 이전, 다음 버튼
	function fnWeekChange(startDate) {
		window.location.href = "schedule_003.jsp?startDate="+startDate;
	}

	// 선택보기에서 선택한 프로세스 단계만 스케줄 화면에 표시
	function fnProcessStepView(code) {
		$(".process_view > ul").css("display","none");
		$(".process_view > ul."+code+"").css("display","");
	}
</script>

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
				
					<div class="schedule_all">
						<div class="schedule_top">
							<ul class="sc_title">
								<li><button type="button" class="prev" onclick="mMonth('-1')">이전</button></li> 
								<li><strong><span id="mMonth" name="mMonth" ></span> <span id="mMonth2" name="mMonth2" ></span>, <span id="mYear" name="mYear" ></span></strong></li>
								<li><a href="schedule_001.jsp?yy=2021" class="now">현재날짜로 돌아가기</a></li>
								<li><button type="button" class="next" onclick="mMonth('1')">다음</button></li>
							</ul>
							<ul class="view_btn">
						<li><a href="<c:url value='/'/>empo/schedule/eMAU00B01Main.do" >YEAR</a></li>
						<li><a href="<c:url value='/'/>empo/schedule/eMAU00B02Main.do">MONTH</a></li>
						<li><a href="<c:url value='/'/>empo/schedule/eMAU00B03Main.do" class="active">WEEK</a></li>
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
									
											<li>Sun<span>07/11</span></li>
									
											<li>Mon<span>07/12</span></li>
									
											<li>Tue<span>07/13</span></li>
									
											<li>Wed<span>07/14</span></li>
									
											<li>Thu<span>07/15</span></li>
									
											<li>Fri<span>07/16</span></li>
									
											<li>Sat<span>07/17</span></li>
									
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
									
								========== ul class 설명 ==================
								1. 프로세스 단계 class 추가 : 하단의 선택보기의 각 프로세스 단계의 코드값 등과 동일한 class명을 추가한다. (proc1, proc2, proc1-1, proc1-2 등)
							-->
							
							<div class="time_all scroll sbox_h700">
								<div class="time_list">
									<div class="time_view">
										<span>09:00 AM</span> 
										<span>18:00 PM</span>
									</div>

									<div class="process_view">
										<!-- 프로세스 한개에 ul 한개 설정 -->
										<ul class="proc1 proc1-1">										
											<li class="sc_view01 view_inform process_start1 process_len7">
												<strong>PMS내 분과구성</strong>
												<span>중소기업 기술혁신개발사업 (수출지향형) 2차중소기업 기술혁신개발사업 (수출지향형) 2차중소기업 기술혁신개발사업 (수출지향형) 2차중소기업 기술혁신개발사업 (수출지향형) 2차중소기업 기술혁신개발사업 (수출지향형) 2차</span>
											</li>
										</ul>
										
										<!-- 프로세스 한개에 ul 한개 설정 -->
										<ul class="proc1 proc1-2">										
											<li class="sc_view01 view_now process_start7 process_len1">
												<strong>평가위원회 구성계획 수립, 평가전문위원 구성 평가위원회 구성계획 수립, 평가전문위원 구성 </strong>
												<span>중소기업 기술혁신개발사업 (수출지향형) 2차</span>
											</li>
										</ul>
										
										<!-- 프로세스 한개에 ul 한개 설정 -->
										<ul class="proc2">						
											<li class="sc_view01 view_past process_start4 process_len3">
												<strong>구성결과 등록</strong>
												<span>중소기업 기술혁신개발사업 (수출지향형) 2차</span>
											</li>
										</ul>

										<!-- 프로세스 한개에 ul 한개 설정 -->
										<ul class="proc3">		
											<li class="sc_view01 view_expect process_start3 process_len4">
												<strong>서면평가</strong>
												<span>중소기업 기술혁신개발사업 (수출지향형) 2차 중소기업 기술혁신개발사업 (수출지향형) 2차 중소기업 기술혁신개발사업 (수출지향형) 2차</span>
											</li>
										</ul>
									</div>
								</div>
								<!-- e :time_list -->

								

										<div class="time_list  ">
											<div class="time_view">
												<span>09:00 AM</span> 
											</div>
											
											<div class="process_view">
												
												<!-- 프로세스 한개에 ul 한개 설정 -->
												<ul class="proc4  proc4-1">										
													<li class="sc_view01 view_inform process_start1 process_len1">
														<strong>평가위원회 구성계획 수립, 평가전문위원 구성 평가위원회 구성계획 수립, 평가전문위원 구성 </strong>
														<span>중소기업 기술혁신개발사업 (수출지향형) 2차</span>
													</li>
												</ul>

												<!-- 프로세스 한개에 ul 한개 설정 -->
												<ul class="proc4 proc4-2">										
													<li class="sc_view01 view_now process_start3 process_len3">
														<strong>평가위원회 구성계획 수립, 평가전문위원 구성 평가위원회 구성계획 수립, 평가전문위원 구성 </strong>
														<span>중소기업 기술혁신개발사업 (수출지향형) 2차</span>
													</li>
												</ul>

												<!-- 프로세스 한개에 ul 한개 설정 -->
												<ul class="proc4 proc4-3">							
													<li class="sc_view01 view_expect process_start7 process_len1">
														<strong>평가위원회 구성계획 수립, 평가전문위원 구성 평가위원회 구성계획 수립, 평가전문위원 구성 </strong>
														<span>중소기업 기술혁신개발사업 (수출지향형) 2차</span>
													</li>
												</ul>
											</div>
										</div>
								

										<div class="time_list  ">
											<div class="time_view">
												<span>10:00 AM</span> 
											</div>
											
											<div class="process_view">
												
												<!-- 프로세스 한개에 ul 한개 설정 -->
												<ul class="proc4  proc4-1">										
													<li class="sc_view01 view_inform process_start1 process_len1">
														<strong>평가위원회 구성계획 수립, 평가전문위원 구성 평가위원회 구성계획 수립, 평가전문위원 구성 </strong>
														<span>중소기업 기술혁신개발사업 (수출지향형) 2차</span>
													</li>
												</ul>

												<!-- 프로세스 한개에 ul 한개 설정 -->
												<ul class="proc4 proc4-2">										
													<li class="sc_view01 view_now process_start3 process_len3">
														<strong>평가위원회 구성계획 수립, 평가전문위원 구성 평가위원회 구성계획 수립, 평가전문위원 구성 </strong>
														<span>중소기업 기술혁신개발사업 (수출지향형) 2차</span>
													</li>
												</ul>

												<!-- 프로세스 한개에 ul 한개 설정 -->
												<ul class="proc4 proc4-3">							
													<li class="sc_view01 view_expect process_start7 process_len1">
														<strong>평가위원회 구성계획 수립, 평가전문위원 구성 평가위원회 구성계획 수립, 평가전문위원 구성 </strong>
														<span>중소기업 기술혁신개발사업 (수출지향형) 2차</span>
													</li>
												</ul>
											</div>
										</div>
								

										<div class="time_list  ">
											<div class="time_view">
												<span>11:00 AM</span> 
											</div>
											
											<div class="process_view">
												
												<!-- 프로세스 한개에 ul 한개 설정 -->
												<ul class="proc4  proc4-1">										
													<li class="sc_view01 view_inform process_start1 process_len1">
														<strong>평가위원회 구성계획 수립, 평가전문위원 구성 평가위원회 구성계획 수립, 평가전문위원 구성 </strong>
														<span>중소기업 기술혁신개발사업 (수출지향형) 2차</span>
													</li>
												</ul>

												<!-- 프로세스 한개에 ul 한개 설정 -->
												<ul class="proc4 proc4-2">										
													<li class="sc_view01 view_now process_start3 process_len3">
														<strong>평가위원회 구성계획 수립, 평가전문위원 구성 평가위원회 구성계획 수립, 평가전문위원 구성 </strong>
														<span>중소기업 기술혁신개발사업 (수출지향형) 2차</span>
													</li>
												</ul>

												<!-- 프로세스 한개에 ul 한개 설정 -->
												<ul class="proc4 proc4-3">							
													<li class="sc_view01 view_expect process_start7 process_len1">
														<strong>평가위원회 구성계획 수립, 평가전문위원 구성 평가위원회 구성계획 수립, 평가전문위원 구성 </strong>
														<span>중소기업 기술혁신개발사업 (수출지향형) 2차</span>
													</li>
												</ul>
											</div>
										</div>
								

										<div class="time_list  ">
											<div class="time_view">
												<span>12:00 PM</span> 
											</div>
											
											<div class="process_view">
												
												<!-- 프로세스 한개에 ul 한개 설정 -->
												<ul class="proc4  proc4-1">										
													<li class="sc_view01 view_inform process_start1 process_len1">
														<strong>평가위원회 구성계획 수립, 평가전문위원 구성 평가위원회 구성계획 수립, 평가전문위원 구성 </strong>
														<span>중소기업 기술혁신개발사업 (수출지향형) 2차</span>
													</li>
												</ul>

												<!-- 프로세스 한개에 ul 한개 설정 -->
												<ul class="proc4 proc4-2">										
													<li class="sc_view01 view_now process_start3 process_len3">
														<strong>평가위원회 구성계획 수립, 평가전문위원 구성 평가위원회 구성계획 수립, 평가전문위원 구성 </strong>
														<span>중소기업 기술혁신개발사업 (수출지향형) 2차</span>
													</li>
												</ul>

												<!-- 프로세스 한개에 ul 한개 설정 -->
												<ul class="proc4 proc4-3">							
													<li class="sc_view01 view_expect process_start7 process_len1">
														<strong>평가위원회 구성계획 수립, 평가전문위원 구성 평가위원회 구성계획 수립, 평가전문위원 구성 </strong>
														<span>중소기업 기술혁신개발사업 (수출지향형) 2차</span>
													</li>
												</ul>
											</div>
										</div>
								

										<div class="time_list  ">
											<div class="time_view">
												<span>13:00 PM</span> 
											</div>
											
											<div class="process_view">
												
												<!-- 프로세스 한개에 ul 한개 설정 -->
												<ul class="proc4  proc4-1">										
													<li class="sc_view01 view_inform process_start1 process_len1">
														<strong>평가위원회 구성계획 수립, 평가전문위원 구성 평가위원회 구성계획 수립, 평가전문위원 구성 </strong>
														<span>중소기업 기술혁신개발사업 (수출지향형) 2차</span>
													</li>
												</ul>

												<!-- 프로세스 한개에 ul 한개 설정 -->
												<ul class="proc4 proc4-2">										
													<li class="sc_view01 view_now process_start3 process_len3">
														<strong>평가위원회 구성계획 수립, 평가전문위원 구성 평가위원회 구성계획 수립, 평가전문위원 구성 </strong>
														<span>중소기업 기술혁신개발사업 (수출지향형) 2차</span>
													</li>
												</ul>

												<!-- 프로세스 한개에 ul 한개 설정 -->
												<ul class="proc4 proc4-3">							
													<li class="sc_view01 view_expect process_start7 process_len1">
														<strong>평가위원회 구성계획 수립, 평가전문위원 구성 평가위원회 구성계획 수립, 평가전문위원 구성 </strong>
														<span>중소기업 기술혁신개발사업 (수출지향형) 2차</span>
													</li>
												</ul>
											</div>
										</div>
								

										<div class="time_list  ing_time">
											<div class="time_view">
												<span>14:00 PM</span> 
											</div>
											
											<div class="process_view">
												
												<!-- 프로세스 한개에 ul 한개 설정 -->
												<ul class="proc4  proc4-1">										
													<li class="sc_view01 view_inform process_start1 process_len1">
														<strong>평가위원회 구성계획 수립, 평가전문위원 구성 평가위원회 구성계획 수립, 평가전문위원 구성 </strong>
														<span>중소기업 기술혁신개발사업 (수출지향형) 2차</span>
													</li>
												</ul>

												<!-- 프로세스 한개에 ul 한개 설정 -->
												<ul class="proc4 proc4-2">										
													<li class="sc_view01 view_now process_start3 process_len3">
														<strong>평가위원회 구성계획 수립, 평가전문위원 구성 평가위원회 구성계획 수립, 평가전문위원 구성 </strong>
														<span>중소기업 기술혁신개발사업 (수출지향형) 2차</span>
													</li>
												</ul>

												<!-- 프로세스 한개에 ul 한개 설정 -->
												<ul class="proc4 proc4-3">							
													<li class="sc_view01 view_expect process_start7 process_len1">
														<strong>평가위원회 구성계획 수립, 평가전문위원 구성 평가위원회 구성계획 수립, 평가전문위원 구성 </strong>
														<span>중소기업 기술혁신개발사업 (수출지향형) 2차</span>
													</li>
												</ul>
											</div>
										</div>
								

										<div class="time_list  ">
											<div class="time_view">
												<span>15:00 PM</span> 
											</div>
											
											<div class="process_view">
												
												<!-- 프로세스 한개에 ul 한개 설정 -->
												<ul class="proc4  proc4-1">										
													<li class="sc_view01 view_inform process_start1 process_len1">
														<strong>평가위원회 구성계획 수립, 평가전문위원 구성 평가위원회 구성계획 수립, 평가전문위원 구성 </strong>
														<span>중소기업 기술혁신개발사업 (수출지향형) 2차</span>
													</li>
												</ul>

												<!-- 프로세스 한개에 ul 한개 설정 -->
												<ul class="proc4 proc4-2">										
													<li class="sc_view01 view_now process_start3 process_len3">
														<strong>평가위원회 구성계획 수립, 평가전문위원 구성 평가위원회 구성계획 수립, 평가전문위원 구성 </strong>
														<span>중소기업 기술혁신개발사업 (수출지향형) 2차</span>
													</li>
												</ul>

												<!-- 프로세스 한개에 ul 한개 설정 -->
												<ul class="proc4 proc4-3">							
													<li class="sc_view01 view_expect process_start7 process_len1">
														<strong>평가위원회 구성계획 수립, 평가전문위원 구성 평가위원회 구성계획 수립, 평가전문위원 구성 </strong>
														<span>중소기업 기술혁신개발사업 (수출지향형) 2차</span>
													</li>
												</ul>
											</div>
										</div>
								

										<div class="time_list  ">
											<div class="time_view">
												<span>16:00 PM</span> 
											</div>
											
											<div class="process_view">
												
												<!-- 프로세스 한개에 ul 한개 설정 -->
												<ul class="proc4  proc4-1">										
													<li class="sc_view01 view_inform process_start1 process_len1">
														<strong>평가위원회 구성계획 수립, 평가전문위원 구성 평가위원회 구성계획 수립, 평가전문위원 구성 </strong>
														<span>중소기업 기술혁신개발사업 (수출지향형) 2차</span>
													</li>
												</ul>

												<!-- 프로세스 한개에 ul 한개 설정 -->
												<ul class="proc4 proc4-2">										
													<li class="sc_view01 view_now process_start3 process_len3">
														<strong>평가위원회 구성계획 수립, 평가전문위원 구성 평가위원회 구성계획 수립, 평가전문위원 구성 </strong>
														<span>중소기업 기술혁신개발사업 (수출지향형) 2차</span>
													</li>
												</ul>

												<!-- 프로세스 한개에 ul 한개 설정 -->
												<ul class="proc4 proc4-3">							
													<li class="sc_view01 view_expect process_start7 process_len1">
														<strong>평가위원회 구성계획 수립, 평가전문위원 구성 평가위원회 구성계획 수립, 평가전문위원 구성 </strong>
														<span>중소기업 기술혁신개발사업 (수출지향형) 2차</span>
													</li>
												</ul>
											</div>
										</div>
								

										<div class="time_list  ">
											<div class="time_view">
												<span>17:00 PM</span> 
											</div>
											
											<div class="process_view">
												
												<!-- 프로세스 한개에 ul 한개 설정 -->
												<ul class="proc4  proc4-1">										
													<li class="sc_view01 view_inform process_start1 process_len1">
														<strong>평가위원회 구성계획 수립, 평가전문위원 구성 평가위원회 구성계획 수립, 평가전문위원 구성 </strong>
														<span>중소기업 기술혁신개발사업 (수출지향형) 2차</span>
													</li>
												</ul>

												<!-- 프로세스 한개에 ul 한개 설정 -->
												<ul class="proc4 proc4-2">										
													<li class="sc_view01 view_now process_start3 process_len3">
														<strong>평가위원회 구성계획 수립, 평가전문위원 구성 평가위원회 구성계획 수립, 평가전문위원 구성 </strong>
														<span>중소기업 기술혁신개발사업 (수출지향형) 2차</span>
													</li>
												</ul>

												<!-- 프로세스 한개에 ul 한개 설정 -->
												<ul class="proc4 proc4-3">							
													<li class="sc_view01 view_expect process_start7 process_len1">
														<strong>평가위원회 구성계획 수립, 평가전문위원 구성 평가위원회 구성계획 수립, 평가전문위원 구성 </strong>
														<span>중소기업 기술혁신개발사업 (수출지향형) 2차</span>
													</li>
												</ul>
											</div>
										</div>
								

										<div class="time_list  ">
											<div class="time_view">
												<span>18:00 PM</span> 
											</div>
											
											<div class="process_view">
												
												<!-- 프로세스 한개에 ul 한개 설정 -->
												<ul class="proc4  proc4-1">										
													<li class="sc_view01 view_inform process_start1 process_len1">
														<strong>평가위원회 구성계획 수립, 평가전문위원 구성 평가위원회 구성계획 수립, 평가전문위원 구성 </strong>
														<span>중소기업 기술혁신개발사업 (수출지향형) 2차</span>
													</li>
												</ul>

												<!-- 프로세스 한개에 ul 한개 설정 -->
												<ul class="proc4 proc4-2">										
													<li class="sc_view01 view_now process_start3 process_len3">
														<strong>평가위원회 구성계획 수립, 평가전문위원 구성 평가위원회 구성계획 수립, 평가전문위원 구성 </strong>
														<span>중소기업 기술혁신개발사업 (수출지향형) 2차</span>
													</li>
												</ul>

												<!-- 프로세스 한개에 ul 한개 설정 -->
												<ul class="proc4 proc4-3">							
													<li class="sc_view01 view_expect process_start7 process_len1">
														<strong>평가위원회 구성계획 수립, 평가전문위원 구성 평가위원회 구성계획 수립, 평가전문위원 구성 </strong>
														<span>중소기업 기술혁신개발사업 (수출지향형) 2차</span>
													</li>
												</ul>
											</div>
										</div>
								
							</div>
						</div>
						
					</div>
					<!-- e :schedule_all -->
				
					<!-- 선택보기 단계 표시 시작 -->
					<div class="process_guide">
						<div class="title">선택보기</div>
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
					<!-- 선택보기 단계 표시 종료 -->
					
					
				</div>
				<!-- e :schedule_guide -->
					
			</div>
			<!-- e :contents_guide -->
		</div>
		<!-- e :right_guide -->
	</div>
	<!-- e :wrap -->
</body>
</html>
