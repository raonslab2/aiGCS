<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
	// 업무영역의 class와 게시글 index
	String name = request.getParameter("name");
	String seq = request.getParameter("seq");
%>

<script type="text/javascript">
	var tlWorkName = "";
	var tlWriteTime = "";
	var time = "";
	var flPath = "";
	$(document).ready(function() {
		// 팝업 스크롤바를 정의
		$(".scroll").mCustomScrollbar({
			scrollbarPosition : "outside"
			//theme:"dark"
		});
	 
		$.ajax({
			type : "POST"
			,url : "/empo/tplink.detailView.do"
			,data : {"tlPk" : tlPk}
		}).done(function(res){
			res.list.forEach(function(row, index) {
				if(row.tlConfirm==0){
					$('#status').append('업무요청');	
				}
				if(row.tlConfirm==1){
					$('#status').append('확인');	
				}
				if(row.tlConfirm==2){
					$('#status').append('완료');	
				}
				if(row.tlConfirm==3){
					$('#status').append('피드백');	
				}
				tlWriteTime = row.tlWriteTime;
				var now = new Date(tlWriteTime);
				var year = now.getFullYear();
				var month = now.getMonth()+1;
				var date = now.getDate();
				var hour = now.getHours();
				var min = now.getMinutes();
				time = year + '-' + month + '-' + date + ' ' + hour + ':' + min;
				$('#requestDate').append(year + '년 ' + month + '월 ' + date + '일 ' + hour + '시 ' + min + '분 '); // 요청일
				
				$('#tlTitle').append(row.tlTitle);
				$('#requester').append(row.grmName + ' ' + row.mbName);
				$('#tlWorkDay').append(row.tlWorkDay);
				$('#tlWorkMbName').append(row.tlWorkGrmName + ' ' + row.tlWorkMbName);
				tlWorkName = row.tlWorkGrmName + ' ' + tlWorkMbName
				$('#tlTxt').append(row.tlTxt);
				// $('#tlFile').append($('<a id="fileDownload" href="' + row.flPath + '" download="text.txt">' + row.flName + '</a>'));
				if(row.flName != null){
					$('#tlFile').append($('<a id="fileDownload"  href="/' + row.flPath + '" download="' + row.flName + '">' + row.flName + '</a>'));	
				}
			})
		});
		
		$.ajax({
			type : "POST"
			,url : "/empo/tplink.checkChangeManager.do"
			,data : {"tlPk" : tlPk}
		}).done(function(res){
			res.list.forEach(function(row, index) {
				if(row.cnt==1){
					$('.changeManager1').append(dataListView(row));
				}
			});
		});
		
		var dataListView = function(row) {
			var data = 
				'<li class="tlink_info_tit">' + row.tlWorkOldGrmName + ' ' + row.tlWorkOldMbName + '<span></span>' + row.tlWorkGrmName + ' ' + row.tlWorkMbName + '</li>'
			return $(data);
		}
		
		$.ajax({
			type : "POST"
			,url : "/empo/tplink.commentView.do"
			,data : {"tlPk" : tlPk}
		}).done(function(res){
			res.list.forEach(function(row, index) {
				$('.commentView').append(dataListView1(row));
			});
		}).fail(function(){
			alert('실패')
		});
		
		var dataListView1 = function(row) {
			var data = 
				'<li>'
			+ '<strong>' + row.tlCommentgrmName + ' ' + row.tlCommentMbName + '</strong>'
			+ '<strong class="date">' + row.tlCommentDate + '</strong>'
			+ '<div class="tlink_info">'
			+ row.tlCommentText + '<a href="#"><span class="file">파일명3.hwp</span></a>'
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
							<td id="status">
											                     
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
							<td id = "tlFile">
								
							</td>
						</tr>
						<tr>
							<th scope="row">내용</th>
							<td id ="tlTxt">
							</td>
						</tr>


						<!-- 담당자 변경 검색 및 입력 -->
					</tbody>
				</table>
			</div>



			<div class="bbs_write01">
				<ul class ="changeManager1">
					<!-- 변경된 담당자 표시 -->
					<!-- <li class="tlink_info_tit">담당자 정보화기획실 경하경 <span></span> 대외협력사업실 홍길동</li> -->
				</ul>
					<!-- 댓글 목록 -->
					<ul class = "commentView">				
				</ul>
			</div>
		</div>
	</div>
	<!-- e :popup_content -->
</div>
<!-- e :popup_guide -->