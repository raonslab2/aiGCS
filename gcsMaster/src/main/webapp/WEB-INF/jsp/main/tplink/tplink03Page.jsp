<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
	// 상태
	String state = request.getParameter("state");
%>

<style>
.dialogZindex {
   z-index: 100000;
}
</style>
<script type="text/javascript">
	var fileName = "";
	var loginMbCode;
	var loginGrmCode;
	var time;
	var changeManage = "";
	// 로그인정보 = 요청자
	$(document).ready(function() {
		changeManage = $('#manageChange').text();
		$.ajax({
			type : "POST",
			url : "/empo/rpa/businessDepart.do"
		}).done(function(res) {
			var k = res.list.grSumName + ' ' + res.list.mbName ;
			var now = new Date();
			var year = now.getFullYear();
			var month = now.getMonth()+1;
			var date = now.getDate();
			var hour = now.getHours();
			var min = now.getMinutes();
			
			$('#requester').append(k);
			$('#nowTime').append(year + '년 ' + month + '월 ' + date + '일 ' + hour + '시 ' + min + '분 ');
			time = year + '-' + month + '-' + date + ' ' + hour + ':' + min;
			loginMbCode = res.list.mbCode;
			loginGrmCode = res.list.grmCode
		});
	});
		
		// 달력 입력 datepicker 설정
		$('.inputCalendar').datepicker({
			dateFormat : 'yyyy.mm.dd'		// 날짜 형태 설정		
		});	
		
		
		// 파일 입력 추가버튼
		$(".btnFileAdd").click(function() {
			var fileForm = '<input type="file" class="input_w100" id="file" name="uploadFile">';
			$(".fileList").append(fileForm);
		}); 
		
		/* 
		$(".btnFileAdd").click(function() {
			var fileForm = 
				'<form action="uploadFormAction" method = "post" enctype = "multipart/form-data">' 
				'<input type="file" class="input_w100 fileChoice" id="file" name="uploadFile" multiple>'
				'</form>';
			$(".fileList").append(fileForm);
		});
		*/
		
		// 담당자 검색 클릭
		$(".btnChargeSearch2").click(function() {
			fnPopupAddOpen("/empo/tplink/eMAU00H05Main.do", "#formInsertManager");	// ../js/popup.js 참고
		});

		// 취소버튼 클릭
		$("#btnPopCancel").click(function() {
			
            var dialog = $('<p>등록된 정보를 저장하지 않고 취소하시겠습니까?</p>').dialog({
				modal : true, 
				dialogClass : "dialogZindex",
            	title : "Check List 추가 취소",
                buttons: {
                    "아니오": function() {
                        dialog.dialog('close');
                    },
                    "예":  function() {
                        dialog.dialog('close');
            			fnPopupClose();
                    }
                }
            });
		});
	
		/* // 저장버튼 클릭
		$("#formPopTlinkAdd").submit(function () {
			
			alert("정보가 정상적으로 등록되었습니다.");
			fnPopupClose();
			
			return false;
		}); */

		 /* $(document).on('click', '#btnSave', function() {
			var tlTitle = $('#tlTitle').val(); // 제목
			var date1 = $('#date1').val(); // 필요일정
			var date2 = $('#date2').val(); // 완료일
			var tlMbCode = $('#hdName').val(); // 담당자
			var tlGrmCode = $('#hdName2').val(); // 담당기관
			var tlText = $('#tlText').val(); // 내용
			var tlConfirm = $("select[name=tlConfirm]").val();
			console.log(tlMbCode)
			$.ajax({
				type : "POST"
				,url : "/empo/tplink.businessRequest.do"
				,data : {
					'tlTitle' : tlTitle
					,'tlText' : tlText
					,'mbCode' : loginMbCode
					,'grmCode' : loginGrmCode
					,'date1' : date1
					,'tlMbCode' : tlMbCode
					,'tlGrmCode' : tlGrmCode
					,'time' : time
					,'date2' : date2
					,'tlConfirm' : tlConfirm
					}
			}).done(function(res) {
				var taskRequest = '평과계획관리시스템>T-LINK를 확인해주세요'
				if(tlConfirm == 0){
					tlConfirm = '업무요청'
				}
				if(tlConfirm == 1){
					tlConfirm = '확인'
				}
				if(tlConfirm == 2){
					tlConfirm = '완료'
				}
				if(tlConfirm == 3){
					tlConfirm = '피드백'
				}
				var text = '';
				// 알람서비스
				$.ajax({
					type: "POST"
					,url : "/empo/tplink.tlinkAlarmSend.do"
					,data : {'loginMbCode' : loginMbCode
							,'tlMbCode' : tlMbCode
							,'tlConfirm' : tlConfirm
							,'taskRequest' : taskRequest
							,'text' : text}
				}).done(function(){
					alert("정보가 정상적으로 등록되었습니다.");
					fnPopupClose();
					location.reload();
					return false;
				}).fail(function(){
					alert('실패');
				});
			});
			
			var formData = new FormData();
	        var inputFile = $("input[name='uploadFile']");
	        var files = inputFile[0].files;
	        console.log(files);

	        for(var i=0; i<files.length; i++) {
	            formData.append("uploadFile", files[i]);
	        }
	        
	        // 파일 D드라이브에 업로드
	        $.ajax({
	            url: '/empo/tplink.uploadFile.do',
	            processData : false,
	            contentType: false,
	            data: formData,
	            type: 'POST',
	            anysc: false,
	            success: function(result) {
	                alert("Uploaded");
	            }
	        });
		});  */
		
		$(document).on('click', '#btnSave', function() {
			var tlTitle = $('#tlTitle').val(); // 제목
			var date1 = $('#date1').val(); // 필요일정
			var date2 = $('#date2').val(); // 완료일
			var tlMbCode = $('#hdName').val(); // 담당자
			var tlGrmCode = $('#hdName2').val(); // 담당기관
			var tlText = $('#tlText').val(); // 내용
			var tlConfirm = $("select[name=tlConfirm]").val();
			console.log(tlMbCode)
			$.ajax({
				type : "POST"
				,url : "/empo/tplink.businessRequest.do"
				,data : {
					'tlTitle' : tlTitle
					,'tlText' : tlText
					,'mbCode' : loginMbCode
					,'grmCode' : loginGrmCode
					,'date1' : date1
					,'tlMbCode' : tlMbCode
					,'tlGrmCode' : tlGrmCode
					,'time' : time
					,'date2' : date2
					,'tlConfirm' : tlConfirm
					}
			}).done(function(res) {
				var taskRequest = '평과계획관리시스템>T-LINK를 확인해주세요'
				if(tlConfirm == 0){
					tlConfirm = '업무요청'
				}
				if(tlConfirm == 1){
					tlConfirm = '확인'
				}
				if(tlConfirm == 2){
					tlConfirm = '완료'
				}
				if(tlConfirm == 3){
					tlConfirm = '피드백'
				}
				var text = '';
				// 알람서비스
				$.ajax({
					type: "POST"
					,url : "/empo/tplink.tlinkAlarmSend.do"
					,data : {'loginMbCode' : loginMbCode
							,'tlMbCode' : tlMbCode
							,'tlConfirm' : tlConfirm
							,'taskRequest' : taskRequest
							,'text' : text}
				}).done(function(){
					alert("정보가 정상적으로 등록되었습니다.");
					fnPopupClose();
					location.reload();
					return false;
				}).fail(function(){
					alert('실패');
				});
				
				var formData = new FormData();
		        var inputFile = $("input[name='uploadFile']");
		        var files = inputFile[0].files;
		        console.log(files);

		        for(var i=0; i<files.length; i++) {
		            formData.append("uploadFile", files[i]);
		        }
		        formData.append("tlPk", res.tlPk);
		        
		        // 파일 D드라이브에 업로드
		        $.ajax({
		            url: '/empo/tplink.uploadFile.do',
		            processData : false,
		            contentType: false,
		            data: formData,
		            type: 'POST',
		            anysc: false,
		            success: function(result) {
		                alert("Uploaded");
		            }
		        });
			});
			
			
		});
		
