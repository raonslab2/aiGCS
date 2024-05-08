<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>TIPA 스케쥴기반 평가관리시스템</title>
<%@ include file = "../include/src.jsp" %>

<script type="text/javascript">
	$(document).ready(function() {

		// 회원정보 목록 커서
		$(".userList > table > tbody> tr > td").css("cursor","pointer");

		// 비밀번호 변경 버튼
		$("#btnPwdChange").click(function() {
			fnPopupOpen("../popup/member_001_02.jsp", "");	// ../js/popup.js 참고
		});

		// 권한 수정 버튼
		$("#btnAuthEdit").click(function() {
			$("#formAuthList").find("#authMode").val("edit");
			fnPopupOpen("../popup/em_auth_001.jsp", "#formAuthList");	// ../js/popup.js 참고
		});

		// 권한 추가 버튼
		$("#btnAuthAdd").click(function() {
			$("#formAuthList").find("#authMode").val("insert");
			fnPopupOpen("../popup/em_auth_001.jsp", "#formAuthList");	// ../js/popup.js 참고
		});
	});

	// 회원정보 상세보기
	function fnUserView() {
		window.location.href = "EMAU00F0101.jsp"
	}

	// 담당자 목록에서 권한 등록 버튼 클릭 이벤트
	function fnListAuthAdd() {
		$("#formUserList").find("#authMode").val("insert");
		fnPopupOpen("../popup/em_auth_001.jsp", "#formUserList");	// ../js/popup.js 참고
	}

	// 담당자 목록에서 권한 관리 버튼 클릭 이벤트
	function fnListAuthEdit() {

		// 목록에서 선택한 담당자 정보에 따라 회원정보 및 권한정보를 보여주면 됩니다.
		window.location.href = "EMAU00F0101.jsp"
	}
</script>

</head>

