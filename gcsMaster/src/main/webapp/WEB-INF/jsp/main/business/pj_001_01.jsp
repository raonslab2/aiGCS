<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<%
	// 권한 모드 (추가:insert, 수정:edit);
	String authMode = request.getParameter("authMode");
	String dataMbCode = request.getParameter("dataMbCode");
	String dataMbName = request.getParameter("dataMbName");
	String dataGrmName = request.getParameter("dataGrmName");
	String dataPjCode = request.getParameter("dataPjCode");
	String dataPjTitle = request.getParameter("dataPjTitle");
	String dataAuCode = request.getParameter("dataAuCode");
	String dataPjAuId = request.getParameter("dataPjAuId");
	String dataPjYear = request.getParameter("dataPjYear");
	String dataAuName = request.getParameter("dataAuName");
%>

<!-- 사업관리 -->
<div class="popup_guide popup_w500">	
	<h3>
		사업관리
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
		
		<input type="hidden" id="authMode" value="<%=authMode %>">
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
						<select id="groupPart1" name="groupPart1" class="input_w26">
							<option value="">전체</option>
						</select>
						
						<select id="groupPart2" name="groupPart2" class="input_w26">
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
	
	$('#groupPart1').change(function() {
		var el = $(this);
		var data = el.val();
		var id = el.attr('id');
		
		if (id == 'groupPart1') {
			$('#groupPart2').children('option:not(:first)').remove();
			
			$.get( '/empo/business/eMAU00E01SearchSubOption.do', { "grpCode" : data } ).done(function(res) {
				res.list.forEach( function(row, index) {
					var option = $('<option value="'+ row.grmCode +'">'+ row.grmName +'</option>');
					$('#groupPart2').append(option);
				})
			}).fail(function() {
				alert("실패")
			});
		}
		
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
	
	
	$('#managerSearch').click(function() {
		var mbCode = "";
		
		var groupPart1 = $('#groupPart1 option:selected').val();
		var groupPart2 = $('#groupPart2 option:selected').val();
		var searchManager = $('#searchManager').val();
		
		var data = {
			"groupPart1" : groupPart1
			, "groupPart2" : groupPart2
			, "searchName" : searchManager
		}
		
		$.post('/empo/business/eMAU00E01managerSearch.do', data).done(function(res) {
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
		})
		
	});
	
	$("#btnAuthCancel").click(function() {
		fnPopupClose();
	});
	
	var authListView = function(row) {
		console.log(row)
		var data = 
			"<ul class='data_list04' >" + 
			"<li>" +
			"<p><input type='checkbox' name='checkField' data-gr_m_name='"+ row.grSumName + "'data-mb_name='"+ row.mbName + "'data-mb_code='"+ row.mbCode + "'data-pj_year='"+ row.pjYear + "'data-pj_code='"+ row.pjCode + "'data-au_code='"+ row.auCode + "'data-pj_au_id='"+ row.pjAuId + "'data-au_name='"+ row.auName + "'>" + row.grSumName  + "<span> "+ row.writeTime + "</span></p>"
			+ row.mbName + "<span class='auName'>"+ row.auName +"</span>" 
		+"</li>" +"</ul>" ; 
		return $(data);
	}
	
		
	$('#btnAuthConfirm').click(function() {
		if (confirm("사업관리를 저장하시겠습니까?")) {
			var radioVal = $('input[name="auth"]:checked').val();
			$('#createAuCode').val(radioVal);
			var formSer = $('#popupCreateForm').serialize();
			var mbCode = $('#createMbCode').val();
			
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
			
			$.post('/empo/business/eMAU00E01AuthInsert.do', formSer).done(function(res) {
				var checkRow = $('.mCS_no_scrollbar_y').find('input[name="checkField"]:checked');
				console.log(res.list)
				if ( checkRow.length == 0 ) {
					$('.mCS_no_scrollbar_y').append(authListView(res.list));
					
					if($('.mCS_no_scrollbar_y').length == 1) {
						$('.mCS_no_scrollbar_y').children().filter(function(index, row) {
							if ( $(row).data('mbcode') == mbCode ) {
								$(row).find('.insert').remove();
								$(row).append($("<td class='rowTD isButton'><button type='button' class='btn_style03 btn_white'>관리</button></td>"));
							}
						});
					} 
				} else {
					console.log(res.list);
					checkRow.data('au_code', res.list.auCode);
					checkRow.parents('.data_list04').find('.auName').html(res.list.auName)
					
				}
				
				$('input[name="checkField"]').filter(function(index, row) {
			    	$(row).prop('checked', false);
			    });
				
				fnPopupClose();
				
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
		if (confirm("권한을 삭제하시겠습니까?")) {
			$.post('/empo/business/eMAU00E01AuthDelete.do', formSer).done(function(res) {
				var checkRow = $('.data_list04').find('input[name="checkField"]:checked');
				if ( checkRow.length == 0 ) {
					
				} else {
					checkRow.parents('.data_list04').remove();
					if ( $('.data_list04').length == 0 ) {
						$('#resultList').children().filter(function(index, row) {
							if ( $(row).data('mbcode') == mbCode ) {
							}
						});
					}
				}
				fnPopupClose();	
			})
			
			return false;
		}
	});
	
	$(function() {
		//부서정보 호출
		console.log("12");
		$.post('/empo/business/eMAU00E01SearchFirstOption.do').done(function(res) {
			res.list.forEach( function(row, index) {
				var option = $('<option value="'+ row.grmCode +'">'+ row.grmName +'</option>');
				$('#groupPart1').append(option)
			})
		}).fail(function() {
			alert("실패");
		});
		
	});
})();
	
</script>