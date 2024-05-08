<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<style>
.dialogZindex {
   z-index: 100000;
}
</style>

<script src="../../js/jquery.timepicker.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		// 팝업 스크롤바를 정의
		$(".scroll").mCustomScrollbar({
			scrollbarPosition : "outside"
			//theme:"dark"
		});

		// 달력 입력 datepicker 설정
		$('.inputCalendar').datepicker({

			// 날짜 포맷 변경
			 onSelect: function(formattedDate, date, inst) {
				 //console.log(formattedDate);
//				 console.log(date);
//				 console.log(inst);

				 var week = ['일', '월', '화', '수', '목', '금', '토'];
				 var dayOfWeek = week[new Date(formattedDate).getDay()];

				 var newDate = formattedDate.substr(5,2) + "월 " + formattedDate.substr(8,2) + "일 " + "("+dayOfWeek+")";
				 inst.$el.val(newDate);
			 }
		});	

		// 시간입력 timepicker 설정
		$('.timepicker').timepicker({
			timeFormat: 'p HH:mm', // 형식
			interval: 10, // 표현 단위 (분)
			minTime: '05',	// 시작시간
			maxTime: '23:50',	// 종료시간
			defaultTime: '',
			startTime: '05:00',	// 시작시간
			dynamic: false,
			dropdown: true,
			scrollbar: true
		});

		// 취소버튼 클릭
		$("#btnPopCancel").click(function() {
			
            var dialog = $('<p>등록된 정보를 저장하지 않습니다.</p>').dialog({
				modal : true, 
				dialogClass : "dialogZindex",
            	title : "To-Do 취소",
                buttons: {
                    "아니오": function() {
                        dialog.dialog('close');
                    },
                    "네":  function() {
                        dialog.dialog('close');
            			fnPopupAddClose();
                    }
                }
            });
		});
	
		// 저장버튼 클릭
		$("#formPopToDo").submit(function () {
			
			alert("일정이 추가되었습니다.");
			fnPopupAddClose();
			
			return false;
		});
		
		// 알림추가 버튼
		$(".btnPopNoticeAddView").click(function() {
			if ($("#noticeAdd").css("display") == "none") {
				$("#noticeAdd").css("display","");
			}
			else {
				$("#noticeAdd").css("display","none");
			}
		});

		// 알림추가 확인버튼
		$(".btnNoticeAddConfirm").click(function() {
			var noticeList = $("#noticeList").val();

			$('input:checkbox[name="chkNotice"]').each(function() {
				if(this.checked){//checked 처리된 항목의 값
					if ($.trim(noticeList).length > 0) noticeList = noticeList + ", ";
					noticeList = noticeList + this.value;
				}
			});

			$("#noticeList").val(noticeList);
			$("#noticeAdd").css("display","none");
		});
		
		// 일정공유 추가 버튼
		$(".btnPopScheduleAddView").click(function() {
			if ($("#scheduleAdd").css("display") == "none") {
				$("#scheduleAdd").css("display","");
			}
			else {
				$("#scheduleAdd").css("display","none");
			}
		});


		// 일정공유 확인버튼
		$(".btnScheduleAddConfirm").click(function() {
			var sltDept = $("#sltDept").val();
			var sltName = $("#sltName").val();
			
			if ($.trim(sltDept).length < 1)	{
				alert("사업부서를 선택하세요.");
				$("#sltDept").focus();
				return false;
			}
			
			if ($.trim(sltName).length < 1)	{
				alert("이름을 선택하세요.");
				$("#sltName").focus();
				return false;
			}

			var scheduleList = $("#scheduleList").val();
			if ($.trim(scheduleList).length > 0) scheduleList = scheduleList + ", ";
			
			scheduleList = scheduleList + sltDept + " " + sltName;
			$("#scheduleList").val(scheduleList);

			//$("#scheduleAdd").css("display","none");
		});
		
		// 파일 입력 추가 버튼
		$(".btnFileAdd").click(function() {
			var fileForm = '<input type="file" class="input_w100" id="" name="">';
			$(".fileList").append(fileForm);
		});
	
	});


</script>

