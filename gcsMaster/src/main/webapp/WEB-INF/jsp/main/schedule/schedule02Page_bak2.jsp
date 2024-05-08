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
</head>

<style>
	.calendar {
		width: 100%;
		height: 700px;
		border: 1px solid #444444;
		border-collapse: collapse;
		}
		
	.calendar td{ padding: 10px 0.5%; border-bottom: 1px solid #ddd; border-left: 1px solid #ddd; font-weight:300;} {
		width: 100%;
		height: 700px;
		border: 1px solid #444444;
		border-collapse: collapse;
		}
</style>


<script type="text/javascript">
	$(document).ready(function() {	
		
		// 현재월 표시 호출
		//fnNowMonthView();
		
		//달력
		autoReload();
		
		processList();

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
	
 


	var today = new Date(); //오늘 날짜        
	var date = new Date();
	
	//이전달
	function beforem() //이전 달을 today에 값을 저장
	{ 
		today = new Date(today.getFullYear(), today.getMonth() - 1, today.getDate());
		autoReload(); //만들기
	}
	
	//다음달
	function nextm()  //다음 달을 today에 저장
	{
		today = new Date(today.getFullYear(), today.getMonth() + 1, today.getDate());
		autoReload();
	}
	
	//오늘선택
	function thisMonth(){
		today = new Date();
		autoReload();
	}

	function autoReload()
	{
		//년도
		var now = new Date();	// 현재 날짜 및 시간
		var year = now.getFullYear();	// 연도
		var month = now.getMonth();	// 월 
		var m = month;	// 현재월 숫자 변환 
		
		var nMonth = new Date(today.getFullYear(), today.getMonth(), 1); //현재달의 첫째 날
		var lastDate = new Date(today.getFullYear(), today.getMonth() + 1, 0); //현재 달의 마지막 날
		var tbcal = document.getElementById("calendar"); // 테이블 달력을 만들 테이블
		//var yearmonth = document.getElementById("yearmonth"); //  년도와 월 출력할곳 
		 $( '#yearmonth' ).val( today.getFullYear() + "년 "+ (today.getMonth() + 1) + "월");
			var myArray = {1: "JAN", 2: "FEB", 3: "MAR", 4: "APR", 5: "MAY", 6: "JUN", 7: "JUL", 8: "AUG", 9: "SEP", 10: "OCT", 11: "NOV", 12: "DEC"  };
	        var monthData = myArray[today.getMonth() + 1]; 
	        $( '#mYear' ).text( today.getFullYear());
	        $( '#pjYear' ).val( today.getFullYear());
	      
	        $('#mMonth').text(monthData);
	        
	        var tmMonth = "";
	        if((today.getMonth() + 1)<10){
	        	tmMonth = "0"+(today.getMonth() + 1);
	        }else{
	        	tmMonth = today.getMonth() + 1;
	        }
	        $('#mMonth2').text(tmMonth); 
		
		
		if(today.getMonth()+1==12) //  눌렀을 때 월이 넘어가는 곳
		{
			before.innerHTML=("<"+today.getMonth())+"월";
			next.innerHTML="1월"+">";
			
		}
		else if(today.getMonth()+1==1) //  1월 일 때
		{
			before.innerHTML="<"+"12월";
			next.innerHTML=(today.getMonth()+2)+"월" +">";
		}
		else //   12월 일 때
		{
			before.innerHTML="<"+(today.getMonth())+"월";
			next.innerHTML=(today.getMonth()+2)+"월"+">";
		}


		// 남은 테이블 줄 삭제
		while (tbcal.rows.length > 2) 
		{
			tbcal.deleteRow(tbcal.rows.length - 1);
		}
		var row = null;
		row = tbcal.insertRow();
		var cnt = 0;
		var dayCheck = (nMonth.getDay()==0) ? 7 : nMonth.getDay(); //일요일을 마지막으로 넣기 위해서.

		 // 1일 시작칸 찾기
		for (i = 0; i < (dayCheck-1); i++) 
		{
			cnt = cnt + 1;	//요일값
			cell = row.insertCell();
			
			if (i>4) { //주말
				cell.style.backgroundColor = "#f7f7f7";
			}
		}


		// 달력 출력 
		for (i = 1; i <= lastDate.getDate(); i++) // 1일부터 마지막 일까지
		{  
			cell = row.insertCell();
			
			var str="";
			
			str += "<div style='height: 20px;'>"+i+"</div>";
			var day = (i<10) ? "0"+i : i;           
			
	 
			str += "<div style='height: 90px;' id='"+day+"'></div>"; //나중에 원하는 날에 일정을 넣기위해 id값을 날자로 설정
			cell.innerHTML = str;
			
			cnt = cnt + 1;
			if (cnt % 7 == 6) {//토요일
				var str="";
				str += "<div style='height: 20px;'>"+i+"</div>";
				var day = (i<10) ? "0"+i : i;            	
				str += "<div style='height: 90px;' id='"+day+"'>";
				str += "</div>";
				cell.innerHTML = str;
				cell.style.color = "#009de0";
				cell.style.backgroundColor = "#f7f7f7";                    
			}
			if (cnt % 7 == 0) { //일요일
				var str="";
				str += "<div style='height: 20px;'>"+i+"</div>";
				var day = (i<10) ? "0"+i : i;            	
				str += "<div style='height: 90px;'id='"+day+"'>";
				str += "</div>";
				cell.innerHTML = str;
				row = calendar.insertRow();// 줄 추가
				cell.style.color = "#ed5353";
				cell.style.backgroundColor = "#f7f7f7";
			}
			
			//마지막 날짜가 지나면 일요일까지 칸 그리기 
			if(lastDate.getDate() == i && ((cnt % 7) != 0)){
 
				var add = 7 - (cnt % 7);
				for(var k = 1; k <= add; k++){
					cell = row.insertCell();
					cnt = cnt + 1;
					if (cnt % 7 == 6) {//토요일
						cell.style.backgroundColor = "#f7f7f7";
					}
					if (cnt % 7 == 0) { //일요일
						cell.style.backgroundColor = "#f7f7f7";
					}
					
					/* 다음달 미리 보니.?
					var str="";
					str += "<div>"+k+"</div>";
					var day = (i<10) ? "0"+k : i;            	
					str += "<div id='"+day+"'>";
					str += "</div>";
					cell.innerHTML = str;
					*/
				}
			}
			
			//오늘날짜배경색
			if( today.getFullYear() == date.getFullYear() && today.getMonth() == date.getMonth() && i==date.getDate() )
			{
				cell.style.backgroundColor = "#e2f3da"; //오늘날짜배경색
			}
			
			//마지막 날짜가 지나면 일요일까지 칸 그리기
			if(lastDate.getDate() == i && ((cnt % 7) != 0)){
				var add = 7 - (cnt % 7);
				for(var k = 1; k <= add; k++){
					cell = row.insertCell();
					cnt = cnt + 1;
					if (cnt % 7 == 6) {//토요일
						cell.style.backgroundColor = "#f7f7f7";
					}
					if (cnt % 7 == 0) { //일요일
						cell.style.backgroundColor = "#f7f7f7";
					}
				}
			}
			  
		}
		
		/*
        $( '#mYear' ).text( year);
        $( '#pjYear' ).val( year);
      
        $('#mMonth').text(monthData);
        */
        
        var tmYear = $('#mYear').text();
        var tmMonth = $('#mMonth2').text();
        var searchMonthVal = tmYear+"-"+tmMonth;;
     
		$.post('/empo/schedule/selectMonthList.do', {searchMonth:searchMonthVal} ).done(function(res) {
			  
	  
			res.list.forEach(function(row, index) {  
				//$('#resultProcess').append(managerListView(row)); 
				//원하는 날짜 영역에 내용 추가하기
				var tdId = row.noDay; //1일
				var str = "";
				if(document.getElementById(tdId).innerHTML !=""){ 
					str += "<br>";  
				} 
				str += "<a href='/empo/rpa/eMAU00G02Main.do'>09:00</a> "+row.noEtc;   
				document.getElementById(tdId).innerHTML = document.getElementById(tdId).innerHTML+str;    
			});
			
		}).fail(function() {
			alert("실패");
		});
		
		
		/* 
		//원하는 날짜 영역에 내용 추가하기
		var tdId = "20"; //1일
		var str = "";
		str += "09:00 분과구성1";
		str += "<br>12:00 분과구성2 \n"; 
		document.getElementById(tdId).innerHTML = str;
		*/
		 
	}
	
	$(document).on('click', 'input[name="processRow"]', function() {
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
		$("#mCSB_1_container").addClass('processTree');
		
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
		
	}
</script>



<body  >
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
							<input type="hidden" id="yearmonth" >
								<li><button type="button" id="before" class="prev" onclick="beforem()">이전</button></li> 
								<li><strong><span id="mMonth" name="mMonth" ></span> <span id="mMonth2" name="mMonth2" ></span>, <span id="mYear" name="mYear" ></span></strong></li>
								<li><a href="javascript:thisMonth()" class="now">현재날짜로 돌아가기</a></li>
								<li><button type="button" id="next" class="next" onclick="nextm()">다음</button>
								 
								</li>
							</ul>
							<ul class="view_btn">
						<li><a href="<c:url value='/'/>empo/schedule/eMAU00B01Main.do" >YEAR</a></li>
						<li><a href="<c:url value='/'/>empo/schedule/eMAU00B02Main.do" class="active">MONTH</a></li>
						<li><a href="<c:url value='/'/>empo/schedule/eMAU00B03Main.do">WEEK</a></li>
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
						<div id="yearmonth"></div>
						<div class="month_guide"> 
								<table align="center" id="calendar" class="calendar">
									<tr style="height:0px">
										<td> 
										</td>
										<td colspan="4" align="center">
										
										</td>
										<td> 
										</td>
										<td>
									 
										</td>
									</tr>
									<tr style="">
										<td width="14%" style="font-weight:bold;text-align: center;height:45px; font-size: 18px;">MON </td>
										<td width="14%" style="font-weight:bold;text-align: center; font-size: 18px;">TUE</td>
										<td width="14%" style="font-weight:bold;text-align: center; font-size: 18px;">WED</td>
										<td width="14%" style="font-weight:bold;text-align: center; font-size: 18px;">THU</td>
										<td width="14%" style="font-weight:bold;text-align: center; font-size: 18px;">FRI</td>
										<td width="14%" style="font-weight:bold;text-align: center; font-size: 18px;"><font color="#009de0">SAT</font></td>
										<td width="14%" style="font-weight:bold;text-align: center; font-size: 18px;"><font color="#ed5353">SUN</font></td>
									</tr>
								</table> 
						</div>
						<!-- e :month_guide -->
					</div>
					<!-- e :schedule_all -->
				
					<div class="process_guide">
						<div class="title">선택보기</div>
						<div class=" scroll sbox_h700">
						</div>
					</div>
					<!-- e :process_guide -->
					
					<!-- s :sc_popup -->
<!--                     <div style="position: absolute; top: 250px; left:200px; width: 900px; z-index:55;"> -->
<!-- 						<div class="sc_view01 view_inform"> -->
<!-- 							<strong>PMS내 분과구성</strong> -->
<!-- 							<span>중소기업 기술혁신개발사업 (수출지향형) 2차</span> -->
<!-- 						</div> -->
<!-- 						 -->
<!-- 						<div class="sc_view01 view_now"> -->
<!-- 							<strong>평가위원회 구성계획 수립, 평가전문위원 구성 평가위원회 구성계획 수립, 평가전문위원 구성 </strong> -->
<!-- 							<span>중소기업 기술혁신개발사업 (수출지향형) 2차</span> -->
<!-- 						</div> -->
<!-- 						 -->
<!-- 						<div class="sc_view01 view_past"> -->
<!-- 							<strong>구성결과 등록</strong> -->
<!-- 							<span>중소기업 기술혁신개발사업 (수출지향형) 2차</span> -->
<!-- 						</div> -->
<!-- 						 -->
<!-- 						<div class="sc_view01 view_expect"> -->
<!-- 							<strong>서면평가</strong> -->
<!-- 							<span>중소기업 기술혁신개발사업 (수출지향형) 2차 중소기업 기술혁신개발사업 (수출지향형) 2차 중소기업 기술혁신개발사업 (수출지향형) 2차</span> -->
<!-- 						</div> -->
<!-- 					</div> -->
					<!-- e :sc_popup -->
					
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
