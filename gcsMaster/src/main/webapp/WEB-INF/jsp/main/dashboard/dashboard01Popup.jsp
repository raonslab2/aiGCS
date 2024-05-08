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

<script type="text/javascript">
	$(document).ready(function() {
		$(".btnPopupProcessStateClose").click(function() {
			$("#popupProcessState").css("display","none");
		});

		$("#btnPopExcelDown").click(function() {
			alert("엑셀 다운로드 프로그램 진행");
		});
	});

	// 일정변경 팝업 오픈
	function fnScheduleChangePopOpen() {
		fnPopupOpen("schedule_001_03.jsp", "");	// ../js/popup.js 참고
	}

	// To-Do 팝업 오픈
	function fnToDoPopOpen() {
		fnPopupAddOpen("todo_001.jsp", "");	// ../js/popup.js 참고
	}

	// Check List 추가 팝업 오픈
	function fnCheckListPopOpen() {
		fnPopupOpen("check_001_01.jsp", "");	// ../js/popup.js 참고
	}
</script>

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