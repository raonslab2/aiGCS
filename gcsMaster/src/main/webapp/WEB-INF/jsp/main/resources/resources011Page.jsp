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
						<li><a href="<c:url value='/empo/resources/eMAU00C01Main.do'/>" class="active">분과구성 현황</a></li>
						<li><a href="<c:url value='/empo/resources/eMAU00C02Main.do'/>">가용자원 조회(간사, 평가장)</a></li>
						<li><a href="<c:url value='/empo/resources/eMAU00C03Main.do'/>">가용자원 조회(평가장) 삭제예정</a></li>
					</ul>
				</div>
				
				<div class="btn_guide ar mt-65 mb30">
					<button type="button" class="btn_style01 btn_white" id="btnList" >목록</button>
					<button type="button" class="btn_style01 btn_blue" id="btnSave">저장</button>
				</div>
				<!-- s :content_col2 -->
				<form id="searchForm1" name="searchForm1" method="post">
				<div class="content_col2 bg">
					<div class="bbs_write01">
						<ul>
							<li><span>사업명</span>
								
								<select id="pjYear" name="pjYear">
								</select>
						
								<span class="search_box03 input_w60">
									<input type="text" id="searchName" name="searchName" placeholder="사업명을 입력하세요." value="">
									<button type="button" id="commonSearch" name="commonSearch" class="btn_search01">검색</button>
								</span>
								<span id="authLi"></span>
								
							</li>

							<li><span>평가구분</span>
							<select id="groupPart1" name="groupPart1" class="input_w26">
								<option id="groupPart1_1" value="-">선택해 주세요.</option> 
							</select>
							</li>

							<li><span>평가종류</span>
							<select class="input_w40" id="searchVuDiCode" name="searchVuDiCode">
								<option id="searchVuDiCode1" value="-">선택해 주세요.</option> 
							</select>
							</li>
							<li><span>평가시작</span>
							<input type="text" class="inputCalendar input_w30" name="vuDayStart" id="vuDayStart" >
							</li>
							<li><span>평가시작시간</span>
							<input type="text" class="input_w30 ac timepicker" name="vuDayStartTime" id="vuDayStartTime" value="10:00">
							</li>
							<li><span>평가종료일</span>
							<input type="text" class="inputCalendar input_w30" name="vuDayEnd" id="vuDayEnd" >
							</li>
							<li><span>평가종료시간</span>
							<input type="text" class="input_w30 ac timepicker" name="vuDayEndTime" id="vuDayEndTime" value="16:00">
							</li>
						</ul>
						<div class="btn_guide ar mt20">
							<button type="button" class="btn_style05 btn_red" id="btnCommonSave" name="btnCommonSave">공통정보 저장</button>
						</div>
						<!-- e :btn_guide -->
					</div>
					<!-- e :bbs_write01 -->
					
					<div class="bbs_write01">
                        <p class="text_type01">* 공통정보 입력 후 [공통정보 저장]버튼을 클릭하시면 아래정보를 등록하실 수 있습니다.</p>
                        <ul>

                            <li class="liCategoryView" style="display:none;">
                            	 <!--
                            	<span>분과위원회명</span>
								중소기업기술혁신개발사업(수출지향형) 1차 서면평가 위원회
                                <div class="ar mt-30">
                                    <button type="button" class="btn_style01 btn_gray" id="btnCategoryReSelect">다시 선택</button>
                                </div>
                                  -->
                            </li> 

							<!-- 분과위원회명 다시 선택 버튼 클릭 후 -->
                            <li class="liCategoryList"><span>분과위원회명</span>
								 <ul class="data_box01" id="liCategorySelect">
								 <!-- 
									<li><label><input type="checkbox" name="chkCategory"> 산업기술분류1</li></label>
									<li><label><input type="checkbox" name="chkCategory"> 산업기술분류2</li></label>
									<li><label><input type="checkbox" name="chkCategory"> 산업기술분류3</li></label>
									<li><label><input type="checkbox" name="chkCategory"> 산업기술분류4</li></label>
									<li><label><input type="checkbox" name="chkCategory"> 산업기술분류5</li></label>
									<li><label><input type="checkbox" name="chkCategory"> 산업기술분류6</li></label>
									<li><label><input type="checkbox" name="chkCategory"> 산업기술분류7</li></label>
									 -->
								</ul> 
                            </li> 
                            <li class="liCategorySelect">
                                <div class="ar">
                                    <button type="button" class="btn_style01 btn_gray" id="btnCategorySelect">선택</button>
                                </div>

                                <div class="result_box" id="categoryList" style="display:none;">
                                    <!-- <ul>
                                        <li><label><input type="checkbox"> 중소기업기술혁신개발사업(수출지향형) 1차 서면평가 위원회(기계소재)</li></label>
                                    </ul> -->
                                </div>
                            </li>


                            <li class="liPlaceView" style="display:none;">
                            	<!-- <span>평가장 선택</span>
								501호
                                <div class="ar mt-30">
                                    <button type="button" class="btn_style01 btn_gray" id="btnPlaceReSelect">다시 선택</button>
                                </div> -->
                            </li>

							<!-- 평가장 다시 선택 버튼 클릭 후 -->
                            <li class="liPlaceSelect"><span>평가장 선택</span>
								
								<span class="search_box03 input_w70">
									<input type="text" id="searchPlace" name="searchPlace" placeholder="평가장을 입력하세요.">
									<button type="button" class="btn_search01 btnPlaceSearch" >검색</button>
								</span>
								<button type="button" class="btn_style01 btn_gray btnPlaceSearch"  id="btnPlaceSearch">평가장 조회</button>
								<button type="button" class="btn_style01 btn_gray" id="btnPlaceSave" style="display:none;">평가장 저장</button>
                               
								
								<div class="result_box sbox_h120 scroll" id="placeList" style="display:none;">
                                   <!-- <ul class="data_list01">
                                        <li><input type="radio" name="place"> 501호</li>
                                        <li><span class="yes">가능</span> 가능 <span>불가능</span> 불가능</li>
                                        <li>본원</li>
                                    </ul>
                                    <ul class="data_list02">
                                        <li><input type="radio" name="place"> 직접입력 <input type="text" class="input_w70"></li>
                                    </ul> -->
                                </div>
                          <span id="placeNone">
                          </span>
							
							</li> 

                            <li class="liChargeView" style="display:none;">
                            	<!--<span>담당간사</span>
								 홍길순(창업성장사업실 책임)
                                <div class="ar mt-30">
                                    <button type="button" class="btn_style01 btn_gray" id="btnChargeReSelect">다시 선택</button>
                                </div> -->
                            </li>

							<!-- 담당간사 다시 선택 버튼 클릭 후 -->
                            <li class="liChargeSelect"><span>담당간사</span>
								<select id="groupPart3" name="groupPart3" class="input_w26">
									<option value="">전체</option>
								</select>
									
								<select id="groupPart4" name="groupPart4" class="input_w26">
									<option value="">전체</option>
								</select>
								<span class="search_box03 input_w40" style="margin-top:10px;">
									<input type="text" id="searchCharge" name="searchCharge" placeholder="담당간사를 입력하세요.">
									<button type="button" class="btn_search01 btnChargeSearch">검색</button>
								</span>
								<button type="button" class="btn_style01 btn_gray btnChargeSearch" id="btnChargeSearch">간사 조회</button>
								<button type="button" class="btn_style01 btn_gray" id="btnChargeSave" style="display:none;">간사 저장</button>

                                <div class="result_box sbox_h150 scroll" id="chargeList" style="display:none;">
                                    <!-- <ul class="data_list02">
                                        <li><input type="radio"> 홍길순 (창업성장사업실, 책임)</li>
                                        <li><input type="radio"> 홍길동 (창업성장사업실, 선임)</li>
                                        <li><input type="radio"> 김영희 (창업성장사업실, 책임)</li>
                                        <li><input type="radio"> 박철수 (창업성장사업실, 주임)</li>
                                        <li><input type="radio"> 홍길순 (창업성장사업실, 책임)</li>
                                        <li><input type="radio"> 김영희 (창업성장사업실, 책임)</li>
                                    </ul> -->
                                </div>
                                <span id="memberNone">
                         		 </span>
                            </li>
                        </ul>
                    </div>
					<!-- e :bbs_write01 -->
				</div>
				</form>
				<!-- e :content_col2 -->
				
			</div>
			<!-- e :contents_guide -->
		</div>
		<!-- e :right_guide -->
	</div>
	<!-- e :wrap -->
