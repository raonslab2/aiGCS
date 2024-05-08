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
				<h3>가용자원</h3>

				<c:import url="/EmpPageLink.do?link=main/include/top" /> 
			</div>
			<!-- 화면 상단 종료 -->
			
			<!-- s :contents_guide -->
			<div class="contents_guide">
				<div class="submenu_guide">
					<ul>
						<!-- 2차메뉴명 -->
						<li><a href="<c:url value='/empo/resources/eMAU00C01Main.do'/>">분과구성 현황</a></li>
						<li><a href="<c:url value='/empo/resources/eMAU00C02Main.do'/>" class="active">가용자원 조회(간사)</a></li>
						<li><a href="<c:url value='/empo/resources/eMAU00C03Main.do'/>">가용자원 조회(평가장)</a></li>
					</ul>
				</div>
				
				<!-- s :content_col2 -->
				<div class="content_col2">
					<div class="bbs_write01 w50">
						<input type="hidden" id="page" name="page" value="" />
						<ul>
							<li><span>사업명 *</span>
							<select id="pjYear" name="pjYear" class="input_w20">
							</select>
							<input type="text" class="input_w70" id="searchName" placeholder="사업명을 입력하세요.">
							</li>
						</ul>
						<ul>
							<li><span>요청자</span>
						<input type="text" id="businessDepart" name="businessDepart" readOnly>
						<input type="text" id="ContactInfo" name="ContactInfo" readOnly>
							</li>
						</ul>
					</div>
					<!-- e :bbs_write01 -->
					
                    <div class="bbs_write01 w50">
                        <ul>
                            <li><span>평가기간 *</span>
								<input type="text" class="inputCalendar" name="searchDate1" id="searchDate1">
								~
								<input type="text" class="inputCalendar" name="searchDate2" id="searchDate2">

								<div class="period">
									<a href="#">오늘</a>
									<a href="#">7일</a>
									<a href="#">15일</a>
									<a href="#">1개월</a>
									<a href="#">5개월</a>
									<a href="#">전체</a>
								</div>
                            </li>
							<li><span>대상자</span>
							<select id="groupPart1" name="groupPart1" class="input_w26" style="width:200px">
								<option value="">전체</option>
							</select>
									
							<select id="groupPart2" name="groupPart2" class="input_w26" style="width:200px">
								<option value="">전체</option>
							</select>
                            </li>
                        </ul>
                    </div>
					<!-- e :bbs_write01 -->
					
					<div class="btn_guide ac mb20 w100">
                        <button type="button" class="btn_style01 sb_style btn_red searchRes">조회하기</button>
                    </div>
					<!-- e :btn_guide -->
				</div>
				<!-- e :content_col2 -->
				
                <div class="bbs_list">
                	<table>
					  	<caption>지원요청 목록 및 결과목록으로 현황, 투입일시, 사업명, 부서, 이름, 가능여부, 확정여부, 요청일시, 답변일시, 요청자를 보여주는 리스트화면</caption>
						
						<thead>
						<tr>
						  <th scope="col"><input type="checkbox" id="chkAll"></th>
						  <th scope="col">현황</th>
						  <th scope="col">투입일시</th>
						  <th scope="col">사업명</th>
						  <th scope="col">부서</th>
						  <th scope="col">이름</th>
						  <th scope="col">가능여부</th>
						  <th scope="col">확정여부</th>
						  <th scope="col">요청일시</th>
						  <th scope="col">답변일시</th>
						  <th scope="col">요청자</th>
						</tr>
						</thead>
						<tbody id="resultList">

					  </tbody>
					</table>
				</div>
				<!-- e :bbs_list -->
					
				<div class="bbs_page">
				  <ul class="pagination">
					<!-- <li class="first"><a href="#" title="첫 페이지 바로가기"><img src="../../images/bbs_prev02.gif" alt="첫 페이지" style="margin: 10px;"></a></li>
					<li class="prev"><a href="#" title="이전 페이지(1page) 바로가기"><img src="../../images/bbs_prev01.gif" alt="이전 페이지" style="margin: 10px;"></a></li>
					<li class="active">1</li>
					<li class=""><a href="#" title="2페이지 바로가기">2</a></li>
					<li class=""><a href="#" title="3페이지 바로가기">3</a></li>
					<li class=""><a href="#" title="4페이지 바로가기">4</a></li>
					<li class=""><a href="#" title="5페이지 바로가기">5</a></li>
					<li class="next"><a href="#" title="다음 페이지(11page) 바로가기"><img src="../../images/bbs_next01.gif" alt="다음 페이지" style="margin: 10px;"></a></li>
					<li class="last"><a href="#" title="끝 페이지(67page) 바로가기"><img src="../../images/bbs_next02.gif" alt="마지막 페이지" style="margin: 10px;"></a></li> -->
				  </ul>
				</div>
				<!-- e :bbs_page -->
				
				<div class="btn_guide al">
					<button type="button" class="btn_style02 btn_green" id="btnListConfirm">선택 확정</button>
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
	// 목록 체크박스 전체선택/해제
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
	// 지원가능여부 확인 버튼
	//$("#btnDivComfirm").click(function() {
	//	window.location.href = "/empo/resources/eMAU00C0201Main.do";
	//});
	
	// 선택확정 버튼
	$("#btnListConfirm").click(function() {
		var valueArr = new Array();
		if ($("input[name=checkField]:checkbox:checked").length == 0) {
			alert("선택확정 대상 정보를 선택해 주세요.");
			return false;
		} else {
			if (confirm("확정 처리하시겠습니까?")) {
				var check = $("input[name='checkField']").filter(function(index, row) {
					if($(row).is(':checked') == true) {
						var gsPk = $(row).data('gs_pk');
						valueArr.push(gsPk);
					}
				});
				
				console.log(valueArr);
				
				$.post('/empo/resources/confirmUpdate.do', {"gsPk" : valueArr}).done(function(res) {
					alert("선택확정 프로세스 진행됩니다.");
					$("input[name='checkField']").filter(function(index, row) { 
						if($(row).is(':checked') == true) { 
							$(row).parents('tr').find('.status').html(res.status);
							$(row).parents('tr').find('.inConfirm').html(res.confirm);
							$(row).prop('checked', false);
						}
					});
				}).fail(function() {
					alert("a")
				});
			} else {
				return false;
			}
		}	
	});
	
	$("#searchName").autocomplete({
		source : function(request, response) {
			$.post('/empo/auth/searchProjectAutocomplete.do', { 
				"pjYear" : $('#pjYear').val()
				, "pjTitle" : $('#searchName').val() 
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
		
	});
	
	// 달력 입력 datepicker 설정
	$('.inputCalendar').datepicker({
		dateFormat : 'yyyy.mm.dd'		// 날짜 형태 설정		
	});
	
	
	
	// 기간검색 버튼 클릭
	$(".period > a").click(function() {

		$(".period > a").removeClass("active");
		$(this).addClass("active");
		
		var searchDate1 = "";
		var searchDate2 = "";
		var dateDiv = $(this).index();
		var now = new Date();
		
		var yy = now.getFullYear();
		var mm = ('0' + (now.getMonth() + 1)).slice(-2);
		var dd = ('0' + (now.getDate() + 1)).slice(-2);
		console.log(dd);
		searchDate2 = yy + '.' + mm  + '.' + dd;

		if (dateDiv == "0") {	// 오늘
			searchDate1 = searchDate2;
		}

		else if (dateDiv == "1") {	// 7일
			var d = new Date(now.setDate(now.getDate() - 6));
			var yy = d.getFullYear();
			var mm = ('0' + (d.getMonth() + 1)).slice(-2);
			var dd = ('0' + d.getDate()).slice(-2);
			searchDate1 = yy + '.' + mm  + '.' + dd;
		}

		else if (dateDiv == "2") {	// 15일
			var d = new Date(now.setDate(now.getDate() - 14));
			var yy = d.getFullYear();
			var mm = ('0' + (d.getMonth() + 1)).slice(-2);
			var dd = ('0' + d.getDate()).slice(-2);
			searchDate1 = yy + '.' + mm  + '.' + dd;
		}

		else if (dateDiv == "3") {	// 1개월
			d = new Date(now.setMonth(now.getMonth() - 1));
			var yy = d.getFullYear();
			var mm = ('0' + (d.getMonth() + 1)).slice(-2);
			var dd = ('0' + d.getDate()).slice(-2);
			searchDate1 = yy + '.' + mm  + '.' + dd;
		}

		else if (dateDiv == "4") {	// 5개월
			d = new Date(now.setMonth(now.getMonth() - 5));
			var yy = d.getFullYear();
			var mm = ('0' + (d.getMonth() + 1)).slice(-2);
			var dd = ('0' + d.getDate()).slice(-2);
			searchDate1 = yy + '.' + mm  + '.' + dd;
		}

		else {	// 전체
			searchDate1 = "";
			searchDate2 = "";
		}
		
		$("#searchDate1").val(searchDate1);
		$("#searchDate2").val(searchDate2);
		
		$('.inputCalendar').each(function(index) {
	        var thisData = $(this).val();
			console.log(thisData);
	        if ($.trim(thisData).length > 0) {
		        var date = new Date(thisData); // 화면에 표시되는 날짜 형태에 따라 변환
		            
		        $(this).data('datepicker').selectDate(new Date(date.getFullYear(), date.getMonth(), date.getDate()));
	    	}
		});
	});
	
	// 서브 그룹
	$('#groupPart1').change(function() {
		var el = $(this);
		var data = el.val();
		var id = el.attr('id');
		
		if (id == 'groupPart1') {
			$('#groupPart2').children('option:not(:first)').remove();
			
			$.get( '/empo/auth/eMAU00F01SearchSubOption.do', { "grpCode" : data } ).done(function(res) {
				res.list.forEach( function(row, index) {
					var option = $('<option value="'+ row.grmCode +'">'+ row.grmName +'</option>');
					$('#groupPart2').append(option);
				})
			}).fail(function() {
				alert("실패")
			});
		}
	});
	
	// 조회하기 버튼
	$(".searchRes").click(function() {
		$("#page").val("");
		$('#resultList > tr').empty();
		userList();
	});
	
	var DataListView = function(row) {
		var response = "";
		if(row.pjInUse==0){row.pjInUse='응답대기'}
		if(row.pjInUse==1){row.pjInUse='가능'}
		if(row.pjInUse==2){row.pjInUse='불가능'}
		if(row.pjInConfirm==0){
			row.pjInConfirm='대기'
			response = '대기'
		}
		if(row.pjInConfirm==1){
			row.pjInConfirm='확정'
			response = '완료'
		}
		if(row.pjInConfirm==2){
			row.pjInConfirm='확정'
		}
		
		if (row.pjInRepleDate == null) {
			row.pjInRepleDate = "";
		}
		
		var data = 
		'<tr data-pj_title= "'+  row.pjTitle + '">' +
		'	<td><input type="checkbox" name="checkField" data-gs_pk="' + row.gsPk + '"></td>' +
		'	<td class="subRow status">' + response + '</td>' +
		'	<td class="subRow">' + row.pjInDate + '</td>' +
		'	<td class="subRow">' + row.pjTitle + '</td>' +
		'	<td class="subRow">' + row.grmName + '</td>' +
		'	<td class="subRow">' + row.mbName + '</td>' +
		'	<td class="subRow">' + row.pjInUse + '</td>' +
		'	<td class="subRow inConfirm">' + row.pjInConfirm + '</td>' +
		'	<td class="subRow">' + row.writeTime + '</td>' +
		'	<td class="subRow">' + row.pjInRepleDate + '</td>' +
		'	<td class="subRow">' + row.reqMbName + '</td>' +
		'</tr>' ;
		
	return $(data);
	}
	
	var userList = function() {
		var data = {
			'pjYear' : $('#pjYear').val()
			, 'pjTitle' : $('#searchName').val()
			, 'date1' : $('#searchDate1').val()
			, 'date2' : $('#searchDate2').val()
			, 'part1' : $("#groupPart1 option:selected").val()
			, 'part2' : $("#groupPart2 option:selected").val()
			, 'reqMbName' : $('#ContactInfo').val()
			, 'page' : $("#page").val()
		}
		
		$.post("/empo/resource/selectPjUsertList.do", data).done(function(res) {
			console.log(res);
			$('.pagination').children().remove();
			res.list.forEach(function(row, index) {
				console.log(row)
				$('#resultList').append(DataListView(row));
			});
			$('.pagination').append(paginationView(res.paginationInfo));
			
			$('.' + res.paginationInfo.currentPageNo ).addClass("active");
			$('.pagination > li').css('cursor', 'pointer');
		}).fail(function() {
			alert("실패");
		});
	}
	
	$(document).on('click', '.pageClass', function() {
		var page = $(this).data('page');
		var totalPageCnt = $(this).data('total_page_count');
		console.log(totalPageCnt);
		if (page > totalPageCnt) {
			return false;
		}
		if (page == 0) {
			return false;
		}
		$("#page").val(page);
		
		var data = {
				'pjYear' : $('#pjYear').val()
				, 'pjTitle' : $('#searchName').val()
				, 'date1' : $('#searchDate1').val()
				, 'date2' : $('#searchDate2').val()
				, 'part1' : $("#groupPart1 option:selected").val()
				, 'part2' : $("#groupPart2 option:selected").val()
				, 'reqMbName' : $('#ContactInfo').val()
				, 'page' : $("#page").val()
			}
		
		$.post("/empo/resource/selectPjUsertList.do", data).done(function(res) {
			console.log(res);
			$('#resultList').children().remove();
			$('.pagination').children().remove();
			res.list.forEach(function(row, index) {
				console.log(row)
				$('#resultList').append(DataListView(row));
			});
			$('.pagination').append(paginationView(res.paginationInfo));
			$('.' + res.paginationInfo.currentPageNo ).addClass("active");
			$('.pagination > li').css('cursor', 'pointer');
		});
		
	});
	
	$(function() {
		$(".period > a")[1].click();
		
		//부서정보 호출
		$.post('/empo/auth/eMAU00F01SearchFirstOption.do').done(function(res) {
			res.list.forEach( function(row, index) {
				var option = $('<option value="'+ row.grmCode +'">'+ row.grmName +'</option>');
				$('#groupPart1').append(option);
			})
		}).fail(function() {
			alert("실패");
		});
		
		$.ajax({
			type : "POST",
			url : "/empo/rpa/businessDepart.do"
		}).done(function(res) {
			$('#businessDepart').val(res.list.grSumName);
			$('#ContactInfo').val(res.list.mbName);
			$('.searchRes').click();
		});
		
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
		
	});
	
	var paginationView = function(page) {
		 var data = "" ;
		 	
		 	data = 
			'	<li class="first"><a class="pageClass" data-page="' + page.firstPageNo + '" title="첫 페이지 바로가기"><img src="/images/bbs_prev02.gif" alt="첫 페이지" style="margin: 10px;"></a></li>' +
			'	<li class="prev"><a class="pageClass" data-page="' + (page.currentPageNo-1) + '" title="이전 페이지(1page) 바로가기"><img src="/images/bbs_prev01.gif" alt="이전 페이지" style="margin: 10px;"></a></li>' ;
			
			for (var i=page.firstPageNoOnPageList; i <= page.lastPageNoOnPageList; i++) {
				data = data +
					'<li class=' + i + '><a class="pageClass" data-page="' + i + '" title="' + i + '페이지 바로가기">' + i + '</a></li>' ;
			}
			
			data = data +
				'<li class="next"><a class="pageClass" data-total_page_count="' + page.totalPageCount + '" data-page="' + (page.currentPageNo+1) + '" title="다음 페이지(11page) 바로가기"><img src="/images/bbs_next01.gif" alt="다음 페이지" style="margin: 10px;"></a></li>' +
				'<li class="last"><a class="pageClass" data-page="' + page.lastPageNo + '" title="끝 페이지(67page) 바로가기"><img src="/images/bbs_next02.gif" alt="마지막 페이지" style="margin: 10px;"></a></li>' ;
			
		return $(data);
	 } 
})();
</script>
</html>
