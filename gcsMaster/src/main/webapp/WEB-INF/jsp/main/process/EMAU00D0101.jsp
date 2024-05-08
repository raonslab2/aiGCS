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
		

		// 분류이동편집 버튼
		$("#btnCategoryEdit").click(function() {
			fnPopupOpen("../popup/proce_003_011.jsp", "");	// ../js/popup.js 참고
		});
		

		// 프로세스 가져오기 버튼
		$("#btnProcessGet").click(function() {
			fnPopupOpen("../popup/proce_002_01.jsp", "");	// ../js/popup.js 참고
		});

		// 일정적용 버튼
		$("#btnScheduleApp").click(function() {
			$(".listDate").each(function(index) {
				$(".listDate").eq(index).html("");
				$(".listDate").eq(index).text("2021.07.03");
			});
		});

		// 목록의 시작일 및 완료일 td 클릭 : 팝업 오픈
		$(".listDate").css("cursor","pointer");
		$(".listDate").click(function(e) {

			// 마우스 클릭 위치 가져오기
			var divTop = e.clientY - 60; // 상단 좌표 위치 안맞을시 e.pageY 
			var divLeft = e.clientX-620; // 좌측 좌표 위치 안맞을시 e.pageX

			$("#popDateInput").css("top",divTop);
			$("#popDateInput").css("left",divLeft);
			$("#popDateInput").css("display","block");
		});

		// 시작일 및 완료일 입력 팝업의 닫기(X) 클릭
		$(".btnPopDateInputClose").click(function() {
			$("#popDateInput").css("display","none");
		});

		// 달력 입력 datepicker 설정
		$('.inputCalendar').datepicker({
			dateFormat : 'yyyy.mm.dd'		// 날짜 형태 설정		
		});	

		// 목록 체크박스 체크 및 해제할 때 경고창 띄우고 자동으로 닫기
		$(".listChkbox").click(function() {
			 var dialog = $('<p>정보가 저장되었습니다.</p>').dialog({
				modal: true,
            	title : "알림",
				dialogClass : "dialogZindex",
				width: 250,
				height: 100,
				open: function (event, ui) {
					setTimeout(function () {
						 dialog.dialog('close');
					}, 1000); // alert 창 닫는 시간 1000 = 1초
				}
			});

		});


		// 최초 하위 프로세스 감추기
		$(".processDown").parent().css("display","none");

		// 프로세스 클릭 커서 변경
		$(".processUp").css("cursor","pointer");

		// 하위 프로세스 펼치기/감추기
		$(".processUp").each(function(index) {
			$(this).click(function() {
				//alert(index);
				
				// 상위 프로세스 상태 파악
				var strClass = $(this).find("span").attr("class");
				//alert(strClass);
				
				var state = "";
				if (strClass.indexOf("icon_off01") > -1) {	// 감춘상태 --> 펼친다
					$(this).find("span").removeClass("icon_off01");
					$(this).find("span").addClass("icon_on01");
					
					state = "";
				}
				else {	// 펼친상태 --> 감춘다
					$(this).find("span").removeClass("icon_on01");
					$(this).find("span").addClass("icon_off01");

					state = "none";
				}

				// 하위 프로세스 시작 및 끝 위치
				var startIndex = $(this).parent().index() + 1;
				var endIndex = $(".processUp").eq(index+1).parent().index();

				//alert(startIndex);
				//alert(endIndex);
				

				if (endIndex < 0) {
					//console.log($(this).parent().parent().find("tr").last());
					endIndex = $(this).parent().parent().find("tr").last().index() + 1;
				}
				//alert(endIndex);

				for (var i = startIndex; i < endIndex; i++ ) {
					$(this).parent().parent().find("tr").eq(i).css("display",state);
				}

			});
		});
	});
</script>

