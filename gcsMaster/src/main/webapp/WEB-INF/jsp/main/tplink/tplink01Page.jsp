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
	var tlPk = "";
	var searchMbCode = "";
	var loginMbCode = "";
	
	$(document).ready(function() {
		// 로그인정보
		$.ajax({
			type : "POST",
			url : "/empo/rpa/businessDepart.do"
		}).done(function(res) {
			loginMbCode = res.list.mbCode;
			
			// 요청정보
			$.ajax({
				type : "POST"
				,url : "/empo/tplink.requestInfo0.do"
				,data : {'loginMbCode' : loginMbCode}
			}).done(function(res) {
				console.log(res.list);
				res.list.forEach(function(row, index) {
					if(row.tlConfirm==0){
						if(row.flName != null){
						$('.tlinkRequest').append(dataListView(row));
					}else{
						$('.tlinkRequest').append(dataListView3(row));
					}
						}
					if(row.tlConfirm==1){
						if(row.flName != null){
							$('.tlinkConfirm').append(dataListView2(row));	
						}else{
							$('.tlinkConfirm').append(dataListView4(row));
						}
						
					}
					if(row.tlConfirm==2){
						if(row.flName != null){
							$('.tlinkComplete').append(dataListView(row));
						}else{
							$('.tlinkComplete').append(dataListView3(row));
						}
					}
					if(row.tlConfirm==3){
						if(row.flName != null){
							$('.tlinkFeedBack').append(dataListView(row));							
						}else{
							$('.tlinkFeedBack').append(dataListView3(row));
						}
					}
				})
			}).fail(function(){
				alert('실패');
			})
		});
		
		$(document).on('click', '.subjectPopupLink', function() {
			var data = $(this).parents('li').data();
			tlPk = data.tl_pk
			var name = $("#tlinkMenuDivClass").val();
			var seq = $("#tlinkMenuDivIndex").val();
			fnPopupOpen("/empo/tplink/eMAU00H04Main.do?name="+name+"&seq="+seq, "");	// ../js/popup.js 참고
		});
		
		var dataListView = function(row) {
			var data = 
				'<ul class="data_info">'
			+ '<li data-tl_pk="'+ row.tlPk +'"><a href="#" class = subjectPopupLink>' + row.tlTitle + '</a>'
			+ "<button type='button' class='btnPopMenuOpen'>메뉴</button></li>"
			+ '<li>' + row.grmName + '</li>'
			+ '<li>' + row.mbName + '</li>'
			+ '<li class="date">' + row.tlWorkDay + '</li>'
			+ '<li class="bgnone">'
			+ '</li>'
			+ '<li class="bgnone">'
				+ '<ul>'
					+ '<li>' + row.tlWorkGrmName + '</li>'
					+ '<li>' + row.tlWorkMbName + '</li>'
					+ '<li class="bgnone">'
					+	'<a href="#"><span class="file">' + row.flName + '</span></a>'
					+ '</li>'
				+ '</ul>'
			+ '</li>'
			+ '<li class="bgnone ar">' + row.tlWriteTime +'</li>' 
		+ '</ul>'
			return $(data);
		} 
		
		var dataListView3 = function(row) {
			var data = 
				'<ul class="data_info">'
			+ '<li data-tl_pk="'+ row.tlPk +'"><a href="#" class = subjectPopupLink>' + row.tlTitle + '</a>'
			+ "<button type='button' class='btnPopMenuOpen'>메뉴</button></li>"
			+ '<li>' + row.grmName + '</li>'
			+ '<li>' + row.mbName + '</li>'
			+ '<li class="date">' + row.tlWorkDay + '</li>'
			+ '<li class="bgnone">'
			+ '</li>'
			+ '<li class="bgnone">'
				+ '<ul>'
					+ '<li>' + row.tlWorkGrmName + '</li>'
					+ '<li>' + row.tlWorkMbName + '</li>'
				+ '</ul>'
			+ '</li>'
			+ '<li class="bgnone ar">' + row.tlWriteTime +'</li>' 
		+ '</ul>'
			return $(data);
		}
		
		var dataListView2 = function(row) {
			var data = 
				'<ul class="data_info">'
			+ '<li data-tl_pk="'+ row.tlPk +'"><a href="#" class = subjectPopupLink>' + row.tlTitle + '</a>'
			+ "<button type='button' class='btnPopMenuOpen'>메뉴</button></li>"
			+ '<li>' + row.grmName + '</li>'
			+ '<li>' + row.mbName + '</li>'
			+ '<li class="date">' + row.tlWorkDay + '</li>'
			+ '<li class="bgnone">'
			+ '<div class="btn_guide ac mb10 checkFirm">'
		//		+ '<button type="button" class="btn_style03 btn_gray">담당자 확인</button>'
		//		+ '<button type="button" class="btn_style03 btn_gray">부서 확인</button>'
			+ '</div>'
			+ '</li>'
			+ '<li class="bgnone">'
				+ '<ul>'
					+ '<li>' + row.tlWorkGrmName + '</li>'
					+ '<li>' + row.tlWorkMbName + '</li>'
					+ '<li class="bgnone">'
					+	'<a href="#"><span class="file">' + row.flName + '</span></a>'
					+ '</li>'
				+ '</ul>'
			+ '</li>'
			+ '<li class="bgnone ar">' + row.tlWriteTime +'</li>' 
		+ '</ul>'
			return $(data);
		}
		
		var dataListView4 = function(row) {
			var data = 
				'<ul class="data_info">'
			+ '<li data-tl_pk="'+ row.tlPk +'"><a href="#" class = subjectPopupLink>' + row.tlTitle + '</a>'
			+ "<button type='button' class='btnPopMenuOpen'>메뉴</button></li>"
			+ '<li>' + row.grmName + '</li>'
			+ '<li>' + row.mbName + '</li>'
			+ '<li class="date">' + row.tlWorkDay + '</li>'
			+ '<li class="bgnone">'
			+ '<div class="btn_guide ac mb10 checkFirm">'
		//		+ '<button type="button" class="btn_style03 btn_gray">담당자 확인</button>'
		//		+ '<button type="button" class="btn_style03 btn_gray">부서 확인</button>'
			+ '</div>'
			+ '</li>'
			+ '<li class="bgnone">'
				+ '<ul>'
					+ '<li>' + row.tlWorkGrmName + '</li>'
					+ '<li>' + row.tlWorkMbName + '</li>'
				+ '</ul>'
			+ '</li>'
			+ '<li class="bgnone ar">' + row.tlWriteTime +'</li>' 
		+ '</ul>'
			return $(data);
		}
		
		// 지난목록 보기 버튼 클릭
		$("#btnPassList").click(function() {
			window.location.href = '/empo/tplink/eMAU00H02Main.do';
		});
		
		// 검색버튼 클릭
		$("#searchTlink").click(function() {
			var tlinkRequester = $('#tlinkRequester').val();
			$.ajax({
				type : "POST"
				,url : "/empo/tplink.searchMbCode.do"
				,data : {'tlinkRequester' : tlinkRequester}
			}).done(function(res){
				res.list.forEach(function(row, index) {
					searchMbCode = row.mbCode;
				})
				if($("#tlinkSearch option:selected").val() == '요청자'){
					$.ajax({
						type : "POST"
						,url : "/empo/tplink.searchTlink.do"
						,data : {'searchMbCode' : searchMbCode}
					}).done(function(res){
						$('.tlinkRequest').empty();
						$('.tlinkConfirm').empty();
						$('.tlinkComplete').empty();
						$('.tlinkFeedBack').empty();
					res.list.forEach(function(row, index) {
						if(row.tlConfirm==0){
							if(row.flName != null){
							$('.tlinkRequest').append(dataListView(row));
						}else{
							$('.tlinkRequest').append(dataListView3(row));
						}
							}
						if(row.tlConfirm==1){
							if(row.flName != null){
								$('.tlinkConfirm').append(dataListView2(row));	
							}else{
								$('.tlinkConfirm').append(dataListView4(row));
							}
							
						}
						if(row.tlConfirm==2){
							if(row.flName != null){
								$('.tlinkComplete').append(dataListView(row));
							}else{
								$('.tlinkComplete').append(dataListView3(row));
							}
						}
						if(row.tlConfirm==3){
							if(row.flName != null){
								$('.tlinkFeedBack').append(dataListView(row));							
							}else{
								$('.tlinkFeedBack').append(dataListView3(row));
							}
						}
					})
					}).fail(function(){
						alert('실패');
					})
				}else{
					$.ajax({
						type : "POST"
						,url : "/empo/tplink.searchTlink2.do"
						,data : {'searchMbCode' : searchMbCode}
					}).done(function(res){
						$('.tlinkRequest').empty();
						$('.tlinkConfirm').empty();
						$('.tlinkComplete').empty();
						$('.tlinkFeedBack').empty();
					res.list.forEach(function(row, index) {
						if(row.tlConfirm==0){
							if(row.flName != null){
							$('.tlinkRequest').append(dataListView(row));
						}else{
							$('.tlinkRequest').append(dataListView3(row));
						}
							}
						if(row.tlConfirm==1){
							if(row.flName != null){
								$('.tlinkConfirm').append(dataListView2(row));	
							}else{
								$('.tlinkConfirm').append(dataListView4(row));
							}
							
						}
						if(row.tlConfirm==2){
							if(row.flName != null){
								$('.tlinkComplete').append(dataListView(row));
							}else{
								$('.tlinkComplete').append(dataListView3(row));
							}
						}
						if(row.tlConfirm==3){
							if(row.flName != null){
								$('.tlinkFeedBack').append(dataListView(row));							
							}else{
								$('.tlinkFeedBack').append(dataListView3(row));
							}
						}
					})
					})
				}
			})
		});

		// 게시글별 메뉴팝업 오픈 클릭
		 $(document).on('click', '.btnPopMenuOpen', function(e) {
			 var data = $(this).parents('li').data();
				tlPk = data.tl_pk
			// 동일 영역(업무요청, 확인, 완료, 피드백) 내에서의 순서
			var index = $(this).parent().parent().index();
			//console.log(index);
			// 클릭한 게시글의 영역 class 구하기
			var name = $(this).parent().parent().parent().attr("class");
			//console.log(name);
			// 마우스 클릭 위치 가져오기
			var divTop = e.pageY - 50; // 상단 좌표 위치 안맞을시 e.pageY 
			var divLeft = e.pageX + 20; // 좌측 좌표 위치 안맞을시 e.pageX
			if (name == "tlinkFeedBack") {	// 피드백 영역에서는 메뉴의 말풍선이 오른쪽으로 보이게 설정 변경
				divLeft = divLeft - 140;
				$("#popMenuView > p").removeClass("left01");
				$("#popMenuView > p").addClass("right01");
			} else {
				$("#popMenuView > p").removeClass("right01");
				$("#popMenuView > p").addClass("left01");
			}
			$("#popMenuView").css("display","none");
			$("#popMenuView").css("top",divTop);
			$("#popMenuView").css("left",divLeft);
			$("#popMenuView").css("display","block");

			// 게시글 영역의 class와 게시글 순서 정보 저장
			$("#tlinkMenuDivClass").val(name);
			$("#tlinkMenuDivIndex").val(index);
		});
		

		// 게시글별 메뉴팝업의 닫기(X) 클릭
		$(".btnPopMenuClose").click(function() {
			// 게시글 영역의 class와 게시글 순서 정보 초기화
			$("#tlinkMenuDivClass").val("");
			$("#tlinkMenuDivIndex").val("");

			$("#popMenuView").css("display","none");
		});

		$(".tlinkPopMenu").click(function() {
			// 클릭한 메뉴의 순서
			var index = $(this).index();
			console.log(tlPk);
			
			// 해당 글의 영역 class 와 글 순서 정보
			var name = $("#tlinkMenuDivClass").val();
			var seq = $("#tlinkMenuDivIndex").val();
			console.log(name);
			console.log(seq);
			console.log(tlPk)
			if ($.trim(name).length > 0 && $.trim(seq).length > 0) {
				// 확인
				if (index == "0") {
						if(confirm("해당 글을 확인 영역으로 이동하시겠습니까?")==true){
							index = index+1;
							$.ajax({
								type : "POST"
								,url : "/empo/tplink.requestMove.do"
								,data : {'tlPk': tlPk, 'index' : index}
							}).done(function(){
								$(".tlinkConfirm").prepend($("."+name+" > ul").eq(seq));
								location.reload();
							}).fail(function(){
								alert('실패');
							})
						}
				}
				// 완료
				else if (index == "1") {
					if (confirm("해당 글을 완료 영역으로 이동하시겠습니까?")) {
						index = index+1;
						$.ajax({
							type : "POST"
							,url : "/empo/tplink.requestMove.do"
							,data : {'tlPk': tlPk, 'index' : index}
						}).done(function(){
							$(".tlinkComplete").prepend($("."+name+" > ul").eq(seq));
							location.reload();
						}).fail(function(){
							alert('실패');
						})
					}
				}
				// 피드백
				else if (index == "2") {
					if (confirm("해당 글을 피드백 영역으로 이동하시겠습니까?")) {
						index = index+1
						$.ajax({
							type : "POST"
							,url : "/empo/tplink.requestMove.do"
							,data : {'tlPk': tlPk, 'index' : index}
						}).done(function(){
							$(".tlinkFeedBack").prepend($("."+name+" > ul").eq(seq));
							location.reload();
						}).fail(function(){
							alert('실패');
						})
					}
				}
				// 전달
				else if (index == "3") {
					fnPopupOpen("/empo/tplink/eMAU00H06Main.do?name="+name+"&seq="+seq, "");	// ../js/popup.js 참고
				}
				// 삭제
				else if (index == "4") {
					if (confirm("해당 글을 삭제하시겠습니까?")) {
						$.ajax({
							type : "POST"
							,url : "/empo/tplink.deleteRequest.do"
							,data : {'tlPk': tlPk}
						}).done(function(){
							$("."+name+" > ul").eq(seq).remove();
						}).fail(function(){
							alert('실패');
						})
					}
				}
			}
			// 게시글 영역의 class와 게시글 순서 정보 초기화
			$("#tlinkMenuDivClass").val("");
			$("#tlinkMenuDivIndex").val("");
			$("#popMenuView").css("display","none");
		});
	});

	
	// 신규등록
	function fnTlinkAdd(state) {
		fnPopupOpen("/empo/tplink/eMAU00H03Main.do?state="+state, "");	// ../js/popup.js 참고
	}
