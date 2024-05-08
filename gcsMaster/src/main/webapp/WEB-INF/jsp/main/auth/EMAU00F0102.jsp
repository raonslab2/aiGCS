<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>TIPA 스케쥴기반 평가관리시스템</title>
<%@ include file = "../include/src.jsp" %>

<script type="text/javascript">
	$(document).ready(function() {

		// 사업명 자동완성 기능
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

		

		// 사업목록 커서
		$(".authBusList > td").css("cursor","pointer");

		
		// 사업목록 클릭에 따라 하위 사업 목록 open, close 이벤트
		$(".authBusList").click(function() {
			//console.log($(this));

			var c1 = $(this).attr("class");
			c1 = c1.replace("authBusList", "");
			c1 = $.trim(c1);
			//console.log(c1);

			$.each($(".authBusList"), function(index, item) {
				var c2 = $(this).attr("class");
				c2 = c2.replace("authBusList", "");
				c2 = $.trim(c2);
				//console.log(c2);

				if (c2.indexOf(c1) > -1 && c2.length == (c1.length+2)) {
					var obj = $("."+c2);

					if (obj.css("display") == "none") {
						obj.css("display","");
						
						if (c1.length == 9) {
							$("."+c1).find(".text_l").find("span").removeClass("icon_off01");
							$("."+c1).find(".text_l").find("span").addClass("icon_on01");
						} else {
							$("."+c1).find(".text_l").find("span").removeClass("icon_off02");
							$("."+c1).find(".text_l").find("span").addClass("icon_on02");
						}

					} else {
						obj.css("display","none");

						$.each($(".authBusList"), function(index, item) {
							var c3 = $(this).attr("class");
							c3 = c3.replace("authBusList", "");
							c3 = $.trim(c3);
							//console.log(c3);

							if (c3.indexOf(c2) > -1 && c3.length == (c2.length+2)) {
								var obj = $("."+c3);
								obj.css("display","none");

								$("."+c2).find(".text_l").find("span").removeClass("icon_on02");
								$("."+c2).find(".text_l").find("span").addClass("icon_off02");
							}

						});
						
						
						if (c1.length == 9) {
							$("."+c1).find(".text_l").find("span").removeClass("icon_on01");
							$("."+c1).find(".text_l").find("span").addClass("icon_off01");
						} else {
							$("."+c1).find(".text_l").find("span").removeClass("icon_on02");
							$("."+c1).find(".text_l").find("span").addClass("icon_off02");
						}
					}
				}

			});
		});


		// 부서별 권한설정 체크박스 전체선택/해제
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

		// 담당자 추가 버튼
		$("#btnUserAdd").click(function() {
			fnPopupOpen("../popup/em_auth_001_01.jsp", "");	// ../js/popup.js 참고
		});

		
		// 담당자 삭제 버튼
		$("#btnUserDelete").click(function() {
			if ($("input[name=checkField]:checkbox:checked").length == 0) {
				alert("삭제할 담당자를 선택하세요.");
				return false;
			} else {
				if (confirm("선택하신 담당자를 삭제하시겠습니까?")) {
					return false;				
				}
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
				<h3>권한관리</h3>

				<%@ include file = "../include/top.jsp" %>
			</div>
			<!-- 화면 상단 종료 -->
			
			<!-- s :contents_guide -->
			<div class="contents_guide">
				<div class="submenu_guide">
					<ul>
						<!-- 2차메뉴명 -->
						<li><a href="EMAU00F0101.jsp">담당자별</a></li>
						<li><a href="EMAU00F0102.jsp" class="active">사업별</a></li>
						<li><a href="EMAU00F0103.jsp">기관담당자</a></li>
					</ul>
				</div>

				<!-- s :content_col2 -->
				<div class="content_col2 bg">
					<div>
						<ul class="">
							<li class="ac">
								<select>
									<option>2021년</option>
									<option>2020년</option>
								</select>
								
								<span class="search_box03 input_w70">
									<input type="text" id="searchName" placeholder="사업명 입력">
									<button type="button" class="btn_search01">검색</button>
								</span>
							</li>
						</ul>
						<div class="bbs_list mt30">
							<table>
							  <thead>
								<tr>
								  <th scope="col">사업</th>
								  <th scope="col">권한설정</th>
								</tr>
							  </thead>		  
							  <tbody> 

								<!--
									====== 사업 단계에 따라 클래스 정의 ======
									1. 목록의 모든 tr에는 authBusList 클래스 삽입
									2. 최상위 사업명의 클래스 정의 : busList01 처럼 busList값은 동일하게 적용하고, 최상위 사업명의 순서에 따라 01, 02 ... 부여 (busList01, busList02 ...)
									3. 중간 사업명 클래스 정의 : 최상위 사업의 클래스에 순서에 따라 01, 02 ... 추가 부여 (busList0101, busList0102, busList0103 .....)
									4. 세부 사업명 클래스 정의 : 중간 사업의 클래스에 순서에 따라 01, 02 ... 추가 부여 (busList010101, busList010102, busList010103 .....)

									
									====== 사업 단계 및 하위 사업목록의 open에 따라 제목 앞 아이콘 클래스 정의 ======
									1. 최상위 사업명 아이콘 : icon_on01 - 하위 사업 open, icon_off01 - 하위 사업 close
									2. 중간 사업명 아이콘 : icon_on02 - 하위 사업 open, icon_off02 - 하위 사업 close
								-->
								<tr class="authBusList busList01"> 
								  <td class="text_l"><span class="step_icon icon_off01"></span> 중소기업혁신개발사업</td>
								  <td><button type="button" class="btn_style03 btn_white">관리</button></td>
								</tr>
								<tr class="authBusList busList0101" style="display:none;">
								  <td class="text_l icon_arrow"><span class="step_icon icon_off02"></span>중소기업기술혁신개발사업(수출지향형)</td>
								  <td><button type="button" class="btn_style03 btn_white">관리</button></td>
								</tr>
								<tr class="authBusList busList010101" style="display:none;">
								  <td class="text_l icon_arrow02">중소기업기술혁신개발사업(수출지향형) 1차</td>
								  <td><button type="button" class="btn_style03 btn_red">등록</button></td>
								</tr>
								<tr class="authBusList busList010102" style="display:none;">
								  <td class="text_l icon_arrow02">중소기업기술혁신개발사업(수출지향형) 2차</td>
								  <td><button type="button" class="btn_style03 btn_white">관리</button></td>
								</tr>
								<tr class="authBusList busList0102" style="display:none;">
								  <td class="text_l icon_arrow"><span class="step_icon icon_off02"></span>중소기업기술혁신개발사업(수출지향형)</td>
								  <td><button type="button" class="btn_style03 btn_white">관리</button></td>
								</tr>
								<tr class="authBusList busList010201" style="display:none;">
								  <td class="text_l icon_arrow02">중소기업기술혁신개발사업(수출지향형) 1차</td>
								  <td><button type="button" class="btn_style03 btn_red">등록</button></td>
								</tr>
								<tr class="authBusList busList010202" style="display:none;">
								  <td class="text_l icon_arrow02">중소기업기술혁신개발사업(수출지향형) 2차</td>
								  <td><button type="button" class="btn_style03 btn_white">관리</button></td>
								</tr>
								

								<tr class="authBusList busList02">
								  <td class="text_l"><span class="step_icon icon_off01"></span> 공정품질개발사업</td>
								  <td><button type="button" class="btn_style03 btn_white">관리</button></td>
								</tr>
								<tr class="authBusList busList0201" style="display:none;">
								  <td class="text_l icon_arrow"><span class="step_icon icon_off02"></span>중소기업기술혁신개발사업(수출지향형)</td>
								  <td><button type="button" class="btn_style03 btn_white">관리</button></td>
								</tr>
								<tr class="authBusList busList020101" style="display:none;">
								  <td class="text_l icon_arrow02">중소기업기술혁신개발사업(수출지향형) 1차</td>
								  <td><button type="button" class="btn_style03 btn_red">등록</button></td>
								</tr>
								

								<tr class="authBusList busList03">
								  <td class="text_l"><span class="step_icon icon_off01"></span> 상용화기술개발사업</td>
								   <td><button type="button" class="btn_style03 btn_red">등록</button></td>
								</tr>
								<tr class="authBusList busList0301" style="display:none;">
								  <td class="text_l icon_arrow"><span class="step_icon icon_off02"></span>중소기업기술혁신개발사업(수출지향형) 1</td>
								  <td><button type="button" class="btn_style03 btn_white">관리</button></td>
								</tr>
								<tr class="authBusList busList030101" style="display:none;">
								  <td class="text_l icon_arrow02">중소기업기술혁신개발사업(수출지향형) 1차</td>
								  <td><button type="button" class="btn_style03 btn_red">등록</button></td>
								</tr>
								<tr class="authBusList busList030102" style="display:none;">
								  <td class="text_l icon_arrow02">중소기업기술혁신개발사업(수출지향형) 2차</td>
								  <td><button type="button" class="btn_style03 btn_red">등록</button></td>
								</tr>
								<tr class="authBusList busList030103" style="display:none;">
								  <td class="text_l icon_arrow02">중소기업기술혁신개발사업(수출지향형) 3차</td>
								  <td><button type="button" class="btn_style03 btn_red">등록</button></td>
								</tr>
								<tr class="authBusList busList0302" style="display:none;">
								  <td class="text_l icon_arrow"><span class="step_icon icon_off02"></span>중소기업기술혁신개발사업(수출지향형) 2</td>
								  <td><button type="button" class="btn_style03 btn_white">관리</button></td>
								</tr>
								<tr class="authBusList busList0303" style="display:none;">
								  <td class="text_l icon_arrow"><span class="step_icon icon_off02"></span>중소기업기술혁신개발사업(수출지향형) 3</td>
								  <td><button type="button" class="btn_style03 btn_white">관리</button></td>
								</tr>
								<tr class="authBusList busList030301" style="display:none;">
								  <td class="text_l icon_arrow02">중소기업기술혁신개발사업(수출지향형) 1차</td>
								  <td><button type="button" class="btn_style03 btn_red">등록</button></td>
								</tr>
								<tr class="authBusList busList030302" style="display:none;">
								  <td class="text_l icon_arrow02">중소기업기술혁신개발사업(수출지향형) 2차</td>
								  <td><button type="button" class="btn_style03 btn_red">등록</button></td>
								</tr>
							  </tbody>
							</table>
						</div>
						<!-- e :btn_guide -->
					</div>
					<!-- e :bbs_write01 -->
					
					<div>
						<h4>기본정보</h4>
						<div class="bbs_list">
							<table class="table_l">
							  <tbody>
								<tr>
								  <th scope="row">사업년도</th>
								  <td>2021년</td>
								</tr>
								<tr>
								  <th scope="row">사업명 *</th>
								  <td>중소기업기술혁신개발사업(수출지향형) 1차</td>
								</tr>
								<tr>
								  <th scope="row">상위사업명</th>
								  <td>중소기업혁신개발사업(수출지향형)</td>
								</tr>
								<tr>
								  <th scope="row">사용설정 *</th>
								  <td><input type="radio"> 사용 <input type="radio"> 미사용</td>
								</tr>
							  </tbody>
							</table>
						</div>
						
						<h4>사업권한 가져오기</h4>
						<div class="mb20">
							<ul>
								<li>
									<select>
										<option>2021년</option>
										<option>2020년</option>
									</select>									
								
									<span class="search_box03 input_w70">
										<input type="text" placeholder="사업명 입력">
										<button type="button" class="btn_search01">검색</button>
									</span>
								</li>
								<li class="mt10">
									<button type="button" class="btn_style02 sb_style  btn_blue">중소기업(수출지향형)</button>
									<button type="button" class="btn_style02 sb_style  btn_blue">중소기업 R&amp;D 역량 재고사업</button>
								</li>
							</ul>
						</div>
						
						<h4>부서별 권한설정</h4>
						<div class="bbs_list">
							<table class="table_l">
							  <tbody>
								<tr>
								  <th scope="row">사업부서</th>
								  <td><select>
										<option>협력사업본부 대외협력기획실</option>
									</select>
								  </td>
								</tr>
								<tr>
								  <th scope="row">권한그룹선택</th>
								  <td>
									  <ul class="data_list02">
										  <li><input type="radio"> 사업관리</li>
										  <li><input type="radio"> 담당간사</li>
										  <li><input type="radio"> 실무자</li>
										  <li><input type="radio"> 일반</li>
									  </ul>
								  </td>
								</tr>
							  </tbody>
							</table>
						</div>
						
						<h4>부서별 권한설정</h4>
						<div class="btn_guide ar mt-50 mb10">
							<button type="button" class="btn_style02 btn_gray" id="btnUserDelete">담당자 삭제</button>
							<button type="button" class="btn_style02 btn_green" id="btnUserAdd">담당자 추가</button>
						</div>
						<div class="bbs_list">
							<table>
								<thead>
								  <tr>
									<th scope="col"><input type="checkbox" id="chkAll"></th>
									<th scope="col">부서명</th>
									<th scope="col">이름</th>
									<th scope="col">직급</th>
									<th scope="col">아이디</th>
									<th scope="col">권한</th>
								  </tr>
								</thead>
								<tbody>
								  <tr>
									<td><input type="checkbox" name="checkField"></td>
									<td>정보화지원실</td>
									<td>이이</td>
									<td>본부장</td>
									<td>333333</td>
									<td>&nbsp;</td>
								  </tr>
								  <tr>
									<td><input type="checkbox" name="checkField"></td>
									<td>협력사업본부</td>
									<td>이이</td>
									<td>실장</td>
									<td>333333</td>
									<td>&nbsp;</td>
								  </tr>
								  <tr>
									<td><input type="checkbox" name="checkField"></td>
									<td>대외협력기획실</td>
									<td>이이</td>
									<td>주임연구원</td>
									<td>333333</td>
									<td>&nbsp;</td>
								  </tr>
								  <tr>
									<td><input type="checkbox" name="checkField"></td>
									<td>대외협력기획실</td>
									<td>이이</td>
									<td>주임연구원</td>
									<td>333333</td>
									<td>&nbsp;</td>
								  </tr>
								  <tr>
									<td><input type="checkbox" name="checkField"></td>
									<td>정보화지원실</td>
									<td>이이</td>
									<td>주임연구원</td>
									<td>333333</td>
									<td>&nbsp;</td>
								  </tr>
								</tbody>
							</table>
						</div>
					</div>
					<!-- e :bbs_write01 -->
                        
                    </div>
					<!-- e :회원정보 -->
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