</body>
<script>
;(function() {
	var pjYear = "";
	var pjCode = "";
	var paPk = "";
	var pjTitle = "";
	var vuReTitle = "";
	var vuDayStart = "";
	var vuDayStartTime = "";
	var vuDayEnd = "";
	var vuDayEndTime = "";
	var allSave = "";

	// 목록 버튼
	$("#btnList").click(function() {
		alert("정보저장 확인(공통알럿)");
		window.location.href = "<c:url value='/empo/resources/eMAU00C01Main.do'/>";
	});
	
	// 담당간사 검색 옵션
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

	// 분과위원회명 선택 버튼
	$("#btnCategorySelect").click(function() {
		$('.categoryUl').remove();
		$("#categoryList").css("display", "none");

		if (paPk == "") {
			alert("공통정보 저장 해주세요");
			return false;
		}
		
		if ($("input[name=chkCategory]:checkbox:checked").length == 0) {
			alert("분류를 선택하세요.");
			return false;
		} 
		
		$("#categoryList").css("display", "");
		
		$('input[name="chkCategory"]').filter(function(index, row) {
			if($(row).is(":checked")) {
				$("#categoryList").append($("<ul class='categoryUl'><li><label><input type='checkbox' class='checkField' data-co_cate_code='" + $(row).val() + "'> " + pjTitle + " " + vuReTitle + " 위원회(" + $(row).parent().text() + ")</li></label></ul>"));
			}
		});
		
	});
	
	var placeListView = function(row) {
		var data ;
			if (row.pjState == "0") {
				data = 
					'<ul class="data_list01 placeUseList">' + 
					'	<li><input type="radio" name="place" disabled> ' + row.emVuTitle + '</li>' +
					'	<li><span>불가능</span> 불가능</li>' +
					'   <li>' + row.arAddrName + '</li>' +
					'</ul>' ;
			} else {
				data = 
					'<ul class="data_list01 placeUseList">' + 
					'	<li><input type="radio" name="place" value="' + row.emVuPk + '" data-em_vu_title="' + row.emVuTitle + '"> ' + row.emVuTitle + '</li>' +
					'	<li><span class="yes">가능</span> 가능 </li>' +
					'   <li>' + row.arAddrName + '</li>' +
					'</ul>' ;
			}
		
		return $(data);
	}
	
	// 평가장 조회
	$(".btnPlaceSearch").click(function() {
	   	
		if (vuDayStart != $("#vuDayStart").val()) {
			alert("공통정보 저장 해주세요");
			return false;
		}
		if (vuDayEnd != $("#vuDayEnd").val()) {
			alert("공통정보 저장 해주세요");
			return false;
		}
		if (vuDayStartTime != $("#vuDayStartTime").val()) {
			alert("공통정보 저장 해주세요");
			return false;
		}
		if (vuDayEndTime != $("#vuDayEndTime").val()) {
			alert("공통정보 저장 해주세요");
			return false;
		}
		
		if (paPk == "") {
			alert("공통정보 저장 해주세요");
			return false;
		}
		
		var searchPlace = $("#searchPlace").val();
		if ($.trim(searchPlace).length < 1) {
			alert("평가장 검색어를 입력하세요.");
			$("#searchPlace").focus();
			return false;
		}
		else {
			$.post("/empo/resource/searchPlaceList.do", { "pjCode" : pjCode , "pjYear" : pjYear, "emVuTitle" : searchPlace } ).done(function(res) {
				console.log(res.list);
				$("#placeList").css("display", "");
				$("#btnPlaceSearch").css("display", "none");
				$("#btnPlaceSave").css("display", "");
				$(".placeUseList").remove();
				
				res.list.forEach(function(row, index) {
					$("#placeList").append(placeListView(row));
				});
				$("#placeList").append($('<ul class="data_list02 placeUseList"><li><input type="radio" name="place" id="inputPlaceRadio" value="0"> 직접입력 <input type="text" class="input_w70" id="inputPlace"></li></ul>'));
			});
		}
	});
	
	var btnPlaceSave = function() {
		var emVuPk = $('input[name="place"]:checked').val();
		
		var emVuTitle = "";
		
		if (emVuPk == "0") {
			emVuTitle = $("#inputPlace").val();
		} else {
			emVuTitle = $('input[name="place"]:checked').data("em_vu_title");
		}
		
		var startDate = new Date(vuDayStart);
	   	var endDate = new Date(vuDayEnd);
	   	
	   	var timeStampStart = startDate.getTime();
	   	var timeStampEnd = endDate.getTime();
	   	
	   	var resDate = [];
	   	if ( timeStampStart > timeStampEnd ) {
	   		alert("기간이 맞지 않습니다.");
	   		return false;
	   	} else if ( timeStampStart == timeStampEnd ) {
	   		var dateStart = vuDayStart + ' ' + vuDayStartTime;
			var dateEnd = vuDayEnd + ' ' + vuDayEndTime;
			
			for (var i = 0; i < 2; i++) { 
				if (i == 0) {
					data = {
						"paPk" : paPk
						, "pjYear" : pjYear
						, "pjCode" : pjCode
						, "emVuPk" : emVuPk
						, "emVuTitle" : emVuTitle
						, "paUseDay" : dateStart
					}	
					resDate.push(data);
					
				} else {
					data = {
						"paPk" : paPk
						, "pjYear" : pjYear
						, "pjCode" : pjCode
						, "emVuPk" : emVuPk
						, "emVuTitle" : emVuTitle
						, "paUseDay" : dateEnd
					}	
					resDate.push(data);
					
				}
			}
			
			console.log(resDate);
	   	} else {
	   		while(startDate.getTime() <= endDate.getTime()) {
				var mon = (startDate.getMonth()+1);
	  			mon = mon < 10 ? '0'+mon : mon;
	  			var day = startDate.getDate();
	  			day = day < 10 ? '0'+day : day;
	  			var paUseDay = "";
	  			
				if (timeStampStart == startDate.getTime()) {
					paUseDay = startDate.getFullYear() + '-' + mon + '-' +  day + ' ' + vuDayStartTime;
					data = {
							"paPk" : paPk
							, "pjYear" : pjYear
							, "pjCode" : pjCode
							, "emVuPk" : emVuPk
							, "emVuTitle" : emVuTitle
							, "paUseDay" : paUseDay
						}	
					resDate.push(data);
					
				} else if (timeStampEnd == startDate.getTime()) {
					paUseDay = startDate.getFullYear() + '-' + mon + '-' +  day + ' ' + vuDayEndTime;
					data = {
							"paPk" : paPk
							, "pjYear" : pjYear
							, "pjCode" : pjCode
							, "emVuPk" : emVuPk
							, "emVuTitle" : emVuTitle
							, "paUseDay" : paUseDay
						}	
					resDate.push(data);
					
				} else {
					paUseDay = startDate.getFullYear() + '-' + mon + '-' +  day + ' 00:00';
					data = {
							"paPk" : paPk
							, "pjYear" : pjYear
							, "pjCode" : pjCode
							, "emVuPk" : emVuPk
							, "emVuTitle" : emVuTitle
							, "paUseDay" : paUseDay
						}	
					resDate.push(data);
					
				}
				
				startDate.setDate(startDate.getDate() + 1);
	   		}
	   	}
	   	if ( resDate.length > 0 ) {
			$.ajax({
				url : "/empo/resource/placeSave.do"
				, type : 'post'
				, data : JSON.stringify(resDate)
				, async : false
				, contentType : "application/json; charset=utf-8"
			}).done(function(res) {
				if (allSave != "allSave") {
					alert("저장되었습니다.");
				}
				
				var dataMap = { "emVuTitle" : emVuTitle };
				
				if ( emVuPk != undefined ) {
					$(".liPlaceView").html("");
					$(".liPlaceView").css("display", "");
					$(".liPlaceSelect").css("display", "none");
					$(".liPlaceView").append(placeDataListView(dataMap));
						
					$("#btnPlaceReSelect").click(function() {
						$(".liPlaceView").css("display", "none");
						$(".liPlaceSelect").css("display", "");
					}) ;	
				}
			}).fail(function() {
				alert("실패");
			});
		}
	}
	
	$("#btnPlaceSave").click(function() {
		if (vuDayStart != $("#vuDayStart").val()) {
			alert("공통정보 저장 해주세요");
			return false;
		}
		if (vuDayEnd != $("#vuDayEnd").val()) {
			alert("공통정보 저장 해주세요");
			return false;
		}
		if (vuDayStartTime != $("#vuDayStartTime").val()) {
			alert("공통정보 저장 해주세요");
			return false;
		}
		if (vuDayEndTime != $("#vuDayEndTime").val()) {
			alert("공통정보 저장 해주세요");
			return false;
		}
		if (paPk == "") {
			alert("공통정보 저장 해주세요");
			return false;
		}

		var emVuPk = $('input[name="place"]:checked').val();
		
		if ( emVuPk == undefined ) {
			alert("저장할 평가장을 선택하세요.");
			return false;
		} else {
			btnPlaceSave();
		}
		
	});
	
	
	var memberListView = function(row) {
		console.log(row)
		var data = 
			"<ul class='data_list02 memberList'>" +
			"<li><input type='radio' data-mb_name='" + row.mbName + "' data-grm_name='" + row.grMName + "' data-mb_rank_name='" + row.mbRName + "' name='member' value='" + row.mbCode + "'> " + row.mbName + '('+ row.grMName + ',' + row.mbRName +')'+"</li>" + 
			"</ul>" ;
		return $(data);
	} 
	
	// 간사 조회
	$(".btnChargeSearch").click(function() {
		if (vuDayStart != $("#vuDayStart").val()) {
			alert("공통정보 저장 해주세요");
			return false;
		}
		if (vuDayEnd != $("#vuDayEnd").val()) {
			alert("공통정보 저장 해주세요");
			return false;
		}
		if (vuDayStartTime != $("#vuDayStartTime").val()) {
			alert("공통정보 저장 해주세요");
			return false;
		}
		if (vuDayEndTime != $("#vuDayEndTime").val()) {
			alert("공통정보 저장 해주세요");
			return false;
		}
		
		if (paPk == "") {
			alert("공통정보 저장 해주세요");
			return false;
		}
		
		var searchCharge = $('#searchCharge').val();
		if ($.trim(searchCharge).length < 1) {
			alert("담당간사 검색어를 입력하세요.");
			$("#searchCharge").focus();
			return false;
		} else {
			var groupPart1 = $('#groupPart3 option:selected').val();
			var groupPart2 = $('#groupPart4 option:selected').val();
			
			var data = {
				"groupPart1" : groupPart1
				, "groupPart2" : groupPart2
				, "searchMemberName" : searchCharge
			}
			
			$.post('/empo/resources/searchMemberList.do', data).done(function(res) {
				$(".memberList").remove();
				console.log(res.list);
				if (res.list.length > 0) {
					$("#chargeList").css("display", "");
					$("#btnChargeSearch").css("display", "none");
					$("#btnChargeSave").css("display", "");
					
					res.list.forEach(function(row, index) {
						$('#mCSB_2_container').append(memberListView(row));
					});
				} else {
					$("#chargeList").css("display", "none");
				}
				
			}).fail(function() {
				alert("실패");
			});
		}
	});
	
	var btnChargeSave = function() {
		var mbCode = $('input[name="member"]:checked').val();
		var mbName = $('input[name="member"]:checked').data('mb_name');
		var grmName = $('input[name="member"]:checked').data('grm_name');
		var mbRankName = $('input[name="member"]:checked').data('mb_rank_name');
		
		$.ajax({
			url : "/empo/resource/memberSave.do" 
			, type : "post"
			, data : { "paPk": paPk, "mbCode" : mbCode }
			, async : false
		}).done(function() {
			if (allSave != "allSave") {
				alert("저장되었습니다.");
			}
			
			var dataMap = { "mbName" : mbName, "grmName" : grmName , "mbRankName" : mbRankName };
			if ( mbCode != undefined ) {
				$(".liChargeView").html("");
				$(".liChargeView").css("display", "");
				$(".liChargeSelect").css("display", "none");
				
				$(".liChargeView").append(memberDataListView(dataMap));

				// 담당간사 다시선택 버튼
				$("#btnChargeReSelect").click(function() {
					$(".liChargeView").css("display", "none");
					$(".liChargeSelect").css("display", "");
				}) ;
			} 
			
		});
	}
	
	$("#btnChargeSave").click(function() {
		var mbCode = $('input[name="member"]:checked').val();
		if ( mbCode == undefined ) {
			alert("저장할 간사를 선택하세요.");
			return false;
		} else {
			btnChargeSave();	
		}
	});
	
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
	
	$("#searchPlace").autocomplete({
		source : function(request, response) {
			$.post("/empo/resource/placeAutocomplete.do", {
				"emVuTitle" : $("#searchPlace").val()
			}).done(function(res) {
				console.log(res.list)
				var list = [];
				res.list.forEach(function(row) {
					list.push(row.emVuTitle);
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
	
	//사업명 검색 자동완성 기능
	$("#searchName").autocomplete({
		source : function(request, response) {
			$.post('/empo/auth/searchProjectAutocomplete.do', { 
				"pjYear" : $('#pjYear').val()
				, "pjTitle" : $('#searchName').val() 
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
	
	var businessListView = function(row) {
		console.log(row);
		var data = 	"<li class='selectRow' style='margin: 10px;' data-pj_code1='"+ row.pjCode +"'>" +
					/* "<button type='button' class='btn_style02 sb_style  btn_white authButton' data-pj_year='" + row.pjYear + "' data-pj_code='"+ row.pjCode + "'data-pj_title='"+ row.pjTitle + "'data-pj_year='"+ row.pjYear  + "'data-pj_vu_day_start='"+ row.vuDayStart + "'data-pj_vu_day_end='"+ row.vuDayEnd + "'data-pj_vu_di_code='"+ row.vuDiCode + "'data-pj_vu_re_code='"+ row.vuReCode +  "'data-pa_pk='"+ row.paPk +  "'>" + row.pjTitle + "</button>"+ */
					"<button type='button' class='btn_style02 sb_style  btn_white authButton' data-pj_year='" + row.pjYear + "' data-pj_code='"+ row.pjCode + "'>" + row.pjTitle + "</button>"+
					"</li>" ;
					
		return $(data);
	};
	
	$('#commonSearch').click(function() {
		var pjYear = $('#pjYear option:selected').val();
		var pjTitle = $('#searchName').val();
		
		var data = {
			"pjYear" : pjYear
			, "pjTitle" : pjTitle
		}
		
		$.post('/empo/auth/eMAU00F01SearchProject.do', data).done(function(res) {
			$('.selectRow').remove();
			console.log(res);
			res.list.forEach(function(row, index) {
				$('#authLi').append(businessListView(row));
			});
			
		}).fail(function() {
			alert("실패");
		});
	});
	
	
	var placeDataListView = function(row) {
		var data = 
			'<span>평가장 선택</span>' +	
			row.emVuTitle +
			'<div class="ar mt-30">' +
			'<button type="button" class="btn_style01 btn_gray" id="btnPlaceReSelect">다시 선택</button>' +
			'</div>' ;
		return $(data);
	}
	
	var memberDataListView = function(row) {
		var data =
			'<span>담당간사</span>' +
			row.mbName + '(' + row.grmName + ', ' + row.mbRankName + ')' +
			'<div class="ar mt-30">' +
			'<button type="button" class="btn_style01 btn_gray" id="btnChargeReSelect">다시 선택</button>' +
			'</div>' ;
			
		return $(data);
	}
	
	$(document).on("click", ".authButton", function() {
		$(".categoryUl").remove();
		$("#categoryList").css("display", "none");
		$(".placeUseList").remove();
		$("#placeList").css("display", "none");
		$(".memberList").remove();
		$("#chargeList").css("display", "none");
		
		if ( $('.authButton').length > 0 ) {
			$('.authButton').each(function(index, row) {
				$(this).removeClass("btn_blue");
				$(this).addClass("btn_white");
			});	
		}
		
		$(this).removeClass("btn_white");
		$(this).addClass("btn_blue");
		pjYear = $(this).data('pj_year');
		pjCode = $(this).data('pj_code');
		
		var data = {
			"pjYear" : pjYear
			, "pjCode" : pjCode
		}
		$.post("/empo/resource/paDataDetail.do", data).done(function(res) {
			console.log(res.list);
			if (res.list != null) {
				paPk = res.list.paPk;
				pjTitle = res.list.pjTitle; 
				vuReTitle = res.list.vuReTitle;
				
				vuDayStart = new Date(res.list.vuDayStart);
				vuDayStartTime = ("0" + vuDayStart.getHours()).slice(-2) + ":" + ("0" + vuDayStart.getMinutes()).slice(-2);
				vuDayStart = vuDayStart.getFullYear() + "." + ("0" + (vuDayStart.getMonth()+1)).slice(-2) + "." + ("0" + vuDayStart.getDate()).slice(-2);
				
				console.log(vuDayStartTime);
				
				vuDayEnd = new Date(res.list.vuDayEnd);
				vuDayEndTime = ("0" + vuDayEnd.getHours()).slice(-2) + ":" + ("0" + vuDayEnd.getMinutes()).slice(-2);
				vuDayEnd = vuDayEnd.getFullYear() + "." + ("0" + (vuDayEnd.getMonth()+1)).slice(-2) + "." + ("0" + vuDayEnd.getDate()).slice(-2);
				
				$('#vuDayStart').val(vuDayStart);
				$('#vuDayEnd').val(vuDayEnd);
				$('#vuDayStartTime').val(vuDayStartTime);
				$('#vuDayEndTime').val(vuDayEndTime);
				
				$('.inputCalendar').each(function(index) {
			        var thisData = $(this).val();

			        if ($.trim(thisData).length > 0) {
				        var date = new Date(thisData); // 화면에 표시되는 날짜 형태에 따라 변환
				            
				        $(this).data('datepicker').selectDate(new Date(date.getFullYear(), date.getMonth(), date.getDate()));
			    	}
				});
				
				$('#groupPart1').children().filter(function(index, row1) {
					if( res.list.vuReCode == $(row1).val()) {
						$(row1).prop("selected", true);
						$('#searchVuDiCode').children('option:not(:first)').remove();
						
						$.get( '/empo/resources/searchEmPjDiCode.do' ).done(function(result) {
							result.list.forEach( function(row, index) {
								var option = $('<option value="'+ row.vuDiCode +'">'+ row.vuDiTitle +'</option>');
								$('#searchVuDiCode').append(option);
							});
							
							$('#searchVuDiCode').children().filter(function(index, row2) {
								if( res.list.vuDiCode == $(row2).val()) {
									$(row2).prop("selected", true);
								}   
							});
							
						});
					}   
		 		});
				
				if(res.list.mbCode != null) {
					$(".liChargeView").html("");
					$(".liChargeView").css("display", "");
					$(".liChargeSelect").css("display", "none");
					
					$(".liChargeView").append(memberDataListView(res.list));

					// 담당간사 다시선택 버튼
					$("#btnChargeReSelect").click(function() {
						$(".liChargeView").css("display", "none");
						$(".liChargeSelect").css("display", "");
					}) ;
					 
				} else {
					$(".liChargeView").css("display", "none");
					$(".liChargeSelect").css("display", "");
				}
				
				if (res.list.emVuTitle != null) {
					$(".liPlaceView").html("");
					$(".liPlaceView").css("display", "");
					$(".liPlaceSelect").css("display", "none");
					$(".liPlaceView").append(placeDataListView(res.list));
					
					$("#btnPlaceReSelect").click(function() {
						$(".liPlaceView").css("display", "none");
						$(".liPlaceSelect").css("display", "");
					}) ;
				} else {
					$(".liPlaceView").css("display", "none");
					$(".liPlaceSelect").css("display", "");
				}
				
				$.post("/empo/resource/coCateDetail.do", { "paPk" : paPk }).done(function(res) {
					console.log(res.list);
					if ( res.list.length > 0 ) { 
						$('.liCategoryList').css("display", "none");
						$('.liCategorySelect').css("display", "none");
						$('.liCategoryView').css("display", "");
					} else {
						$('.liCategoryList').css("display", "");
						$('.liCategorySelect').css("display", "");
						$('.liCategoryView').css("display", "none");
					}
				
					$(".liCategoryView").html('<span>분과위원회명</span>');
					res.list.forEach(function(row, index) {
						$(".liCategoryView").append(pjTitle + ' ' + vuReTitle + ' 위원회(' + row.coCateName + ')<div class="ar"></div>');
					});
					
					$(".liCategoryView").append('<div class="ar mt-30"><button type="button" class="btn_style01 btn_gray" id="btnCategoryReSelect">다시 선택</button></div>');
					
					// 분과위원회 다시선택 버튼
					$("#btnCategoryReSelect").click(function() {
						$('.liCategoryView').css("display", "none");
						$('.liCategoryList').css("display", "");
						$('.liCategorySelect').css("display", "");
					}) ;
				});
				
			} else {
				paPk = "";
				pjTitle = ""; 
				vuReTitle = "";
				
				$(".liChargeView").css("display", "none");
				$(".liChargeSelect").css("display", "");
				$(".liPlaceView").css("display", "none");
				$(".liPlaceSelect").css("display", "");
				$('.liCategoryList').css("display", "");
				$('.liCategorySelect').css("display", "");
				$('.liCategoryView').css("display", "none");
				
				$('#vuDayStart').val("");
				$('#vuDayEnd').val("");
				$('#vuDayStartTime').val("10:00");
				$('#vuDayEndTime').val("16:00");
				
				$('#groupPart1').children().filter(function(index, row) {
					if ( $(row).val() == "-" ) {
						$(row).prop('selected', true);
					}
				});
				
				$("#searchVuDiCode").children().filter(function(index, row) {
					if ( $(row).val() == "-" ) {
						$(row).prop('selected', true);
					}
				});
			}
		});
	});
	
	$("#groupPart1").change(function() {
		paPk = "";
		$('#searchVuDiCode').children('option:not(:first)').remove();
		
		$.get( '/empo/resources/searchEmPjDiCode.do' ).done(function(res) {
			console.log(res.list);
			res.list.forEach( function(row, index) {
				var option = $('<option value="'+ row.vuDiCode +'">'+ row.vuDiTitle +'</option>');
				$('#searchVuDiCode').append(option);
			});
		});
	});
	
	$("#searchVuDiCode").change(function() {
		paPk = "";
	});
	
	
	$("#btnCommonSave").click(function() {
		$(".categoryUl").remove();
		$("#categoryList").css("display", "none");
		$(".placeUseList").remove();
		$("#placeList").css("display", "none");
		$(".memberList").remove();
		$("#chargeList").css("display", "none");
		
		var vuReCode = $('#groupPart1').val();
		var vuDiCode = $('#searchVuDiCode').val();
		vuDayStart = $('#vuDayStart').val();
		vuDayEnd = $('#vuDayEnd').val();
		vuDayStartTime = $('#vuDayStartTime').val();
		vuDayEndTime = $('#vuDayEndTime').val();
		
		if (pjCode == "") {
			alert("사업을 먼저 선택하세요.");
			return false; 
		}
		
		if (vuReCode == "-") {
			alert("평가구분을 선택하세요.");
			return false;
		}
		
		if (vuDiCode == "-") {
			alert("평가종류를 선택하세요.");
			return false;
		}
		
		if (vuDiCode == "-") {
			alert("평가종류를 선택하세요.");
			return false;
		}
		
		if (vuDayStart == "") {
			alert("평가시작기간 선택하세요.");
			return false;
		}
		
		if (vuDayEnd == "") {
			alert("평가시작기간 선택하세요.");
			return false;
		}
		
		var vuDayStartSum = vuDayStart + " " + vuDayStartTime;
		var vuDayEndSum = vuDayEnd + " " + vuDayEndTime;
		
		var data = {
			"pjCode" : pjCode
			, "pjYear" : pjYear
			, "vuReCode" : vuReCode
			, "vuDiCode" : vuDiCode
			, "vuDayStart" : vuDayStartSum
			, "vuDayEnd" : vuDayEndSum
		};
		
		$.post("/empo/resources/commonResourceSave.do", data).done(function(res) {
			alert("공통정보 저장 프로세스");  
			console.log(res.list);
			paPk = res.list.paPk;
			pjTitle = res.list.pjTitle; 
			vuReTitle = res.list.vuReTitle;
			
		});
	});
	
	$("#btnSave").click(function() {
		if (vuDayStart != $("#vuDayStart").val()) {
			alert("공통정보 저장 해주세요");
			return false;
		}
		if (vuDayEnd != $("#vuDayEnd").val()) {
			alert("공통정보 저장 해주세요");
			return false;
		}
		if (vuDayStartTime != $("#vuDayStartTime").val()) {
			alert("공통정보 저장 해주세요");
			return false;
		}
		if (vuDayEndTime != $("#vuDayEndTime").val()) {
			alert("공통정보 저장 해주세요");
			return false;
		}
		if (paPk == "") {
			alert("공통정보 저장 해주세요");
			return false;
		}
		
		allSave = "allSave";

		var dataArray = new Array();
		$('.checkField').filter(function(index, row) {
			if ($(row).is(":checked")) {
				console.log($(row).data("co_cate_code"));
				var data = {
					"paPk" : paPk
					, "coCateCode" : $(row).data("co_cate_code")
				}
				
				dataArray.push(data);
			}
		});
		
		if(dataArray.length > 0) {
			$.ajax({
				url : "/empo/resource/coCateSave.do"
				, type : 'post'
				, data : JSON.stringify(dataArray)
				, contentType : "application/json; charset=utf-8"
			}).done(function(res) {
				console.log(res.list);
				if ( res.list.length > 0 ) { 
					$('.liCategoryList').css("display", "none");
					$('.liCategorySelect').css("display", "none");
					$('.liCategoryView').css("display", "");
				} else {
					$('.liCategoryList').css("display", "");
					$('.liCategorySelect').css("display", "");
					$('.liCategoryView').css("display", "none");
				}
			
				$(".liCategoryView").html('<span>분과위원회명</span>');
				res.list.forEach(function(row, index) {
					$(".liCategoryView").append(pjTitle + ' ' + vuReTitle + ' 위원회(' + row.coCateName + ')<div class="ar"></div>');
				});
				
				$(".liCategoryView").append('<div class="ar mt-30"><button type="button" class="btn_style01 btn_gray" id="btnCategoryReSelect">다시 선택</button></div>');
				
				// 분과위원회 다시선택 버튼
				$("#btnCategoryReSelect").click(function() {
					$('.liCategoryView').css("display", "none");
					$('.liCategoryList').css("display", "");
					$('.liCategorySelect').css("display", "");
				}) ;
			});
		}
		
		var emVuPk = $('input[name="place"]:checked').val();
		if ( emVuPk != undefined ) {
			btnPlaceSave();
		}
		
		var mbCode = $('input[name="member"]:checked').val();
		if ( mbCode != undefined ) {
			btnChargeSave();
		}
		
		alert("저장되었습니다.");
		allSave = "";
		
	});
	
	// 분과위원회 다시선택 버튼
	$("#btnCategoryReSelect").click(function() {
		$('.liCategoryView').css("display", "none");
		$('.liCategoryList').css("display", "");
		$('.liCategorySelect').css("display", "");
	}) ;
	

	// 평가장 다시선택 버튼
	$("#btnPlaceReSelect").click(function() {
		$(".liPlaceView").css("display", "none");
		$(".liPlaceSelect").css("display", "");
	}) ;
	

	// 담당간사 다시선택 버튼
	$("#btnChargeReSelect").click(function() {
		$(".liChargeView").css("display", "none");
		$(".liChargeSelect").css("display", "");
	}) ;
	
	var divisionListView = function(row) {
		console.log(row)
		var data = 
			"<li><label><input type='checkbox' name='chkCategory' value="+ row.coCateCode + "> "+ row.coCateName +" </li></label>" ;
			
		return $(data);
	}	
	
	$(function() {
		initList();
	});
	
	var initList = function(){
		var dt = new Date();
	    var com_year = dt.getFullYear();
	    if (location.search != "") {
	    	$.post('/empo/resources/searchOption.do').done(function(res) {
				res.list.forEach( function(row, index) {
					var option = $('<option value="'+ row.vuReCode +'">'+ row.vuReTitle +'</option>');
					$('#groupPart1').append(option);
				});
			});
	    	
	    	$('#pjYear').css('display', 'none');
	    	$('#commonSearch').css('display', 'none');
	    	
	    	var URLSearch = new URLSearchParams(location.search);
		    var newParam = URLSearch.toString();
		    console.log(newParam);
		    $.post("/empo/resource/paDataDetail.do", newParam).done(function(res) {
		    	$("#searchName").val(res.list.pjTitle);
		    	$("#searchName").prop('readonly', true);
				console.log(res.list);
				
				if (res.list != null) {
					pjYear = res.list.pjYear;
					pjCode = res.list.pjCode;
					paPk = res.list.paPk;
					pjTitle = res.list.pjTitle; 
					vuReTitle = res.list.vuReTitle;
					
					vuDayStart = new Date(res.list.vuDayStart);
					vuDayStartTime = ("0" + vuDayStart.getHours()).slice(-2) + ":" + ("0" + vuDayStart.getMinutes()).slice(-2);
					vuDayStart = vuDayStart.getFullYear() + "." + ("0" + (vuDayStart.getMonth()+1)).slice(-2) + "." + ("0" + vuDayStart.getDate()).slice(-2);
					
					console.log(vuDayStartTime);
					
					vuDayEnd = new Date(res.list.vuDayEnd);
					vuDayEndTime = ("0" + vuDayEnd.getHours()).slice(-2) + ":" + ("0" + vuDayEnd.getMinutes()).slice(-2);
					vuDayEnd = vuDayEnd.getFullYear() + "." + ("0" + (vuDayEnd.getMonth()+1)).slice(-2) + "." + ("0" + vuDayEnd.getDate()).slice(-2);
					
					$('#vuDayStart').val(vuDayStart);
					$('#vuDayEnd').val(vuDayEnd);
					$('#vuDayStartTime').val(vuDayStartTime);
					$('#vuDayEndTime').val(vuDayEndTime);
					
					$('.inputCalendar').each(function(index) {
				        var thisData = $(this).val();

				        if ($.trim(thisData).length > 0) {
					        var date = new Date(thisData); // 화면에 표시되는 날짜 형태에 따라 변환
					            
					        $(this).data('datepicker').selectDate(new Date(date.getFullYear(), date.getMonth(), date.getDate()));
				    	}
					});
					
					$('#groupPart1').children().filter(function(index, row1) {
						if( res.list.vuReCode == $(row1).val()) {
							$(row1).prop("selected", true);
							$('#searchVuDiCode').children('option:not(:first)').remove();
							
							$.get( '/empo/resources/searchEmPjDiCode.do' ).done(function(result) {
								result.list.forEach( function(row, index) {
									var option = $('<option value="'+ row.vuDiCode +'">'+ row.vuDiTitle +'</option>');
									$('#searchVuDiCode').append(option);
								});
								
								$('#searchVuDiCode').children().filter(function(index, row2) {
									if( res.list.vuDiCode == $(row2).val()) {
										$(row2).prop("selected", true);
									}   
								});
								
							});
						}   
			 		});
					
					if(res.list.mbCode != null) {
						$(".liChargeView").html("");
						$(".liChargeView").css("display", "");
						$(".liChargeSelect").css("display", "none");
						
						$(".liChargeView").append(memberDataListView(res.list));

						// 담당간사 다시선택 버튼
						$("#btnChargeReSelect").click(function() {
							$(".liChargeView").css("display", "none");
							$(".liChargeSelect").css("display", "");
						}) ;
						 
					} else {
						$(".liChargeView").css("display", "none");
						$(".liChargeSelect").css("display", "");
					}
					
					if (res.list.emVuTitle != null) {
						$(".liPlaceView").html("");
						$(".liPlaceView").css("display", "");
						$(".liPlaceSelect").css("display", "none");
						$(".liPlaceView").append(placeDataListView(res.list));
						
						$("#btnPlaceReSelect").click(function() {
							$(".liPlaceView").css("display", "none");
							$(".liPlaceSelect").css("display", "");
						}) ;
					} else {
						$(".liPlaceView").css("display", "none");
						$(".liPlaceSelect").css("display", "");
					}
					
					$.post("/empo/resource/coCateDetail.do", { "paPk" : paPk }).done(function(res) {
						console.log(res.list);
						if ( res.list.length > 0 ) { 
							$('.liCategoryList').css("display", "none");
							$('.liCategorySelect').css("display", "none");
							$('.liCategoryView').css("display", "");
						} else {
							$('.liCategoryList').css("display", "");
							$('.liCategorySelect').css("display", "");
							$('.liCategoryView').css("display", "none");
						}
					
						$(".liCategoryView").html('<span>분과위원회명</span>');
						res.list.forEach(function(row, index) {
							$(".liCategoryView").append(pjTitle + ' ' + vuReTitle + ' 위원회(' + row.coCateName + ')<div class="ar"></div>');
						});
						
						$(".liCategoryView").append('<div class="ar mt-30"><button type="button" class="btn_style01 btn_gray" id="btnCategoryReSelect">다시 선택</button></div>');
						
						// 분과위원회 다시선택 버튼
						$("#btnCategoryReSelect").click(function() {
							$('.liCategoryView').css("display", "none");
							$('.liCategoryList').css("display", "");
							$('.liCategorySelect').css("display", "");
						}) ;
					});
					
				}
			});
	    } else {
	    	$.post('/empo/resources/searchOption.do').done(function(res) {
				res.list.forEach( function(row, index) {
					var option = $('<option value="'+ row.vuReCode +'">'+ row.vuReTitle +'</option>');
					$('#groupPart1').append(option);
				});
			});
	    }
	    
		for (var y = (com_year - 5); y <= (com_year + 1); y++) {
			$("#pjYear").append("<option value='" + y + "'>" + y + " 년" + "</option>");
		}
		$("#pjYear").find("option:eq(com_year)").prop("selected", true);
		
		$('#pjYear').children().each(function(index, row) { 
			if ($(row).val() == com_year) {
				$(row).prop('selected', true);
			}
		});
		
		$.post('/empo/resources/divisionList.do').done(function(res) {
			console.log(res.list);
			res.list.forEach( function(row, index) {
				$('#liCategorySelect').append(divisionListView(row));
			});
		}).fail(function() {
			alert("실패");
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
		
	}
	
})();
</script>
</html>
