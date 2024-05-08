<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	// 권한 모드 (추가:insert, 수정:edit);
	String pwdMbCode = request.getParameter("pwdMbCode");
%>
<script type="text/javascript">
	$(document).ready(function() {

		$("#btnPwdCancel").click(function() {
			fnPopupClose();
		});
	
		$("#btnPwdConfirm").click(function() {
			var newPwd1 = $("#newPwd1").val();
			var newPwd2 = $("#newPwd2").val();
			
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
			
			var formSer = $("#formPwd").serialize();
			if (confirm("비밀번호를 변경하시겠습니까?"))	{
				$.post("/empo/auth/changePassword.do", formSer).done(function() {
					alert("변경되었습니다.");
					fnPopupClose();
				})
				//fnPopupClose();
			}
		});
		
	});


</script>

<!-- 비밀번호 변경 -->
<div class="popup_guide popup_w500">
	
	<h3>비밀번호 변경</h3>

	<div class="popup_content">

		
		<div class="bbs_write01">
		
			<form name="formPwd" id="formPwd">
			<ul>
				<!-- <li><span>기존 비밀번호</span>
					<input type="text" class="input_w100" id="oldPwd" name="old_pwd" placeholder="기존 비밀번호를 입력해 주세요.">
				</li> -->
				<input type="hidden" name="pwdMbCode" value="<%=pwdMbCode %>">
				<li><span>변경 비밀번호</span>
					<input type="password" class="input_w100" id="newPwd1" name="newPwd1" placeholder="변경할 비밀번호를 입력해 주세요.">
				</li>
				<!-- <li><span>숫자, 영문 8자 이상</span>	</li> -->

				<li><span>비밀번호 확인</span>
					<input type="password" class="input_w100" id="newPwd2" name="newPwd2" placeholder="위에 입력한 비밀번호를 입력해 주세요.">
				</li>
				<li><span id="pwdErrorMsg" style="color:red;"></span>	</li>
			</ul>
			</form>
			
			<div class="btn_guide ac mt20">
				<button type="button" class="btn_style05 btn_gray" id="btnPwdCancel">취소</button>
				<button type="button" class="btn_style05 btn_red" id="btnPwdConfirm">확인</button>
			</div>
			<!-- e :btn_guide -->
		
		</div>
		
		<!-- e :bbs_write01 -->
		
	</div>
	<!-- e :popup_content -->

</div>
