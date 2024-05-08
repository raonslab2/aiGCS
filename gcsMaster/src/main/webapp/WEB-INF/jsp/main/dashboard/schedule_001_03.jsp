<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>



<script type="text/javascript">
	$(document).ready(function() {
		
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


		$("#btnPopCancel").click(function() {
			fnPopupClose();
		});
	
		$("#formPopScheduleChange").submit(function () {

			fnPopupClose();			
			return false;
		})
	
	});


</script>

<!-- 일정관리 -->
<div class="popup_guide popup_w500">	
	<a href="javascript:void(0)" class="closebtn" onclick="fnPopupClose()">닫기</a>
	<h3>
		일정관리
	</h3>

	<div class="popup_content">

		<form name="formPopScheduleChange" id="formPopScheduleChange">
		<div class="bbs_write01">
			<ul>
				<li><span>프로세스</span>					
					<select name="" class="input_w100">
						<option>사업공고</option>
					</select>
				</li>

				<li><span>시작</span>
				<input type="text" class="inputCalendar input_w40" name="" id="">
				
				<li><span>종료</span>
				<input type="text" class="inputCalendar input_w40" name="" id="">

				<li>
					<label><input type="radio" name="changeDiv" checked> 변경한 프로세스 이후의 모든 일정 변경</label>
					<br>
					<label><input type="radio" name="changeDiv"> 선택한 일정만 변경</label>
				</li>

			</ul>
			
			<div class="btn_guide ac mt20">
				<button type="button" class="btn_style05 btn_gray" id="btnPopCancel">취소</button>
				<button type="submit" class="btn_style05 btn_red" id="btnPopConfirm">확인</button>
			</div>
			<!-- e :btn_guide -->
		
		</div>
		</form>
		<!-- e :bbs_write01 -->
		
	</div>
	<!-- e :popup_content -->

</div>
