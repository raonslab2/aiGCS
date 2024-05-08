<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<script type="text/javascript">
	$(document).ready(function() {

		// 팝업 스크롤바를 정의
		$(".scroll").mCustomScrollbar({
			scrollbarPosition : "outside"
			//theme:"dark"
		});
		

		// 대분류 펼치고 닫기
		$(".popDeptList > li > span").click(function() {
			var index = $(this).parent().index();

			if ($(".popDeptList > li").eq(index).find("ul").css("display") == "none") {
				$(".popDeptList > li").eq(index).find("ul").css("display","");
				
				$(this).removeClass("off");
				$(this).addClass("on");
			} 
			else {
				$(".popDeptList > li").eq(index).find("ul").css("display","none");

				$(this).removeClass("on");
				$(this).addClass("off");
			}			
		});

		// 사업부서 클릭(선택)하면 상단에 선택한 사업부서에 등록
		$(".popDeptList > li > span, .popDeptList > li > ul > li > span").click(function() {
			var dept = $(this).text();
			//console.log(dept);
			
			// 동일한 이름이 있는지 체크
			var chkSameName = false;
			$(".popSelectList > span").each(function(i) {
				var topName = $(this).text();
				topName = topName.replace("삭제", "");
				topName = $.trim(topName);

				if (dept == topName) {
					chkSameName = true;
					return false;
				}
			});

			//console.log(chkSameName);

			if (!chkSameName) {
				var html = '<span class="sel_data">'+dept+' <button type="button" class="btnPopDelete">삭제</button></span>'
				$(".popSelectList").append(html);
			}
		});


		// 선택한 사업부서에서 삭제(X) 버튼 클릭 : 동적으로 추가된 부서 삭제처리를 위해서 click 이벤트 형식 변경
		$(document).on('click', '.btnPopDelete', function(){
			$(this).parent().remove();
		});


		// 선택한 사업부서 선택 버튼 : 검색항목의 사업부서 목록으로 사업부서 정보 이동
		$("#btnPopDeptInput").click(function() {
			var deptCnt = $(".popSelectList > span").length;
			//console.log(deptCnt);

			if (deptCnt == 0) {
				alert("선택한 사업부서가 없습니다.");
				return false;
			} else {

				$("#searchDeptList").empty();

				$(".popSelectList > span").each(function(i) {
					var deptName = $(this).text();
					deptName = deptName.replace("삭제", "");
					deptName = $.trim(deptName);
				
					var html = '<li><input type="checkbox"> '+deptName+'</li>'
					$("#searchDeptList").append(html);
				});
				

				fnPopupClose(); // 팝업 닫기
			}
		});
	});
</script>

<!-- 사업부서 선택 -->
<div class="popup_guide popup_w500">
	<a href="javascript:void(0)" class="closebtn" onclick="fnPopupClose()">닫기</a>
	<h3>사업부서 선택</h3>
	<div class="popup_content">
		<div class="btn_guide ar">
			<button type="button" class="btn_style02 btn_gray" id="btnPopDeptInput">선택</button>
		</div>
		<div class="popup_tit mt-20">
			<h4>선택한 사업부서</h4>
			<div class="result_box popSelectList">
				<span class="sel_data">정보화지원실1 <button type="button" class="btnPopDelete"">삭제</button></span>
				<span class="sel_data">창업성장사업실 <button type="button" class="btnPopDelete">삭제</button></span>
				<span class="sel_data">정보화지원실2 <button type="button" class="btnPopDelete">삭제</button></span>
			</div>
		</div>
		<div class="tree_style01 sbox_h400 scroll">
			<ul class="popDeptList">
				<li><span class="on">협력사업본부1</span>
					<ul>
						<li><span>정보화지원실1</span></li>
						<li><span>정보화지원실2</span></li>
					</ul>
				</li>
				<li><span class="off">협력사업본부2</span>
					<ul style="display:none;">
						<li><span>정보화지원실3</span></li>
						<li><span>정보화지원실4</span></li>
						<li><span>정보화지원실5</span></li>
						<li><span>창업성장사업실</span></li>
					</ul>
				</li>
				<li><span class="off">사업본부1</span></li>
				<li><span class="off">본부1</span></li>
				<li><span class="off">사업본부2</span></li>
				<li><span class="off">본부2</span></li>
			</ul>
		</div>
		
	</div>
	<!-- e :popup_content -->
</div>
<!-- e :popup_guide -->