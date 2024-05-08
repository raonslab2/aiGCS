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

<script src="../../js/jquery.timepicker.js"></script>

<%
	String dataGrmCode = request.getParameter("dataGrmCode");
	String dataGrmName = request.getParameter("dataGrmName");
%>

<!-- 업무요청 -->
<div class="popup_guide popup_w1000">
	<a href="javascript:void(0)" class="closebtn" onclick="fnPopupClose()">닫기</a>
	<h3>업무요청</h3>
	<input type="hidden" id="selectGrmCode" value="<%=dataGrmCode %>">
	<div class="popup_content">
		<div class=" content_col2 bg">
			<div>
				<ul>
					<li class="date_tit"><span>2021년 5월 10일 (월)</span></li>
					<li class="fc_red"><%=dataGrmName %></li>
					<li>
						<dl>
							<dt class="use_box">가능</dt>
			 			<!--<dd><input type="checkbox"> 홍길순 (대외협력기획실, 책임) ☎ 042-388-0235</dd>
							<dd><input type="checkbox"> 윤수    (대외협력기획실, 선임) ☎ 042-388-0231</dd>
							<dd><input type="checkbox"> 홍순희 (기술혁신사업실, 책임) ☎ 042-388-0233</dd>
							<dd><input type="checkbox"> 경하경 (기술혁신사업실, 주임) ☎ 042-388-0238</dd> -->
						</dl>
					</li>
					<li>
						<dl class="notuse_box1">
							<dt>응답대기</dt>
					<!--	<dd><input type="checkbox"> 홍길순 (대외협력기획실, 책임) ☎ 042-388-0235</dd>
							<dd><input type="checkbox"> 윤수    (대외협력기획실, 선임) ☎ 042-388-0231</dd>
							<dd><input type="checkbox"> 홍순희 (기술혁신사업실, 책임) ☎ 042-388-0233</dd>
							<dd><input type="checkbox"> 경하경 (기술혁신사업실, 주임) ☎ 042-388-0238</dd> -->
						</dl>
					</li>
					<li>
						<dl class="notuse_box">
							<dt>불가능</dt>
					<!--	<dd><input type="checkbox"> 홍길순 (대외협력기획실, 책임) ☎ 042-388-0235</dd>
							<dd><input type="checkbox"> 윤수    (대외협력기획실, 선임) ☎ 042-388-0231</dd>
							<dd><input type="checkbox"> 홍순희 (기술혁신사업실, 책임) ☎ 042-388-0233</dd>
							<dd><input type="checkbox"> 경하경 (기술혁신사업실, 주임) ☎ 042-388-0238</dd> -->
						</dl>
					</li>
				</ul>
			</div>
			<div class="bbs_write01">
				<ul>
					<li class="searchList"><span>사업명</span>
					<select name="pjYear" id="pjYear"></select>
					<span class="search_box03 input_w70">
						<input type="text" id="businessname" placeholder="세부 사업명을 입력하세요.">
						<button type="button" id="projectSearch" class="btn_search01">선택</button>
					</span>
					</li>
					<li><span>기간</span>
					<input type="text" class="inputCalendar input_w40" name="date1" id="date1">
					~
					<input type="text" class="inputCalendar input_w40" name="date2" id="date2">
					</li>
					<li><span>평가시작시간 / 평가 완료시간</span>
					<input type="text" class="input_w30 ac timepicker" value="" id="evaluationTime1">
					/
					<input type="text" class="input_w30 ac timepicker" value="" id="evaluationTime2">
					</li>
					<li><span>요청업무</span>
					<input type="text" class="input_w100" value="평가 담당간사 지원요청" id="gsTxt">
					</li>
				</ul>
				<div class="btn_guide ac mt20">
					<button type="button" class="btn_style05 btn_gray" id="btnPopCancel">취소</button>
					<button type="button" class="btn_style05 btn_red" id="btnPopRequest">업무요청</button>
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
	var loginMbCode = "";
	var loginMbName = "";
	var pjCode = "";
	var pjYear = "";
	var grmCode = "";
	var grpCode = "";
	var mbCode = "";
	
	// 달력 입력 datepicker 설정
	$('.inputCalendar').datepicker({
		dateFormat : 'yyyy.mm.dd'		// 날짜 형태 설정		
	});	
	
	// 시간입력 timepicker 설정
	$('.timepicker').timepicker({
		timeFormat: 'HH:mm', // 형식
		interval: 10, // 표현 단위 (분)
		minTime: '05',	// 시작시간
		maxTime: '23:50',	// 종료시간
		defaultTime: '',
		startTime: '05:00',	// 시작시간
		dynamic: false,
		dropdown: true,
		scrollbar: true
	});
	
	// 취소 버튼 클릭
	$("#btnPopCancel").click(function() {
		fnPopupClose();
	});
	
	/* $(document).on('click', '.gsMbCode', function() {
		grmCode = $(this).data('gr_m_code');
		grpCode = $(this).data('gr_p_code');
		mbCode = $(this).data('mb_code');
	}); */
	
	$("#businessname").autocomplete({
		source : function(request, response) {
			$.post('/empo/auth/searchProjectAutocomplete.do', { 
				"pjYear" : $('#pjYear').val()
				, "pjTitle" : $('#businessname').val() 
			}).done(function(res) {
				var list = [];
				res.list.forEach(function(row) {
					list.push(row.pjTitle);
				})
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
	
	$('#projectSearch').click(function() {
		
		var data = {
			"pjYear" : $('#pjYear').val()
			, "pjTitle" : $('#businessname').val()
		}
		
		$.post('/empo/auth/eMAU00F01SearchProject.do', data).done(function(res) {
			$('.pjSelect').remove();
			res.list.forEach(function(row, index) {
				$('.searchList').append($('<span style="cursor:pointer;" class="pjSelect" data-pj_code=' + row.pjCode + ' data-pj_year=' + row.pjYear + '>' + row.pjTitle + '</span>'))
			});
			
		}).fail(function() {
			alert("실패");
		});
		/*$.post('/empo/resources/businessInfo.do', {
			'pjYear' : $('#pjYear').val()
			, 'businessname' : $('#businessname').val()
		}).done(function(res) {
			if (res.list.length > 0) {
				res.list.forEach(function(row) {
					pjYear = row.pjYear;
					pjCode = row.pjCode;
				});
			} else {
				alert("전체 사업명을 입력해주세요.");
				$('#businessname').focus();
				return false;
			}
			console.log(pjYear);
			console.log(pjCode);
		});
		*/
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
		pjYear = selectData.pj_year;
		pjCode = selectData.pj_code;
	});
	
	// 업무요청 버튼 클릭
	$("#btnPopRequest").click(function() {
		if (confirm("업무요청 하시겠습니까?")) {
			if (pjCode == "") {
				alert("사업을 선택해주세요.");
				return false;
			}
			
			if ( $('.gsMbCode:checked').length == 0 ) {
				alert("담당자를 체크하세요.");
				return false;
			}
			if ($('#date1').val() == "") {
				alert("평가 시작 기간을 선택해주세요.");
				return false;
			} else {
				var date1 = $('#date1').val();
			}
			
			if ($('#date2').val() == "") {
				alert("평가 종료 기간을 선택해주세요.");
				return false;
			} else {
				var date2 = $('#date2').val();
			}
			
			var evaluationTime1 = $('#evaluationTime1').val();
			var evaluationTime2 = $('#evaluationTime2').val();
			
			var gsTxt = $('#gsTxt').val();
			
			var resDate = [];
			$('.gsMbCode').each(function(index, row) {
				if ($(row).is(":checked")) {
					grmCode = $(row).data('gr_m_code');
					grpCode = $(row).data('gr_p_code');
					mbCode = $(row).data('mb_code');
					
					var startDate = new Date(date1);
				   	var endDate = new Date(date2);
				   	
				   	var timeStampStart = startDate.getTime();
				   	var timeStampEnd = endDate.getTime();
					
					if ( timeStampStart > timeStampEnd ) {
				   		alert("기간이 맞지 않습니다.");
				   		return false;
				   	} else if ( timeStampStart == timeStampEnd ) {
				   		var dateStart = date1 + ' ' + evaluationTime1;
						var dateEnd = date2 + ' ' + evaluationTime2;
						
						for (var i = 0; i < 2; i++) { 
							if (i == 0) {
								data = {
									"pjYear" : pjYear
									, "pjCode" : pjCode
									, "loginMbName" : loginMbName
									, "loginMbCode" : loginMbCode
									, "grmCode" : grmCode
									, "grpCode" : grpCode
									, "gsTxt" : gsTxt
									, "pjInMbCode" : mbCode
									, "pjInDate" : dateStart
								}	
								resDate.push(data);
								
							} else {
								data = {
									"pjYear" : pjYear
									, "pjCode" : pjCode
									, "loginMbName" : loginMbName
									, "loginMbCode" : loginMbCode
									, "grmCode" : grmCode
									, "grpCode" : grpCode
									, "gsTxt" : gsTxt
									, "pjInMbCode" : mbCode
									, "pjInDate" : dateEnd
								}	
								resDate.push(data);
								
							}
						}
				   	} else {
				   		while(startDate.getTime() <= endDate.getTime()) {
							var mon = (startDate.getMonth()+1);
				  			mon = mon < 10 ? '0'+mon : mon;
				  			var day = startDate.getDate();
				  			day = day < 10 ? '0'+day : day;
				  			var pjInDate = "";
							if (timeStampStart == startDate.getTime()) {
								pjInDate = startDate.getFullYear() + '-' + mon + '-' +  day + ' ' + evaluationTime1;
								data = {
										"pjYear" : pjYear
										, "pjCode" : pjCode
										, "loginMbName" : loginMbName
										, "loginMbCode" : loginMbCode
										, "grmCode" : grmCode
										, "grpCode" : grpCode
										, "gsTxt" : gsTxt
										, "pjInMbCode" : mbCode
										, "pjInDate" : pjInDate
									}	
								resDate.push(data);
								
							} else if (timeStampEnd == startDate.getTime()) {
								pjInDate = startDate.getFullYear() + '-' + mon + '-' +  day + ' ' + evaluationTime2;
								data = {
										"pjYear" : pjYear
										, "pjCode" : pjCode
										, "loginMbName" : loginMbName
										, "loginMbCode" : loginMbCode
										, "grmCode" : grmCode
										, "grpCode" : grpCode
										, "gsTxt" : gsTxt
										, "pjInMbCode" : mbCode
										, "pjInDate" : pjInDate
									}	
								resDate.push(data);
								
							} else {
								pjInDate = startDate.getFullYear() + '-' + mon + '-' +  day + ' 00:00';
								data = {
										"pjYear" : pjYear
										, "pjCode" : pjCode
										, "loginMbName" : loginMbName
										, "loginMbCode" : loginMbCode
										, "grmCode" : grmCode
										, "grpCode" : grpCode
										, "gsTxt" : gsTxt
										, "pjInMbCode" : mbCode
										, "pjInDate" : pjInDate
									}	
								resDate.push(data);
								
							}
							
							startDate.setDate(startDate.getDate() + 1);
				   		}
				   	}
				} 
				
			});
			console.log(resDate);
			
			if ( resDate.length > 0 ) {
				$.ajax({
					url : "/empo/resources/workRequest.do"
					, type : 'post'
					, data : JSON.stringify(resDate)
					, async : false
					, contentType : "application/json; charset=utf-8"
				}).done(function(res) {
					alert("요청되었습니다.");
					fnPopupClose();
				}).fail(function() {
					alert("실패");
				});
			}
		}
		
	});
	
	
	var DataListView = function(row) {
		var data ;
		if (row.inState == 1) {
			data = 
				'<dd>' +
				'<input type="checkbox" class="gsMbCode" data-mb_code="' + row.mbCode + '" data-gr_p_code ="'+ row.grpCode+'" data-gr_m_code ="'+ row.grmCode+'" value="'+row.mbCode+'"> '+ row.mbName + '('+ row.grmName + ', ' + row.mbRank + ')' + ' ☎ ' + row.mbHp + 
				'</dd>' ;
		} else {
			data = '<dd>'+'<input type="checkbox" disabled> '+ row.mbName + '('+ row.grmName + ', ' + row.mbRank + ')' + ' ☎ ' + row.mbHp + '</dd>';
		}
		return $(data);
	}
	
	$(function() {
		$('#evaluationTime1').val("09:00");
		$('#evaluationTime2').val("18:00");
		var dt = new Date();
	    var com_year = dt.getFullYear();
	    
	    $("select[name='pjYear']").each(function(index, row) {
	    	for (var y = (com_year - 5); y <= (com_year + 1); y++) {
				$(row).append("<option value='" + y + "'>" + y + " 년" + "</option>");
			}	
	    });
		
		$("select[name='pjYear']").children().each(function(index, row) { 
			if ($(row).val() == com_year) {
				$(row).prop('selected', true);
			}
		});
		
		$.ajax({
			type : "POST",
			url : "/empo/rpa/businessDepart.do"
		}).done(function(res) {
			loginMbCode = res.list.mbCode
			loginMbName = res.list.mbName;
		});
		
		var grmCode = $('#selectGrmCode').val();
		$.ajax({
			type : "POST",
			url : "/empo/resource/possibleStatus.do",
			data : {'grmCode' : grmCode}
		}).done(function(res) {
			res.list.forEach(function(row) {
				console.log(row)
				if(row.inState==0) {
					 $('.notuse_box1').append(DataListView(row));
				 } 
				if(row.inState==1) {
					$('.use_box').append(DataListView(row));	
				}
				if(row.inState==2) {
					$('.notuse_box').append(DataListView(row));
				}
			});
		}).fail(function(res) {
			alert('실패');
		});
		
	});
	
})();
</script>