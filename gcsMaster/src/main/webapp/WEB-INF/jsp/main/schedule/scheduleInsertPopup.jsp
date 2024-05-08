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

<script src="../../js/jquery.timepicker.js"></script>

<%
	String clickDate = request.getParameter("clickDate");
	String clickTime = request.getParameter("clickTime");
	String clickDay = request.getParameter("clickDay");
	String noPk = request.getParameter("noPk");
	String noText = request.getParameter("noText");
	String noTitle = request.getParameter("noTitle");
	String noEtc = request.getParameter("noEtc");
	String scheduleMode = request.getParameter("scheduleMode"); 
	String mode = request.getParameter("mode");
%> 

<!-- 업무요청 -->
<div class="popup_guide popup_w700">
	<h3>스케줄 등록</h3>
	<% if ("edit".equals(mode)) { %>
	<div class="popup_top_btn">
		<button type="button" class="btn_style01 btn_red" id="btnScheduleDelete">일정삭제</button>
	</div>
	<% } %>
	<input type="hidden" id="dataClickDate" value="<%=clickDate %>">
	<input type="hidden" id="dataClickDay" value="<%=clickDay %>">
	<input type="hidden" id="dataMode" value="<%=mode %>">
	<input type="hidden" id="dataScheduleMode" value="<%=scheduleMode %>">
	<input type="hidden" id="dataNoPk" value="<%=noPk %>">
	<div class="popup_content">
		<div class=" content_col1 bg">
			<div>
				<ul>
					<li class="date_tit"></li>
				</ul>
			</div>
			<div class="bbs_write01">
				<ul>
					<li><span>스케줄 날짜</span>
                    	<input type="text" class="inputCalendar input_w30" id="selectDay" disabled>
                        <input type="text" class="input_w30 ac timepicker" <% if ("".equals(clickTime)) { %> value="10:00" <% } else { %> value="<%=clickTime %>" <% } %>  id="selectTime" value>
					</li>
					<li><span>메모 제목</span>
                   		<input type="text" id="selectNoTitle" class="input_w90" <% if ("".equals(noTitle)) { %> value="" <% } else { %> value="<%=noTitle %>" <% } %> >
					</li>
					<li><span>메모 내용</span>
                   		<textarea id="selectNoText" style="border: 1px solid #ddd; width: 590px; height: 200px;" ><% if ("".equals(noText)) { %><% } else { %><%=noText%><% } %></textarea>
					</li>
					<li><span>기타 내용</span>
                   		<input type="text" id="selectNoEtc" class="input_w90" <% if ("".equals(noEtc)) { %> value="" <% } else { %> value="<%=noEtc %>" <% } %> >
					</li>
				</ul>
				<div class="btn_guide ac mt20">
					<button type="button" class="btn_style05 btn_gray" id="btnPopCancel">취소</button>
					<% if ("edit".equals(mode)) { %>
						<button type="button" class="btn_style05 btn_red" id="btnScheduleSave">수정</button>
					<% } else { %>
					<button type="button" class="btn_style05 btn_red" id="btnScheduleSave">등록</button>
					<% } %>
				</div>
				<!-- e :btn_guide -->
			</div>
			<!-- e :bbs_write01 -->
		</div>
		<!-- e :content_col2 -->
	</div>
	<!-- e :popup_content -->
</div>
<!-- e :popup_guide -->

