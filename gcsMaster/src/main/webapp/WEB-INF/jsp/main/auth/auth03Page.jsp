<%--
  Class Name : dashboardPage.jsp
  Description : dashboard
  Modification Information
 
      수정일         수정자                   수정내용
    -------    --------    ---------------------------
     2021.07.07   MBA       데시보드 생성
 
    author   : 평가계획관리시스템 MBA
    since    : 2021.07.07
--%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta charset="utf-8">
<title>TIPA 스케쥴기반 평가관리시스템</title>
<c:import url="/EmpPageLink.do?link=main/include/src" /> 

<script type="text/javascript">
	$(document).ready(function() {

		// 회원정보 목록 커서
		$(".userList > table > tbody> tr > td").css("cursor","pointer");

		// 기관 담당자 추가 버튼
		$("#btnUserAdd").click(function() {
			fnPopupOpen("../popup/em_auth_003_01.jsp", "");	// ../js/popup.js 참고
		});

		// 비밀번호 변경 버튼
		$("#btnPwdChange").click(function() {
			fnPopupOpen("../popup/member_001_02.jsp", "");	// ../js/popup.js 참고
		});

	});

	// 회원정보 상세보기
	function fnUserView() {
		window.location.href = "EMAU00F0103.jsp"
	}

	// 담당자 목록에서 권한 등록 버튼 클릭 이벤트
	function fnListAuthAdd() {
		$("#formUserList").find("#authMode").val("insert");
		fnPopupOpen("../popup/em_auth_001.jsp", "#formUserList");	// ../js/popup.js 참고
	}

	// 담당자 목록에서 권한 관리 버튼 클릭 이벤트
	function fnListAuthEdit() {
		$("#formUserList").find("#authMode").val("edit");
		fnPopupOpen("../popup/em_auth_001.jsp", "#formUserList");	// ../js/popup.js 참고
	}
</script>

</head>

<body>
	<!-- s :wrap -->
	<div id="wrap">
		<!-- 1차 메뉴 시작 -->
		<div class="lnb_guide">
			<c:import url="/EmpPageLink.do?link=main/include/menu" />
		</div>
		<!-- 1차 메뉴 종료 -->
			
		<!-- s :right_guide -->
		<div class="right_guide">

			<!-- 화면 상단 시작 -->
			<div class="top_guide">

				<!-- 1차 메뉴명 -->
				<h3>권한관리</h3>
				<c:import url="/EmpPageLink.do?link=main/include/top" />
			</div>
			<!-- 화면 상단 종료 -->
			
			<!-- s :contents_guide -->
			<div class="contents_guide">
				<div class="submenu_guide">
					<ul>
						<!-- 2차메뉴명 -->
						<li><a href="/empo/auth/eMAU00F01Main.do">담당자별</a></li>
						<li><a href="/empo/auth/eMAU00F02Main.do">사업별</a></li>
						<li><a href="/empo/auth/eMAU00F03Main.do" class="active">기관담당자</a></li>
					</ul>
				</div>
				
				<!-- s :content_col2 -->
				<div class="content_col2 bg">
					<div>
						
						<!-- 검색 form 시작 -->
						<form name="searchForm" method="post">
						<ul>
							<li class="ac">
								<!-- 기관명 검색 -->
								<select name="" class="input_w40">
									<option value="">기관명 </option>
									<option value="">중소기업진흥원</option>
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

						<div class="btn_guide ar mb-20 mt20">
							<button type="button" class="btn_style02 btn_green" id="btnUserAdd">기관 담당자 추가</button>
						</div>
						
						<!-- 담당자 목록 시작 -->
						<div class="bbs_list mt30 userList">
							<table>
								<thead>
								  <tr>
									<th scope="col">기관명</th>
									<th scope="col">이름</th>
									<th scope="col">직급</th>
									<th scope="col">연락처</th>
									<th scope="col">권한</th>
								  </tr>
								</thead>
								<tbody>
								  <tr class="over"> <!-- 선택된 회원 tr 표시 -->
									<td onclick="fnUserView();">중소기업진흥원</td>
									<td onclick="fnUserView();">이이</td>
									<td onclick="fnUserView();">본부장</td>
									<td onclick="fnUserView();">333333</td>
									<td><button type="button" class="btn_style03 btn_red" onclick="fnListAuthAdd();">등록</button></td>
								  </tr>
								  <tr>
									<td onclick="fnUserView();">중소기업진흥원</td>
									<td onclick="fnUserView();">이이</td>
									<td onclick="fnUserView();">실장</td>
									<td onclick="fnUserView();">333333</td>
									<td><button type="button" class="btn_style03 btn_red" onclick="fnListAuthAdd();">등록</button></td>
								  </tr>
								  <tr>
									<td onclick="fnUserView();">중소기업진흥원</td>
									<td onclick="fnUserView();">이이</td>
									<td onclick="fnUserView();">주임연구원</td>
									<td onclick="fnUserView();">333333</td>
									<td><button type="button" class="btn_style03 btn_white" onclick="fnListAuthEdit();">관리</button></td>
								  </tr>
								  <tr>
									<td onclick="fnUserView();">중소기업진흥원</td>
									<td onclick="fnUserView();">이이</td>
									<td onclick="fnUserView();">주임연구원</td>
									<td onclick="fnUserView();">333333</td>
									<td><button type="button" class="btn_style03 btn_white" onclick="fnListAuthEdit();">관리</button></td>
								  </tr>
								  <tr>
									<td onclick="fnUserView();">중소기업진흥원</td>
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
					
					
					<!-- 담당자 정보 시작 : 목록의 첫번째 회원정보가 최초 출력 -->
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
						
                    </div>
					<!-- e : 담당자 정보 종료 --> 

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
