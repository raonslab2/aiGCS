<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>



<script type="text/javascript">
	$(document).ready(function() {

		$("#btnPopCancel").click(function() {
			fnPopupClose();
		});
	
		$("#formPopProcessGet").submit(function () {

			$("#btnProcessGet").css("display","none");
			$("#btnScheduleApp").css("display","");

			fnPopupClose();
			
			return false;
		})
	
	});


</script>

<!-- 프로세스 가져오기 -->
<div class="popup_guide popup_w500">	
	<h3>
		프로세스 가져오기
	</h3>

	<div class="popup_content">

		<form name="formPopProcessGet" id="formPopProcessGet">
		<div class="bbs_write01">
			<ul>
				<li><span>사연년도</span>					
					<select name="" class="input_w100">
						<option>2021년</option>
						<option>2020년</option>
					</select>
				</li>

				<li><span>세부사업명</span>
					<input type="text" class="input_w100" id="" name="" placeholder="사업명을 입력하세요.">
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
