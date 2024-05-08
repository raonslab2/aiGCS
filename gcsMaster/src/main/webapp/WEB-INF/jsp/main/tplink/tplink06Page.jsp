<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
	// 업무영역의 class와 게시글 index
	String name = request.getParameter("name");
	String seq = request.getParameter("seq");
%>


<script type="text/javascript">
	var loginGrmCode = "";
	var loginMbCode = "";
	var time = "";
	var requester = "";
	var tlWorkGrmName = "";
	var tlWorkGrmCode = "";
	var tlWorkMbName = "";
	var tlWorkMbCode = "";
	var changeTlMbCode = "";
	var changeTlGrmCode = "";
	var changeManage = "";
	var uploadFileName = "";
	$(document).ready(function() {
		changeManage = $('#manageChange').text();
		// 로그인정보 + 현재시간정보
		$.ajax({
			type : "POST",
			url : "/empo/rpa/businessDepart.do"
		}).done(function(res) {
			requester = res.list.grSumName + ' ' + res.list.mbName;
			var now = new Date();
			var year = now.getFullYear();
			var month = now.getMonth()+1;
			var date = now.getDate();
			var hour = now.getHours();
			var min = now.getMinutes();
			time = year + '-' + month + '-' + date + ' ' + hour + ':' + min;
			loginMbCode = res.list.mbCode;
			loginGrmCode = res.list.grmCode;
			$('#requester').append(requester); // 요청자
			$('#requestDate').append(year + '년 ' + month + '월 ' + date + '일 ' + hour + '시 ' + min + '분 '); // 요청일
		});
		
		$.ajax({
			type : "POST"
			,url : "/empo/tplink.requestRelay.do"
			,data : {"tlPk" : tlPk}
		}).done(function(res){
			res.list.forEach(function(row, index){
				$('#tlTitle').append(row.tlTitle); // 제목
				$('#tlWorkDay').append(row.tlWorkDay); // 필요일정 
				$('#tlWorkMbName').append(row.tlWorkMbName); // 담당자
				$('#tlTxt').append(row.tlTxt); // 내용
				$('#tdFile').append(row.uploadFileName);
				tlWorkGrmName = row.tlWorkGrmName;
				tlWorkMbName = row.tlWorkMbName;
				tlWorkMbCode = row.tlWorkMbCode;
				tlWorkGrmCode = row.tlWorkGrmCode;
				uploadFileName = row.uploadFileName;
		});
	});
		
		
		// 팝업 스크롤바를 정의
		$(".scroll").mCustomScrollbar({
			scrollbarPosition : "outside"
			//theme:"dark"
		});


		// 상태 변경 : 완료이면 컨펌여부 보이기
		$(".sltState").change(function() {
			var index = $(".sltState option").index($(".sltState option:selected"));
			console.log(index);

			$(".popConfirmChk").css("display","none");
			if (index == "2") { //완료 변경
				$(".popConfirmChk").css("display","");
			}
		});
		
		// 담당자 변경 검색 클릭
		$(".btnChargeSearch1").click(function() {
			fnPopupAddOpen("/empo/tplink/eMAU00H05Main.do", "#formEditManager");	// ../js/popup.js 참고
		});

		
		// 댓글추가 버튼
		$("#btnCommentAdd").click(function() {
			$(".fileList").empty(); // 첨부파일 영역 삭제
			$(".liCommentInput").css("display","");
			$(".liCommentButton").css("display","none");
		});
		
		// 파일 입력 추가 버튼
		$(".btnFileAdd").click(function() {
			var fileForm = '<input type="file" class="input_w80" id="" name="">';
			$(".fileList").append(fileForm);
		});

		// 댓글 목록 조회
		$.ajax({
			type : "POST"
			,url : "/empo/tplink.selectComment.do"
			,data : {'tlPk' : tlPk}
		}).done(function(res){
			res.list.forEach(function(row, index){
				if(tlPk==row.tlPk){
					$('.comment').append(DataListView(row))
				}
			})
		}).fail(function(res){
			alert('실패')
		})
	
		// 댓글 전송버튼 클릭
		$("#btnCommentSave").click(function () {
			var comment = $("#comment").val();
			if ($.trim(comment).length < 1) {
				alert("댓글을 입력하세요.");
				$("#comment").focus();
				return false;
			}

			else {
				var comment = $('#comment').val();
				console.log(comment)
				$.ajax({
					type : "POST"
					,url : "/empo/tplink.addComment.do"
					,data : {'tlPk' : tlPk, 'comment' : comment, 'loginMbCode' : loginMbCode, 'loginGrmCode' : loginGrmCode}
				}).done(function(res){
					res.list.forEach(function(row, index){
						$('.comment').append(DataListView(row))
					})
					alert("댓글이 전송되었습니다.");			
					$(".fileList").empty(); // 첨부파일 영역 삭제
					$(".liCommentInput").css("display","none");
					$(".liCommentButton").css("display","");
					return false;
				}).fail(function(){
					alert('실패')
				}); 
			}
		});
		
		var DataListView = function(row) {
			var data = 
			'<li>'
			+ '<strong>' + row.tlCommentgrmName + ' ' + row.tlCommentMbName + '</strong>'
			+ '<strong class="date">' + row.tlCommentDate + '</strong>'
			+ '<div class="tlink_info">'
			+ row.tlCommentText + '<a href="#">'
			+ '<span class="file"></span>'
			+ '</a><a href="#"><span class="file">&nbsp;</span></a>'
			+ '</div>'
			+ '</li>'
		return $(data);
		}
		
		
	});
