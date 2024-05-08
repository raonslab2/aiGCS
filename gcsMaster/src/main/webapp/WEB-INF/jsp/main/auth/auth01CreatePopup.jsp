<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<%
	// 권한 모드 (추가:insert, 수정:edit);
	String dataPageName = request.getParameter("dataPageName");
	String authMode = request.getParameter("authMode");
	String dataMbCode = request.getParameter("dataMbCode");
	String dataMbName = request.getParameter("dataMbName");
	String dataGrmName = request.getParameter("dataGrmName");
	String dataPjCode = request.getParameter("dataPjCode");
	String dataPjTitle = request.getParameter("dataPjTitle");
	String dataAuCode = request.getParameter("dataAuCode");
	String dataPjAuId = request.getParameter("dataPjAuId");
	String dataPjYear = request.getParameter("dataPjYear");
%>

<!-- 사업 권한관리 -->
<div class="popup_guide popup_w500">	
	<h3>
		사업 권한관리
	</h3>

	<% if ("edit".equals(authMode)) { %>
	<!-- 권한수정 모드일 경우 '권한삭제' 버튼 출력 -->
	<div class="popup_top_btn">
		<button type="button" class="btn_style01 btn_red" id="btnAuthDelete">권한삭제</button>
	</div>
	<% } %>
	
	<div class="popup_content">
		
		<form name="popupDeleteForm" id="popupDeleteForm">
			<input type="hidden" name="pjAuId" value="<%=dataPjAuId %>" />
		</form>
		
		<form name="popupCreateForm" id="popupCreateForm">
			<input type="hidden" name="pjAuId" id="createPjAuId" <% if (dataPjAuId.equals("")) { %> value=0 <% } else { %> value="<%=dataPjAuId %>" <% } %> />
			<input type="hidden" name="mbCode" id="createMbCode" value="<%=dataMbCode %>" />
			<input type="hidden" name="auCode" id="createAuCode" /> 
			<input type="hidden" name="pjYear" id="createPjYear" value="<%=dataPjYear %>" />
			<input type="hidden" name="pjCode" id="createPjCode" value="<%=dataPjCode %>" /> 
		</form>
		
		<input type="hidden" id="pageName" value="<%=dataPageName %>">
		<div class="bbs_write01">
			<ul>
				<li class="searchList">
					<span>사업명</span>
					<% if (dataPjTitle.equals("")) { %>
					<select id="year">
					</select>
					<span class="search_box03 input_w70">
						<input type="text" id="searchField" placeholder="사업명 입력">
						<button type="button" id="projectSearch" class="btn_search01">검색</button>
					</span>
					<% } else { %>
						<%=dataPjTitle%>
					<% } %>
				</li>
				
				<li>
					<span>사업부서</span>
					<% if (dataGrmName.equals("")) { %>
						<select id="groupPart3" name="groupPart3" class="input_w26">
							<option value="">전체</option>
						</select>
						
						<select id="groupPart3" name="groupPart4" class="input_w26">
							<option value="">전체</option>
						</select>

						
					<% } else { %>
						<%=dataGrmName%>
					<% } %>
				</li>
				
				<li class="searchManager">
					<span>이름</span>
					<% if (dataMbName.equals("")) { %>
						<!-- 담당자명 검색 -->
						<span class="search_box03 input_w40">
							<input type="text" id="searchManager" placeholder="담당자명">
							<button type="button" id="managerSearch" class="btn_search01">검색</button>
						</span>
					<% } else { %>
						<%=dataMbName%>
					<% } %>
				</li>
				
				<li><span>권한</span>
					  <ul class="data_list02">
						  <li><label><input type="radio" name="auth" value="CODE00001" <% if ("CODE00001".equals(dataAuCode)) { %> checked <% } %> > 시스템 관리</label></li>
						  <li><label><input type="radio" name="auth" value="CODE00002" <% if ("CODE00002".equals(dataAuCode)) { %> checked <% } %> > 사업관리</label></li>
						  <li><label><input type="radio" name="auth" value="CODE00003" <% if ("CODE00003".equals(dataAuCode)) { %> checked <% } %> > 담당간사</label></li>
						  <li><label><input type="radio" name="auth" value="CODE00004" <% if ("CODE00004".equals(dataAuCode)) { %> checked <% } %> > 실무자</label></li>
						  <li><label><input type="radio" name="auth" value="CODE00010" <% if ("CODE00010".equals(dataAuCode)) { %> checked <% } %> > 일반</label></li>
					  </ul>
				</li>
			</ul>
			
			<div class="btn_guide ac mt20">
				<button type="button" class="btn_style05 btn_gray" id="btnAuthCancel">취소</button>
				<button type="button" class="btn_style05 btn_red" id="btnAuthConfirm">확인</button>
			</div>
			<!-- e :btn_guide -->
		
		</div>
		<!-- e :bbs_write01 -->
		
	</div>
	<!-- e :popup_content -->

