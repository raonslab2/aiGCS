<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<script type="text/javascript">
	$(document).ready(function() {

		$("#btnPwdCancel").click(function() {
			fnPopupClose();
		});
	
		$("#formPwd").submit(function () {
			var oldPwd = $("#oldPwd").val();
			var newPwd1 = $("#newPwd1").val();
			var newPwd2 = $("#newPwd2").val();

			if ($.trim(oldPwd).length < 1) {
				$("#pwdErrorMsg").text("기존 비밀번호를 입력하세요.");
				$("#oldPwd").focus();
				return false;
			}
			
			if ($.trim(newPwd1).length < 8) {
				$("#pwdErrorMsg").text("변경 비밀번호를 숫자, 영문 8자이상 입력하세요.");
				$("#newPwd1").focus();
				return false;
			}
			
			if ($.trim(newPwd2).length < 1) {
				$("#pwdErrorMsg").text("비밀번호 확인을 입력하세요.");
				$("#newPwd2").focus();
				return false;
			}

			if (newPwd1 != newPwd2)  {
				$("#pwdErrorMsg").text("비밀번호가 동일하지 않습니다.");
				$("#newPwd2").focus();
				return false;
			}

			if (confirm("비밀번호를 변경하시겠습니까?"))	{
				fnPopupClose();
			}

			return false;
		})
	});


</script>

<!-- 비밀번호 변경 -->
<div class="popup_guide popup_w500">
	
	<h3>비밀번호 변경</h3>

	<div class="popup_content">

		<form name="formPwd" id="formPwd">
		<div class="bbs_write01">
			<ul>
				<li><span>기존 비밀번호</span>
					<input type="text" class="input_w100" id="oldPwd" name="old_pwd" placeholder="기존 비밀번호를 입력해 주세요.">
				</li>
				
				<li><span>변경 비밀번호</span>
					<input type="text" class="input_w100" id="newPwd1" name="new_pwd1" placeholder="변경할 비밀번호를 입력해 주세요.">
				</li>
				<li><span>숫자, 영문 8자 이상</span>	</li>

				<li><span>비밀번호 확인</span>
					<input type="text" class="input_w100" id="newPwd2" name="new_pwd2" placeholder="위에 입력한 비밀번호를 입력해 주세요.">
				</li>
				<li><span id="pwdErrorMsg" style="color:red;"></span>	</li>
			</ul>
			
			<div class="btn_guide ac mt20">
				<button type="button" class="btn_style05 btn_gray" id="btnPwdCancel">취소</button>
				<button type="submit" class="btn_style05 btn_red" id="btnPwdConfirm">확인</button>
			</div>
			<!-- e :btn_guide -->
		
		</div>
		</form>
		<!-- e :bbs_write01 -->
		
	</div>
	<!-- e :popup_content -->

</div>
