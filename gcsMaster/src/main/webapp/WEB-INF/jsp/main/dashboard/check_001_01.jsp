<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<style>
.dialogZindex {
   z-index: 100000;
}
</style>

<script type="text/javascript">
	$(document).ready(function() {


		// 취소버튼 클릭
		$("#btnPopCancel").click(function() {
			
            var dialog = $('<p>등록된 정보를 저장하지 않습니다.?</p>').dialog({
				modal : true, 
				dialogClass : "dialogZindex",
            	title : "Check List 추가 취소",
                buttons: {
                    "아니오": function() {
                        dialog.dialog('close');
                    },
                    "네":  function() {
                        dialog.dialog('close');
            			fnPopupClose();
                    }
                }
            });
		});
	
		// 저장버튼 클릭
		$("#formPopCheckList").submit(function () {
			
			alert("체크리스트가 추가되었습니다.");
			fnPopupClose();
			
			return false;
		});
	
	});


</script>

<!-- Check List 추가 -->
<div class="popup_guide popup_w500">	
	<a href="javascript:void(0)" class="closebtn" onclick="fnPopupClose()">닫기</a>
	<h3>
		Check List 추가
	</h3>

	<div class="popup_content">

		<form name="formPopCheckList" id="formPopCheckList">
		<div class="bbs_write01">
			<ul>
				<li><span>항목명 입력</span>
				<input type="text" class="input_w100" placeholder="항목명을 입력하세요.">
				</li>
				
				<li><span>프로세스별 체크리스트 추가 시 아래의 사업정보 및 프로세스를 선택해 주세요.</span></li>

				<li><span>사업선택</span>					
					<select name="" class="input_w100">
						<option>2021년</option>
						<option>2020년</option>
					</select>
				</li>

				<li>				
					<select name="" class="input_w100">
						<option>2021년 생활혁신형 기술혁신개발사업 수출지향형 1차</option>
					</select>
				</li>

				<li><span>프로세스</span>					
					<select name="" class="input_w100">
						<option>사업접수</option>
					</select>
				</li>

				<li>
					<label><input type="radio" name="changeDiv" checked> 선택한 사업에만 적용</label>
					<br>
					<label><input type="radio" name="changeDiv"> 표준 프로세스 체크리스트로 추가</label>
				</li>

			</ul>
			
			<div class="btn_guide ac mt20">
				<button type="button" class="btn_style05 btn_gray" id="btnPopCancel">취소</button>
				<button type="submit" class="btn_style05 btn_red" id="btnPopConfirm">저장</button>
			</div>
			<!-- e :btn_guide -->
		
		</div>
		</form>
		<!-- e :bbs_write01 -->
		
	</div>
	<!-- e :popup_content -->

</div>