<style>
.dialogZindex {
   z-index: 100000;
}
</style>

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
				<h3>프로세스 관리</h3>

				<%@ include file = "../include/top.jsp" %>
			</div>
			<!-- 화면 상단 종료 -->
			
			<!-- s :contents_guide -->
			<div class="contents_guide">
				<div class="submenu_guide">
					<ul>
						<!-- 2차메뉴명 -->
						<li><a href="EMAU00D0101.jsp" class="active">프로세스 매핑</a></li>
						<li><a href="EMAU00D0102.jsp">프로세스 설정</a></li>
						<li><a href="EMAU00D0103.jsp">표준일정 설정</a></li>
						<li><a href="EMAU00D0104.jsp">휴일설정</a></li>
					</ul>
				</div>
				
				<div class="btn_guide ar mt-65 mb30">
					<button type="button" class="btn_style01 btn_blue">프로세스 저장</button>
				</div>
				<!-- e :btn_guide -->
				
				<!-- 검색 form 시작 -->
				<form name="searchForm" method="post">
				<ul>
					<li class="ac">
						<select name="">
							<option>2021년</option>
							<option>2020년</option>
							<option>2019년</option>
						</select>


						<!-- 사업명 검색 -->
						<span class="search_box03 input_w30">
							<input type="text" id="searchName" placeholder="사업명 입력">
							<button type="submit" class="btn_search01">검색</button>
						</span>
					</li>
				</ul>
				</form>
				<!-- 검색 form 종료 -->


				<div class="bbs_list">
					<table>
					  <caption>사업정보</caption>
					  <thead>
						<tr>
						  <th scope="col"><input type="checkbox"></th>
						  <th scope="col">Code</th>
						  <th scope="col">사업년도</th>
						  <th scope="col">사업명</th>
						  <th scope="col">세부 사업명</th>
						  <th scope="col">사업부서</th>
						  <th scope="col">담당간사</th>
						  <th scope="col">등록일</th>
						</tr>
					  </thead>		  
					  <tbody>
						<tr>
						  <td><input type="checkbox"></td>
						  <td>S2019</td>
						  <td>2021</td>	
						  <td class="text_l">중소기업혁신개발사업(수출지향형)</td>
						  <td class="text_l">중소기업혁신개발사업(수출지향형) 1차</td>
						  <td>창업성장사업실</td>
						  <td>홍길동</td>
						  <td>21.03.25</td>
						</tr>
					  </tbody>
					</table>
				</div>
				
					
				<h4>프로세스 선택</h4>
				
				<div class="btn_guide ar mt-45 mb10">
					<button type="button" class="btn_style02 btn_gray" id="btnCategoryEdit">분류이동편집</button>
					<button type="button" class="btn_style02 btn_orange" id="btnProcessGet">프로세스 가져오기</button>
					<button type="button" class="btn_style02 btn_orange" id="btnScheduleApp" style="display:none;">일정적용</button>
				</div>
				<!-- e :btn_guide -->
				
				<p class="ar text_type02 mb10">시작일, 완료일 등록 및 변경 : 오른쪽 마우스 클릭, 일자 등록(수정) 후 상단(프로세스 저장] 버튼을 클릭해주세요.</p>
				<div class="bbs_list scroll sbox_h500">
					<table>
					  <caption>사업정보</caption>
					  <thead>
						<tr>
						  <th scope="col">프로세스</th>
						  <th scope="col">주요일정</th>
						  <th scope="col">사용여부</th>
						  <th scope="col">시작일</th>
						  <th scope="col">완료일</th>
						</tr>
					  </thead>		  
					  <tbody>

						<tr>
						  <td class="text_l processUp"><span class="step_icon icon_off01"></span> 사업공고</td>
						  <td><input type="checkbox" class="listChkbox" checked></td>
						  <td><input type="checkbox" class="listChkbox" checked></td>	
						  <td class="listDate">2021.04.03</td>
						  <td class="listDate">2021.04.03</td>
						</tr>

						<tr>
						  <td class="text_l processDown icon_arrow"><span class="step_icon icon_off02"></span>PMS내 분과구성</td>
						  <td><input type="checkbox" class="listChkbox"></td>
						  <td><input type="checkbox" class="listChkbox"></td>	
						  <td class="listDate"><button type="button" class="btn_style03 btn_red">등록</button></td>
						  <td class="listDate"><button type="button" class="btn_style03 btn_white">등록</button></td>
						</tr>
						<tr>
						  <td class="text_l processDown icon_arrow"><span class="step_icon icon_off02"></span>평가전문위원회 구성계획 수립</td>
						  <td><input type="checkbox" class="listChkbox"></td>
						  <td><input type="checkbox" class="listChkbox"></td>	
						  <td class="listDate"><button type="button" class="btn_style03 btn_red">등록</button></td>
						  <td class="listDate"><button type="button" class="btn_style03 btn_white">등록</button></td>
						</tr>
						<tr>
						  <td class="text_l processDown icon_arrow"><span class="step_icon icon_off02"></span>평가전문위원회 구성</td>
						  <td><input type="checkbox" class="listChkbox"></td>
						  <td><input type="checkbox" class="listChkbox"></td>	
						  <td class="listDate"><button type="button" class="btn_style03 btn_red">등록</button></td>
						  <td class="listDate"><button type="button" class="btn_style03 btn_white">등록</button></td>
						</tr>

						<tr>
						  <td class="text_l processUp"><span class="step_icon icon_off01"></span> 과제접수</td>
						  <td><input type="checkbox" class="listChkbox"></td>
						  <td><input type="checkbox" class="listChkbox"></td>	
						  <td class="listDate"><button type="button" class="btn_style03 btn_red">등록</button> </td><!--//클릭시팝업나옴-->
						  <td class="listDate"><button type="button" class="btn_style03 btn_white">등록</button></td>
						</tr>

						<tr>
						  <td class="text_l processUp"><span class="step_icon icon_off01"></span> 사전점검</td>
						  <td><input type="checkbox" class="listChkbox"></td>
						  <td><input type="checkbox" class="listChkbox"></td>	
						  <td class="listDate"><button type="button" class="btn_style03 btn_red">등록</button></td>
						  <td class="listDate"><button type="button" class="btn_style03 btn_white">등록</button></td>
						</tr>  

						<tr>
						  <td class="text_l processUp"><span class="step_icon icon_off01"></span> 서면평가</td>
						  <td><input type="checkbox" class="listChkbox"></td>
						  <td><input type="checkbox" class="listChkbox"></td>	
						  <td class="listDate"><button type="button" class="btn_style03 btn_red">등록</button></td>
						  <td class="listDate"><button type="button" class="btn_style03 btn_white">등록</button></td>
						</tr>

						<tr>
						  <td class="text_l processDown icon_arrow"><span class="step_icon icon_off02"></span>PMS내 분과구성</td>
						  <td><input type="checkbox" class="listChkbox"></td>
						  <td><input type="checkbox" class="listChkbox"></td>	
						  <td class="listDate"><button type="button" class="btn_style03 btn_red">등록</button></td>
						  <td class="listDate"><button type="button" class="btn_style03 btn_white">등록</button></td>
						</tr>
						<tr>
						  <td class="text_l processDown icon_arrow"><span class="step_icon icon_off02"></span>평가전문위원회 구성계획 수립</td>
						  <td><input type="checkbox" class="listChkbox"></td>
						  <td><input type="checkbox" class="listChkbox"></td>	
						  <td class="listDate"><button type="button" class="btn_style03 btn_red">등록</button></td>
						  <td class="listDate"><button type="button" class="btn_style03 btn_white">등록</button></td>
						</tr>
						<tr>
						  <td class="text_l processDown icon_arrow"><span class="step_icon icon_off02"></span>평가전문위원회 구성</td>
						  <td><input type="checkbox" class="listChkbox"></td>
						  <td><input type="checkbox" class="listChkbox"></td>	
						  <td class="listDate"><button type="button" class="btn_style03 btn_red">등록</button></td>
						  <td class="listDate"><button type="button" class="btn_style03 btn_white">등록</button></td>
						</tr>

						<tr>
						  <td class="text_l processUp"><span class="step_icon icon_off01"></span> 대면평가</td>
						  <td><input type="checkbox" class="listChkbox"></td>
						  <td><input type="checkbox" class="listChkbox"></td>	
						  <td class="listDate"><button type="button" class="btn_style03 btn_red">등록</button></td>
						  <td class="listDate"><button type="button" class="btn_style03 btn_white">등록</button></td>
						</tr>  

						<tr>
						  <td class="text_l processUp"><span class="step_icon icon_off01"></span> 대면평가</td>
						  <td><input type="checkbox" class="listChkbox"></td>
						  <td><input type="checkbox" class="listChkbox"></td>	
						  <td class="listDate"><button type="button" class="btn_style03 btn_red">등록</button></td>
						  <td class="listDate"><button type="button" class="btn_style03 btn_white">등록</button></td>
						</tr>  

						<tr>
						  <td class="text_l processUp"><span class="step_icon icon_off01"></span> 대면평가</td>
						  <td><input type="checkbox" class="listChkbox"></td>
						  <td><input type="checkbox" class="listChkbox"></td>	
						  <td class="listDate"><button type="button" class="btn_style03 btn_red">등록</button></td>
						  <td class="listDate"><button type="button" class="btn_style03 btn_white">등록</button></td>
						</tr> 

						<tr>
						  <td class="text_l processDown icon_arrow"><span class="step_icon icon_off02"></span>PMS내 분과구성</td>
						  <td><input type="checkbox" class="listChkbox"></td>
						  <td><input type="checkbox" class="listChkbox"></td>	
						  <td class="listDate"><button type="button" class="btn_style03 btn_red">등록</button></td>
						  <td class="listDate"><button type="button" class="btn_style03 btn_white">등록</button></td>
						</tr>
						<tr>
						  <td class="text_l processDown icon_arrow"><span class="step_icon icon_off02"></span>평가전문위원회 구성계획 수립</td>
						  <td><input type="checkbox" class="listChkbox"></td>
						  <td><input type="checkbox" class="listChkbox"></td>	
						  <td class="listDate"><button type="button" class="btn_style03 btn_red">등록</button></td>
						  <td class="listDate"><button type="button" class="btn_style03 btn_white">등록</button></td>
						</tr> 

						<tr>
						  <td class="text_l processUp"><span class="step_icon icon_off01"></span> 대면평가</td>
						  <td><input type="checkbox" class="listChkbox"></td>
						  <td><input type="checkbox" class="listChkbox"></td>	
						  <td class="listDate"><button type="button" class="btn_style03 btn_red">등록</button></td>
						  <td class="listDate"><button type="button" class="btn_style03 btn_white">등록</button></td>
						</tr> 
						
						<tr>
						  <td class="text_l processUp"><span class="step_icon icon_off01"></span> 대면평가</td>
						  <td><input type="checkbox" class="listChkbox"></td>
						  <td><input type="checkbox" class="listChkbox"></td>	
						  <td class="listDate"><button type="button" class="btn_style03 btn_red">등록</button></td>
						  <td class="listDate"><button type="button" class="btn_style03 btn_white">등록</button></td>
						</tr>  

						<tr>
						  <td class="text_l processDown icon_arrow"><span class="step_icon icon_off02"></span>PMS내 분과구성</td>
						  <td><input type="checkbox" class="listChkbox"></td>
						  <td><input type="checkbox" class="listChkbox"></td>	
						  <td class="listDate"><button type="button" class="btn_style03 btn_red">등록</button></td>
						  <td class="listDate"><button type="button" class="btn_style03 btn_white">등록</button></td>
						</tr>
						<tr>
						  <td class="text_l processDown icon_arrow"><span class="step_icon icon_off02"></span>평가전문위원회 구성계획 수립</td>
						  <td><input type="checkbox" class="listChkbox"></td>
						  <td><input type="checkbox" class="listChkbox"></td>	
						  <td class="listDate"><button type="button" class="btn_style03 btn_red">등록</button></td>
						  <td class="listDate"><button type="button" class="btn_style03 btn_white">등록</button></td>
						</tr>

						<tr>
						  <td class="text_l processUp"><span class="step_icon icon_off01"></span> 대면평가</td>
						  <td><input type="checkbox" class="listChkbox"></td>
						  <td><input type="checkbox" class="listChkbox"></td>	
						  <td class="listDate"><button type="button" class="btn_style03 btn_red">등록</button></td>
						  <td class="listDate"><button type="button" class="btn_style03 btn_white">등록</button></td>
						</tr>  
						<tr>
						  <td class="text_l processUp"><span class="step_icon icon_off01"></span> 대면평가111111</td>
						  <td><input type="checkbox" class="listChkbox"></td>
						  <td><input type="checkbox" class="listChkbox"></td>	
						  <td class="listDate"><button type="button" class="btn_style03 btn_red">등록</button></td>
						  <td class="listDate"><button type="button" class="btn_style03 btn_white">등록</button></td>
						</tr>  

						<tr>
						  <td class="text_l processDown icon_arrow"><span class="step_icon icon_off02"></span>PMS내 분과구성</td>
						  <td><input type="checkbox" class="listChkbox"></td>
						  <td><input type="checkbox" class="listChkbox"></td>	
						  <td class="listDate"><button type="button" class="btn_style03 btn_red">등록</button></td>
						  <td class="listDate"><button type="button" class="btn_style03 btn_white">등록</button></td>
						</tr>
						<tr>
						  <td class="text_l processDown icon_arrow"><span class="step_icon icon_off02"></span>평가전문위원회 구성계획 수립</td>
						  <td><input type="checkbox" class="listChkbox"></td>
						  <td><input type="checkbox" class="listChkbox"></td>	
						  <td class="listDate"><button type="button" class="btn_style03 btn_red">등록</button></td>
						  <td class="listDate"><button type="button" class="btn_style03 btn_white">등록</button></td>
						</tr>
						<tr>
						  <td class="text_l processDown icon_arrow"><span class="step_icon icon_off02"></span>평가전문위원회 구성계획 수립222222</td>
						  <td><input type="checkbox" class="listChkbox"></td>
						  <td><input type="checkbox" class="listChkbox"></td>	
						  <td class="listDate"><button type="button" class="btn_style03 btn_red">등록</button></td>
						  <td class="listDate"><button type="button" class="btn_style03 btn_white">등록</button></td>
						</tr>

					  </tbody>
					</table>
				</div>
				<!-- e :content_table -->

				
				<!-- s : 시작일, 완료일 입력 레이어 시작 -->
                <div id="popDateInput" class="Layer_popup">
                    <p class="right01"></p><!--왼쪽 말풍선인경우 class="left01" 변경-->
                    <div class="popup_guide popup_w200 popup_type02 box_mh400">
						<button type="button" class="closebtn btnPopDateInputClose">닫기</button>
                        <div class="popup_content">
                            <h5>TO-DO</h5>
							<ul class="data_list03 mb30">
								<li><input type="checkbox" checked> 적용안함</li>
								<li><input type="checkbox"> 시작일</li>
								<li><input type="checkbox"> 완료일</li>
							</ul>
							<h5>알람설정</h5>
							<ul class="data_list03">
								<li><input type="checkbox"> 설정안함</li>
								<li><input type="checkbox"> 10분 전</li>
								<li><input type="checkbox"> 30분 전</li>
								<li><input type="checkbox"> 1시간 전</li>
								<li><input type="checkbox" checked> 1일 전</li>
								<li><input type="checkbox"> 2일 전</li>
								<li><input type="checkbox"> 3일 전</li>
								<li><input type="checkbox"> 7일 전</li>
							</ul>
                        </div>
                        <!-- e :popup_content -->
                    </div>
					
					<div class="popup_guide popup_w400 popup_type01 box_mh400">
						<button type="button" class="closebtn btnPopDateInputClose">닫기</button>
                        <div class="popup_content bbs_write01">
                            <ul>
								<li><span>시작일</span>
                            		<input type="text" class="inputCalendar">
								</li>
								<li><span>완료일</span>
                            		<input type="text" class="inputCalendar">
								</li>
							</ul>
							<div class="btn_guide ac mt20">
								<button type="button" class="btn_style05 btn_gray btnPopDateInputClose">취소</button>
								<button type="button" class="btn_style05 btn_red btnPopDateInputClose">확인</button>
							</div>
							
                        </div>
                        <!-- e :popup_content -->
                    </div>
					
                </div>
                <!-- e :시작일, 완료일 입력 레이어 종료 -->
                

					
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