</script>

<!-- 사업부서 선택 -->
<div class="popup_guide popup_w600">
	<a href="javascript:void(0)" class="closebtn" onclick="fnPopupClose()">닫기</a>
	<h3 id="tlTitle"></h3>

	<form id="formEditManager">
		<input type="hidden" name="choice" value="Edit" />
	</form>
	
	<div class="popup_content">
		
		<div class="sbox_h600 scroll">
			<div class="bbs_list">
				<table class="table_l">
					<colgroup>
						<col width = "20%">
						<col width = "%">
					</colgroup>

					<tbody>
						<tr>
							<th scope="row">상태</th>
							<td>							                     
								<select class="sltState">
								<option <% if (name.equals("tlinkRequest")) {%> selected <%}%>>업무요청</option>
								<option <% if (name.equals("tlinkConfirm")) {%> selected <%}%>>확인</option>
								<option <% if (name.equals("tlinkComplete")) {%> selected <%}%>>완료</option>
								<option <% if (name.equals("tlinkFeedBack")) {%> selected <%}%>>피드백</option>
								</select>
							</td>
						</tr>

						<tr class="popConfirmChk" <% if (!name.equals("tlinkComplete")) {%> style="display:none;" <%}%>>
							<th scope="row">컨펌여부</th>
							<td>
								<label><input type="checkbox" name=""> 팀장</label>
								&nbsp;&nbsp;&nbsp;
								<label><input type="checkbox" name=""> 실장</label>
								&nbsp;&nbsp;&nbsp;
								<label><input type="checkbox" name=""> 본부장</label>
								&nbsp;&nbsp;&nbsp;
								<label><input type="checkbox" name=""> 기타</label>
								<input type="text" class="input_w30">
							</td>
						</tr>
						<tr>
							<th scope="row">요청자</th>
							<td id="requester">
							</td>
						</tr>
						<tr>
							<th scope="row">요청일</th>
							<td id="requestDate">
							</td>
						</tr>
						<tr>
							<th scope="row">필요일정</th>
							<td id = "tlWorkDay">
							</td>
						</tr>
						<tr>
							<th scope="row">담당자</th>
							<td id="tlWorkMbName">
							</td>
						</tr>
						<tr>
							<th scope="row">첨부파일</th>
							<td id="tdFile">
							</td>
						</tr>
						<tr>
							<th scope="row">내용<br>(30자이내)</th>
							<td id ="tlTxt">
							</td>
						</tr>


						<!-- 담당자 변경 검색 및 입력 -->
						<tr>
							<th scope="row" id="manageChange">담당자 변경</th>
							<td>
								<span class="search_box03 input_w80">
									<input type="text" id="chargeName" placeholder="담당자 검색" class="btnChargeSearch1">
									<button type="button" class="btn_search01 btnChargeSearch">검색</button>
									<input type="hidden" id="hdName" value="">
									<input type="hidden" id="hdName2" value="">
									<input type="hidden" id="changeManage" value="">
								</span>
							</td>
						</tr>
					</tbody>
				</table>
			</div>



			<div class="bbs_write01">
			<ul class ="changeManager">
					<!-- 
					<li class="tlink_info_tit">담당자 정보화기획실 경하경 <span></span> 대외협력사업실 홍길동</li> -->
				</ul>
				<ul class="comment">
					<!-- <li>
						<strong></strong>
						<strong class="date">2021.05.21 10:30</strong>
						<div class="tlink_info">
							파일양식 변경해도 되나요? <a href="#"><span class="file">파일명3.hwp</span></a> <a href="#"><span class="file">&nbsp;</span></a>
						</div>
					</li> -->
					</ul>
					<ul>
					<!-- <li>
						<strong>중소기업진흥원 홍길동</strong>
						<strong class="date">2021.05.21 11:30</strong>	
						<div class="tlink_info">
							양식을 지켜주세요.
						</div>
					</li> -->

					<li class="liCommentInput" style="display:none;">
						<div class="tlink_info">
							<input type="text" class="input_w70" id="comment" placeholder="댓글추가"> <!-- 댓글 입력란 -->							
							<span class="file btnFileAdd" style="cursor:pointer;">&nbsp;</span>	<!-- 파일 입력 추가 버튼 -->		
							<button type="button" class="btn_style01 btn_orange" id="btnCommentSave">전송</button><!-- 댓글 전송 버튼 -->		
							<div class="fileList"> <!-- 파일 입력란 추가 공간 -->							
							</div>
						</div>
					</li>

					<li class="liCommentButton">
						<button type="button" class="btn_style01 btn_gray" id="btnCommentAdd">댓글추가 +</button>
					</li>
				</ul>
			</div>
		</div>
	</div>
	<!-- e :popup_content -->
</div>
<!-- e :popup_guide -->