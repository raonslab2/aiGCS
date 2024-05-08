<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>TIPA 스케쥴기반 평가관리시스템</title>
<%@ include file = "../include/src.jsp" %>

<script type="text/javascript">
	$(document).ready(function() {

		// 평가장 목록 커서
		$(".placeList > table > tbody> tr > td").css("cursor","pointer");

		// 목록 체크박스 전체선택/해제
		$("#chkAll").click(function() {
			if ($("#chkAll").is(":checked")) {
				$("input:checkbox[name='checkField']").each(function() {
					this.checked = true;
				});
			} else {
				$("input:checkbox[name='checkField']").each(function() {
					this.checked = false;
				});
			}
		});

		
		// 선택 삭제 버튼
		$("#btnPlaceDelete").click(function() {
			if ($("input[name=checkField]:checkbox:checked").length == 0) {
				alert("삭제할 평가장을 선택해 주세요.");
				return false;
			} else {
				// 평가장 삭제 프로세스 삽입
				alert("평가장 삭제가 진행됩니다.");
				return false;
			}
		});

		

		// 평가장 추가
		$("#formPlaceAdd").submit(function () {
			
			var placeName = $("#formPlaceAdd").find("#placeName").val();

			if ($.trim(placeName).length < 1) {
				alert("평가실명을 입력하세요.");
				$("#placeName").focus();
				return false;
			}

			if (confirm("평가실명을 저장하시겠습니까?"))	{
				return false;
			}
			else {
				return false;
			}
		});

		

		// 평가장 수정
		$("#formPlaceModify").submit(function () {
			
			var placeName = $("#formPlaceModify").find("#placeName").val();

			if ($.trim(placeName).length < 1) {
				alert("평가실명을 입력하세요.");
				$("#placeName").focus();
				return false;
			}

			if (confirm("평가실 정보를 수정하시겠습니까?"))	{
				return false;
			}
			else {
				return false;
			}
		})
	});

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
				<h3>가용자원</h3>

				<%@ include file = "../include/top.jsp" %>
			</div>
			<!-- 화면 상단 종료 -->
			
			<!-- s :contents_guide -->
			<div class="contents_guide">
				<div class="submenu_guide">
					<ul>
						<!-- 2차메뉴명 -->
						<li><a href="set_001.jsp">분과구성 현황</a></li>
						<li><a href="set_002.jsp">가용자원 조회_간사</a></li>
						<li><a href="set_003.jsp" class="active">가용자원 조회_평가장</a></li>
					</ul>
				</div>
				
				<!-- s :content_col2 -->
				<div class="content_col2 bg">
					<div>
						
						<form name="formPlaceAdd" id="formPlaceAdd" method="post">
						<div class="bbs_write01">
							<ul>
								<li><span>평가장 추가</span>
								<select class="input_w20">
									<option>본사</option>
								</select>
								<input type="text" class="input_w70" id="placeName" placeholder="평가실명을 등록하세요.">
								</li>								
							</ul>
						</div>

						<div class="btn_guide al fc_red mt10">
							오류 : 동일한 평가장이 있습니다.
						</div>

						<div class="btn_guide ar mt-20">
							<button type="submit" class="btn_style02 btn_green" id="btnPlaceAdd">평가장 추가</button>
						</div>
						</form>
						
						<!-- 평가실 목록 시작 -->
						<div class="bbs_list mt30 placeList">
							<table>
								<thead>
								  <tr>
									<th scope="col"><input type="checkbox" id="chkAll"></th>
									<th scope="col">위치</th>
									<th scope="col">평가실명</th>
									<th scope="col">사용여부</th>
									<th scope="col">등록일</th>
								  </tr>
								</thead>
								<tbody>
								  <tr class="over"> <!-- 선택된 평가실 tr 표시 -->
									<td><input type="checkbox" name="checkField"></td>
									<td>본사</td>
									<td>502호</td>
									<td>사용</td>
									<td>21.04.25</td>
								  </tr>
								  <tr>
									<td><input type="checkbox" name="checkField"></td>
									<td>분원1</td>
									<td>102호</td>
									<td>사용</td>
									<td>21.04.25</td>
								  </tr>
								  <tr>
									<td><input type="checkbox" name="checkField"></td>
									<td>분원2</td>
									<td>202호</td>
									<td>사용</td>
									<td>21.04.25</td>
								  </tr>
								  <tr>
									<td><input type="checkbox" name="checkField"></td>
									<td>외부</td>
									<td>A호텔 세미나실 1호</td>
									<td>사용</td>
									<td>21.04.25</td>
								  </tr>
								  <tr>
									<td><input type="checkbox" name="checkField"></td>
									<td>본사</td>
									<td>503호</td>
									<td>사용</td>
									<td>21.04.25</td>
								  </tr>
								</tbody>
							</table>
						</div>
						<!-- 평가실 목록 끝 -->

						
						<div class="btn_guide al">
							<button type="button" class="btn_style02 btn_gray" id="btnPlaceDelete">선택삭제</button>
						</div>
					</div>
					<!-- e :bbs_write01 -->
					
					
					<!-- 평가장 정보 수정 -->
					<div>
						<h4>평가장 정보</h4>
						
						<form name="formPlaceModify" id="formPlaceModify" method="post">
						<div class="btn_guide ar mt-50 mb10">
							<button type="submit" class="btn_style02 btn_green" id="btnPlaceModify">저장</button>
						</div>
						<div class="bbs_list">
							<table class="table_l">
							  <tbody>
								<tr>
								  <th scope="row">위치 *</th>
								  <td>
									<select class="input_w90">
										<option>본사</option>
									</select>
								  </td>
								</tr>
								<tr>
								  <th scope="row">평가실 *</th>
								  <td>
									<input type="text" class="input_w90" id="placeName" value="502호">
								  </td>
								</tr>
								<tr>
								  <th scope="row">주소</th>
								  <td>
									<input type="text" class="input_w20" >
									<button type="button" class="btn_style03 btn_gray">우편번호 선택</button>
									<br>
									<input type="text" class="input_w90">
									<br>
									<input type="text" class="input_w90">
								  </td>
								</tr>
								<tr>
								  <th scope="row">사용설정 *</th>
								  <td>
									<label><input type="radio" checked> 사용</label>
									&nbsp;&nbsp;&nbsp;
									<label><input type="radio"> 미사용</label>
								  </td>
								</tr>
							  </tbody>
							</table>
						</div>
						</form>
						
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
