<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<script type="text/javascript">
	$(document).ready(function() {

		// 비밀번호 변경 버튼
		$("#btnPopupPwdChange").click(function() {
			fnPopupOpen("../popup/member_001_02.jsp", "");	// ../js/popup.js 참고
		});

	});
</script>

<div class="popup_guide popup_w500">
	<a href="javascript:void(0)" class="closebtn" onclick="fnPopupClose()">닫기</a>
	
	<h3>회원정보</h3>

	<div class="popup_content">
		<h4>회원정보</h4>
		
		<div class="bbs_list">
			<table class="table_l">
				<tbody>
					<tr>
						<th scope="row">이름*</th>
						<td><strong>나실장</strong></td>
					</tr>
					
					<tr>
						<th scope="row">사원번호 *</th>
						<td>000000 <button type="button" class="btn_style03 btn_gray" id="btnPopupPwdChange">비밀번호 변경</button></td>
					</tr>
					
					<tr>
						<th scope="row">부서 * </th>
						<td>협력사업본부 대외협력기획실 </td>
					</tr>
					
					<tr>
						<th scope="row">아이디 *</th>
						<td>Abcd30</td>
					</tr>
					
					<tr>
						<th scope="row">이메일 *</th>
						<td>aaa@bbb.com</td>
					</tr>
					
					<tr>
						<th scope="row">전화번호</th>
						<td>042-388-9999</td>
					</tr>
				</tbody>
			</table>
		</div>
		
		<h4>권한</h4>
		<div class="bbs_list">
			<table class="table_l mb10">
				<tbody>
					<tr>
						<th scope="row">사업명 *</th>
						<td>중소기업혁신개발사업(수출지향형)</td>
					</tr>
					
					<tr>
						<th scope="row">권한*</th>
						<td>사업관리자</td>
					</tr>
				</tbody>
			</table>
			
			<table class="table_l mb10">
				<tbody>
					<tr>
						<th scope="row">사업명 *</th>
						<td>중소기업혁신개발사업(수출지향형)</td>
					</tr>
					
					<tr>
						<th scope="row">권한*</th>
						<td>사업관리자</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	<!-- e :popup_content -->

</div>
<!-- e :popup_guide -->
