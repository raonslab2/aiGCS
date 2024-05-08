<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>TIPA 스케쥴기반 평가관리시스템</title>
<%@ include file = "../include/src.jsp" %>


<script type="text/javascript">
	$(document).ready(function() {
		
		// 대분류 펼치고 닫기
		$("#processList > li > span").click(function() {
			var index = $(this).parent().index();

			if ($("#processList > li").eq(index).find("ul").css("display") == "none") {
				$("#processList > li").eq(index).find("ul").css("display","");
				
				$(this).removeClass("off");
				$(this).addClass("on");
			} 
			else {
				$("#processList > li").eq(index).find("ul").css("display","none");

				$(this).removeClass("on");
				$(this).addClass("off");
			}
			
		});

		// 대분류 추가 버튼
		$(".btnProcessAdd").click(function() {
			$("#processList").append('<li><span class="off"><input type="text" id="processName"  placeholder="대분류 입력"></span></li>');

			// 스크롤 하단으로 이동
			$(".scroll").mCustomScrollbar("scrollTo","bottom",{
				scrollEasing:"easeOut"
			});
		});

		// 하위 프로세스 등록 버튼
		$(".btnSubProcessAdd").click(function() {
			var index = $(this).parent().index();
			
			if ($("#processList > li").eq(index).find("input").length < 1) {
				if ($("#processList > li").eq(index).find("ul").length < 1) {
					$("#processList > li").eq(index).find("span").removeClass("off");
					$("#processList > li").eq(index).find("span").addClass("on");
					$("#processList > li").eq(index).append("<ul></ul>");
				} 

				$("#processList > li").eq(index).find("ul").css("display","");
				$("#processList > li").eq(index).find("ul").append(' <li><span><input type="text" id="subProcessName"  placeholder="하위분류 입력"></span></li>');
			}
		});


		// 프로세스 삭제를 위한 선택 (클릭)
		$("#processList").find("li > span").click(function() {
			$("#processList").find("li > span").css("background-color", "");
			$(this).css("background-color", "#e6fbf5");
		});


		// 프로세스 삭제버튼
		$(".btnProcessDelete").click(function() {
			if (confirm("선택하신 프로세스를 삭제하시겠습니까?")) {
			}
		});

		
		// 분류이동편집 버튼
		$(".btnProcessMoveEdit").click(function() {
			fnPopupOpen("../popup/proce_003_011.jsp", "");	// ../js/popup.js 참고
		});
		
	
		// Check List 체크박스 전체선택/해제
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

		// Check List 항목추가 버튼
		$("#btnCheckListAdd").click(function() {
			fnPopupOpen("../popup/proce_003_01.jsp", "");	// ../js/popup.js 참고
		});

		
		// Check List 삭제 버튼
		$("#btnCheckListDelete").click(function() {
			if ($("input[name=checkField]:checkbox:checked").length == 0) {
				alert("삭제할 항목을 선택하세요.");
				return false;
			} else {
				if (confirm("선택하신 항목을 삭제하시겠습니까?")) {
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
				<h3>프로세스 관리</h3>

				<%@ include file = "../include/top.jsp" %>
			</div>
			<!-- 화면 상단 종료 -->
			
			<!-- s :contents_guide -->
			<div class="contents_guide">
				<div class="submenu_guide">
					<ul>
						<!-- 2차메뉴명 -->
						<li><a href="EMAU00D0101.jsp">프로세스 매핑</a></li>
						<li><a href="EMAU00D0102.jsp" class="active">프로세스 설정</a></li>
						<li><a href="EMAU00D0103.jsp">표준일정 설정</a></li>
						<li><a href="EMAU00D0104.jsp">휴일설정</a></li>
					</ul>
				</div>
				
				<!-- s :content_col2 -->
				<div class="content_col2">
					<div class="tree_guide">
						<div class="btn_guide">
							<button type="button" class="btn_style02 btn_white btnProcessAdd">대분류 추가</button>
							<button type="button" class="btn_style02 btn_white btnProcessDelete">삭제</button>
							<button type="button" class="btn_style02 btn_blue fr btnProcessMoveEdit">분류이동 편집</button>
						</div>
						<!-- e :btn_guide -->
						<div class="tree_style01 tree_style02 sbox_h600 scroll">
                            <ul id="processList"> <!-- 프로세스가 없어도 ul은 반드시 정의해야 함 -->
								<li><span class="on">사업공고 <em>1</em></span><button type="button" class="plus btnSubProcessAdd">추가</button>
                                    <ul>
                                        <li><span>사업공고</span></li>
                                    </ul>
                                </li>
                                <li><span class="off">과제접수 <em>3</em></span><button type="button" class="plus btnSubProcessAdd">추가</button>
                                    <ul style="display:none;">
                                        <li><span>접수마감</span></li>
                                        <li><span>접수현황 결과보고</span></li>
                                        <li><span>서류보완 요청</span></li>
                                    </ul>
                                </li>
                                <li><span class="off">대분류</span><button type="button" class="plus btnSubProcessAdd">추가</button>
								</li>
                                <li><span class="off">대분류</span><button type="button" class="plus btnSubProcessAdd">추가</button>
								</li>
                                <li><span class="off">대분류 <em>3</em></span><button type="button" class="plus btnSubProcessAdd">추가</button>
                                    <ul style="display:none;">
                                        <li><span>접수마감</span></li>
                                        <li><span>접수현황 결과보고</span></li>
                                        <li><span>서류보완 요청</span></li>
                                    </ul>
								</li>
                                <li><span class="off">대분류</span><button type="button" class="plus btnSubProcessAdd">추가</button>
								</li>
                            </ul>
                        </div>
						<div class="btn_guide">
							<button type="button" class="btn_style02 btn_white btnProcessAdd">대분류 추가</button>
							<button type="button" class="btn_style02 btn_white btnProcessDelete">삭제</button>
						</div>
						<!-- e :btn_guide -->
					</div>
					<!-- e :tree_guide -->
					
                    <div >
                        <h5>분류정보</h5>
						<div class="bbs_list">
							<table class="table_l">
							  <caption>분류명(필수), 상위 분류명, 일정표시, 사용설정을 나타내는 분류정보</caption>
							  <tbody>
								<tr>
								  <th scope="row">분류명(필수) *</th>
								  <td>
									<input type="text" id="categoryName" placeholder="분류명을 입력하세요.">
								  </td>
								</tr>
								<tr>
								  <th scope="row">상위 분류명</th>
								  <td>대분류명 나타남</td>
								</tr>
								<tr>
								  <th scope="row">일정표시 *</th>
								  <td>
									<label><input type="radio"> 주요일정</label>
									&nbsp;&nbsp;&nbsp;
									<label><input type="radio"> 세부일정</label>
									&nbsp;&nbsp;&nbsp;
									<label><input type="radio"> 표시안함</label>
								  </td>
								</tr>
								<tr>
								  <th scope="row">사용설정 *</th>
								  <td>
									<label><input type="radio" name="useDiv" checked> 사용</label>
									&nbsp;&nbsp;&nbsp;
									<label><input type="radio" name="useDiv"> 미사용</label>
  								  </td>
								</tr>
							  </tbody>
							</table>
						</div>
						
						<h5>Check List</h5>
						<div class="btn_guide ar mt-40 mb10">
							<button type="button" class="btn_style02 btn_gray" id="btnCheckListDelete">항목 삭제</button>
							<button type="button" class="btn_style02 btn_blue" id="btnCheckListAdd">항목 추가</button>
						</div>
						<!-- e :btn_guide -->
						<div class="bbs_list">
							<table>
							  <caption>항목명, 사용유무 정보를 제공하는 Check List</caption>
							  <thead>
								<tr>
								  <th scope="col"><input type="checkbox" id="chkAll"></th>
								  <th scope="col">항목명</th>
								  <th scope="col">사용유무</th>
								</tr>
							  </thead>
							  <tbody>
								<tr>
								  <td><input type="checkbox" name="checkField"></td>
								  <td class="text_l">통합공고 대비 사업 특성 정리</td>
								  <td><input type="radio"> 사용   <input type="radio"> 미사용</td>
								</tr>
								<tr>
								  <td><input type="checkbox" name="checkField"></td>
								  <td class="text_l">내역사업분류관리 추가 요청 확인</td>
								  <td><input type="radio"> 사용   <input type="radio"> 미사용</td>
								</tr>
								<tr>
								  <td><input type="checkbox" name="checkField"></td>
								  <td class="text_l">통합공고 대비 사업 특성 정리</td>
								  <td><input type="radio"> 사용   <input type="radio"> 미사용</td>
								</tr>
								<tr>
								  <td><input type="checkbox" name="checkField"></td>
								  <td class="text_l">통합공고 대비 사업 특성 정리</td>
								  <td><input type="radio"> 사용   <input type="radio"> 미사용</td>
								</tr>
								<tr>
								  <td><input type="checkbox" name="checkField"></td>
								  <td class="text_l">사업분류 추가</td>
								  <td><input type="radio"> 사용   <input type="radio"> 미사용</td>
								</tr>
								<tr>
								  <td><input type="checkbox" name="checkField"></td>
								  <td class="text_l">사업별 특성관리 설정</td>
								  <td><input type="radio"> 사용   <input type="radio"> 미사용</td>
								</tr>
							  </tbody>
							</table>
						</div>
                    </div>
					<!-- e :right -->
					
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
