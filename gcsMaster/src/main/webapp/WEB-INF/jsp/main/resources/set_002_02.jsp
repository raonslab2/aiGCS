<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>TIPA 스케쥴기반 평가관리시스템</title>
<%@ include file = "../include/src.jsp" %>


<script type="text/javascript">
	$(document).ready(function() {

		// 지원가능여부 확인 버튼
		$("#btnDivComfirm").click(function() {
			window.location.href = "set_002_02.jsp";
		});
		

		// 사업분서 검색 자동완성 기능
		$("#searchName").autocomplete({
			source: ["경영전략본부","경영전략기획실","경영기획실","전략경영본부","전략경영지원"],
			select: function(event, ui) {
				console.log(ui.item);
			},
		
			focus: function(event, ui) {
				return false;
				//event.preventDefault();
			}
		});

		
		// 달력 입력 datepicker 설정
		$('.inputCalendar').datepicker({
			dateFormat : 'yyyy.mm.dd'		// 날짜 형태 설정		
		});	


		// 기간검색 버튼 클릭
		$(".period > a").click(function() {

			$(".period > a").removeClass("active");
			$(this).addClass("active");
			
			var searchDate1 = "";
			var searchDate2 = "";
			var dateDiv = $(this).index();
			var now = new Date();
			
			var yy = now.getFullYear();
			var mm = ('0' + (now.getMonth() + 1)).slice(-2);
			var dd = ('0' + now.getDate()).slice(-2);
			searchDate2 = yy + '.' + mm  + '.' + dd;

			if (dateDiv == "0") {	// 오늘
				searchDate1 = searchDate2;
			}

			else if (dateDiv == "1") {	// 7일
				var d = new Date(now.setDate(now.getDate() - 6));
				var yy = d.getFullYear();
				var mm = ('0' + (d.getMonth() + 1)).slice(-2);
				var dd = ('0' + d.getDate()).slice(-2);
				searchDate1 = yy + '.' + mm  + '.' + dd;
			}

			else if (dateDiv == "2") {	// 15일
				var d = new Date(now.setDate(now.getDate() - 14));
				var yy = d.getFullYear();
				var mm = ('0' + (d.getMonth() + 1)).slice(-2);
				var dd = ('0' + d.getDate()).slice(-2);
				searchDate1 = yy + '.' + mm  + '.' + dd;
			}

			else if (dateDiv == "3") {	// 1개월
				d = new Date(now.setMonth(now.getMonth() - 1));
				var yy = d.getFullYear();
				var mm = ('0' + (d.getMonth() + 1)).slice(-2);
				var dd = ('0' + d.getDate()).slice(-2);
				searchDate1 = yy + '.' + mm  + '.' + dd;
			}

			else if (dateDiv == "4") {	// 5개월
				d = new Date(now.setMonth(now.getMonth() - 5));
				var yy = d.getFullYear();
				var mm = ('0' + (d.getMonth() + 1)).slice(-2);
				var dd = ('0' + d.getDate()).slice(-2);
				searchDate1 = yy + '.' + mm  + '.' + dd;
			}

			else {	// 전체
				searchDate1 = "";
				searchDate2 = "";
			}

			$("#searchDate1").val(searchDate1);
			$("#searchDate2").val(searchDate2);
		});

		
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

		
		// 선택확정 버튼
		$("#btnListConfirm").click(function() {
			if ($("input[name=checkField]:checkbox:checked").length == 0) {
				alert("선택확정 대상 정보를 선택해 주세요.");
				return false;
			} else {
				// 선택확정 프로세스 삽입
				alert("선택확정 프로세스 진행됩니다.");
				return false;
			}
		});
	});



</script>

</head>

