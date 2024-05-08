<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
	// 권한 모드 (추가:insert, 수정:edit);
	String authMode = request.getParameter("authMode");
%>

<script type="text/javascript">
	$(document).ready(function() {

		$("#btnAuthCancel").click(function() {
			fnPopupClose();
		});
	
		$("#formPopAuth").submit(function () {
			if (confirm("담당자 권한관리를 저장하시겠습니까?"))	{
				fnPopupClose();
				return false;
			}

			return false;
		})

			
		$("#btnAuthDelete").click(function() {
			if (confirm("권한을 삭제하시겠습니까?"))	{
				fnPopupClose();
				return false;
			}
		});
	
	});


</script>

<!-- 담당자 권한관리 -->
<div class="popup_guide popup_w500">	
	<h3>
		담당자 권한관리
	</h3>

	<% if ("edit".equals(authMode)) { %>
	<!-- 권한수정 모드일 경우 '권한삭제' 버튼 출력 -->
	<div class="popup_top_btn">
		<button type="button" class="btn_style01 btn_red" id="btnAuthDelete">권한삭제</button>
	</div>
	<% } %>

	<div class="popup_content">

		<form name="formPopAuth" id="formPopAuth">
		<div class="bbs_write01">
			<ul>
				<li><span>사연년도</span>					
					<select name="" class="input_w100">
						<option>2021년</option>
						<option>2020년</option>
					</select>
				</li>

				<li><span>사업명</span>
					<input type="text" class="input_w100" id="" name="" placeholder="사업명을 입력하세요.">
				</li>
				
				<li><span>권한</span>
					  <ul class="data_list02">
						  <li><label><input type="radio"> 시스템 관리</label></li>
						  <li><label><input type="radio"> 사업관리</label></li>
						  <li><label><input type="radio"> 담당간사</label></li>
						  <li><label><input type="radio"> 실무자</label></li>
						  <li><label><input type="radio"> 일반</label></li>
					  </ul>
				</li>
			</ul>
			
			<div class="btn_guide ac mt20">
				<button type="button" class="btn_style05 btn_gray" id="btnAuthCancel">취소</button>
				<button type="submit" class="btn_style05 btn_red" id="btnAuthConfirm">확인</button>
			</div>
			<!-- e :btn_guide -->
		
		</div>
		</form>
		<!-- e :bbs_write01 -->
		
	</div>
	<!-- e :popup_content -->

</div>
