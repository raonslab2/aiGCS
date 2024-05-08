<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<script type="text/javascript">
	$(document).ready(function() {

		// 팝업 스크롤바를 정의
		$(".scroll").mCustomScrollbar({
			scrollbarPosition : "outside"
			//theme:"dark"
		});
		

		// 대분류 펼치고 닫기
		$(".popProcessList > li > span").click(function() {
			var index = $(this).parent().index();

			if ($(".popProcessList > li").eq(index).find("ul").css("display") == "none") {
				$(".popProcessList > li").eq(index).find("ul").css("display","");
				
				$(this).removeClass("off");
				$(this).addClass("on");
			} 
			else {
				$(".popProcessList > li").eq(index).find("ul").css("display","none");

				$(this).removeClass("on");
				$(this).addClass("off");
			}
			
		});

		// 대분류 추가 버튼
		$(".btnPopProcessAdd").click(function() {
			$(".popProcessList").append('<li><span class="off"><input type="text" id="popProcessName"  placeholder="대분류 입력"></span></li>');

			// 스크롤 하단으로 이동
			$(".scroll").mCustomScrollbar("scrollTo","bottom",{
				scrollEasing:"easeOut"
			});
		});

		// 하위 프로세스 등록 버튼
		$(".btnPopSubProcessAdd").click(function() {
			var index = $(this).parent().index();
			
			if ($(".popProcessList > li").eq(index).find("input").length < 1) {
				if ($(".popProcessList > li").eq(index).find("ul").length < 1) {
					$(".popProcessList > li").eq(index).find("span").removeClass("off");
					$(".popProcessList > li").eq(index).find("span").addClass("on");
					$(".popProcessList > li").eq(index).append("<ul></ul>");
				} 

				$(".popProcessList > li").eq(index).find("ul").css("display","");
				$(".popProcessList > li").eq(index).find("ul").append(' <li><span><input type="text" id="popSubProcessName"  placeholder="하위분류 입력"></span></li>');
			}
		});


		// 프로세스 삭제를 위한 선택 (클릭)
		$(".popProcessList").find("li > span").click(function() {
			$(".popProcessList").find("li > span").css("background-color", "");
			$(this).css("background-color", "#e6fbf5");
		});


		// 프로세스 삭제버튼
		$(".btnPopProcessDelete").click(function() {
			if (confirm("선택하신 프로세스를 삭제하시겠습니까?")) {
			}
		});
		
		// 분류이동 저장버튼
		$(".btnPopProcessMoveSave").click(function() {
			if (confirm("분류이동 정보를 저장하시겠습니까?")) {
			}
		});


		// 대분류 이동
		$(".popProcessList").sortable({
			placeholder: "dropPlace",	// 드랍 위치 css class

			start:function(event,ui){
				// 드래그 시작 시 호출
			},
				
			stop:function(event,ui){
				// 드래그 종료 시 호출
			}
		}).disableSelection();

		// 하위분류 이동
		$(".popProcessList > li > ul").sortable({
			connectWith: ".popProcessList > li > ul", // 다른 대분류 하위로 이동할 수 있게 해주는 옵션
			placeholder: "dropPlace",	// 드랍 위치 css class

			start:function(event,ui){
				// 드래그 시작 시 호출
			},
				
			stop:function(event,ui){
				// 드래그 종료 시 호출
			}
		}).disableSelection();
	});
</script>

<!-- 드랍 위치 css -->
<style>
	.dropPlace { 
		width: calc(100% - 48px);
		height:40px;
		border:2px dotted #dad55e;
		background:#fffa90;
		color:#777620;
	}
</style>

<!-- 분류이동 편집 -->
<div class="popup_guide popup_w700">	
	<a href="javascript:void(0)" class="closebtn" onclick="fnPopupClose()">닫기</a>
	<h3>
		분류이동 편집
	</h3>

	<div class="popup_content">

		<div class="tree_guide">
			<div class="btn_guide">
				<button type="button" class="btn_style02 btn_white btnPopProcessAdd">대분류 추가</button>
				<button type="button" class="btn_style02 btn_white btnPopProcessDelete">삭제</button>
				<button type="button" class="btn_style02 btn_green fr btnPopProcessMoveSave">분류이동 저장</button>
			</div>
			<!-- e :btn_guide -->
			<div class="tree_style01 tree_style02 tree_style03 sbox_h600 scroll">
				<ul class="popProcessList"> <!-- 프로세스가 없어도 ul은 반드시 정의해야 함 -->
					<li><span class="on">사업공고<em>1</em></span><button type="button" class="plus btnPopSubProcessAdd">추가</button><a type="button" class="move">이동</a>
						<ul>
							<li><span>사업공고</span><a type="button" class="move">이동</a></li>
						</ul>
					</li>
					<li><span class="on">과제접수<em>3</em></span><button type="button" class="plus btnPopSubProcessAdd">추가</button><a type="button" class="move">이동</a>
						<ul>
							<li><span>접수마감</span><a type="button" class="move">이동</a></li>
							<li><span>접수현황 결과보고</span><a type="button" class="move">이동</a></li>
							<li><span>서류보완 요청</span><a type="button" class="move">이동</a></li>
						</ul>
					</li>
					<li><span class="off">대분류<em>3</em></span><button type="button" class="plus btnPopSubProcessAdd">추가</button><a type="button" class="move">이동</a>
						<ul>
							<li><span>접수마감</span><a type="button" class="move">이동</a></li>
							<li><span>접수현황 결과보고</span><a type="button" class="move">이동</a></li>
							<li><span>서류보완 요청</span><a type="button" class="move">이동</a></li>
						</ul>
					</li>
					<li><span class="off">대분류</span><button type="button" class="plus btnPopSubProcessAdd">추가</button><a type="button" class="move">이동</a>
						<ul></ul><!-- 하위 프로세스가 없어도 ul은 반드시 정의해야 함 -->
					</li>
					<li><span class="off">대분류</span><button type="button" class="plus btnPopSubProcessAdd">추가</button><a type="button" class="move">이동</a>
						<ul></ul><!-- 하위 프로세스가 없어도 ul은 반드시 정의해야 함 -->
					</li>
					<li><span class="off">대분류</span><button type="button" class="plus btnPopSubProcessAdd">추가</button><a type="button" class="move">이동</a>
						<ul></ul><!-- 하위 프로세스가 없어도 ul은 반드시 정의해야 함 -->
					</li>
				</ul>
			</div>
			<div class="btn_guide">
				<button type="button" class="btn_style02 btn_white btnPopProcessAdd">대분류 추가</button>
				<button type="button" class="btn_style02 btn_white btnPopProcessDelete">삭제</button>
			</div>
			<!-- e :btn_guide -->
		</div>
		<!-- e :tree_guide -->


	</div>
</div>
