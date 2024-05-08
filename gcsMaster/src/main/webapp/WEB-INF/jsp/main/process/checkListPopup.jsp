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

<%
	String dataPcCode = request.getParameter("dataPcCode");
	String dataPcName = request.getParameter("dataPcName");
	String dataOrderBy = request.getParameter("dataOrderBy");
%>

<style>
.dialogZindex {
   z-index: 100000;
}
</style>

<!-- Check List 추가 -->
<div class="popup_guide popup_w500">	
	<h3>
		Check List 추가
	</h3>

	<div class="popup_content">

		
		<form name="formPopCheckListAdd" id="formPopCheckListAdd">
		<div class="bbs_write01">
			
			<input type="hidden" name="pcCode" value="<%=dataPcCode %>" />
			<input type="hidden" name="clOrderBy" value="<%=dataOrderBy %>" />
			<ul>
				<li><span>항목명 입력</span>
					<input type="text" class="input_w100" id="clTitle" name="clTitle" placeholder="항목명을 입력하세요.">
				</li>
				
				<!-- <p class="text_type02">프로세스별 체크리스트 추가 시 아래의 사업정보 및 프로세스를 선택해 주세요.</p>

				<li>								
					<button type="button" class="btn_style02 sb_style  btn_blue">사업선택</button>
				</li>

				<li>
					<select name="" class="input_w100">
						<option>2021년</option>
						<option>2020년</option>
					</select>
				</li>

				<li>
					<select name="" class="input_w100">
						<option>2021년 생활혁신형 기술혁신개발사업 수출지향형 1차</option>
					</select>
				</li> -->

				<li><span>프로세스 선택</span>	
					<%=dataPcName%>				
				</li>
			</ul>
		</div>
		<!-- e :bbs_write01 -->
		</form>
		<div class="btn_guide ac mt20">
			<button type="button" class="btn_style05 btn_gray" id="btnPopCancel">취소</button>
			<button type="button" class="btn_style05 btn_red" id="btnPopSave">저장</button>
		</div>
		<!-- e :btn_guide -->	
		
		
		
	</div>
	<!-- e :popup_content -->

</div>
<script>
;(function() {
	var checkListView = function(row) {
		var data =
			'<tr class="rowCheckList" data-cl_pk=' + row.clPk + '>' +
			'	<td><input type="checkbox" name="checkField"></td>' +
			'	<td class="text_l">' + row.clTitle + '</td>' +
			'	<td class="radioTD"><input type="radio" name="checkListUse' + row.clPk + '" value="1"> 사용   <input type="radio" name="checkListUse' + row.clPk + '" value="0"> 미사용</td>' +
			'</tr>' ;
			
		return $(data);
	}
	
	$("#btnPopCancel").click(function() {
		
	    var dialog = $('<p>등록된 정보를 저장하지 않습니다.</p>').dialog({
			modal : true, 
			dialogClass : "dialogZindex",
	    	title : "Check List 추가 취소",
	        buttons: {
	            "아니오": function() {
	                dialog.dialog('close');
	            },
	            "네":  function() {
	                dialog.dialog('close');
	                fnPopupClose();
	            }
	        }
	    });
	});
	
	$("#btnPopSave").click(function () {
		
		var formSer = $('#formPopCheckListAdd').serialize();
		
		$.post('/empo/process/eMAU00D02CheckListCreate.do', formSer).done(function(res) {
			alert("체크리스트가 추가되었습니다.");
			
			if ( $('.noCheckList').length == 1 ) {
				$('.noCheckList').remove();
			}
			$('#processCheckList').append(checkListView(res.list));
			$('input[name="checkListUse' + res.list.clPk + '"][value="' + res.list.clUse + '"]').prop('checked', true);
		}).fail(function() {
			alert("실패");
		})
		
		fnPopupClose();
		
	});
	
})();

</script>