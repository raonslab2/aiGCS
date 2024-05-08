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
<c:import url="/EmpPageLink.do?link=main/include/src" />

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
			fnPopupOpen("/empo/dashboard/eMAU00A0101check00101.do", "");	// ../js/popup.js 참고
		});
		
		// To-Do 일정 추가 버튼
		$(".btnToDoAdd").click(function() {
			fnPopupAddOpen("/empo/dashboard/eMAU00A0101TODO.do", "");	// ../js/popup.js 참고
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
			url:'/empo/dashboard/eMAU00A010100101schedule.do',
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
		fnPopupOpen("/empo/dashboard/eMAU00A010100102.do", "");	// ../js/popup.js 참고
	}

	// 스케줄 일정 클릭
	function fnScheduleListClick() {
		fnPopupOpen("/empo/dashboard/eMAU00A010100102.do", "");	// ../js/popup.js 참고
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
				<h3>Dashboard</h3>
                <c:import url="/EmpPageLink.do?link=main/include/top" />
			</div>
			<!-- 화면 상단 종료 -->
			
			<!-- s :contents_guide -->
			<div class="contents_guide ">
				<div class="dashboard_guide dashboard_detail">
					
					<h4>
                        <strong>Today</strong> <%=toDate.replace("-",".")%><span>(<%=strKorWeek%>)</span>
                        <b>
							<select name="searchGubun" id="searchGubun">
								<option value="1">담당사업</option>
								<option value="2">소속부서 전체</option>
								<option value="3">사업 전체</option> 
							</select>
						</b>
                    </h4>
					
					<div class="tasks_guide">
						<h5>Tasks</h5>
						
						<div class="btn_guide ar">
							<a href="/empo/dashboard/eMAU00A01Main.do" class="btn_style02 btn_white sb_style ">년도별 보기</a>
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
                            <div id="resultProcess">
                            </div>
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
				<!-- e :popup -->
					<!-- 프로세스 현황 팝업 보기 -->
					<div id="popupProcessState" class="Layer_popup" style="display:none;">
						<p class="left01"></p><!--왼쪽 말풍선인경우 class="left01" 변경-->
						<div class="popup_guide popup_w400 popup_type01 box_mh450">
							<a href="javascript:void(0)" class="closebtn btnPopupProcessStateClose">닫기</a>
							<div class="popup_content db_popup01">
								<h5 class="dashboard">접수현황 <strong>마감 <span class="txt_now">10</span></strong>일전</h5>
								<p>(2021.02.17 ~ 2021.03.09)</p>
								<ul>
									<li><p>전체과제 <span><b>390</b>건</span></p>
										<div>
											<strong>345건</strong>
											<span>제출완료</span>
										</div>
										<div>
											<strong>45건</strong>
											<span>접수처리</span>
										</div>
									</li>
									<li><p>기술분야별 <span><b>10</b>개분야</span></p></li>
								</ul>
					
								<p class="ar">접수현황 <button type="button" class="btn_style02 btn_green ml20" id="btnPopExcelDown">엑셀다운로드</button></p>
							</div>
							<!-- e :popup_content -->
						</div>
					
						<div class="popup_guide popup_w200 popup_type02 box_mh450">
							<a href="javascript:void(0)" class="closebtn btnPopupProcessStateClose">닫기</a>
							<div class="popup_content">
								<ul class="data_list03 mb30">
									<li><a href="#" onclick="fnScheduleChangePopOpen();">□ 일정변경</a></li>
									<li><a href="#" onclick="fnToDoPopOpen();">□ To-Do</a></li>
									<li><a href="#" onclick="fnCheckListPopOpen();">□ Check List 추가</a></li>
								</ul>
							</div>
							<!-- e :popup_content -->
						</div>
						
					</div>
 
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
<script>
;(function() { 
	$(function() {
		
		//프로세스 목록 출력
		initList(); 
		
	});
	
	$('#searchGubun').change(function() {
		var el = $(this);
		var data = el.val();
		var id = el.attr('id');
		 
		initList(); 
		
	});
	
	var initList = function() {
		//var formSer = $('#searchForm').serialize();   
		var searchTodayVal = getToday();
		var searchGubunValue = $('#searchGubun').val(); 
		$.post('/empo/dashboard/eMAU00A0101Task.do', {searchGubun:searchGubunValue,searchToday:searchTodayVal}).done(function(res) {
			$('.tasks_list').remove(); 
			res.list.forEach(function(row, index) {  
				$('#resultProcess').append(managerListView(row));
			});
			
		}).fail(function() {
			alert("실패");
		});
		
		//통계정보
		$.post('/empo/dashboard/eMAU00A0101Sum.do', {searchGubun:searchGubunValue,searchToday:searchTodayVal}).done(function(res) {
			
			$('#processSum').remove();
			res.list.forEach(function(row, index) {  
				$('#resultProcessSum').append(managerSumView(row));
			});
			
		}).fail(function() {
			alert("실패");
		});
	}
	
	var managerListView = function(row) {
		  
		var searchTodayVal = getToday();
		var searchPjCodeVal = row.pjCode; 
		
        var pcNameOne = "";
        var pcDayStartOne = "";
        var pcDayEndOne = "";
        $.ajaxSetup({ async:false });
		$.post('/empo/dashboard/eMAU00A0101TaskDetail.do', {searchToday:searchTodayVal,searchPjCode:searchPjCodeVal} ).done(function(res) {
	 
			res.list.forEach(function(row, index) {  
				//$('#resultProcess').append(managerListView(row));
				pcNameOne     = row.pcName;
				pcDayStartOne = row.pcDayStart;
				pcDayEndOne   = row.pcDayEnd;
			});
			
		}).fail(function() {
			alert("실패");
		});
		
	    var stDate = new Date(getToday());  
	    var endDate = new Date(pcDayStartOne); 
	    
	    var btMs  = endDate.getTime() - stDate.getTime();
	    var btDay = btMs / (1000*60*60*24)
	     
   
        
 
        var pcName = new Array(); 
        var pcOrderBy = new Array();
        var pcDayStart = new Array();
        var pcDayEnd = new Array();
        
        $.ajaxSetup({ async:false });
		$.post('/empo/dashboard/eMAU00A0101TaskProcess.do', {searchToday:searchTodayVal,searchPjCode:searchPjCodeVal} ).done(function(res) {
	        var i = 0;

			res.list.forEach(function(row, index) {  
				//$('#resultProcess').append(managerListView(row));
				pcName[i]     = row.pcName;
				pcOrderBy[i] = row.pcOrderBy;
				pcDayStart[i] = row.pcDayStart;
				pcDayEnd[i]   = row.pcDayEnd; 
				i++;
			});
			
		}).fail(function() {
			alert("실패");
		});
		

	    var tmStr = "";
	    var bg_now_val = "";
	    var bg_now_class = "";
	    for (var s = 0; s < 8; s++) { 
	    	bg_now_class = "";
	    	
	    	if(pcName[s] !=null){
	    		
	    		if(bg_now_val =="" && pcDayEnd[s] >= getToday()){ 
	    			bg_now_class = "bg_now";
	    			bg_now_val = "1";
	    		}else{
	    			bg_now_class = "";
	    		}
	    		
	    		
	    		
	    		tmStr = tmStr +" " + 
	    		"										<li><span class=\" "+bg_now_class+"  \"></span>\r\n" + 
	    		"											<p>"+pcName[s]+"</p>\r\n" + 
	    		"											<em>("+pcDayStart[s]+" ~ "+pcDayEnd[s]+")</em>\r\n" + 
	    		"										</li>\r\n" ;
	    	}else{
	    		tmStr = tmStr +"										<li><span></span>\r\n" + 
				"											<p></p>\r\n" + 
				"											<em></em>\r\n" + 
				"										</li>";
	    	}

	    	
		}
	 
	   
		
	    data = "							<div class=\"tasks_list active taskTopNow\"> <!-- 진행중 class : taskTopNow -->\r\n" + 
		"\r\n" + 
		"								\r\n" + 
		"								<!-- 사업 설명 -->\r\n" + 
		"								<ul class=\"tasks_info\">\r\n" + 
		"									<li class=\"date\">"+row.pcdayStart+"</li>\r\n" + 
		"									<li class=\"progress\">"+pcNameOne+" <strong class=\"txt_now\">"+btDay+"</strong>일전</li>\r\n" + 
		"									<li class=\"tit\">"+row.pjTitle+"</li>\r\n" + 
		"									<li class=\"t_period\">"+row.pjStart+" ~ "+row.pjEnd+"</li>\r\n" + 
		"								</ul>\r\n" + 
		"\r\n" + 
		"								<!-- 사업진행상황 -->\r\n" + 
		"								<div class=\"progress_guide\">\r\n" + 
		"									<div class=\"tit_txt\">STATUS <strong>접수</strong> | 완료일 <strong>D-22</strong> (21.05.31)</div>\r\n" + 
		"									<ul>\r\n" + 
		tmStr
		"									</ul>\r\n" + 
		"								</div>\r\n" + 
		"								<!-- e :progress_guide -->\r\n" + 
		"							</div>\r\n" + 
		"							<!-- e :tasks_list -->";
     
		return $(data);
		 
	}
	
	function getToday(){
	    var now = new Date();
	    var year = now.getFullYear();
	    var month = now.getMonth() + 1;    //1월이 0으로 되기때문에 +1을 함.
	    var date = now.getDate();

	    month = month >=10 ? month : "0" + month;
	    date  = date  >= 10 ? date : "0" + date;
	     // ""을 빼면 year + month (숫자+숫자) 됨.. ex) 2018 + 12 = 2030이 리턴됨.

	    //console.log(""+year + month + date);
	    return today = ""+year +"-"+ month +"-"+ date; 
	}
	
	
})();
</script>
</body>
</html>
