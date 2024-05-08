<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<script type="text/javascript">
	$(document).ready(function() {

		$("#btnUserCancel").click(function() {
			fnPopupClose();
		});
	
		$("#formUserAdd").submit(function () {
			if (confirm("기관 담당자 정보를 저장하시겠습니까?"))	{
				fnPopupClose();
			}

			return false;
		})
	});


</script>

<!-- 기관 담당자 등록 -->
<div class="popup_guide popup_w500">
	
	<h3>기관 담당자 등록</h3>

	<div class="popup_content">

		<form name="formUserAdd" id="formUserAdd">
		<div class="bbs_write01">
			<ul>
				<li><span>아이디 *</span>
					<input type="text" class="input_w100" id="" name="" placeholder="영문 숫자 포함 8자리">
				</li>
				
				<li><span>이메일 * (임시 비밀번호를 발급받을 이메일 주소 입력)</span>
					<input type="text" class="input_w100" id="" name="" placeholder="이메일 주소를 입력해 주세요">
				</li>

				<li><span>기관명 *</span>
					<select name="" class="input_w100">
						<option value="">중소벤처기업부 </option>
						<option value="">기타</option>
					</select>
				</li>

				<li><span>이름 *</span>
					<input type="text" class="input_w100" id="" name="" placeholder="이름을 입력하세요.">
				</li>

				<li><span>직급</span>
					<select name="" class="input_w100">
						<option value="">과장</option>
						<option value="">사무관</option>
						<option value="">주무관</option>
						<option value="">기타</option>
					</select>
				</li>

				<li><span>연락처</span>
					<input type="text" class="input_w100" id="" name="" placeholder="연락처를 입력하세요.">
				</li>
			</ul>
			
			<div class="btn_guide ac mt20">
				<button type="button" class="btn_style05 btn_gray" id="btnUserCancel">취소</button>
				<button type="submit" class="btn_style05 btn_red" id="btnUserConfirm">확인</button>
			</div>
			<!-- e :btn_guide -->
		
		</div>
		</form>
		<!-- e :bbs_write01 -->
		
	</div>
	<!-- e :popup_content -->

</div>