<body>
	<!-- s :wrap -->
	<div id="wrap">
		<!-- 1차 메뉴 시작 -->
		<div class="lnb_guide">
			<%@ include file = "../include/menu.jsp" %>
		</div>
		<!-- 1차 메뉴 종료 -->
			
		<!-- s :right_guide -->
		<div class="right_guide">

			<!-- 화면 상단 시작 -->
			<div class="top_guide">

				<!-- 1차 메뉴명 -->
				<h3>권한관리</h3>

				<%@ include file = "../include/top.jsp" %>
			</div>
			<!-- 화면 상단 종료 -->
			
			<!-- s :contents_guide -->
			<div class="contents_guide">
				<div class="submenu_guide">
					<ul>
						<!-- 2차메뉴명 -->
						<li><a href="EMAU00F0101.jsp" class="active">담당자별</a></li>
						<li><a href="EMAU00F0102.jsp">사업별</a></li>
						<li><a href="EMAU00F0103.jsp">기관담당자</a></li>
					</ul>
				</div>
				
				<!-- s :content_col2 -->
				<div class="content_col2 bg">
					<div>
						
						<!-- 검색 form 시작 -->
						<form name="searchForm" method="post">
						<ul>
							<li class="ac">
								<!-- 부서검색 -->
								<select name="" class="input_w40">
									<option value="">협력사업본부 대외협력기획실 </option>
									<option value="">정보화 지원실 </option>
								</select>

								<!-- 담당자명 검색 -->
								<span class="search_box03 input_w40">
									<input type="text" placeholder="담당자명">
									<button type="submit" class="btn_search01">검색</button>
								</span>
							</li>
						</ul>
						</form>
						<!-- 검색 form 종료 -->

						
						<!-- 담당자 목록 시작 -->
						<div class="bbs_list mt30 userList">
							<table>
								<thead>
								  <tr>
									<th scope="col">부서명</th>
									<th scope="col">이름</th>
									<th scope="col">직급</th>
									<th scope="col">사원번호</th>
									<th scope="col">권한</th>
								  </tr>
								</thead>
								<tbody>
								  <tr class="over"> <!-- 선택된 회원 tr 표시 -->
									<td onclick="fnUserView();">정보화지원실</td>
									<td onclick="fnUserView();">이이</td>
									<td onclick="fnUserView();">본부장</td>
									<td onclick="fnUserView();">333333</td>
									<td><button type="button" class="btn_style03 btn_red" onclick="fnListAuthAdd();">등록</button></td>
								  </tr>
								  <tr>
									<td onclick="fnUserView();">협력사업본부</td>
									<td onclick="fnUserView();">이이</td>
									<td onclick="fnUserView();">실장</td>
									<td onclick="fnUserView();">333333</td>
									<td><button type="button" class="btn_style03 btn_red" onclick="fnListAuthAdd();">등록</button></td>
								  </tr>
								  <tr>
									<td onclick="fnUserView();">대외협력기획실</td>
									<td onclick="fnUserView();">이이</td>
									<td onclick="fnUserView();">주임연구원</td>
									<td onclick="fnUserView();">333333</td>
									<td><button type="button" class="btn_style03 btn_white" onclick="fnListAuthEdit();">관리</button></td>
								  </tr>
								  <tr>
									<td onclick="fnUserView();">대외협력기획실</td>
									<td onclick="fnUserView();">이이</td>
									<td onclick="fnUserView();">주임연구원</td>
									<td onclick="fnUserView();">333333</td>
									<td><button type="button" class="btn_style03 btn_white" onclick="fnListAuthEdit();">관리</button></td>
								  </tr>
								  <tr>
									<td onclick="fnUserView();">정보화지원실</td>
									<td onclick="fnUserView();">이이</td>
									<td onclick="fnUserView();">주임연구원</td>
									<td onclick="fnUserView();">333333</td>
									<td><button type="button" class="btn_style03 btn_white" onclick="fnListAuthEdit();">관리</button></td>
								  </tr>
								</tbody>
							</table>
						</div>
						<!-- 담당자 목록 끝 -->

						
						<form id="formUserList">
							<input type="hidden" name="authMode" id="authMode" value=""/>
						</form>
					</div>
					<!-- e :bbs_write01 -->
					
					
					<!-- 담당자 정보 및 권한 시작 : 목록의 첫번째 회원정보가 최초 출력 -->
					<div id="divUserInfoView">
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
								  <td>
									000000
									<button type="button" class="btn_style03 btn_gray" id="btnPwdChange">비밀번호 변경</button>
								  </td>
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

						<div class="btn_guide ar mt-50 mb10">
							<button type="button" class="btn_style02 btn_gray" id="btnAuthEdit">권한수정</button>
							<button type="button" class="btn_style02 btn_green" id="btnAuthAdd">권한추가</button>
						</div>

						<form id="formAuthList">
						<input type="hidden" name="authMode" id="authMode" value=""/>
						<div class="bbs_list">
							<table class="table_l mb10">
							  <tbody>
								<tr>
								  <th scope="row" rowspan="2" class="ac"><input type="checkbox"></th>
								  <th scope="row">사업명 *</th>
								  <td>중소기업혁신개발사업(수출지향형)</td>
								</tr>
								<tr>
								  <th scope="row" class="th_line">권한*</th>
								  <td>사업관리자</td>
								</tr>
							  </tbody>
							</table>

							<table class="table_l mb10">
							  <tbody>
								<tr>
								  <th scope="row" rowspan="2" class="ac"><input type="checkbox"></th>
								  <th scope="row">사업명 *</th>
								  <td>중소기업혁신개발사업(수출지향형)</td>
								</tr>
								<tr>
								  <th scope="row" class="th_line">권한*</th>
								  <td>사업관리자</td>
								</tr>
							  </tbody>
							</table>
						</div>
						</form>
                        
                    </div>
					<!-- e : 담당자 정보 및 권한 종료 --> 

				</div>
				<!-- e :content_col2 -->
				
				
				<!-- 팝업 띄울 공간 -->
                <div id="divPopup" class="overlay">
				</div>

			</div>
			<!-- e :contents_guide -->
		</div>
		<!-- e :right_guide -->
	</div>
	<!-- e :wrap -->
</body>
</html>
