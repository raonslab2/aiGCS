<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
	// 권한 모드 (추가:insert, 수정:edit);
	String gsPk = request.getParameter("gsPk"); 
%>

<script type="text/javascript">
	$(document).ready(function() {
		

		 
		// 답변보류 클릭
		$("#btnPopCancel").click(function() {
			
            var dialog = $('<p>빠른 답변은 신속한 업무진행에 도움이 됩니다.</p>').dialog({
				modal : true, 
				dialogClass : "dialogZindex",
            	title : "답변보류",
                buttons: {
                    "보류": function() {
                        dialog.dialog('close');
            			fnPopupClose();
                    },
                    "답변 등록":  function() {
                        dialog.dialog('close');
                    }
                }
            });
		});
		
		// 답변전송 버튼 클릭
		$("#btnPopSend").click(function() {
			alert("빠른 답변에 감사드립니다.\n좋은 하루 되세요.");
			fnPopupClose();
			return false;
		});
	});
	
 
	

</script>

<style>
.dialogZindex {
   z-index: 100000;
}
</style>


<!-- 담당간사 지원가능여부 확인 -->
<div class="popup_guide popup_w1000">
	<a href="javascript:void(0)" class="closebtn" onclick="fnPopupClose()">닫기</a>
	<h3>담당간사 지원가능여부 확인</h3>
	<div class="popup_content">
		<form id="formUserRequest">
			<input type="hidden" name="gsPk" id="gsPk" value="<%=gsPk %>"/> 
		</form> 
		<div class=" content_col2 bg">
			<div class="bbs_write01">
				<ul>
					<li><span>사업명</span>
					 <div id="pjTitle2"> </div>
					</li>

					<li>
						<div class="inputDiv">
							<ul>
								<li>
									<span>시작일시</span> 
									<div id="pcDayStart2"></div> 
								</li>
							
								<li>
									<span>시간</span>
									09:00
									~
									17:00
								</li>
							</ul>
						</div>
					</li>

					<li>
						<div class="inputDiv">
							<ul>
								<li>
									<span>완료일시</span>
									<div id="pcDayEnd2"></div>
								</li>
							
								<li>
									<span>시간</span>
									09:00
									~
									17:00
								</li>
							</ul>
						</div>
					</li>

					<li><span>요청업무</span>
					평가 담당간사 지원요청
					</li>

					<li><span>요청자</span>
					협력사업본부 대외협력실
					<br>
					홍길동 책임
					<br>
					☎ 042-388-9999
					</li>
				</ul>
			</div>
			<!-- e :bbs_write01 -->


			<div class="bbs_write01" >
				<h4>지원여부 답변하기</h4>
				<div id="resultNotice2"></div> 
				<div class="btn_guide ac mt20">
					<button type="button" class="btn_style05 btn_gray" id="btnPopCancel">답변보류</button>
					<button type="button" class="btn_style05 btn_red" id="btnPopSend">답변전송</button>
				</div>
				<!-- e :btn_guide -->
			</div>
			<!-- e :bbs_write01 -->
		</div>
		<!-- e :content_col2 -->
	</div>
	<!-- e :popup_content -->
</div>
<!-- e :popup_guide -->

<script>
;(function() { 
	$(function() {
		
		var searchTodayVal = getToday(); 
		var gsPkVal = $("#gsPk").val();   
		var selectRequestView = function(row) {
			var data; 
			 
			data =  "	 <li>		\r\n" + 
			"						<label>\r\n" + 
			"						<input type=\"checkbox\">\r\n" + 
			"						&nbsp;&nbsp;&nbsp;\r\n" + 
			"						"+row.pjInDate+"\r\n" +  
			"						</label>\r\n" + 
			"					</li>"; 
			return $(data);
		}
		
		$.post('/empo/dashboard/selectPjRequest2.do', {searchToday:searchTodayVal,gsPk:gsPkVal} ).done(function(res) { 
			res.list.forEach(function(row, index) {  
				$('#pjTitle2').append(row.pjTitle);
				$('#pcDayStart2').append(row.pcDayStart);
				$('#pcDayEnd2').append(row.pcDayEnd);
				$('#resultNotice2').append(selectRequestView(row));  
			});  
		}).fail(function() {
			alert("실패");
		});
		
	});
	
	function getToday(){ 
	    var now = new Date();
	    var year = now.getFullYear();
	    var month = now.getMonth() + 1;    //1월이 0으로 되기때문에 +1을 함.
	    var date = now.getDate();

	    month = month >=10 ? month : "0" + month;
	    date  = date  >= 10 ? date : "0" + date;
	     // ""을 빼면 year + month (숫자+숫자) 됨.. ex) 2018 + 12 = 2030이 리턴됨.
 
	    return today = ""+year +"-"+ month +"-"+ date; 
	}
	
})();
</script>