<script>
;(function() {
	var selectDate = "";
	// 달력 입력 datepicker 설정
	$('.inputCalendar').datepicker({
		dateFormat : 'yyyy.mm.dd'		// 날짜 형태 설정		
	});	
	
	// 시간입력 timepicker 설정
	$('.timepicker').timepicker({
		timeFormat: 'HH:mm', // 형식
		interval: 10, // 표현 단위 (분)
		minTime: '09',	// 시작시간
		maxTime: '17:50',	// 종료시간
		defaultTime: '',
		startTime: '09:00',	// 시작시간
		dynamic: false,
		dropdown: true,
		scrollbar: true
	});
	
	// 취소 버튼 클릭
	$("#btnPopCancel").click(function() {
		fnPopupClose();
	});
	
	$("#btnScheduleSave").click(function() {
		if(confirm("일정을 등록하시겠습니까?")) {
			
			if ($("#selectNoTitle").val() == "") {
				alert("메모 제목을 입력하세요.");
				return false;
			}
			if ($("#selectNoText").val() == "") {
				alert("메모 내용을 입력하세요.");
				return false;
			} 
			
			var data = {
					"noInDay" : $("#selectDay").val() + " " + $("#selectTime").val()
					, "noTitle" : $("#selectNoTitle").val()
					, "noText" : $("#selectNoText").val()
					, "noEtc" : $("#selectNoEtc").val()
					, "mode" : $("#dataMode").val()
					, "noPk" : $("#dataNoPk").val()
				}
				
			$.post("/empo/schedule/scheduleSave.do", data).done(function(res) {
				console.log(res.list);
				alert("등록되었습니다.");
				
				if ($("#dataScheduleMode").val() == "month") {
					if (res.list.mode == "insert") {
						var insertNoInDate = new Date(res.list.noInday);
						var hours = ('0' + insertNoInDate.getHours()).slice(-2);
						var minutes = ('0' + insertNoInDate.getMinutes()).slice(-2);
						var rowTitle = "";
						if (res.list.noTitle.length > 12 ) {
							rowTitle = res.list.noTitle.substring(0, 11) + "...";
						} else {
							rowTitle = res.list.noTitle;
						}
						$("#" + selectDate).append($("<br><a class='scheduleDetail' id='no" + res.list.noPk + "' data-no_pk='" + res.list.noPk + "'>" + hours + ":" + minutes + " " + rowTitle + "</a>"))
						$('.scheduleDetail').css("cursor", "pointer");
					} else {
						var insertNoInDate = new Date(res.list.noInday);
						var hours = ('0' + insertNoInDate.getHours()).slice(-2);
						var minutes = ('0' + insertNoInDate.getMinutes()).slice(-2);
						var rowTitle = "";
						if (res.list.noTitle.length > 12 ) {
							rowTitle = res.list.noTitle.substring(0, 11) + "...";
						} else {
							rowTitle = res.list.noTitle;
						}
						$("#no" + res.list.noPk).html(hours + ":" + minutes + " " + rowTitle);
					}
					
				} else {
					if (res.list.mode == "insert") { 
						var insertNoInDate = new Date(res.list.noInday);
						
						var mon = (insertNoInDate.getMonth()+1);
			  			mon = mon < 10 ? '0'+mon : mon;
			  			var day = insertNoInDate.getDate();
			  			day = day < 10 ? '0'+day : day;
			  			var hours = ('0' + insertNoInDate.getHours()).slice(-2);
						var minutes = ('0' + insertNoInDate.getMinutes()).slice(-2);
						
						var rowTitle = "";
						if (res.list.noTitle.length > 12 ) {
							rowTitle = res.list.noTitle.substring(0, 11) + "...";
						} else {
							rowTitle = res.list.noTitle;
						}
						
						$("#" + day + "all").append("<li><a class='scheduleDetail no" + res.list.noPk + "' data-no_pk='" + res.list.noPk + "'>" + hours + ":" + minutes + " " + rowTitle + "</a></li>");
						$("#" + day + hours).append("<li><a class='scheduleDetail no" + res.list.noPk + "' data-no_pk='" + res.list.noPk + "'>" + hours + ":" + minutes + " " + rowTitle + "</a></li>");		
					} else {
						var insertNoInDate = new Date(res.list.noInday);
						var hours = ('0' + insertNoInDate.getHours()).slice(-2);
						var minutes = ('0' + insertNoInDate.getMinutes()).slice(-2);
						var rowTitle = "";
						if (res.list.noTitle.length > 12 ) {
							rowTitle = res.list.noTitle.substring(0, 11) + "...";
						} else {
							rowTitle = res.list.noTitle;
						}
						$(".no" + res.list.noPk).html(hours + ":" + minutes + " " + rowTitle);
					}
					
				}
				fnPopupClose();
				
			});
		} else {
			return false; 
		}
		
	});
	
	$("#btnScheduleDelete").click(function() {
		if (confirm("일정을 삭제하시겠습니까?")) {
			$.post("/empo/schedule/scheduleDelete.do", { "noPk" : $("#dataNoPk").val() } ).done(function() {
				if ($("#dataScheduleMode").val() == "month") {
					$("#no"+$("#dataNoPk").val()).prev().remove();
					$("#no"+$("#dataNoPk").val()).remove();
				} else {
					$(".no"+$("#dataNoPk").val()).parent().remove();
				}
				
				alert("삭제되었습니다.");
				fnPopupClose();	
				
			});	
		} else {
			return false;
		}
		
	})
	
	$(function() {
		//$('#evaluationTime1').val("09:00");
		$('#evaluationTime2').val("18:00");
		var insertDate = $("#dataClickDate").val();
		var insertDay = $("#dataClickDay").val();
		console.log(insertDate);
		$("#selectDay").val(insertDate);
		var formatDate = new Date(insertDate);
		
		var mon = (formatDate.getMonth()+1);
		mon = mon < 10 ? '0'+mon : mon;
		var day = formatDate.getDate();
		day = day < 10 ? '0'+day : day;
		
		selectDate = day;
		
		$(".date_tit").append($("<span>" + formatDate.getFullYear() + "년 " + mon + "월 " + day  + "일 (" + insertDay + ")</span>"));
	});
	
})();
</script>