</script>

<!-- 사업부서 선택 -->
<div class="popup_guide popup_w600">
	<a href="javascript:void(0)" class="closebtn" onclick="fnPopupClose()">닫기</a>
	<h3>
		<% if (state.equals("R")) {%> 업무요청 정보 <%}%>
		<% if (state.equals("M")) {%> 확인 정보 <%}%>
		<% if (state.equals("C")) {%> 완료 정보 <%}%>
		<% if (state.equals("F")) {%> 피드백 정보 <%}%>
	</h3>

	<form id="formInsertManager">
		<input type="hidden" name="choice" value="Insert" />
	</form>
	<div class="popup_content">
		
		<form name="formPopTlinkAdd" id="formPopTlinkAdd" method="post">
		<div class="bbs_list">
			<table class="table_l">
				<colgroup>
					<col width = "20%">
					<col width = "%">
				</colgroup>

				<tbody>
					<tr>
						<th scope="row">제목 *</th>
						<td>
							<input type="text" class="input_w100" id="tlTitle" name="" placeholder="제목을 입력하세요.">
						</td>
					</tr>
					<tr>
						<th scope="row">상태</th>
						<td>							                     
							<select class="input_w30" name = "tlConfirm" id="tlConfirm">
								<option value ="0" <% if (state.equals("R")) {%> selected <%}%>>요청</option>
								<option value ="1" <% if (state.equals("M")) {%> selected <%}%>>확인</option>
								<option value ="2" <% if (state.equals("C")) {%> selected <%}%>>완료</option>
								<option value ="3" <% if (state.equals("F")) {%> selected <%}%>>피드백</option>
							</select>
						</td>
					</tr>
					<tr>
						<th scope="row">요청자</th>
						<td  id = "requester">
						</td>
					</tr>
					<tr>
						<th scope="row">요청일</th>
						<td id="nowTime">
						</td>
					</tr>
					<tr>
						<th scope="row">필요일정</th>
						<td>
							<input type="text" class="inputCalendar" name="" id="date1">
						</td>
					</tr>
					<tr>
						<th scope="row">완료일</th>
						<td>
							<input type="text" class="inputCalendar" name="" id="date2">
						</td>
					</tr>
					<tr>
						<th scope="row">담당자</th>
						<td>
							<span class="search_box03 input_w80">
								<input type="text" id="chargeName" placeholder="담당자 검색" class="btnChargeSearch2">
								<button type="button" class="btn_search01 btnChargeSearch">검색</button>
								<input type="hidden" id="hdName" value="">
								<input type="hidden" id="hdName2" value="">
								<input type="hidden" id="changeManage" value="">
							</span>
						</td>
					</tr>
					<tr>
						<th scope="row">첨부파일</th>
						<td>
							<span class="file btnFileAdd" style="cursor:pointer;">&nbsp;</span>	<!-- 파일 입력 추가 버튼 -->						
							<div class="fileList"> <!-- 파일 입력란 추가 공간 -->							
							
							</div>
						</td>
					</tr>
					<tr>
						<th scope="row">내용<br></th>
						<td>
							<textarea class="input_w100" id="tlText" name="" maxlength="5000" placeholder="내용을 입력하세요." style="height: 110px;"></textarea>
						</td>
					</tr>
				</tbody>
			</table>
		</div>

			
		<div class="btn_guide ac mt20">
			<button type="button" class="btn_style05 btn_gray" id="btnPopCancel">취소</button>
			<button type="button" class="btn_style05 btn_red" id="btnSave">저장</button>
		</div>
		</form>
	</div>
	<!-- e :popup_content -->
</div>
<!-- e :popup_guide -->