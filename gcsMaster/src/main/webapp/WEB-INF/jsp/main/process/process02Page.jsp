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
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>TIPA 스케쥴기반 평가관리시스템</title>
<c:import url="/EmpPageLink.do?link=main/include/src" /> 
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
						<li><a href="/empo/process/eMAU00D01Main.do">프로세스 매핑</a></li>
						<li><a href="/empo/process/eMAU00D02Main.do" class="active">프로세스 설정</a></li>
						<!-- <li><a href="/empo/process/eMAU00D03Main.do">표준일정 설정</a></li>
						<li><a href="/empo/process/eMAU00D04Main.do">휴일설정</a></li>  -->
					</ul>
				</div>
				
				<input type="hidden" id="createMode" />
				<input type="hidden" id="createPcPCode" />
				<!-- s :content_col2 -->
				<div class="content_col2">
					<div class="tree_guide">
						<div class="btn_guide">
							<button type="button" class="btn_style02 btn_white btnProcessAdd">대분류 추가</button>
							<button type="button" class="btn_style02 btn_white btnProcessDelete">삭제</button>
							<button type="button" class="btn_style02 btn_blue fr btnProcessMoveEdit">분류이동 편집</button>
						</div>
						<!-- e :btn_guide -->
						<div class="tree_style01 tree_style02 sbox_h600 scroll">
							<!-- 프로세스가 없어도 ul은 반드시 정의해야 함 -->
							
                            <!-- <ul id="processList"> 
                            
								 <li><span class="on">사업공고 <em>1</em></span><button type="button" class="plus btnSubProcessAdd">추가</button>
                                    <ul>
                                        <li><span>사업공고</span></li>
                                    </ul>
                                </li>
                                <li><span class="off">과제접수 <em>3</em></span><button type="button" class="plus btnSubProcessAdd">추가</button>
                                    <ul style="display:none;">
                                        <li><span>접수마감</span></li>
                                        <li><span>접수현황 결과보고</span></li>
                                        <li><span>서류보완 요청</span></li>
                                    </ul>
                                </li>
                                <li><span class="off">대분류</span><button type="button" class="plus btnSubProcessAdd">추가</button>
								</li>
                                <li><span class="off">대분류</span><button type="button" class="plus btnSubProcessAdd">추가</button>
								</li>
                                <li><span class="off">대분류 <em>3</em></span><button type="button" class="plus btnSubProcessAdd">추가</button>
                                    <ul style="display:none;">
                                        <li><span>접수마감</span></li>
                                        <li><span>접수현황 결과보고</span></li>
                                        <li><span>서류보완 요청</span></li>
                                    </ul>
								</li>
                                <li><span class="off">대분류</span><button type="button" class="plus btnSubProcessAdd">추가</button>
								</li>
                            </ul> -->
                        </div>
						<div class="btn_guide">
							<button type="button" class="btn_style02 btn_white btnProcessAdd">대분류 추가</button>
							<button type="button" class="btn_style02 btn_white btnProcessDelete">삭제</button>
						</div>
						<!-- e :btn_guide -->
					</div>
					<!-- e :tree_guide -->
					<input type="hidden" id="i" value=2 />
                    <div>
                        <h5>분류정보</h5>
                        <div class="btn_guide ar mt-40 mb10">
							<button type="button" class="btn_style02 btn_blue" id="btnSave">저장</button>
						</div>
						<div class="bbs_list">
							<table class="table_l">
							  <caption>분류명(필수), 상위 분류명, 일정표시, 사용설정을 나타내는 분류정보</caption>
							  <tbody>
								<tr>
								  <th scope="row">분류명(필수) *</th>
								  <td>
									<input type="text" id="processName" placeholder="분류명을 입력하세요.">
								  </td>
								</tr>
								<tr>
								  <th scope="row">상위 분류명</th>
								  <td id="processParentName"></td>
								</tr>
								<tr>
								  <th scope="row">일정표시 *</th>
								  <td>
									<label><input type="radio" name="scheduleDisplay" id="mainSchedule" value="1"> 주요일정</label>
									&nbsp;&nbsp;&nbsp;
									<label><input type="radio" name="scheduleDisplay" id="detailSchedule" value="2"> 세부일정</label>
									&nbsp;&nbsp;&nbsp;
									<label><input type="radio" name="scheduleDisplay" id="displayNone" value="3"> 표시안함</label>
								  </td>
								</tr>
								<tr>
								  <th scope="row">사용설정 *</th>
								  <td>
									<label><input type="radio" name="useDiv" id="use" value="1"> 사용</label>
									&nbsp;&nbsp;&nbsp;
									<label><input type="radio" name="useDiv" id="unUse" value="0"> 미사용</label>
  								  </td>
								</tr>
							  </tbody>
							</table>
						</div>
						
						<form id="checkListForm">
							<input type="hidden" id="dataPcCode" name="dataPcCode">
							<input type="hidden" id="dataPcName" name="dataPcName">
							<input type="hidden" id="dataOrderBy" name="dataOrderBy">
						</form>
						
						<h5>Check List</h5>
						<div class="btn_guide ar mt-40 mb10">
							<button type="button" class="btn_style02 btn_gray" id="btnCheckListDelete">항목 삭제</button>
							<button type="button" class="btn_style02 btn_blue" id="btnCheckListAdd">항목 추가</button>
						</div>
						<!-- e :btn_guide -->
						<div class="bbs_list">
							<table>
							  <caption>항목명, 사용유무 정보를 제공하는 Check List</caption>
							  <colgroup>
								<col width="20%">
			                    <col width="50%">  
			                    <col width="30%">
		                      </colgroup>
							  <thead>
								<tr>
								  <th scope="col"><input type="checkbox" id="chkAll"></th>
								  <th scope="col">항목명</th>
								  <th scope="col">사용유무</th>
								</tr>
							  </thead>
							  <tbody id="processCheckList">
							  	
								<!-- <tr>
								  <td><input type="checkbox" name="checkField"></td>
								  <td class="text_l">통합공고 대비 사업 특성 정리</td>
								  <td><input type="radio"> 사용   <input type="radio"> 미사용</td>
								</tr>
								<tr>
								  <td><input type="checkbox" name="checkField"></td>
								  <td class="text_l">내역사업분류관리 추가 요청 확인</td>
								  <td><input type="radio"> 사용   <input type="radio"> 미사용</td>
								</tr>
								<tr>
								  <td><input type="checkbox" name="checkField"></td>
								  <td class="text_l">통합공고 대비 사업 특성 정리</td>
								  <td><input type="radio"> 사용   <input type="radio"> 미사용</td>
								</tr>
								<tr>
								  <td><input type="checkbox" name="checkField"></td>
								  <td class="text_l">통합공고 대비 사업 특성 정리</td>
								  <td><input type="radio"> 사용   <input type="radio"> 미사용</td>
								</tr>
								<tr>
								  <td><input type="checkbox" name="checkField"></td>
								  <td class="text_l">사업분류 추가</td>
								  <td><input type="radio"> 사용   <input type="radio"> 미사용</td>
								</tr>
								<tr>
								  <td><input type="checkbox" name="checkField"></td>
								  <td class="text_l">사업별 특성관리 설정</td>
								  <td><input type="radio"> 사용   <input type="radio"> 미사용</td>
								</tr> -->
							  </tbody>
							</table>
						</div>
                    </div>
					<!-- e :right -->
					
				</div>
				<!-- e :content_col2 -->
				
				
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
	var pcCode = "" ;
	var pcName = "" ;
	
	// 대분류 추가 버튼
	$(".btnProcessAdd").click(function() {
		pcCode = "";
		$('#createMode').val("main");
		$('.subRow').filter(function(index, row) { 
			$(row).attr('style', 'cursor:pointer;');
		});
		
		$('.createSubRow').removeAttr('style');
		
		$("#processName").val("");
		$("#processParentName").html("");
		$('input[name="scheduleDisplay"][value="1"]').prop('checked', true);
		$('input[name="useDiv"][value="1"]').prop('checked', true);
		
		$('.rowCheckList').remove();
		
		if ($('.rowCheckList').length == 0 ) {
			if ($(".noCheckList").length == 0) {
				$('#processCheckList').append($('<tr class="noCheckList"><td colspan="3">체크리스트가 없습니다.</td></tr>'));	
			}
		}
		
		if ($('#createProcessName').length != 0) {
			$('.createRow').css('background-color', 'rgb(230, 251, 245)');
			$("#createProcessName").focus();
			return false;
		}
		$("#processList").append('<li><span class="off createRow"><input type="text" id="createProcessName"  placeholder="대분류 입력"></span></li>');
		$('.createRow').css('background-color', 'rgb(230, 251, 245)');
		$("#createProcessName").focus();
		
		$("#createProcessName").keyup(function() {
			$("#processName").val($(this).val());
		});
		// 스크롤 하단으로 이동
		$(".scroll").mCustomScrollbar("scrollTo","bottom",{
			scrollEasing:"easeOut"
		});
	});
	
	$(document).on('click', '#createProcessName', function() {
		pcCode = "";
		$('#createMode').val("main");
		$('.subRow').filter(function(index, row) { 
			$(row).attr('style', 'cursor:pointer;');
		});
		
		$('.createSubRow').removeAttr('style');
		
		$("#processName").val("");
		$("#processParentName").html("");
		$('input[name="scheduleDisplay"][value="1"]').prop('checked', true);
		$('input[name="useDiv"][value="1"]').prop('checked', true);
		
		$('.rowCheckList').remove();
		$('.createRow').css('background-color', 'rgb(230, 251, 245)'); 
		
	});
	
	// 하위 프로세스 등록 버튼
	$(document).on('click', '.btnSubProcessAdd', function() {
		pcCode = "";
		$('#createMode').val("sub");
		var index = $(this).parent().index();
		
		$('.subRow').filter(function(index, row) { 
			$(row).attr('style', 'cursor:pointer;');
		});
		
		$('.createRow').removeAttr('style');
		$('.createSubRow').removeAttr('style');
		
		$("#processName").val("");
		$("#processParentName").html($(this).prev().data('pc_name'));
		$("#createPcPCode").val($(this).prev().data('pc_code'));
		$('input[name="scheduleDisplay"][value="2"]').prop('checked', true);
		$('input[name="useDiv"][value="1"]').prop('checked', true);
		
		$('.rowCheckList').remove();
		
		if ($('.rowCheckList').length == 0 ) {
			if ($(".noCheckList").length == 0) {
				$('#processCheckList').append($('<tr class="noCheckList"><td colspan="3">체크리스트가 없습니다.</td></tr>'));	
			}
		}
		
		if ($("#processList > li").eq(index).find("input").length == 0 ) {
			if ($("#processList > li").eq(index).find("ul").length < 1) {
				$("#processList > li").eq(index).find("span").removeClass("off");
				$("#processList > li").eq(index).find("span").addClass("on");
				$("#processList > li").eq(index).append("<ul></ul>");
			} 

			$("#processList > li").eq(index).find("ul").css("display","");
			$("#processList > li").eq(index).find("ul").append(' <li><span class="createSubRow"><input type="text" class="subProcessName" id="subProcessName"  placeholder="하위분류 입력"></span></li>');
			$(".createSubRow").removeAttr('style');
			$("#processList > li").eq(index).find(".createSubRow").css('background-color', 'rgb(230, 251, 245)'); 
			$("#processList > li").eq(index).find("#subProcessName").focus();
			
		} else {
			$("#processList > li").eq(index).find("ul").css("display","");
			$("#processList > li").eq(index).find(".createSubRow").css('background-color', 'rgb(230, 251, 245)'); 
			$("#processList > li").eq(index).find("#subProcessName").focus();
		}
		
	});
	
	$(document).on('keyup', '.subProcessName', function() {
		$("#processName").val($(this).val());
	})
	
	$(document).on('click', '.subProcessName', function() {
		pcCode = "";
		$('#createMode').val("sub");
		
		$('.subRow').filter(function(index, row) { 
			$(row).attr('style', 'cursor:pointer;');
		});
		
		$(".createRow").removeAttr('style');
		$(".createSubRow").removeAttr('style');
		
		$("#processName").val("");
		$("#processParentName").html($(this).parents('ul').prev().prev().data('pc_name'));
		
		$("#createPcPCode").val($(this).parents('ul').prev().prev().data('pc_code'));
		
		$('input[name="scheduleDisplay"][value="2"]').prop('checked', true);
		$('input[name="useDiv"][value="1"]').prop('checked', true);
		
		$('.rowCheckList').remove();
		
		$(this).parent().css('background-color', 'rgb(230, 251, 245)'); 
	});
	
	
	// 프로세스 삭제버튼
	$(".btnProcessDelete").click(function() {
		if (pcCode == "") {
			alert("프로세스를 선택해주세요.");
			return false;
		} else {
			console.log(pcName);
			if (confirm("선택하신 " + pcName + " 프로세스를 삭제하시겠습니까?")) {
				$.post('/empo/process/eMAU00D02ProcessCategoryDelete.do', { "pcCode" : pcCode }).done(function(res) {
					console.log(res.list)
					$('.subRow').filter(function(index, row) {
						if ( $(row).data('pc_code') == res.list.pcCode ) {
							if ($(row).hasClass('sub')) {
								var em = $(row).parent().parent().parent().find('em');
								var dataLength = em.data('sub_length') - 1;
								em.html(dataLength);
								em.data('sub_length', dataLength);
							} 
							$(row).parent().remove();
						}
					});
				}).fail(function() {
					alert("실패");
				})
			}			
		}
		
	});
	
	// 분류이동편집 버튼
	$(".btnProcessMoveEdit").click(function() {
		fnPopupOpen("/empo/process/eMAU00D05ProcessEditPage.do", "");	// ../js/popup.js 참고 
		
	});
	
	// Check List 항목추가 버튼
	$("#btnCheckListAdd").click(function() {
		if (pcCode == "") {
			alert("프로세스를 선택해주세요.");
			return false;
		} else {
			$("#dataOrderBy").val($('.rowCheckList').length + 1);
			fnPopupOpen("/empo/process/eMAU00D02CheckListPopup.do", "#checkListForm");	// ../js/popup.js 참고	
		}
		
	});
	
	// Check List 체크박스 전체선택/해제
	$("#chkAll").click(function() {
		if ($("#chkAll").is(":checked")) {
			$("input:checkbox[name='checkField']").each(function() {
				this.checked = true;
			});
		} else {
			$("input:checkbox[name='checkField']").each(function() {
				this.checked = false;
			});
		}
	});
	
	$(document).on('click', 'input[name="checkField"]', function() {
		if ( $(this).is(':checked') != true) {
			$("#chkAll").prop('checked', false);
		}
	});
	
	// Check List 삭제 버튼
	var checkListDelete = function() {
		var valueArr = new Array();
		if ($("input[name=checkField]:checkbox:checked").length == 0) {
			alert("삭제할 항목을 선택하세요.");
			return false;
		} else {
			if (confirm("선택하신 항목을 삭제하시겠습니까?")) {
				console.log(pcCode);
				var check = $("input[name='checkField']").filter(function() {
					if($(this).is(':checked') == true) {
						var clPk = $(this).parents('tr').data('cl_pk');
						valueArr.push(clPk);
					}
				});
				
				$.post('/empo/process/eMAU00D02CheckListDelete.do', { "clPk" : valueArr }).done(function() { 
					alert("삭제되었습니다.");
					$("#chkAll").prop('checked', false);
					
					var check = $("input[name='checkField']").filter(function() {
						if ($(this).is(':checked') == true) {
							$(this).parents('tr').remove();
						}
						
						if ($('.rowCheckList').length == 0 ) {
							$('#processCheckList').append($('<tr class="noCheckList"><td colspan="3">체크리스트가 없습니다.</td></tr>'));
						}
					});
				}).fail(function() {
					alert("실패")
				})
			} else {
				return false;
			}
		}	
	}
	
	var checkListView = function(row) {
		var data =
			'<tr class="rowCheckList" data-cl_pk=' + row.clPk + '>' +
			'	<td><input type="checkbox" name="checkField"></td>' +
			'	<td class="text_l">' + row.clTitle + '</td>' +
			'	<td class="radioTD"><input type="radio" name="checkListUse' + row.clPk + '" value="1"> 사용   <input type="radio" name="checkListUse' + row.clPk + '" value="0"> 미사용</td>' +
			'</tr>' ;
			
		return $(data);
	}
	
	var select = function() {
		// 프로세스 삭제를 위한 선택 (클릭)
		$("#processList").find("li > span").css("background-color", "");
		$(this).css("background-color", "#e6fbf5");
		
		$('#createMode').val("select");
		pcCode = $(this).data('pc_code');
		pcName = $(this).data('pc_name');
		if($('.createRow').length == 1) {
			$('.createRow').removeAttr('style'); 
			$(this).css('background-color', 'rgb(230, 251, 245)'); 
		}
		$.post('/empo/process/eMAU00D02ProcessDetail.do', { 'pcCode' : pcCode }).done(function(res) {
			$("#dataPcCode").val(pcCode);
			$("#dataPcName").val(res.list.pcName);
			
			$('#processName').val(res.list.pcName);
			$('#processParentName').html(res.list.pcNameP);
			$('input[name="scheduleDisplay"]').filter(function(index, row) {
				if(res.list.pcScheduleCode == $(row).val()) {
					$(row).prop('checked', true);
				}
			});
			
			$('input[name="useDiv"]').filter(function(index, row) {
				if(res.list.pcUse == $(row).val()) {
					$(row).prop('checked', true);
				}
			});
			
			$.post('/empo/process/eMAU00D02ProcessCheckList.do',  { 'pcCode' : pcCode }).done(function(res) { 
				$('.rowCheckList').remove();
				$('.noCheckList').remove();
				
				if ( $('#chkAll').prop('checked') ) {
					$('#chkAll').prop('checked', false);
				}
				
				var clUseList = [];
				if(res.list.length == 0 ) {
					$('#processCheckList').append($('<tr class="noCheckList"><td colspan="3">체크리스트가 없습니다.</td></tr>'));
				} else {
					res.list.forEach(function(row, index) {
						clUseList.push(row.clUse)
						console.log(clUseList)
						$('#processCheckList').append(checkListView(row));
					});
				}
				
				$('.rowCheckList').filter(function (index, row) {
					var checkListUse = $(row).find('input[type="radio"]')
					var clUse = clUseList[index]
					checkListUse.filter(function(index, row) {
						if(clUse == $(row).val()) {
							$(row).prop('checked', true);
						} 
					});
				});
			})
		}).fail(function() {
			alert("실패")
		});
	}
	
	var save = function() {
		var paramArr = new Array;
		var processName = $('#processName').val();
		var pcScheduleCode = $('input[name="scheduleDisplay"]:checked').val();
		var pcUse = $('input[name="useDiv"]:checked').val();
		
		console.log($("#createMode").val())
		
		if( $("#createMode").val() == "main") {
			if ( processName == "" ) {
				alert("분류명을 입력하세요.");
				return false;
			}
			
			var data = {
					"pcName" : processName
					, "pcScheduleCode" : pcScheduleCode
					, "pcUse" : pcUse
					, "pcPCode" : 0
				}
			console.log(data);
			
			$.post('/empo/process/eMAU00D02ProcessCategorySave.do', data).done(function(res) {
				alert("저장되었습니다.");
				console.log(res.list);
				$('#createProcessName').parents('li').remove();
				$('#processList').append(processListView(res.list));
				$("#processList").find("li > span").css("cursor","pointer");
				$("#createMode").val("");
				
				pcCode = "" ;
			}).fail(function() {
				alert("실패");
			});
			
		} else if ( $("#createMode").val() == "sub" ) {
			if ( processName == "" ) {
				alert("분류명을 입력하세요.");
				return false;
			}
			
			var data = {
					"pcName" : processName
					, "pcScheduleCode" : pcScheduleCode
					, "pcUse" : pcUse
					, "pcPCode" : $("#createPcPCode").val()
				}
			console.log(data);
			
			$.post('/empo/process/eMAU00D02ProcessCategorySave.do', data).done(function(res) {
				console.log(res.list);
				$('.subProcessName').filter(function(index, row) { 
					if ( $(row).parent().attr('style') == "background-color: rgb(230, 251, 245);" ) {
						alert("저장되었습니다.");
						var em = $(row).parent().parent().parent().parent().find('em')
						$(row).parent().parent().parent().append(processListView(res.list));
						var dataLength = em.data('sub_length') + 1;
						em.html(dataLength);
						em.data('sub_length', dataLength);
						$(row).parent().parent().remove();
						
						$("#processList").find("li > span").css("cursor","pointer");
						$("#createMode").val("");
						
						pcCode = "" ;
					}
				});
			}).fail(function() {
				alert("실패");
			});
			
		} else {
			var data = {
					"pcCode" : pcCode
					, "pcName" : processName
					, "pcScheduleCode" : pcScheduleCode
					, "pcUse" : pcUse
				}
			paramArr.push(data);
			
			if (pcCode == "") {
				alert("프로세스를 선택해주세요.");
				return false;
			} else {
				if ( $('.rowCheckList').length > 0 ) {
					var attrNameArr = [];
					
					$('.rowCheckList').filter(function(index, row) {
						var attrName = $(row).find('input[type="radio"]').attr('name');
						attrNameArr.push(attrName);
					});
					
					console.log(attrNameArr);
					
					attrNameArr.forEach(function(row, index) {
						$('input[name="' + row + '"]').parents('tr').data('clUse', $('input[name="' + row + '"]:checked').val());
						var data = $('input[name="' + row + '"]').parents('tr').data();
						paramArr.push(data);
					});
					console.log(paramArr);
				} 
			}
			
			console.log(paramArr);
			$.ajax({
				url : '/empo/process/eMAU00D02ProcessSave.do'
				, type : 'post'
				, data : JSON.stringify(paramArr)
				, contentType : "application/json; charset=utf-8"
			}).done(function(res) {
				alert("저장되었습니다.");
				$('.subRow').filter(function(index, row) {
					if ( $(row).data('pc_code') == res.list.pcCode ) {
						if ($(row).hasClass('sub')) {
							$(row).html(res.list.pcName);
						} else {
							var emHtml = $(row).find('em').html();
							$(row).html(res.list.pcName + '<em data-sub_length=' + emHtml + ' >' + emHtml);
						}
					}
				});
			}).fail(function() {
				alert("실패");
			});
		}
	}
	
	$(function() {
		$(document).on('click', '.subRow', select);
		$("#btnCheckListDelete").click( checkListDelete );
		$("#btnSave").click( save );
		
		initList();
	});
	
	var processListView = function(row) {
		var data ;
		if (row.subLength == undefined) {
			row.subLength = 0;	
		}
		
		if (row.pcPCode == 0) {
			data = '<li><span class="off subRow" data-pc_code=' + row.pcCode + ' data-pc_name=' + row.pcName + '>' + row.pcName + ' <em data-sub_length=' + row.subLength + ' >' + row.subLength + '</em></span><button type="button" class="plus btnSubProcessAdd">추가</button>' ;	
		} else {
			data = '<li><span class="subRow sub" data-pc_code=' + row.pcCode + ' data-pc_name=' + row.pcName + '>' + row.pcName + '</span></li>'
		}
		
		/* if (row.pcPCode == 0 && row.subs.length == 0) {
			data = '<li><span class="off subRow" data-pc_code=' + row.pcCode + ' data-pc_name=' + row.pcName + '>' + row.pcName + ' <em data-sub_length=' + row.subLength + ' >' + row.subLength + '</em></span><button type="button" class="plus btnSubProcessAdd">추가</button><ul style="display: none;"></ul>' ;	
		}  */
			
		return $(data);
	}
	
	var getTree = function(process) {
		process.forEach(function(row, index) {
			console.log(row)
			row.subs = [];
		    if (row.pcPCode != "0") {
		    	console.log(index);
		    	process.forEach(function(obj) {
		    		if (obj.pcCode == row.pcPCode) {
		    			parentRow = obj;
		    			parentRow.subs.push(row);
		    		}
		    	});
		    	//var parentRow = process.find(obj => obj.pcCode == row.pcPCode);
		    	console.log(parentRow);
		    	//parentRow.subs.push(row);
		    }
		});
		parentProcess = [];
		process.filter(function(row, index) {
			if (row.pcPCode == 0) {
				parentProcess.push(row);
			}
		});
		//console.log(parentProcess);
		return parentProcess;
		//return process.filter(obj => obj.pcPCode == '0');
	}
	
	var addSubs = function(parentDiv, subs) {
		var ul = $("<ul>");
		if( parentDiv.hasClass('processTree') ) {
            ul.attr('id', 'processList');
        }
		
		subs.forEach( function(row) {
			if (row.pcPCode != 0) {
				ul.css('display', 'none');
			}
			if(row.subs.length > 0) {
				row.subLength = row.subs.length;	
			}
			
            var li = processListView(row);
            ul.append(li);
            if ( row.subs.length > 0 ) {
                addSubs( li, row.subs );
            }
        });
		
		parentDiv.append(ul);
	}
	
	var initList = function() {
		$(".mCS_no_scrollbar_y").addClass('processTree');
		
		$.post('/empo/process/eMAU00D02ProcessList.do').done(function(res) {
			var subs = getTree(res.list);
			addSubs( $('.processTree'), subs );
			
			$("#processList > li > span").click(function() {
				var index = $(this).parent().index();

				if ($("#processList > li").eq(index).find("ul").css("display") == "none") {
					$("#processList > li").eq(index).find("ul").css("display","");
					
					$(this).removeClass("off");
					$(this).addClass("on");
				} 
				else {
					$("#processList > li").eq(index).find("ul").css("display","none");

					$(this).removeClass("on");
					$(this).addClass("off");
				}
				
			});
			
			$("#processList").find("li > span").css("cursor","pointer");
			
		}).fail(function() {
			
		});
		
	}
})();
</script>
</html>
