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
	$(document).ready(function() {

		
		

		

		// 일정적용 버튼
		$("#btnScheduleApp").click(function() {
			$(".listDate").each(function(index) {
				$(".listDate").eq(index).html("");
				$(".listDate").eq(index).text("2021.07.03");
			});
		});
		
		// 달력 입력 datepicker 설정
		$('.inputCalendar').datepicker({
			dateFormat : 'yyyy.mm.dd'		// 날짜 형태 설정		
		});	
		
		
		
	});
</script>

<style>
.dialogZindex {
   z-index: 100000;
}
</style>

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
				<h3>프로세스 관리</h3>
				<c:import url="/EmpPageLink.do?link=main/include/top" />  
			</div>
			<!-- 화면 상단 종료 -->
			
			<!-- s :contents_guide -->
			<div class="contents_guide">
				<div class="submenu_guide">
					<ul>
						<!-- 2차메뉴명 -->
						<li><a href="/empo/process/eMAU00D01Main.do" class="active">프로세스 매핑</a></li>
						<li><a href="/empo/process/eMAU00D02Main.do">프로세스 설정</a></li>
						<li><a href="/empo/process/eMAU00D03Main.do">표준일정 설정</a></li>
						<li><a href="/empo/process/eMAU00D04Main.do">휴일설정</a></li>
					</ul>
				</div>
				
				<!-- <div class="btn_guide ar mt-65 mb30">
					<button type="button" class="btn_style01 btn_blue">프로세스 저장</button>
				</div> -->
				<!-- e :btn_guide -->
				
				<!-- 검색 form 시작 -->
				<form name="searchForm" method="post">
				<ul>
					<li class="ac">
						<select id="pjYear" name="pjYear">
						</select>

						<!-- 사업명 검색 -->
						<span class="search_box03 input_w30">
							<input type="text" id="searchName" placeholder="사업명 입력">
							<button type="button" class="btn_search01" id="pjSearch">검색</button>
						</span>
					</li>
				</ul>
				</form>
				<!-- 검색 form 종료 -->


				<div class="bbs_list">
					<table id="main">
					  <caption>사업정보</caption>
					  <colgroup>
							<col width="10%">  
		                    <col width="10%">
		                    <col width="20%">
		                    <col width="20%">
		                    <col width="10%">
		                    <col width="10%">
		                    <col width="10%">
	                  </colgroup>
					  <thead>
						<tr>
						  <th scope="col">Code</th>
						  <th scope="col">사업년도</th>
						  <th scope="col">사업명</th>
						  <th scope="col">세부 사업명</th>
						  <th scope="col">사업부서</th>
						  <th scope="col">담당간사</th>
						  <th scope="col">등록일</th>
						</tr>
					  </thead>	  
					  <tbody id="loginUserResultList">
						
					  </tbody>
					</table>
				</div>
				
				<input type="hidden" id="loginMbCode" />
				<h4>프로세스 선택</h4>
				
				<div class="btn_guide ar mt-45 mb10">
					<button type="button" class="btn_style02 btn_gray" id="btnCategoryEdit">분류이동편집</button>
					<button type="button" class="btn_style02 btn_orange" id="btnProcessGet">프로세스 가져오기</button>
					<button type="button" class="btn_style02 btn_orange" id="btnScheduleApp" style="display:none;">일정적용</button>
				</div>
				<!-- e :btn_guide -->
				
				<!-- <p class="ar text_type02 mb10">시작일, 완료일 등록 및 변경 : 오른쪽 마우스 클릭, 일자 등록(수정) 후 상단(프로세스 저장] 버튼을 클릭해주세요.</p> -->
				<div class="bbs_list scroll sbox_h500">
					<table>
					  <caption>사업정보</caption>
					  <colgroup>
							<col width="20%">
							<col width="10%">  
		                    <col width="10%">
		                    <col width="10%">
		                    <col width="10%">
	                  </colgroup>
					  <thead>
						<tr>
						  <th scope="col">프로세스</th>
						  <th scope="col">주요일정</th>
						  <th scope="col">사용여부</th>
						  <th scope="col">시작일</th>
						  <th scope="col">완료일</th>
						</tr>
					  </thead>		  
					  <tbody id="processResultList">
					  <!--//클릭시팝업나옴-->
					  <!-- 
						<tr>
						  <td class="text_l"><span class="step_icon icon_off01"></span> 사업공고</td>
						  <td><input type="checkbox" class="listChkbox" checked></td>
						  <td><input type="checkbox" class="listChkbox" checked></td>	
						  <td class="listDate">2021.04.03</td>
						  <td class="listDate">2021.04.03</td>
						</tr>
						<tr>
						  <td class="text_l"><span class="step_icon icon_off01"></span> 과제접수</td>
						  <td><input type="checkbox" class="listChkbox"></td>
						  <td><input type="checkbox" class="listChkbox"></td>	
						  <td class="listDate"><button type="button" class="btn_style03 btn_red">등록</button> </td>
						  <td class="listDate"><button type="button" class="btn_style03 btn_white">등록</button></td>
						</tr>
						<tr>
						  <td class="text_l"><span class="step_icon icon_off01"></span> 사전점검</td>
						  <td><input type="checkbox" class="listChkbox"></td>
						  <td><input type="checkbox" class="listChkbox"></td>	
						  <td class="listDate"><button type="button" class="btn_style03 btn_red">등록</button></td>
						  <td class="listDate"><button type="button" class="btn_style03 btn_white">등록</button></td>
						</tr>  
						<tr>
						  <td class="text_l"><span class="step_icon icon_on01"></span> 서면평가</td>
						  <td><input type="checkbox" class="listChkbox"></td>
						  <td><input type="checkbox" class="listChkbox"></td>	
						  <td class="listDate"><button type="button" class="btn_style03 btn_red">등록</button></td>
						  <td class="listDate"><button type="button" class="btn_style03 btn_white">등록</button></td>
						</tr>
						<tr>
						  <td class="text_l icon_arrow"><span class="step_icon icon_off02"></span>PMS내 분과구성</td>
						  <td><input type="checkbox" class="listChkbox"></td>
						  <td><input type="checkbox" class="listChkbox"></td>	
						  <td class="listDate"><button type="button" class="btn_style03 btn_red">등록</button></td>
						  <td class="listDate"><button type="button" class="btn_style03 btn_white">등록</button></td>
						</tr>
						<tr>
						  <td class="text_l icon_arrow"><span class="step_icon icon_off02"></span>평가전문위원회 구성계획 수립</td>
						  <td><input type="checkbox" class="listChkbox"></td>
						  <td><input type="checkbox" class="listChkbox"></td>	
						  <td class="listDate"><button type="button" class="btn_style03 btn_red">등록</button></td>
						  <td class="listDate"><button type="button" class="btn_style03 btn_white">등록</button></td>
						</tr>
						<tr>
						  <td class="text_l icon_arrow"><span class="step_icon icon_off02"></span>평가전문위원회 구성</td>
						  <td><input type="checkbox" class="listChkbox"></td>
						  <td><input type="checkbox" class="listChkbox"></td>	
						  <td class="listDate"><button type="button" class="btn_style03 btn_red">등록</button></td>
						  <td class="listDate"><button type="button" class="btn_style03 btn_white">등록</button></td>
						</tr>
						<tr>
						  <td class="text_l"><span class="step_icon icon_off01"></span> 대면평가</td>
						  <td><input type="checkbox" class="listChkbox"></td>
						  <td><input type="checkbox" class="listChkbox"></td>	
						  <td class="listDate"><button type="button" class="btn_style03 btn_red">등록</button></td>
						  <td class="listDate"><button type="button" class="btn_style03 btn_white">등록</button></td>
						</tr>  
						<tr>
						  <td class="text_l"><span class="step_icon icon_off01"></span> 대면평가</td>
						  <td><input type="checkbox" class="listChkbox"></td>
						  <td><input type="checkbox" class="listChkbox"></td>	
						  <td class="listDate"><button type="button" class="btn_style03 btn_red">등록</button></td>
						  <td class="listDate"><button type="button" class="btn_style03 btn_white">등록</button></td>
						</tr>  
						<tr>
						  <td class="text_l"><span class="step_icon icon_off01"></span> 대면평가</td>
						  <td><input type="checkbox" class="listChkbox"></td>
						  <td><input type="checkbox" class="listChkbox"></td>	
						  <td class="listDate"><button type="button" class="btn_style03 btn_red">등록</button></td>
						  <td class="listDate"><button type="button" class="btn_style03 btn_white">등록</button></td>
						</tr>  
						<tr>
						  <td class="text_l"><span class="step_icon icon_off01"></span> 대면평가</td>
						  <td><input type="checkbox" class="listChkbox"></td>
						  <td><input type="checkbox" class="listChkbox"></td>	
						  <td class="listDate"><button type="button" class="btn_style03 btn_red">등록</button></td>
						  <td class="listDate"><button type="button" class="btn_style03 btn_white">등록</button></td>
						</tr>  
						<tr>
						  <td class="text_l"><span class="step_icon icon_off01"></span> 대면평가</td>
						  <td><input type="checkbox" class="listChkbox"></td>
						  <td><input type="checkbox" class="listChkbox"></td>	
						  <td class="listDate"><button type="button" class="btn_style03 btn_red">등록</button></td>
						  <td class="listDate"><button type="button" class="btn_style03 btn_white">등록</button></td>
						</tr>  
						<tr>
						  <td class="text_l"><span class="step_icon icon_off01"></span> 대면평가</td>
						  <td><input type="checkbox" class="listChkbox"></td>
						  <td><input type="checkbox" class="listChkbox"></td>	
						  <td class="listDate"><button type="button" class="btn_style03 btn_red">등록</button></td>
						  <td class="listDate"><button type="button" class="btn_style03 btn_white">등록</button></td>
						</tr>  
						<tr>
						  <td class="text_l"><span class="step_icon icon_off01"></span> 대면평가</td>
						  <td><input type="checkbox" class="listChkbox"></td>
						  <td><input type="checkbox" class="listChkbox"></td>	
						  <td class="listDate"><button type="button" class="btn_style03 btn_red">등록</button></td>
						  <td class="listDate"><button type="button" class="btn_style03 btn_white">등록</button></td>
						</tr>  
						 -->
					  </tbody>
					</table>
				</div>
				<!-- e :content_table -->

				
				<!-- s : 시작일, 완료일 입력 레이어 시작 -->
                <div id="popDateInput" class="Layer_popup">
                    <p class="right01"></p><!--왼쪽 말풍선인경우 class="left01" 변경-->
                    <div class="popup_guide popup_w200 popup_type02 box_mh400">
						<button type="button" class="closebtn btnPopDateInputClose">닫기</button>
                        <div class="popup_content">
                            <h5>TO-DO</h5>
							<ul class="data_list03 mb30">
								<li><input type="checkbox" name="todo" id="todo1" value="1"> 적용안함</li>
								<li><input type="checkbox" name="todo" id="todo2" value="2"> 시작일</li>
								<li><input type="checkbox" name="todo" id="todo3" value="3"> 완료일</li>
							</ul>
							<h5>알람설정</h5>
							<ul class="data_list03">
								<li><input type="checkbox" name="aram" id="aram0" value="1"> 설정안함</li>
								<li><input type="checkbox" name="aram" id="aram1" value="2"> 1일 전</li>
								<li><input type="checkbox" name="aram" id="aram2" value="3"> 2일 전</li>
								<li><input type="checkbox" name="aram" id="aram3" value="4"> 3일 전</li>
								<li><input type="checkbox" name="aram" id="aram7" value="5"> 7일 전</li>
							</ul>
                        </div>
                        <!-- e :popup_content -->
                    </div>
					
					<div class="popup_guide popup_w400 popup_type01 box_mh400">
						<button type="button" class="closebtn btnPopDateInputClose">닫기</button>
                        <div class="popup_content bbs_write01">
                            <ul>
								<li><span>시작일</span>
                            		<input type="text" class="inputCalendar" id="start" >
								</li>
								<li><span>완료일</span>
                            		<input type="text" class="inputCalendar" id="end" >
								</li>
							</ul>
							<div class="btn_guide ac mt20">
								<button type="button" class="btn_style05 btn_gray btnPopDateInputClose">취소</button>
								<button type="button" class="btn_style05 btn_red btnPopDateInputSave">확인</button>
							</div>
							
                        </div>
                        <!-- e :popup_content -->
                    </div>
					
                </div>
                <!-- e :시작일, 완료일 입력 레이어 종료 -->
                

					
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
<script>
;(function() {
	var pjCode, pjCateCode, pcCode, pcName, workPoint, useYN, selectedTD, loginMbCode, pjPk;
	//사업명 검색 자동완성 기능
	$("#searchName").autocomplete({
		source : function(request, response) {
			$.post('/empo/rpa/autocomplete.do', {
				'searchRpaPjList' : $('#searchName').val()
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
			});
		},

		select : function(event, ui) {
			console.log(ui.item);
		},

		focus : function(event, ui) {
			return false;
			//event.preventDefault();
		}
	});
	
	// 분류이동편집 버튼
	$("#btnCategoryEdit").click(function() {
		fnPopupOpen("/empo/process/eMAU00D05ProcessEditPage.do", "");	// ../js/popup.js 참고
	});
	

	// 프로세스 가져오기 버튼
	$("#btnProcessGet").click(function() {
		fnPopupOpen("/empo/process/processGetPopup.do", "");	// ../js/popup.js 참고
	});
	
	
	// 목록 체크박스 체크 및 해제할 때 경고창 띄우고 자동으로 닫기
	var dialogAlert = function() {
		var dialog = $('<p>정보가 저장되었습니다.</p>').dialog({
			modal: true,
	    	title : "알림",
			dialogClass : "dialogZindex",
			width: 300,
			height: 120,
			open: function (event, ui) {
				setTimeout(function () {
					 dialog.dialog('close');
				}, 1100); // alert 창 닫는 시간 1000 = 1초
			}
		});
	}
	
	var pjSearchTableHead = function() {
		var data = 
			'<caption>사업정보</caption>' +
			'	<colgroup>' +
			'		<col width="7%">  ' +
			'	    	<col width="7%">' +
			'	        <col width="22%">' +
			'	        <col width="23%">' +
			'	        <col width="25%">' +
			'	        <col width="7%">' +
			'	        <col width="10%">' +
			'	 	</colgroup>' +
			'	<thead>' +
			'		<tr>' +
			'			<th scope="col">Code</th>' +
			'			<th scope="col">사업년도</th>' +
			'			<th scope="col">레벨 1</th>' +
			'			<th scope="col">레벨 2</th>' +
			'			<th scope="col">레벨 3</th>' +
			'			<th scope="col">등록일</th>' +
			'			<th scope="col">사업부서</th>' +
			'		</tr>' +
			'	</thead>' +
			'	<tbody id="loginUserResultList">' +
			'	</tbody>' ;
		
		return $(data);			
	}
	
	var searchPJListView = function(row) {
		var data = 
			'<tr class="loginUserProject" style="cursor:pointer" data-pj_code="' + row.pjCode + '" data-pj_cate_code="' + row.pjCateCode1 + '">' +
			'	<td>' + row.pjCode + '</td>' +
			'	<td>' + row.pjYear + '</td>	' +
			'	<td class="text_l">' + row.pjCateName1 + '</td>' +
			'	<td class="text_l">' + row.pjCateName2 + '</td>' +
			'	<td>' + row.pjTitle + '</td>' +
			'	<td>' + row.writeTime + '</td>' +
			'	<td>' + row.grMName + '</td>' +
			'</tr>' ;
			
		return $(data);
	}
	
	$('#pjSearch').click(function() {
		var pjYear = $('#pjYear option:selected').val();
		var pjTitle = $('#searchName').val();
		
		console.log(pjYear);
		console.log(pjTitle);
		
		var data = {
				"pjYear" : pjYear
				, "pjTitle" : pjTitle
			}
		
		$.post("/empo/auth/searchProjectList.do", data).done(function(res) {
			$('#main').children().remove();
			$('#main').append(pjSearchTableHead());
			res.list.forEach(function(row, index) {
				$('#loginUserResultList').append(searchPJListView(row));
			});
		}).fail(function() {
			alert("실패");
		});
		
	});
	
	$(document).on('click', 'input[name="pcWorkPoint"]', function() {
		if (pjCode == undefined) {
			alert("프로젝트를 먼저 선택해주세요.");
			return false;
		}
		pcCode = $(this).parents('tr').data('pc_code');
		pcName = $(this).parents('tr').data('pc_name');
		
		if ($(this).is(":checked")) {
			workPoint = "1"; 
		} else {
			workPoint = "0";
		}
		
		if ($(this).parent('td').next().children().is(":checked")) {
			useYN = "1";
		} else {
			useYN = "0";
		}
		console.log(workPoint);
		console.log(useYN);
		
		var data = {
			"pjCode" : pjCode
			, "pcCode" : pcCode
			, "pcName" : pcName
			, "pcOrderBy": pcCode
			, "pjCateCode" : pjCateCode
			, "pcWorkPoint" : workPoint
			, "pcUse" : useYN
		}
		
		$.post("/empo/auth/projectProcessMappingSave.do", data).done(function() {
			dialogAlert();
		}).fail(function() {
			alert("실패");
		});
		
		
	});
	
	$(document).on('click', 'input[name="pcUse"]', function() {
		if (pjCode == undefined) {
			alert("프로젝트를 먼저 선택해주세요.");
			return false;
		}
		pcCode = $(this).parents('tr').data('pc_code');
		pcName = $(this).parents('tr').data('pc_name');
		
		if ($(this).is(":checked")) {
			useYN = "1"; 
		} else {
			useYN = "0"; 
		}
		
		if ($(this).parent('td').prev().children().is(":checked")) {
			workPoint = "1";
		} else {
			workPoint = "0";
		}
		console.log(workPoint);
		console.log(useYN);
		
		var data = {
			"pjCode" : pjCode
			, "pcCode" : pcCode
			, "pcName" : pcName
			, "pcOrderBy": pcCode
			, "pjCateCode" : pjCateCode
			, "pcWorkPoint" : workPoint
			, "pcUse" : useYN
		}
		
		$.post("/empo/auth/projectProcessMappingSave.do", data).done(function() {
			dialogAlert();
		}).fail(function() {
			alert("실패");
		});
		
	});
	// 목록의 시작일 및 완료일 td 클릭 : 팝업 오픈
	$(document).on('click', ".listDate", function(e) {
		selectedTD = $(this);
		pcCode = $(this).parents('tr').data('pc_code');
		pcName = $(this).parents('tr').data('pc_name');
		
		if ($(this).siblings('.workPoint').children().is(":checked")) {
			workPoint = "1";
		} else {
			workPoint = "0";
		}
		
		if ($(this).siblings('.use').children().is(":checked")) {
			useYN = "1"; 
		} else {
			useYN = "0"; 
		}
		
		if (pjCode == undefined) {
			alert("프로젝트를 먼저 선택해주세요.");
			return false;
		}
		
		$('#start').val("");
		$('#end').val("");
		
		if( $(this).hasClass('startDate') ) {
			if ($(this).text() != "등록") {
				$('#start').val($(this).text());
			}
			if ( $(this).next().text() != "등록") {
				$('#end').val($(this).next().text());
			}
		}
		
		if( $(this).hasClass('endDate') ) {
			if ($(this).prev().prev().prev().children().is(":checked")) {
				workPoint = "1";
			} else {
				workPoint = "0";
			}
			
			if ($(this).prev().prev().is(":checked")) {
				useYN = "1"; 
			} else {
				useYN = "0"; 
			}
			
			if ($(this).text() != "등록") {
				$('#end').val($(this).text());
			}
			if ( $(this).prev().text() != "등록") {
				$('#start').val($(this).prev().text());
			}
		}
		
		$('.inputCalendar').each(function(index) {
	        var thisData = $(this).val();

	        if ($.trim(thisData).length > 0) {
		        var date = new Date(thisData); // 화면에 표시되는 날짜 형태에 따라 변환
		            
		        $(this).data('datepicker').selectDate(new Date(date.getFullYear(), date.getMonth(), date.getDate()));
	    	}
		});
		
		$('input[name="todo"]').each(function(index, row) {
	    	$(row).prop('checked', false);
	    });
		$('#todo1').prop('checked', true);
	    
	    $('input[name="aram"]').each(function(index, row) {
	    	$(row).prop('checked', false);
	    });
	    $('#aram0').prop('checked', true);
	    
		// 마우스 클릭 위치 가져오기
		var divTop = e.clientY - 60; // 상단 좌표 위치 안맞을시 e.pageY 
		var divLeft = e.clientX-620; // 좌측 좌표 위치 안맞을시 e.pageX

		$("#popDateInput").css("top",divTop);
		$("#popDateInput").css("left",divLeft);
		$("#popDateInput").css("display","block");
	});

	$('input[name="todo"]').click(function() {
		console.log($(this).attr('id'));
		if ( $(this).attr('id') == "todo1" ) {
			if (! $(this).is(':checked')) {
				alert("하나 이상 체크하세요.");
				$(this).prop('checked', true);
			}
			$('input[name="aram"]').each(function(index, row) {
		    	$(row).prop('checked', false);
		    });
		    $('#aram0').prop('checked', true);
			$('#todo2').prop('checked', false);
			$('#todo3').prop('checked', false);
		} else if( $(this).attr('id') == "todo2" ) {
			if ( $('#start').val() == "") {
				alert("시작일 날짜를 입력해주세요.");
				return false;
			}
				
			$('#todo1').prop('checked', false);
			
			if ( ! $('#todo2').is(':checked') && ! $('#todo3').is(':checked')) {
				$('#todo1').prop('checked', true);
			}
		} else {
			if ( $('#end').val() == "") {
				alert("완료일 날짜를 입력해주세요.");
				return false;
			}
			
			$('#todo1').prop('checked', false);
			
			if ( ! $('#todo2').is(':checked') && ! $('#todo3').is(':checked')) {
				$('#todo1').prop('checked', true);
			}
		}
		
	});
	
	$('input[name="aram"]').click(function() {
		
		if ( $('#todo1').is(':checked')) {
			if ( $(this).attr('id') == "aram0" ) {
				return false;				
			} else {
				alert("TO-DO 적용안함으로 체크되어 있습니다.");	
				return false;
			}
			
		}	
		
		$('input[name="aram"]').each(function(index, row) {
	    	$(row).prop('checked', false);
	    });
	    $(this).prop('checked', true);
	})
	
	// 시작일 및 완료일 입력 팝업의 닫기(X) 클릭
	$(".btnPopDateInputClose").click(function() {
		$("#popDateInput").css("display","none");
	});
	
	$(".btnPopDateInputSave").click(function() {
		
		if ( confirm("저장하시겠습니까?")) {
			console.log(selectedTD)
			var data = {
					"pjCode" : pjCode
					, "pcCode" : pcCode
					, "pcName" : pcName
					, "pcOrderBy": pcCode
					, "pjCateCode" : pjCateCode
					, "pcWorkPoint" : workPoint
					, "pcUse" : useYN
					, "pcDayStart" : $('#start').val()
					, "pcDayEnd" : $('#end').val()
				} 
			
			
			
			$.post("/empo/auth/projectProcessMappingSave.do", data).done(function(res) {
				pjPk = res.pjPk;
				console.log(pjPk);
				
				var dataArray = new Array();
				var todoAramData ;
				$('input[name="todo"]').filter(function(index, row) {
					todoAramData = {
							"tdGubun" : ""
							, "tdCode" : ""
							, "tdDay"	: ""
							, "pjPk" : pjPk	
							, "cdArCode" : ""	
							, "mbCode" : $('#loginMbCode').val()
						}
					
					if ( $(row).is(":checked") ) {
						if ($(row).val() == "2") {
							todoAramData.tdGubun = ($(row).val()-1);
							todoAramData.tdCode = $(row).val();
							todoAramData.tdDay = $('#start').val();
							dataArray.push(todoAramData);
						} else if ($(row).val() == "3") {
							todoAramData.tdGubun = ($(row).val()-1);
							todoAramData.tdCode = $(row).val();
							todoAramData.tdDay = $('#end').val();
							dataArray.push(todoAramData);
						}
					}
					
				});
				console.log(dataArray)
				
				$('input[name="aram"]').filter(function(index, row) { 
					if ( $(row).is(":checked") ) {
						for (var i = 0; i < dataArray.length; i++) {
							dataArray[i].cdArCode = $(row).val();
						}
					}
					
				});
				
				if(dataArray.length > 0) {
					$.ajax({
						url : '/empo/auth/todoAramSave.do'
						, type : 'post'
						, data : JSON.stringify(dataArray)
						, contentType : "application/json; charset=utf-8"
					}).done(function() {
						
					}).fail(function() {
						alert("실패");
					})
				}
				
				if ( selectedTD.hasClass('startDate') ) {
					if ($('#start').val() != "") {
						selectedTD.html($('#start').val());
					}
					if ($('#end').val() != "") {
						selectedTD.siblings('.endDate').html($('#end').val());
					}
				}
				
				if ( selectedTD.hasClass('endDate') ) {
					if ($('#end').val() != "") {
						selectedTD.html($('#end').val());
					}
					if ($('#start').val() != "") {
						selectedTD.siblings('.startDate').html($('#start').val());
					}
				}
				
				$("#popDateInput").css("display","none");
				dialogAlert();
			}).fail(function() {
				alert("실패");
			}); 
			
		}
		
	});
	
	$(document).on('click', '.loginUserProject', function() {
		pjCode = $(this).data('pj_code');
		pjCateCode = $(this).data('pj_cate_code');
		console.log(pjCode);
		console.log(pjCateCode);
		
		$.post("/empo/auth/projectProcessMappingList.do", { "pjCode" : pjCode }).done(function(res) {
			
			console.log(res.list)
			$('.processList').filter(function(index, row1) {
				var rtn = "" ;
				res.list.every(function(row2, index) {
					if($(row1).hasClass(row2.pcCode)) {
						var trClass = $('.' + row2.pcCode);
						var workPointCheckBoxClass = trClass.children('.workPoint').children();
						var isUseClass = trClass.children('.use').children();
						var startDateClass = trClass.children('.startDate');
						var endDateClass = trClass.children('.endDate');
						
						if (row2.pcWorkPoint == 0) {
							workPointCheckBoxClass.prop("checked", false);
						} else {
							workPointCheckBoxClass.prop("checked", true);
						}
						
						if(row2.pcUse == 0) {
							isUseClass.prop("checked", false);
						} else {
							isUseClass.prop("checked", true);
						}
						
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
	});
	
	$(function() {
		initList();
		
	});
	
		
	var loginUserProjectListView = function(row) {
		var data = 
			'<tr class="loginUserProject" style="cursor:pointer" data-pj_code="' + row.pjCode + '" data-pj_cate_code="' + row.pjCateCode1 + '">' +
			'	<td>' + row.pjCode + '</td>' +
			'	<td>' + row.pjYear + '</td>	' +
			'	<td class="text_l">' + row.pjCateName + '</td>' +
			'	<td class="text_l">' + row.pjTitle + '</td>' +
			'	<td>' + row.grmName + '</td>' +
			'	<td>' + row.mbName + '</td>' +
			'	<td>' + row.writeTime + '</td>' +
			'</tr>' ;
			
		return $(data);
	}
	
	var processListView = function(row) {
		var data;
			
			if (row.pcPCode == 0) {
				data = 
					'<tr class="' + row.pcCode + ' processList" data-pc_code="' + row.pcCode + '" data-pc_name="' + row.pcName + '">' +
					'  <td class="text_l processUp"><span class="step_icon icon_off01"></span> ' + row.pcName + '</td>' +
					'  <td class="workPoint"><input type="checkbox" name="pcWorkPoint" class="pcWorkPoint' + row.pcScheduleCode + '"></td>' +
					'  <td class="use"><input type="checkbox" name="pcUse" class="pcUse' + row.pcUse + '"></td>	' +
					'  <td class="startDate listDate"><button type="button" class="btn_style03 btn_red">등록</button></td>' +
					'  <td class="endDate listDate"><button type="button" class="btn_style03 btn_red">등록</button></td>' +
					'</tr> ' ;
				
			} else {
				data = 
					'<tr class="' + row.pcCode + ' processList" data-pc_code="' + row.pcCode + '" data-pc_name="' + row.pcName + '">' +
					'  <td class="text_l processDown icon_arrow" ><span class="step_icon icon_off02"></span> ' + row.pcName + '</td>' +
					'  <td class="workPoint"><input type="checkbox" name="pcWorkPoint" class="pcWorkPoint' + row.pcScheduleCode + '"></td>' +
					'  <td class="use"><input type="checkbox" name="pcUse" class="pcUse' + row.pcUse + '"></td>	' +
					'  <td class="startDate listDate"><button type="button" class="btn_style03 btn_red">등록</button></td>' +
					'  <td class="endDate listDate"><button type="button" class="btn_style03 btn_red">등록</button></td>' +
					'</tr>' ; 
			}
			
			return $(data);
	}
	
	var getTree = function(process) {
		process.forEach(function(row) {
			row.subs = [];
		    if (row.pcPCode != "0") {
		    	var parentRow = process.find(obj => obj.pcCode == row.pcPCode);
		    	parentRow.subs.push(row);
		    }
		});
		return process.filter(obj => obj.pcPCode == '0');
	}
	
	// 사업별 Tree 형식 목록 View
	var addSubs = function(parentTbody, subs) {
		subs.forEach(function(row, index) {
			parentTbody.append(processListView(row, index));
			
			if (row.subs.length > 0) {
				addSubs(parentTbody, row.subs);
			}
			
		});
	}
	
	var initList = function() {
		//var pjYear = $('#year option:selected').val();
		var dt = new Date();
	    var com_year = dt.getFullYear();
	    
		for (var y = (com_year - 5); y <= (com_year + 1); y++) {
			$("#pjYear").append("<option value='" + y + "'>" + y + " 년" + "</option>");
		}
		$("#pjYear").find("option:eq(com_year)").prop("selected", true);
		
		$('#pjYear').children().each(function(index, row) { 
			if ($(row).val() == com_year) {
				$(row).prop('selected', true);
			}
		});
		
		$.post("/empo/auth/loginUserProjectList.do").done(function(res) {
			loginMbCode = $('#loginMbCode').val(res.mbCode);
			res.list.forEach(function(row, index) {
				$('#loginUserResultList').append(loginUserProjectListView(row));
			});
		}).fail(function() {
			alert("실패");
		});
		
		$.post("/empo/auth/eMAU00D02ProcessList.do").done(function(res) {
			var subs = getTree(res.list);
			addSubs( $('#processResultList'), subs);
			
			$(".pcWorkPoint1").prop("checked", true);
			$(".pcUse1").prop("checked", true);
			$(".listDate").css("cursor","pointer");
			// 최초 하위 프로세스 감추기
			$(".processDown").parent().css("display","none");
			// 프로세스 클릭 커서 변경
			$(".processUp").css("cursor","pointer");
			// 하위 프로세스 펼치기/감추기
			$(".processUp").each(function(index) {
				$(this).click(function() {
					//alert(index);
					
					// 상위 프로세스 상태 파악
					var strClass = $(this).find("span").attr("class");
					//alert(strClass);
					
					var state = "";
					if (strClass.indexOf("icon_off01") > -1) {	// 감춘상태 --> 펼친다
						$(this).find("span").removeClass("icon_off01");
						$(this).find("span").addClass("icon_on01");
						
						state = "";
					}
					else {	// 펼친상태 --> 감춘다
						$(this).find("span").removeClass("icon_on01");
						$(this).find("span").addClass("icon_off01");

						state = "none";
					}

					// 하위 프로세스 시작 및 끝 위치
					var startIndex = $(this).parent().index() + 1;
					var endIndex = $(".processUp").eq(index+1).parent().index();

					//alert(startIndex);
					//alert(endIndex);
					if (endIndex < 0) {
						endIndex = $(this).parent().parent().find("tr").last().index() + 1;
					}

					for (var i = startIndex; i < endIndex; i++ ) {
						$(this).parent().parent().find("tr").eq(i).css("display",state);
					}
					
				});
			});
		}).fail(function() {
			
		});
		
	}
})();
</script>
</html>
