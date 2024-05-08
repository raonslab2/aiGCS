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


<!-- 프로세스 가져오기 -->
<div class="popup_guide popup_w500">	
	<h3>
		프로세스 가져오기
	</h3>

	<div class="popup_content">

		<div class="bbs_write01">
			<ul>
				<li><span>사연년도</span>					
					<select id="year" name="pjYear" class="input_w100">
					</select>
				</li>

				<li><span>세부사업명</span>
					<input type="text" class="input_w100" id="searchField" name="searchField" placeholder="사업명을 입력하세요.">
				</li>

			</ul>
			
			<div class="btn_guide ac mt20">
				<button type="button" class="btn_style05 btn_gray" id="btnPopCancel">취소</button>
				<button type="button" class="btn_style05 btn_red" id="btnPopConfirm">확인</button>
			</div>
			<!-- e :btn_guide -->
		
		</div>
		<!-- e :bbs_write01 -->
		
	</div>
	<!-- e :popup_content -->

</div>
<script>
;(function() {
	$("#searchField").autocomplete({
		source : function(request, response) {
			$.post('/empo/auth/searchProjectAutocomplete.do', { 
				"pjYear" : $('#year').val()
				, "pjTitle" : $('#searchField').val() 
			}).done(function(res) {
				console.log(res.list)
				var list = [];
				res.list.forEach(function(row) {
					console.log(row.pjTitle);
					list.push(row.pjTitle);
				})
				console.log(list);
				response(list);
			}).fail(function() {
				alert("실패");
			});
		},

		select : function(event, ui) {
			console.log(ui.item);
		},

		focus : function(event, ui) {
			return false;
			//event.preventDefault();
		},
		
		open: function () {
	        $(this).autocomplete('widget').css('z-index', 999999);
	        return false;
	    }
	});
	
	$("#btnPopCancel").click(function() {
		fnPopupClose();
	});
	
	$("#btnPopConfirm").click(function () {
		var data = {
			"pjYear" : $('#year').val()
			, "pjTitle" : $('#searchField').val() 
		}
		
		$.post("/empo/process/processIsUse.do", data ).done(function(res) {
			console.log(res.list);
			if (res.list == null ) {
				alert("전체 사업명을 입력해주세요.");
				return false;
			} else {
				var dataPjCode = res.list.pjCode;
				$.post("/empo/process/projectProcessMappingList.do", { "pjCode" : dataPjCode }).done(function(res) {
					
					console.log(res.list)
					$('.processList').filter(function(index, row1) {
						var rtn = "" ;
						res.list.every(function(row2, index) {
							if($(row1).hasClass(row2.pcCode)) {
								var trClass = $('.' + row2.pcCode);
								var startDateClass = trClass.children('.startDate');
								var endDateClass = trClass.children('.endDate');
								
								if (row2.pcDayStart == null) {
									startDateClass.html($('<button type="button" class="btn_style03 btn_red">등록</button>'));
								} else {
									startDateClass.html(row2.pcDayStart);
								}
								if (row2.pcDayEnd == null) {
									endDateClass.html($('<button type="button" class="btn_style03 btn_red">등록</button>'));
								} else {
									endDateClass.html(row2.pcDayEnd);
								}
								
								rtn = "isData";
								return false;
							} else {
								return true;
							}
						});
						
						if(rtn == "") {
							$(row1).find('.workPoint').children().prop('checked', false)
							$(row1).find('.use').children().prop('checked', false);
							$(row1).find('.pcWorkPoint1').prop('checked', true);
							$(row1).find('.pcUse1').prop('checked', true);
							$(row1).find('.listDate').html($('<button type="button" class="btn_style03 btn_red">등록</button>'));
						}
						
					});
				}).fail(function() {
					alert("실패");
				});
				
				$("#btnProcessGet").css("display","none");
				$("#btnScheduleApp").css("display","");

				fnPopupClose();
				
				return false;
			}
		}).fail(function() {
			
		});

	});
	
	$(function() {
		console.log("a");
		var dt = new Date();
	    var com_year = dt.getFullYear();
	    
		for (var y = (com_year - 5); y <= (com_year + 1); y++) {
			$("#year").append("<option value='" + y + "'>" + y + " 년" + "</option>");
		}
		$("#year").find("option:eq(com_year)").prop("selected", true);
		
		$('#year').children().each(function(index, row) { 
			if ($(row).val() == com_year) {
				$(row).prop('selected', true);
			}
		});
	});
	
})();
</script>