<body>
	<!-- s :wrap -->
	<div id="wrap">
		<!-- s :lnb_guide -->
		<div class="lnb_guide">
			<%@ include file = "../include/menu.jsp" %>
		</div>
		<!-- e :lnb_guide -->
			
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
						<li><a href="set_002.jsp" class="active">가용자원 조회_간사</a></li>
						<li><a href="set_003.jsp">가용자원 조회_평가장</a></li>
					</ul>
				</div>
				
				<!-- s :content_col2 -->
				<div class="content_col2">
					<div class="bbs_write01 w50">
						<ul>
							<li><span>사업명</span>
							<select class="input_w20">
								<option>2021년</option>
								<option>2020년</option>
								<option>2019년</option>
							</select>
							<input type="text" class="input_w70" id="searchName" placeholder="사업명을 입력하세요.">
							</li>
						</ul>
						<ul>
							<li><span>요청자</span>
							<select class="input_w60">
								<option>협력사업본부 대외협력기획실</option>
							</select>
							<select class="input_w30">
								<option>홍길동 (본부장)</option>
							</select>
							</li>
						</ul>
					</div>
					<!-- e :bbs_write01 -->
					
                    <div class="bbs_write01 w50">
                        <ul>
                            <li><span>평가기간</span>
								<input type="text" class="inputCalendar" name="searchDate1" id="searchDate1">
								~
								<input type="text" class="inputCalendar" name="searchDate2" id="searchDate2">

								<div class="period">
									<a href="#">오늘</a>
									<a href="#">7일</a>
									<a href="#">15일</a>
									<a href="#">1개월</a>
									<a href="#">5개월</a>
									<a href="#" class="active">전체</a>
								</div>
                            </li>
							<li><span>대상자</span>
							<select class="input_w60">
								<option>부서 전체</option>
							</select>
							<select class="input_w30">
								<option>전체</option>
							</select>
                            </li>
                        </ul>
                    </div>
					<!-- e :bbs_write01 -->
					
					<div class="btn_guide ac mb20 w100">
                        <button type="button" class="btn_style01 sb_style btn_red">조회하기</button>
                    </div>
					<!-- e :btn_guide -->
				</div>
				<!-- e :content_col2 -->
				
                <div class="bbs_list">
                	<table>
					  	<caption>지원요청 목록 및 결과목록으로 현황, 요청일시, 사업명, 부서, 이름, 가능여부, 확정여부, 요청일, 답변일시, 요청자를 보여주는 리스트화면</caption>
						
						<thead>
						<tr>
						  <th scope="col"><input type="checkbox" id="chkAll"></th>
						  <th scope="col">현황</th>
						  <th scope="col">요청일시</th>
						  <th scope="col">사업명</th>
						  <th scope="col">부서</th>
						  <th scope="col">이름</th>
						  <th scope="col">가능여부</th>
						  <th scope="col">확정여부</th>
						  <th scope="col">요청일</th>
						  <th scope="col">답변일시</th>
						  <th scope="col">요청자</th>
						</tr>
						</thead>
						<tbody>
						<tr>
						  <td><input type="checkbox" name="checkField"></td>
						  <td>대기</td>
						  <td>21.03.25 14:00</td>
						  <td>중소기업혁신개발사업(수출지향형) 1차</td>
						  <td>대외협력기획실</td>
						  <td>홍길순</td>
						  <td>-</td>
						  <td></td>
						  <td>21.03.20</td>
						  <td></td>
						  <td>요청자</td>
						</tr>
						<tr>
						  <td><input type="checkbox" name="checkField"></td>
						  <td>대기</td>
						  <td>21.03.25 14:00</td>
						  <td>중소기업혁신개발사업(수출지향형) 1차</td>
						  <td>대외협력기획실</td>
						  <td>홍길순</td>
						  <td>-</td>
						  <td></td>
						  <td>21.03.20</td>
						  <td></td>
						  <td>요청자</td>
						</tr>
						<tr>
						  <td><input type="checkbox" name="checkField"></td>
						  <td>대기</td>
						  <td>21.03.25 14:00</td>
						  <td>중소기업혁신개발사업(수출지향형) 1차</td>
						  <td>대외협력기획실</td>
						  <td>홍길순</td>
						  <td>가능</td>
						  <td></td>
						  <td>21.03.20</td>
						  <td>21.03.25 14:00</td>
						  <td>요청자</td>
						</tr>
						<tr>
						  <td><input type="checkbox" name="checkField"></td>
						  <td>대기</td>
						  <td>21.03.25 14:00</td>
						  <td>중소기업혁신개발사업(수출지향형) 1차</td>
						  <td>대외협력기획실</td>
						  <td>홍길순</td>
						  <td>가능</td>
						  <td>확정</td>
						  <td>21.03.20</td>
						  <td>21.03.25 14:00</td>
						  <td>요청자</td>
						</tr>
						<tr>
						  <td><input type="checkbox" name="checkField"></td>
						  <td>대기</td>
						  <td>21.03.25 14:00</td>
						  <td>중소기업혁신개발사업(수출지향형) 1차</td>
						  <td>대외협력기획실</td>
						  <td>홍길순</td>
						  <td>불가능</td>
						  <td>확정</td>
						  <td>21.03.20</td>
						  <td>21.03.25 14:00</td>
						  <td>요청자</td>
						</tr>
						<tr>
						  <td><input type="checkbox" name="checkField"></td>
						  <td>대기</td>
						  <td>21.03.25 14:00</td>
						  <td>중소기업혁신개발사업(수출지향형) 1차</td>
						  <td>대외협력기획실</td>
						  <td>홍길순</td>
						  <td>-</td>
						  <td></td>
						  <td>21.03.20</td>
						  <td>21.03.25 14:00</td>
						  <td>요청자</td>
						</tr>
						<tr>
						  <td><input type="checkbox" name="checkField"></td>
						  <td>대기</td>
						  <td>21.03.25 14:00</td>
						  <td>중소기업혁신개발사업(수출지향형) 1차</td>
						  <td>대외협력기획실</td>
						  <td>홍길순</td>
						  <td>-</td>
						  <td></td>
						  <td></td>
						  <td>21.03.25 14:00</td>
						  <td>요청자</td>
						</tr>
						<tr>
						  <td><input type="checkbox" name="checkField"></td>
						  <td>대기</td>
						  <td>21.03.25 14:00</td>
						  <td>중소기업혁신개발사업(수출지향형) 1차</td>
						  <td>대외협력기획실</td>
						  <td>홍길순</td>
						  <td>-</td>
						  <td></td>
						  <td></td>
						  <td>21.03.25 14:00</td>
						  <td>요청자</td>
						</tr>
						<tr>
						  <td><input type="checkbox" name="checkField"></td>
						  <td>대기</td>
						  <td>21.03.25 14:00</td>
						  <td>중소기업혁신개발사업(수출지향형) 1차</td>
						  <td>대외협력기획실</td>
						  <td>홍길순</td>
						  <td>-</td>
						  <td></td>
						  <td>21.03.20</td>
						  <td>21.03.25 14:00</td>
						  <td>요청자</td>
						</tr>
						<tr>
						  <td><input type="checkbox" name="checkField"></td>
						  <td>대기</td>
						  <td>21.03.25 14:00</td>
						  <td>중소기업혁신개발사업(수출지향형) 1차</td>
						  <td>대외협력기획실</td>
						  <td>홍길순</td>
						  <td>-</td>
						  <td></td>
						  <td>21.03.20</td>
						  <td>21.03.25 14:00</td>
						  <td>요청자</td>
						</tr>
					  </tbody>
					</table>
				</div>
				<!-- e :bbs_list -->
					
				<div class="bbs_page">
				  <ul>
					<li class="first"><a href="#" title="첫 페이지 바로가기"><img src="../../images/bbs_prev02.gif" alt="첫 페이지"></a></li>
					<li class="prev"><a href="#" title="이전 페이지(1page) 바로가기"><img src="../../images/bbs_prev01.gif" alt="이전 페이지"></a></li>
					<li class="active">1</li>
					<li class=""><a href="#" title="2페이지 바로가기">2</a></li>
					<li class=""><a href="#" title="3페이지 바로가기">3</a></li>
					<li class=""><a href="#" title="4페이지 바로가기">4</a></li>
					<li class=""><a href="#" title="5페이지 바로가기">5</a></li>
					<li class="next"><a href="#" title="다음 페이지(11page) 바로가기"><img src="../../images/bbs_next01.gif" alt="다음 페이지"></a></li>
					<li class="last"><a href="#" title="끝 페이지(67page) 바로가기"><img src="../../images/bbs_next02.gif" alt="마지막 페이지"></a></li>
				  </ul>
				</div>
				<!-- e :bbs_page -->
				
				<div class="btn_guide al">
					<button type="button" class="btn_style02 btn_green" id="btnListConfirm">선택 확정</button>
				</div>
			</div>
			<!-- e :contents_guide -->

		</div>
		<!-- e :right_guide -->
	</div>
	<!-- e :wrap -->

</body>
</html>