<!-- To-Do -->
<div class="popup_guide popup_w700">	
	<h3>
		To-Do
	</h3>
	
	<form name="formPopToDo" id="formPopToDo">
	<div class="popup_top_btn">
		<button type="button" class="btn_style01 btn_gray" id="btnPopCancel">취소</button>
		<button type="submit" class="btn_style01 btn_red" id="btnPopConfirm">저장</button>
	</div>

	<div class="popup_content">
		<div class="sbox_h600 scroll">
			<div class="bbs_write01">
				<ul>
					<li><span>제목</span>
					<input type="text" class="input_w100" placeholder="세부사업명을 입력하세요.">
					<label><input type="checkbox" name=""> Check List 추가</label>
					</li>

					<li><span>시작</span>
					<input type="text" class="inputCalendar input_w40" name="" id="">
					<input type="text" class="input_w30 ac timepicker" value="">
					&nbsp;
					<label>시간대 <input type="checkbox" name=""> 종일</label>
					
					<li><span>종료</span>
					<input type="text" class="inputCalendar input_w40" name="" id="">
					<input type="text" class="input_w30 ac timepicker" value="">

					<li><span>설명</span>
					<input type="text" class="input_w100" placeholder="설명을 입력하세요.">
					</li>
					
					<li><span class="notice btnPopNoticeAddView">알림추가 +</span>
					<input type="text" class="input_w100 btnPopNoticeAddView" id="noticeList" placeholder="알림추가 +">
					<div class="add" id="noticeAdd" style="display:none;">
						<div>
							<label><input type="checkbox" name="chkNotice" value="10분 전"> 10분 전</label>
							&nbsp;&nbsp;&nbsp;
							<label><input type="checkbox" name="chkNotice" value="1시간 전"> 1시간 전</label>
							&nbsp;&nbsp;&nbsp;
							<label><input type="checkbox" name="chkNotice" value="1일 전"> 1일 전</label>
							&nbsp;&nbsp;&nbsp;
							<label><input type="checkbox" name="chkNotice" value="3일 전"> 3일 전</label>
							<br>
							<label><input type="checkbox" name="chkNotice" value="30분전"> 30분전</label>
							&nbsp;&nbsp;&nbsp;&nbsp;
							<label><input type="checkbox" name="chkNotice" value="3시간 전"> 3시간 전</label>
							&nbsp;&nbsp;&nbsp;
							<label><input type="checkbox" name="chkNotice" value="2일 전"> 2일 전</label>
							&nbsp;&nbsp;&nbsp;
							<label><input type="checkbox" name="chkNotice" value="7일 전"> 7일 전</label>
						</div>

						<div class="btn_guide ac mt20">
							<button type="button" class="btn_style01 btn_green btnNoticeAddConfirm">확인</button>
						</div>
					</div>
					</li>

					<li><span class="btnPopScheduleAddView" style="cursor:pointer;">일정 공유 +</span>
					<input type="text" class="input_w100 btnPopScheduleAddView" id="scheduleList" placeholder="일정 공유 +" value="">
					<div class="add" id="scheduleAdd" style="display:none;">
						
						<ul>
							<li>
								<span>사업부서	</span>
								<select name="" id="sltDept" class="input_w100">
									<option value="">사업부서 선택</option>
									<option value="협력사업본부 대외협력기획실">협력사업본부 대외협력기획실</option>
								</select>
							</li>
						
							<li>
								<span>이름</span>
								<select name="" id="sltName" class="input_w100">
									<option value="">이름 선택</option>
									<option value="홍길순">홍길순</option>
								</select>
							</li>
						</ul>

						<div class="btn_guide ac mt20">
							<button type="button" class="btn_style01 btn_green btnScheduleAddConfirm">확인</button>
						</div>
					</div>
					</li>

					<li><span class="btnFileAdd"  style="cursor:pointer;">첨부파일 추가 +</span>
						<button type="button" class="btn_style03 btn_green btnFileAdd">첨부파일 +</button>	<!-- 파일 입력 추가 버튼 -->						
						<div class="fileList"> <!-- 파일 입력란 추가 공간 -->							
						</div>
					</li>

				</ul>
						
			</div>
			<!-- e :bbs_write01 -->
		</div>
		
	</div>
	<!-- e :popup_content -->

	</form>
</div>
