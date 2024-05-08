<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

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