</script>
</head>

<body>
	<!-- s :wrap -->
	<div id="wrap">
		<!-- s :lnb_guide -->
		<div class="lnb_guide">
			<c:import url="/EmpPageLink.do?link=main/include/menu" />
		</div>
		<!-- e :lnb_guide -->
			
		<!-- s :right_guide -->
		<div class="right_guide">

			<!-- 화면 상단 시작 -->
			<div class="top_guide">

				<!-- 1차 메뉴명 -->
				<h3>T-Link 현황 <span class="text_type20"></span></h3>
                <c:import url="/EmpPageLink.do?link=main/include/top" />  
			</div>
			<!-- 화면 상단 종료 -->
			
			<!-- s :contents_guide -->
			<div class="contents_guide">

				<div class="btn_guide ar">
					<button type="button" class="btn_style01 btn_blue" id="btnPassList">지난목록 보기</button>
				</div>
				<!-- e :btn_guide -->
				
				<!-- s :search_box01 -->
				<div class="search_box01">
					<select id="tlinkSearch">
						<option value="요청자"> 요청자</option>
						<option value="담당자"> 담당자</option>
					</select>
					<input type="text" class="input_w30 input_style01" id="tlinkRequester">
					<button type="button" class="btn_style04 btn_search01" id="searchTlink">검색</button> 
				</div>
				<!-- e :search_box01 -->
				
				<!-- s : tlink_guide -->
				<div class="tlink_guide">
					<div>
						<h4>업무요청 <span><a href="javascript:void(0)" onclick="fnTlinkAdd('R')">등록</a></span></h4>
						<div class="tlinkRequest">
						
						<!-- e : 업무요청1 -->	  
						</div>
					</div>
					<!-- e : 업무요청영역  -->
					
					<div>
						<h4>확인 <span><a href="javascript:void(0)" onclick="fnTlinkAdd('M')">등록</a></span></h4>
						<div class="tlinkConfirm">
						</div>
					</div>
					<!-- e : 확인영역  -->
					
					<div>
						<h4>완료 <span><a href="javascript:void(0)" onclick="fnTlinkAdd('C')">등록</a></span></h4>
						<div class="tlinkComplete">
							
						</div>
					</div>
					<!-- e : 완료영역  -->
					
					<div>
						<h4>피드백 <span><a href="javascript:void(0)" onclick="fnTlinkAdd('F')">등록</a></span></h4>
						<div class="tlinkFeedBack">
							
						</div>
					</div>
					<!-- e : 피드백영역  -->
				</div>
				<!-- e : tlink_guide  -->


				<!-- s : 게시글별 메뉴 레이어 팝업 -->
                <div id="popMenuView" class="Layer_popup">
                    <p class="left01"></p><!--오른쪽 말풍선인경우 class="right01" 변경-->
                    <div class="popup_guide popup_w100 popup_type01">
                        <a href="javascript:void(0)" class="closebtn btnPopMenuClose">닫기</a>
                        <div class="popup_content">
                            <ul class="data_list02">
                                <li class="tlinkPopMenu" id="confirm"><a href="#">확인</a></li>
                                <li class="tlinkPopMenu" id="complete"><a href="#">완료</a></li>
								<li class="tlinkPopMenu" id="feedback"><a href="#">피드백</a></li>
								<li class="tlinkPopMenu" id="relay"><a href="#">전달</a></li>
								<li class="tlinkPopMenu" id="delete"><a href="#">삭제</a></li>
                            </ul>
                        </div>
                        <!-- e :popup_content -->
                    </div>
					
					<!-- 게시글 메뉴에서 사용할 정보 input 설정 --> 
					<input type="hidden" id="tlinkMenuDivClass" value=""/>	<!-- 영역 class 저장 -->
					<input type="hidden" id="tlinkMenuDivIndex" value=""/>	<!-- 영역별 게시글 순서 -->

                </div>
                    
				<!-- 팝업 띄울 공간 -->
                <div id="divPopup" class="overlay">
				</div>

				<!-- 추가 팝업 띄울 공간 -->
                <div id="divAddPopup" class="overlay">
				</div>
			</div>
			<!-- e :contents_guide -->


		</div>
		<!-- e :right_guide -->
	</div>
	<!-- e :wrap -->

</body>
</html>

