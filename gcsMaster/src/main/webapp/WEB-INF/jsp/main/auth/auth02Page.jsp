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
<style>
	.sb_style {
		margin: 5px;
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
				<h3>권한관리</h3>
				<c:import url="/EmpPageLink.do?link=main/include/top" /> 
			</div>
			<!-- 화면 상단 종료 -->
			
			<!-- s :contents_guide -->
			<div class="contents_guide">
				<div class="submenu_guide">
					<ul>
						<!-- 2차메뉴명 -->
						<li><a href="/empo/auth/eMAU00F01Main.do">담당자별</a></li>
						<li><a href="/empo/auth/eMAU00F02Main.do" class="active">사업별</a></li>
						<!-- <li><a href="/empo/auth/eMAU00F03Main.do">기관담당자</a></li>  -->
					</ul>
				</div>

				<!-- s :content_col2 -->
				<div class="content_col2 bg">
					<div>
						<ul class="">
							<li class="ac">
								<select name="pjYear" id="pjYear">
								</select>
								
								<span class="search_box03 input_w70">
									<input type="text" id="searchName" name="searchName" placeholder="세부 사업명 입력">
									<button type="button" id="searchProject" class="btn_search01">검색</button>
								</span>
							</li>
						</ul>
						<div class="bbs_list mt30">
							<table>
							  <thead>
								<tr>
								  <th scope="col">사업</th>
								  <th scope="col">권한설정</th>
								</tr>
							  </thead>		  
							  <tbody id="resultList"> 

								<!--
									====== 사업 단계에 따라 클래스 정의 ======
									1. 목록의 모든 tr에는 authBusList 클래스 삽입
									2. 최상위 사업명의 클래스 정의 : busList01 처럼 busList값은 동일하게 적용하고, 최상위 사업명의 순서에 따라 01, 02 ... 부여 (busList01, busList02 ...)
									3. 중간 사업명 클래스 정의 : 최상위 사업의 클래스에 순서에 따라 01, 02 ... 추가 부여 (busList0101, busList0102, busList0103 .....)
									4. 세부 사업명 클래스 정의 : 중간 사업의 클래스에 순서에 따라 01, 02 ... 추가 부여 (busList010101, busList010102, busList010103 .....)

									
									====== 사업 단계 및 하위 사업목록의 open에 따라 제목 앞 아이콘 클래스 정의 ======
									1. 최상위 사업명 아이콘 : icon_on01 - 하위 사업 open, icon_off01 - 하위 사업 close
									2. 중간 사업명 아이콘 : icon_on02 - 하위 사업 open, icon_off02 - 하위 사업 close
								-->
								<!-- <tr class="authBusList busList01"> 
								  <td class="text_l"><span class="step_icon icon_off01"></span> 중소기업혁신개발사업</td>
								  <td><button type="button" class="btn_style03 btn_white">관리</button></td>
								</tr>
								<tr class="authBusList busList0101" style="display:none;">
								  <td class="text_l icon_arrow"><span class="step_icon icon_off02"></span>중소기업기술혁신개발사업(수출지향형)</td>
								  <td><button type="button" class="btn_style03 btn_white">관리</button></td>
								</tr>
								<tr class="authBusList busList010101" style="display:none;">
								  <td class="text_l icon_arrow02">중소기업기술혁신개발사업(수출지향형) 1차</td>
								  <td><button type="button" class="btn_style03 btn_red">등록</button></td>
								</tr>
								<tr class="authBusList busList010102" style="display:none;">
								  <td class="text_l icon_arrow02">중소기업기술혁신개발사업(수출지향형) 2차</td>
								  <td><button type="button" class="btn_style03 btn_white">관리</button></td>
								</tr>
								<tr class="authBusList busList0102" style="display:none;">
								  <td class="text_l icon_arrow"><span class="step_icon icon_off02"></span>중소기업기술혁신개발사업(수출지향형)</td>
								  <td><button type="button" class="btn_style03 btn_white">관리</button></td>
								</tr>
								<tr class="authBusList busList010201" style="display:none;">
								  <td class="text_l icon_arrow02">중소기업기술혁신개발사업(수출지향형) 1차</td>
								  <td><button type="button" class="btn_style03 btn_red">등록</button></td>
								</tr>
								<tr class="authBusList busList010202" style="display:none;">
								  <td class="text_l icon_arrow02">중소기업기술혁신개발사업(수출지향형) 2차</td>
								  <td><button type="button" class="btn_style03 btn_white">관리</button></td>
								</tr>
								

								<tr class="authBusList busList02">
								  <td class="text_l"><span class="step_icon icon_off01"></span> 공정품질개발사업</td>
								  <td><button type="button" class="btn_style03 btn_white">관리</button></td>
								</tr>
								<tr class="authBusList busList0201" style="display:none;">
								  <td class="text_l icon_arrow"><span class="step_icon icon_off02"></span>중소기업기술혁신개발사업(수출지향형)</td>
								  <td><button type="button" class="btn_style03 btn_white">관리</button></td>
								</tr>
								<tr class="authBusList busList020101" style="display:none;">
								  <td class="text_l icon_arrow02">중소기업기술혁신개발사업(수출지향형) 1차</td>
								  <td><button type="button" class="btn_style03 btn_red">등록</button></td>
								</tr>
								

								<tr class="authBusList busList03">
								  <td class="text_l"><span class="step_icon icon_off01"></span> 상용화기술개발사업</td>
								   <td><button type="button" class="btn_style03 btn_red">등록</button></td>
								</tr>
								<tr class="authBusList busList0301" style="display:none;">
								  <td class="text_l icon_arrow"><span class="step_icon icon_off02"></span>중소기업기술혁신개발사업(수출지향형) 1</td>
								  <td><button type="button" class="btn_style03 btn_white">관리</button></td>
								</tr>
								<tr class="authBusList busList030101" style="display:none;">
								  <td class="text_l icon_arrow02">중소기업기술혁신개발사업(수출지향형) 1차</td>
								  <td><button type="button" class="btn_style03 btn_red">등록</button></td>
								</tr>
								<tr class="authBusList busList030102" style="display:none;">
								  <td class="text_l icon_arrow02">중소기업기술혁신개발사업(수출지향형) 2차</td>
								  <td><button type="button" class="btn_style03 btn_red">등록</button></td>
								</tr>
								<tr class="authBusList busList030103" style="display:none;">
								  <td class="text_l icon_arrow02">중소기업기술혁신개발사업(수출지향형) 3차</td>
								  <td><button type="button" class="btn_style03 btn_red">등록</button></td>
								</tr>
								<tr class="authBusList busList0302" style="display:none;">
								  <td class="text_l icon_arrow"><span class="step_icon icon_off02"></span>중소기업기술혁신개발사업(수출지향형) 2</td>
								  <td><button type="button" class="btn_style03 btn_white">관리</button></td>
								</tr>
								<tr class="authBusList busList0303" style="display:none;">
								  <td class="text_l icon_arrow"><span class="step_icon icon_off02"></span>중소기업기술혁신개발사업(수출지향형) 3</td>
								  <td><button type="button" class="btn_style03 btn_white">관리</button></td>
								</tr>
								<tr class="authBusList busList030301" style="display:none;">
								  <td class="text_l icon_arrow02">중소기업기술혁신개발사업(수출지향형) 1차</td>
								  <td><button type="button" class="btn_style03 btn_red">등록</button></td>
								</tr>
								<tr class="authBusList busList030302" style="display:none;">
								  <td class="text_l icon_arrow02">중소기업기술혁신개발사업(수출지향형) 2차</td>
								  <td><button type="button" class="btn_style03 btn_red">등록</button></td>
								</tr>
								 -->
							  </tbody>
							</table>
						</div>
						<!-- e :btn_guide -->
					</div>
					<!-- e :bbs_write01 -->
					
					<div>
						<h4>기본정보</h4>
						<div class="btn_guide ar mt-50 mb10">
							<button type="button" class="btn_style02 btn_red" id="btnSave">저장</button>
						</div>
						<div class="bbs_list">
							<table class="table_l">
							  <colgroup>
							  	<col width="30%">
							  	<col width="">
							  </colgroup>
							  <tbody>
								<tr>
								  <th scope="row">사업년도</th>
								  <td id="resultPjYear"></td>
								</tr>
								<tr>
								  <th scope="row">사업명 *</th>
								  <td id="resultPjTitle"></td>
								</tr>
								<tr>
								  <th scope="row">상위사업명</th>
								  <td id="resultPjCateName"></td>
								</tr>
								<tr>
								  <th scope="row">사용설정 *</th>
								  <td><input type="radio" id="use" name="pjUse" value="1"> 사용 <input type="radio" id="unUse" name="pjUse" value="0"> 미사용</td>
								</tr>
							  </tbody>
							</table>
						</div>
						
						<!-- <h4>사업권한 가져오기</h4>
						<div class="mb20">
							<ul>
								<li>
									<select name="pjYear" id="getPjYear">
									</select>									
								
									<span class="search_box03 input_w70">
										<input type="text" id="getPjSearchName" placeholder="사업명 입력">
										<button type="button" class="btn_search01" id="getPjSelect">검색</button>
									</span>
								</li>
								<li class="mt10" id="getPjList">
									<button type="button" class="btn_style02 sb_style  btn_blue">중소기업(수출지향형)</button>
									<button type="button" class="btn_style02 sb_style  btn_blue">중소기업 R&amp;D 역량 재고사업</button>
									<button type="button" class="btn_style02 sb_style  btn_blue">중소기업 R&amp;D 역량 재고사업</button>
									<button type="button" class="btn_style02 sb_style  btn_blue">중소기업 R&amp;D 역량 재고사업</button>
									<button type="button" class="btn_style02 sb_style  btn_blue">중소기업 R&amp;D 역량 재고사업</button>
									<button type="button" class="btn_style02 sb_style  btn_blue">중소기업 R&amp;D 역량 재고사업</button>
									<button type="button" class="btn_style02 sb_style  btn_blue">중소기업 R&amp;D 역량 재고사업</button>
								</li>
							</ul>
						</div> -->
						
						<form id="formAuthList">
							<input type="hidden" name="dataPageName" id="dataPageName" value="project"/>
							<input type="hidden" name="authMode" id="authMode" value=""/>
							<input type="hidden" name="dataMbCode" id="dataMbCode" value=""/>
							<input type="hidden" name="dataMbName" id="dataMbName" value=""/>
							<input type="hidden" name="dataGrmName" id="dataGrmName" value=""/>
							<input type="hidden" name="dataPjCode" id="dataPjCode" value=""/>
							<input type="hidden" name="dataPjTitle" id="dataPjTitle" value=""/>
							<input type="hidden" name="dataAuCode" id="dataAuCode" value=""/>
							<input type="hidden" name="dataPjAuId" id="dataPjAuId" value=""/>
							<input type="hidden" name="dataPjYear" id="dataPjYear" value=""/>
						</form>
						
						<h4>부서별 권한설정</h4>
						<div class="bbs_list">
							<table class="table_l">
							<colgroup>
							  	<col width="30%">
							  	<col width="">
							  </colgroup>
							  <tbody>
								<tr>
								  <th scope="row">사업부서</th>
								  <td id="resultGrSumName"></td>
								</tr>
								<tr>
								  <th scope="row">권한그룹선택</th>
								  <td>
									  <ul class="data_list02">
										  <li><input type="radio" name="projectAuth" id="systemManagement" value="CODE00001"> 시스템관리</li>
										  <li><input type="radio" name="projectAuth" id="projectManagement" value="CODE00002"> 사업관리</li>
										  <li><input type="radio" name="projectAuth" id="manager" value="CODE00003"> 담당간사</li>
										  <li><input type="radio" name="projectAuth" id="practitioner" value="CODE00004"> 실무자</li>
									  </ul>
								  </td>
								</tr>
							  </tbody>
							</table>
						</div>
						
						<h4>담당자별 권한설정</h4>
						<div class="btn_guide ar mt-50 mb10">
							<button type="button" class="btn_style02 btn_gray" id="btnUserUpdate">담당자 수정</button>
							<button type="button" class="btn_style02 btn_green" id="btnUserAdd">담당자 추가</button>
						</div>
						<div class="bbs_list">
							<table>
								<colgroup>
								  	<col width="10%">
								  	<col width="25%">
								  	<col width="15%">
								  	<col width="15%">
								  	<col width="20%">
								  	<col width="25%">
							  	</colgroup>
								<thead>
								  <tr>
								  	<th scope="col"></th>
									<!-- <th scope="col"><input type="checkbox" id="chkAll"></th> -->
									<th scope="col">부서명</th>
									<th scope="col">이름</th>
									<th scope="col">직급</th>
									<th scope="col">아이디</th>
									<th scope="col">권한</th>
								  </tr>
								</thead>
								<tbody id="authResultList">
									
								</tbody>
							</table>
						</div>
					</div>
					<!-- e :bbs_write01 -->
                        
                    </div>
					<!-- e :회원정보 -->
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
	
	var pjCode = "";
	var auCode = "";
	var pjYear = "";
	
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
		}
	});
	
	$("#getPjSearchName").autocomplete({
		source : function(request, response) {
			$.post('/empo/auth/searchProjectAutocomplete.do', { 
				"pjYear" : $('#getPjYear').val()
				, "pjTitle" : $('#getPjSearchName').val() 
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
		}
	});
	
	var si1 = 1;
	var si2 = 1;
	var sortIndex = 1;
	var dataPjCateCode1 = "";
	var dataPjCateCode2 = "";
	var sortLength = 2;
	var searchListView = function(row, index) {
		var data ;
		console.log(row);
		/*
		if ( dataPjCateCode1 == row.pjCateCode1 && dataPjCateCode2 == row.pjCateCode2) {
			var parentTr = $('.authBusList').eq($('.authBusList').length - sortLength);
			var className = parentTr.attr('class');
			var splitClass = className.split(" ");
			if ( row.pjAuId == null) { 
				data =
					'<tr data-pj_code="' + row.pjCode + '" class="authBusList ' + splitClass[1] + '0' + sortLength + '" style="">' +
					'	<td class="text_l icon_arrow02 subRow">' + row.pjTitle + '</td>' +
					'	<td><button type="button" class="btn_style03 btn_red createPopup">등록</button></td>' +
					'</tr>' ;
			} else {
				data =
					'<tr data-pj_code="' + row.pjCode + '" class="authBusList ' + splitClass[1] + '0' + sortLength + '" style="">' +
					'	<td class="text_l icon_arrow02 subRow">' + row.pjTitle + '</td>' +
					'	<td class="subRow"><button type="button" class="btn_style03 btn_white isData">관리</button></td>' +
					'</tr>' ;
			}
			sortLength = sortLength + 1;
		} else if ( dataPjCateCode1 == row.pjCateCode1 && dataPjCateCode2 != row.pjCateCode2) {
			
			/* var parentTr = $('.authBusList').eq($('.authBusList').length - (sortLength+1));
			var className = parentTr.attr('class');
			var splitClass = className.split(" ");
			if ( row.pjAuId == null) { 
				data =
					'<tr class="authBusList ' + splitClass[1] + '0' + sortLength + '" style=""> ' + 
					'	<td class="text_l icon_arrow"><span class="step_icon icon_on02"></span>' + row.pjCateName2 + '</td>' +
					//'	<td><button type="button" class="btn_style03 btn_white">관리</button></td>' + 
					'<td></td>' +
					'</tr>' +
					'<tr data-pj_code="' + row.pjCode + '" class="authBusList ' + splitClass[1] + '0' + sortLength + '0' + sortIndex + '" style="">' +
					'	<td class="text_l icon_arrow02 subRow">' + row.pjTitle + '</td>' +
					'	<td class="subRow"><button type="button" class="btn_style03 btn_white isData">관리</button></td>' +
					'</tr>' ;
			} else {
				data =
					'<tr class="authBusList ' + splitClass[1] + '0' + sortLength + '" style=""> ' + 
					'	<td class="text_l icon_arrow"><span class="step_icon icon_on02"></span>' + row.pjCateName2 + '</td>' +
					//'	<td><button type="button" class="btn_style03 btn_white">관리</button></td>' + 
					'<td></td>' +
					'</tr>' +
					'<tr data-pj_code="' + row.pjCode + '" class="authBusList ' + splitClass[1] + '0' + sortLength + '0' + sortIndex + '" style="">' +
					'	<td class="text_l icon_arrow02 subRow">' + row.pjTitle + '</td>' +
					'	<td><button type="button" class="btn_style03 btn_red createPopup">등록</button></td>' +
					'</tr>' ;
			} 
			sortLength = sortLength + 1;
		} 
		else {*/
			sortLength = 2;
			if ( row.pjAuId == null) {
				data = 
					/* '<tr class="authBusList busList0' + (index+1) + '"> ' + 
					'	<td class="text_l"><span class="step_icon icon_on01"></span>' + row.pjCateName1 + '</td>' + 
					//'	<td><button type="button" class="btn_style03 btn_white">관리</button></td>' + 
					'<td></td>' +
					'</tr>' +
					'<tr class="authBusList busList0' + (index+1) + '0' + sortIndex + '" style=""> ' + 
					'	<td class="text_l icon_arrow"><span class="step_icon icon_on02"></span>' + row.pjCateName2 + '</td>' +
					//'	<td><button type="button" class="btn_style03 btn_white">관리</button></td>' + 
					'<td></td>' +
					'</tr>' + */
					'<tr data-pj_code="' + row.pjCode + '" class="authBusList busList0' + (index+1) + '0' + sortIndex + '0' + sortIndex + '" style="">' +
					'	<td class="text_l icon_arrow02 subRow">' + row.pjTitle + '</td>' +
					'	<td><button type="button" class="btn_style03 btn_red createPopup">등록</button></td>' +
					'</tr>' ;
			} else {
				data = 
					/* '<tr class="authBusList busList0' + (index+1) + '"> ' + 
					'	<td class="text_l"><span class="step_icon icon_on01"></span>' + row.pjCateName1 + '</td>' + 
					//'	<td><button type="button" class="btn_style03 btn_white">관리</button></td>' + 
					'<td></td>' +
					'</tr>' +
					'<tr class="authBusList busList0' + (index+1) + '0' + sortIndex + '" style=""> ' + 
					'	<td class="text_l icon_arrow"><span class="step_icon icon_on02"></span>' + row.pjCateName2 + '</td>' +
					//'	<td><button type="button" class="btn_style03 btn_white">관리</button></td>' + 
					'<td></td>' +
					'</tr>' + */
					'<tr data-pj_code="' + row.pjCode + '" class="authBusList busList0' + (index+1) + '0' + sortIndex + '0' + sortIndex + '" style="">' +
					'	<td class="text_l icon_arrow02 subRow">' + row.pjTitle + '</td>' +
					'	<td class="subRow"><button type="button" class="btn_style03 btn_white isData">관리</button></td>' +
					'</tr>' ;
			}	
		/*}*/
		
		
		
		dataPjCateCode1 = row.pjCateCode1
		dataPjCateCode2 = row.pjCateCode2
		
			
		return $(data);
	}
	
	$('#searchProject').click(function() {
		var data = {
			pjYear : $('select[name="pjYear"]').val()
			, pjTitle : $('#searchName').val()
		}
		
		$.post("/empo/auth/searchProjectList.do", data).done(function(res) {
			$('.authBusList').remove();
			res.list.forEach(function(row, index) {
				$('#resultList').append(searchListView(row, index));
			});
			// 사업목록 커서
			$(".authBusList > td").css("cursor","pointer");
			// 사업목록 클릭에 따라 하위 사업 목록 open, close 이벤트
			$(".authBusList").click( toggle );
		}).fail(function() {
			alert("성공");
		});
		
	});
	
	
	$("#btnUserAdd").click(function() {
		if (pjCode == "") {
			alert("사업을 먼저 선택하세요.");
			return false;
		}
		
		$('#dataMbCode').val("");
	    $('#dataMbName').val("");
	    $('#dataGrmName').val("");
	    $('#dataAuCode').val("");
	    $('#dataPjAuId').val(""); 
	    
		$('input[name="checkField"]').filter(function(index, row) {
	    	$(row).prop('checked', false);
	    });
		
		$("#formAuthList").find("#authMode").val("insert");
		fnPopupOpen("/empo/auth/eMAU00F01AuthCreatePopup.do", "#formAuthList");	// ../js/popup.js 참고
	});

	
	var createPopup = function() { // ../js/popup.js 참고
		$('#dataMbCode').val("");
	    $('#dataMbName').val("");
	    $('#dataGrmName').val("");
	    $('#dataAuCode').val("");
	    $('#dataPjAuId').val(""); 
	    
		$('input[name="checkField"]').filter(function(index, row) {
	    	$(row).prop('checked', false);
	    });
	
		$("#authMode").val("insert");
		$(this).parent('td').prev().click();
		
		fnPopupOpen("/empo/auth/eMAU00F01AuthCreatePopup.do", "#formAuthList");
			
	}
	
	$(document).on('click', 'input[name="checkField"]', function() {
		var checkName = $('input[name="checkField"]');
	    checkName.filter(function(index, row) {
	    	$(row).prop('checked', false);
	    });
	    $(this).prop('checked', true);
	    
	    $('#dataPjAuId').val($(this).data('pj_au_id'));
	    $('#dataGrmName').val($(this).data('gr_m_name'));
	    $('#dataAuCode').val($(this).data('au_code'));
	    $('#dataMbName').val($(this).data('mb_name'));
	    $('#dataMbCode').val($(this).data('mb_code'));
	});
	
	// 담당자 수정 버튼
	var update = function() {
		var rtn = true;
		
		if ($("input[name=checkField]:checkbox:checked").length == 0) {
			alert("수정할 담당자를 선택하세요.");
			return false;
		}
		
		if ($('.sb_style').length > 0) {
			$('.sb_style').each(function(index, row) {
				if ($(row).hasClass('btn_blue')) {
					alert("먼저 저장을 해주세요.");
					rtn = false;
					
				}
			});
			return rtn; 
		}
			
		$("#formAuthList").find("#authMode").val("edit");
		fnPopupOpen("/empo/auth/eMAU00F01AuthCreatePopup.do", "#formAuthList");	
	}
	
	var groupCode = function() {
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
		
	}
	
	var getPj = 0;
	$('#getPjSelect').click(function() {
		if (pjCode == "") {
			alert("사업을 먼저 선택하세요.");
			return false;
		}
				
		console.log(auCode);
		if (auCode == null && $('.rowList').length == 0) {
			getPj = 1;
			$.post("/empo/auth/searchProjectList.do", {"pjYear" : $('#getPjYear').val(), "pjTitle" : $('#getPjSearchName').val() }).done(function(res) {
				$('.sb_style').remove();
				res.list.forEach(function(row, index) {
					$('#getPjList').append($('<button type="button" data-pj_code="' + row.pjCode +'" class="btn_style02 sb_style  btn_white">' + row.pjTitle + '</button>'));
				});
			}).fail(function() {
				alert("실패");
			});
		} else {
			if (getPj == 1) {
				$.post("/empo/auth/searchProjectList.do", {"pjYear" : $('#getPjYear').val(), "pjTitle" : $('#getPjSearchName').val() }).done(function(res) {
					$('.sb_style').remove();
					res.list.forEach(function(row, index) {
						$('#getPjList').append($('<button type="button" data-pj_code="' + row.pjCode +'" class="btn_style02 sb_style  btn_white">' + row.pjTitle + '</button>'));
					});
				}).fail(function() {
					alert("실패");
				});
			} else {
				alert("선택한 사업은 설정된 권한이 있습니다.");	
			}
			
		}
	});
	
	$(document).on('click', '.sb_style', function() {
		$('.sb_style').each(function(index, row) {
			if ( ! $(row).hasClass('btn_white') ) {
				$(row).removeClass('btn_blue');
				$(row).addClass('btn_white');
			}
		});
		$(this).removeClass('btn_white');
		$(this).addClass('btn_blue');
		
		var selectPjCode = $(this).data('pj_code');
		$.ajax({
			url : '/empo/auth/eMAU00F02ProjectDetail.do'
			, type : 'post' 
			, async : false
			, data : { "pjCode" : selectPjCode }
		}).done(function(res) {
			console.log(res.list);
			
			$('input[name="projectAuth"]').filter(function(index, row) {
				if( $(row).val() == res.list.auCode ) {
					$(row).prop('checked', true);
					return false;
				} else {
					$(row).prop('checked', false);
				}
			});
			
			$.post('/empo/auth/eMAU00F02projectAuthList.do', { "pjCode" : selectPjCode }).done(function(res) {
				$('.rowList').remove();
				res.list.forEach(function(row, index) {
					$('#authResultList').append(authListView(row));
				});
				
				if ($('.rowList').length > 0) {
					$("#noData").parent().remove();
				}
				
			}).fail(function() {
				alert("실패");
			});
			
		}).fail(function() {
			alert("실패");
		});
	});
	
	var authListView = function(row) {
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
	
	var select = function() {
		$('.rowList').remove();
		$('.sb_style').remove();
		$('#getPjSearchName').val("");
		getPj = 0;
		
		pjCode = $(this).parent('tr').data('pj_code');
		console.log(pjCode);
		
		$('.subRow').each(function(index, row) {
			$(row).css("background-color","")
			$(row).siblings().css("background-color","")
		})
		$(this).css("background-color","rgb(230, 251, 245);");
		$(this).siblings().css("background-color","rgb(230, 251, 245);");
		
		$.ajax({
			url : '/empo/auth/eMAU00F02ProjectDetail.do'
			, type : 'post' 
			, async : false
			, data : { "pjCode" : pjCode }
		}).done(function(res) {
			console.log(res.list)
			//auCode = res.list.auCode;
			pjYear = res.list.pjYear;
			$('#dataPjTitle').val(res.list.pjTitle);
			$('#dataPjYear').val(res.list.pjYear);
			$('#dataPjCode').val(res.list.pjCode);
			
			$("#resultPjYear").html(res.list.pjYear + "년");
			$("#resultPjTitle").html(res.list.pjTitle);
			$("#resultPjCateName").html(res.list.pjCateName);
			$("#resultGrSumName").html(res.list.grSumName);
			
			/* if(res.list.pjUse == 1) {
				$('#use').prop('checked', true);
			} else {
				$('#unUse').prop('checked', true);
			} */
			$('#use').prop('checked', true);
			
			$('input[name="projectAuth"]').filter(function(index, row) {
				if( $(row).val() == res.list.auCode ) {
					$(row).prop('checked', true);
					return false;
				} else {
					$(row).prop('checked', false);
				}
			});
			
			$.post('/empo/auth/eMAU00F02projectAuthList.do', { "pjCode" : pjCode }).done(function(res) {
				if ( res.list.length > 0 ) {
					$('#noData').parents('tr').remove();
					res.list.forEach(function(row, index) {
						$('#authResultList').append(authListView(row));
					});	
				} else {
					if ($('#noData').length == 0) {
						$('#authResultList').append($('<tr><td id="noData" colspan="6">설정된 권한이 없습니다.</td></tr>'));
					} 
				}
				
			}).fail(function() {
				alert("실패");
			});
			
		}).fail(function() {
			alert("실패");
		})
	}
	
	$('#btnSave').click(function() {
		if (pjCode == "") {
			alert("사업을 먼저 선택하세요.");
			return false;
		}
		
		var paramArr = new Array();
		var pjUse = $('input[name="pjUse"]:checked').val();
		var checkAuCode = $('input[name="projectAuth"]:checked').val();
		
		var data = {
			"pjCode" : pjCode
			, "pjUse" : pjUse
			, "auCode" : checkAuCode
		}
		
		paramArr.push(data);
		
		$('.sb_style').each(function(index, row) {
			if ( $(row).hasClass('btn_blue') ) {
				$('.rowList').each(function(index, row) {
					var data2 = {
						"pjYear" : pjYear
						, "pjCode" : pjCode
						, "auCode" : $(row).find('[type=checkbox]').data('au_code')
						, "mbCode" : $(row).find('[type=checkbox]').data('mb_code')
					}
					
					paramArr.push(data2);
					console.log(paramArr);
				});
			}
		});
		console.log(paramArr);
		
		if (confirm("저장하시겠습니까?")) {
			$.ajax({
				url : "/empo/auth/projectUpdate.do"
				, type : 'post'
				, data : JSON.stringify(paramArr)
				, contentType : "application/json; charset=utf-8"
			}).done(function(res) {
				alert("저장되었습니다.");
				auCode = res.list.auCode
				$('.authBusList').each(function(index, row) { 
					if ($(row).data('pj_code') == pjCode) {
						if ( $('.rowList').length > 0 ) {
							if ( $(row).find('.isData').length == 0) {
								$(row).find('.createPopup').parent('td').remove();
								$(row).append($('<td class="subRow"><button type="button" class="btn_style03 btn_white isData">관리</button></td>'));	
							}
						}
						
						$(row).children('.subRow')[0].click();
					} 
				});
				
			}).fail(function() {
				
			});
		} else {
			return false;
		}
		
	});
	
	$(function() {
		$(document).on("click", ".subRow", select);
		$(document).on( 'click', '.createPopup', createPopup );
		$("#btnUserUpdate").click( update );
		initList();
		
	});
	
	var toggle = function() {
		//console.log($(this));

		var c1 = $(this).attr("class");
		c1 = c1.replace("authBusList", "");
		c1 = $.trim(c1);
		//console.log(c1);

		$.each($(".authBusList"), function(index, item) {
			var c2 = $(this).attr("class");
			c2 = c2.replace("authBusList", "");
			c2 = $.trim(c2);
			//console.log(c2);

			if (c2.indexOf(c1) > -1 && c2.length == (c1.length+2)) {
				var obj = $("."+c2);

				if (obj.css("display") == "none") {
					obj.css("display","");
					
					if (c1.length == 9) {
						$("."+c1).find(".text_l").find("span").removeClass("icon_off01");
						$("."+c1).find(".text_l").find("span").addClass("icon_on01");
					} else {
						$("."+c1).find(".text_l").find("span").removeClass("icon_off02");
						$("."+c1).find(".text_l").find("span").addClass("icon_on02");
					}

				} else {
					obj.css("display","none");

					$.each($(".authBusList"), function(index, item) {
						var c3 = $(this).attr("class");
						c3 = c3.replace("authBusList", "");
						c3 = $.trim(c3);
						//console.log(c3);

						if (c3.indexOf(c2) > -1 && c3.length == (c2.length+2)) {
							var obj = $("."+c3);
							obj.css("display","none");

							$("."+c2).find(".text_l").find("span").removeClass("icon_on02");
							$("."+c2).find(".text_l").find("span").addClass("icon_off02");
						}

					});
					
					
					if (c1.length == 9) {
						$("."+c1).find(".text_l").find("span").removeClass("icon_on01");
						$("."+c1).find(".text_l").find("span").addClass("icon_off01");
					} else {
						$("."+c1).find(".text_l").find("span").removeClass("icon_on02");
						$("."+c1).find(".text_l").find("span").addClass("icon_off02");
					}
				}
			}

		});
	}
	
	
	var i1 = 1;
	var i2 = 1;
	var rowData = "" ;
	var ListView = function(row, index) {
		var data = "";
		if ( row.pjAuId == null) {
			data = 
				'<tr data-pj_code="' + row.pjCode + '" class="authBusList busList0' + i1 + '0' + i2 + '0' +  (index+1) + '">' +
				'	<td class="text_l icon_arrow02 subRow">' + row.pjTitle + '</td>' +
				'	<td><button type="button" class="btn_style03 btn_red createPopup">등록</button></td>' +
				'</tr>' ;
		} else {
			data = 
				'<tr data-pj_code="' + row.pjCode + '" class="authBusList busList0' + i1 + '0' + i2 + '0' +  (index+1) + '">' +
				'	<td class="text_l icon_arrow02 subRow">' + row.pjTitle + '</td>' +
				'	<td class="subRow"><button type="button" class="btn_style03 btn_white isData">관리</button></td>' +
				'</tr>' ;
		}
		i1 = i1 + 1;
		i2 = i2 + 1;
		
		return $(data);
			
		/* if (rowData == row) {
			rowData = row
			return "";
		} else {
			rowData = row
			console.log(row);
			if (row.pjOrderBy == 1) {
				i1 = i1 + 1;
				i2 = 0;
				var data = 
					'<tr class="authBusList busList0' + (index+1) + '"> ' + 
					'	<td class="text_l"><span class="step_icon icon_off01"></span>' + row.pjCateName1 + '</td>' + 
					//'	<td><button type="button" class="btn_style03 btn_white">관리</button></td>' + 
					'<td></td>' +
					'</tr>' ;
				return $(data);
			} else if (row.pjOrderBy == 2) {
				i2 = i2 + 1;
				var data = 
					'<tr class="authBusList busList0' + i1 + '0' + (index+1) + '" style="display:none;"> ' + 
					'	<td class="text_l icon_arrow"><span class="step_icon icon_off02"></span>' + row.pjCateName1 + '</td>' +
					//'	<td><button type="button" class="btn_style03 btn_white">관리</button></td>' + 
					'<td></td>' +
					'</tr>' ;
				return $(data);
			} else {
				var data ;
				if ( row.pjAuId == null) {
					data = 
						'<tr data-pj_code="' + row.pjCateCode1 + '" class="authBusList busList0' + i1 + '0' + i2 + '0' +  (index+1) + '" style="display:none;">' +
						'	<td class="text_l icon_arrow02 subRow">' + row.pjCateName1 + '</td>' +
						'	<td><button type="button" class="btn_style03 btn_red createPopup">등록</button></td>' +
						'</tr>' ;
				} else {
					data = 
						'<tr data-pj_code="' + row.pjCateCode1 + '" class="authBusList busList0' + i1 + '0' + i2 + '0' +  (index+1) + '" style="display:none;">' +
						'	<td class="text_l icon_arrow02 subRow">' + row.pjCateName1 + '</td>' +
						'	<td class="subRow"><button type="button" class="btn_style03 btn_white isData">관리</button></td>' +
						'</tr>' ;
				}
				
				return $(data);
			}
		} */
	}
	
	// 사업별 Tree 형식 목록
	var getTree = function (projectTree) {
		projectTree.forEach( function( row, index ) {
			row.subs = [];  
		    if (row.pjCateCodeP1 != "00000") { 
		    	console.log(index)	
		    	console.log(row)
		    	projectTree.forEach(function(obj) {
		    		if (obj.pjCateCode1 == row.pjCateCodeP1) {
		    			parentRow = obj;
		    			console.log(parentRow);
		    			console.log(parentRow.subs);
		    			if (parentRow.subs == undefined) {
		    				parentRow.subs = [];
		    			} else {
		    				parentRow.subs.push(row);
		    			}
		    		}
		    	});
		    	//var parentRow = projectTree.find(obj => obj.pjCateCode1 == row.pjCateCodeP1);
		    	//if(parentRow){
		    	//	parentRow.subs.push(row);
		    	//}
		    	
		    } 
		});
		parentProject = [];
		projectTree.filter(function(row, index) {
			console.log(row);
			if (row.pjCateCodeP1 == "00000") {
				parentProject.push(row);
			}
		});
		console.log(parentProject);
		return parentProject;
		
		//return projectTree.filter(obj => obj.pjCateCodeP1 == '00000');
	}
	
	var rowData1 = "";
	// 사업별 Tree 형식 목록 View
	var addSubs = function(parentTbody, subs) {
		subs.forEach(function(row, index) {
			if (rowData1 == row) {
				rowData1 = row;
				return "";
			} else {
				rowData1 = row;
				parentTbody.append(ListView(row, index));
				console.log(row);
				if (row.subs.length > 0) {
					addSubs(parentTbody, row.subs);
				}
			}
			
			
		});
	}
	
	var initList = function() {
		
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
		
		var url = '/empo/auth/eMAU00F02projectList.do';
		$.ajax({
			url: url
			, type: 'post'
			, data : {
				"pjYear" : $("#pjYear").val()
			}
		}).done(function(res) {
			console.log(res.list);
			res.list.forEach(function(row, index) {
				$('#resultList').append(ListView(row, index));
			});
			//var subs = getTree(res.list);
			//addSubs( $('#resultList'), subs);
			
			// 사업목록 커서
			$(".authBusList > td").css("cursor","pointer");
			// 사업목록 클릭에 따라 하위 사업 목록 open, close 이벤트
			$(".authBusList").click( toggle );
		}).fail(function(){
			alert("실패");
		});
	}
	
})();
	
</script>
</html>