</div>
<script>
;(function() {
	// 사업명 자동완성 기능
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
	
	$('#groupPart3').change(function() {
		var el = $(this);
		var data = el.val();
		var id = el.attr('id');
		
		if (id == 'groupPart3') {
			$('#groupPart4').children('option:not(:first)').remove();
			
			$.get( '/empo/auth/eMAU00F01SearchSubOption.do', { "grpCode" : data } ).done(function(res) {
				res.list.forEach( function(row, index) {
					var option = $('<option value="'+ row.grmCode +'">'+ row.grmName +'</option>');
					$('#groupPart4').append(option);
				})
			}).fail(function() {
				alert("실패")
			});
		}
		
	});
	
	$('#managerSearch').click(function() {
		var mbCode = "";
		
		var groupPart3 = $('#groupPart3 option:selected').val();
		var groupPart4 = $('#groupPart4 option:selected').val();
		var searchManager = $('#searchManager').val();
		
		var data = {
			"groupPart1" : groupPart3
			, "groupPart2" : groupPart4
			, "searchName" : searchManager
		}
		
		$.post('/empo/auth/eMAU00F01managerSearch.do', data).done(function(res) {
			$('.managerSelect').remove();
			res.list.forEach(function(row, index) {
				console.log(row)
				if (mbCode == row.mbCode) {
					return ;
				} else {
					$('.searchManager').append($('<span style="cursor:pointer;" class="managerSelect" data-mb_code=' + row.mbCode + '>' + row.mbName + '</span>'));	
				}
				mbCode = row.mbCode;	
			});
			
		}).fail(function() {
			alert("실패");
		});
		
	});
	
	$(document).on('click', '.managerSelect', function() {
		if ($('.managerSelect').hasClass('selected')) {
			$('.managerSelect').removeClass('selected');
		} 
		
		$('.managerSelect').removeAttr('style');
		$('.managerSelect').css('cursor', 'pointer');
		$(this).css('color', 'red');
		$(this).addClass('selected');
		
		var selectData = $(this).data();
		$('#createMbCode').val(selectData.mb_code);
		console.log($('#createMbCode').val());
	});
	
	$("#btnAuthCancel").click(function() {
		fnPopupClose();
	});
	
	var authListView1 = function(row) {
		console.log(row)
		var data = 
			"<table class='table_l mb10 rowList'>" +
			"	<colgroup>" + 
			"		<col width='5%'>" + 
			"		<col width='25%'>" +
			"		<col width=''>" +
			"	</colgroup>" + 
			"	<tbody>" +
			"		<tr>" +
			"			<th scope='row' rowspan='2' class='ac'>" +
			"				<input type='checkbox' name='checkField' data-pj_year='" + row.pjYear + "'data-pj_au_id='" + row.pjAuId + "' data-pj_code='" + row.pjCode + "' data-pj_title='" + row.pjTitle + "' data-au_code='" + row.auCode + "'></th>" +
			"			<th scope='row'>사업명 *</th>" +
			"				<td class='pjTitle'>" + row.pjTitle + "</td>" +
			"		</tr>" +
			"		<tr>" +
			"			<th scope='row' class='th_line'>권한*</th>" +
			"				<td class='auName'>" + row.auName + "</td>" +
			"		</tr>" +
			"	</tbody>" +
			"</table>" ;
			
		return $(data);
	}
	
	var authListView2 = function(row) {
		var data = 
			'<tr class="rowList">' +
			'	<td><input type="checkbox" name="checkField" data-pj_au_id=' + row.pjAuId + ' data-gr_m_name=' + row.grmName + ' data-mb_name=' + row.mbName + ' data-mb_code=' + row.mbCode + ' data-au_code=' + row.auCode + '></td>' +
			'	<td class="grmName">' + row.grmName + '</td>' +
			'	<td class="mbName">' + row.mbName + '</td>' +
			'	<td class="mbRankName">' + row.mbRankName + '</td>' +
			'	<td class="smtechId">' + row.smtechId + '</td>' +
			'	<td class="auName">' + row.auName + '</td>' +
			'</tr>' ;
			
		return $(data);
	}
	
	$('#projectSearch').click(function() {
		
		var pjYear = $('#year option:selected').val();
		var pjTitle = $('#searchField').val();
		
		var data = {
			"pjYear" : pjYear
			, "pjTitle" : pjTitle
		}
		
		$.post('/empo/auth/eMAU00F01SearchProject.do', data).done(function(res) {
			$('.pjSelect').remove();
			res.list.forEach(function(row, index) {
				$('.searchList').append($('<span style="cursor:pointer;" class="pjSelect" data-pj_code="' + row.pjCode + '" data-pj_year=' + row.pjYear + '>' + row.pjTitle + '</span>'))
			});
			
		}).fail(function() {
			alert("실패");
		});
	});
	
	$(document).on('click', '.pjSelect', function() {
		if ($('.pjSelect').hasClass('selected')) {
			$('.pjSelect').removeClass('selected');
		} 
		
		$('.pjSelect').removeAttr('style');
		$('.pjSelect').css('cursor', 'pointer');
		$(this).css('color', 'red');
		$(this).addClass('selected');
		
		var selectData = $(this).data();
		$('#createPjYear').val(selectData.pj_year);
		$('#createPjCode').val(selectData.pj_code);
	});
	
	$('#btnAuthConfirm').click(function() {
		if (confirm("사업 권한관리를 저장하시겠습니까?")) {
			var radioVal = $('input[name="auth"]:checked').val();
			$('#createAuCode').val(radioVal);
			var formSer = $('#popupCreateForm').serialize();
			var mbCode = $('#createMbCode').val();
			var pjCode = $('#createPjCode').val();
			
			if ($('#searchField').length == 1) {
				if ( ! $('.pjSelect').hasClass('selected')) {
					alert("사업을 선택하세요.");
					return false;
				} 
			}
			
			if($('#searchManager').length == 1) {
				if ( ! $('.managerSelect').hasClass('selected')) {
					alert("담당자를 선택하세요.");
					return false;
				} 
			}
			
			if(! $('input[name="auth"]').is(':checked')) {
				alert("권한을 체크해주세요.");
				return false;
			}
			
			
			$.post('/empo/auth/eMAU00F01AuthInsert.do', formSer).done(function(res) {
				
				if($('#pageName').val() == "manager") {
					var checkRow = $('.rowList').find('input[name="checkField"]:checked');
					if ( checkRow.length == 0 ) {
						$('#authResultList').append(authListView1(res.list));
						
						if($('.rowList').length == 1) {
							$('#resultList').children().filter(function(index, row) {
								if ( $(row).data('mbcode') == mbCode ) {
									$(row).find('.insert').remove();
									$(row).append($("<td class='rowTD isButton'><button type='button' class='btn_style03 btn_white'>관리</button></td>"));
								}
							});
						} 
					} else {
						checkRow.data('au_code', res.list.auCode);
						checkRow.parents('tbody').find('.auName').html(res.list.auName);
					}
					
					$('input[name="checkField"]').filter(function(index, row) {
				    	$(row).prop('checked', false);
				    });
					
					fnPopupClose();
				} else {
					var checkRow = $('.rowList').find('input[name="checkField"]:checked');
					console.log(res.list);
					
					if ( checkRow.length == 0 ) { 
						if ($("#noData").length > 0 ) {
							$("#noData").parent().remove();
						}
						
						$('#authResultList').append(authListView2(res.list));
						
						if($('.rowList').length == 1) { 
							$('.authBusList').filter(function(index, row) { 
								if ($(row).data('pj_code') == pjCode) {
									$(row).find('.createPopup').parent('td').remove();
									$(row).append($('<td class="subRow" style="background-color : rgb(230, 251, 245);"><button type="button" class="btn_style03 btn_white isData">관리</button></td>'));
									$(".authBusList > td").css("cursor","pointer");
								}
							});
						}
					} else {
						checkRow.data('au_code', res.list.auCode);
						checkRow.parents('tr').find('.auName').html(res.list.auName);
					}
					
					$('input[name="checkField"]').filter(function(index, row) {
				    	$(row).prop('checked', false);
				    });
					fnPopupClose();
				}
				
				
				
			}).fail(function() {
				alert("실패");
			});
			
			
		} else {
			return false;	
		}
		
	});

		
	$("#btnAuthDelete").click(function() {
		var formSer = $('#popupDeleteForm').serialize();
		var mbCode = $('#createMbCode').val();
		var pjCode = $('#createPjCode').val();
		
		if (confirm("권한을 삭제하시겠습니까?")) {
			$.post('/empo/auth/eMAU00F01AuthDelete.do', formSer).done(function(res) {
				var checkRow = $('.rowList').find('input[name="checkField"]:checked');
				if ( checkRow.length == 0 ) {
					
				} else {
					checkRow.parents('.rowList').remove();
					if ( $('.rowList').length == 0 ) {
						if( $('#pageName').val() == "manager" ) {
							$('#resultList').children().filter(function(index, row) {
								if ( $(row).data('mbcode') == mbCode ) {
									$(row).find('.isButton').remove();
									$(row).append($("<td class='insert'><button type='button' class='btn_style03 btn_red createPopup' >등록</button></td>"));
								}
							});
						} else {
							$('#authResultList').append($('<tr><td id="noData" colspan="6">설정된 권한이 없습니다.</td></tr>'));
							$('.authBusList').filter(function(index, row) { 
								if ($(row).data('pj_code') == pjCode) {
									$(row).find('.isData').parent('td').remove();
									$(row).append($('<td style="background-color : rgb(230, 251, 245);"><button type="button" class="btn_style03 btn_red createPopup">등록</button></td>'));
									$(".authBusList > td").css("cursor","pointer");
								}
							});
						}
						
					}
				}
				
				fnPopupClose();	
			})
			
			return false;
		}
	});
	
	$(function() {
		console.log("1")
		
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
		
		//부서정보 호출
		$.post('/empo/auth/eMAU00F01SearchFirstOption.do').done(function(res) {
			res.list.forEach( function(row, index) {
				var option = $('<option value="'+ row.grmCode +'">'+ row.grmName +'</option>');
				$('#groupPart3').append(option);
			})
		}).fail(function() {
			alert("실패");
		});
		
	});
})();
	
</script>