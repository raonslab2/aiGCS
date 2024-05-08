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
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>

<body>
	<!-- s :wrap -->
	<div id="wrap">
		<!-- 1차 메뉴 시작 -->
		<div class="lnb_guide">
			<c:import url="/EmpPageLink.do?link=main/include/menu" /> 
		</div>
		<!-- 1차 메뉴 종료 -->
			
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
						<li><a href="<c:url value='/empo/resources/eMAU00C02Main.do'/>" >가용자원 조회(간사, 평가장)</a></li>
						<li><a href="<c:url value='/empo/resources/eMAU00C03Main.do'/>">가용자원 조회(평가장) 삭제예정</a></li>
					</ul>
				</div>
				
				<!-- s :content_col2 -->
				<div class="content_col2 bg">
					<div>
						
						<!-- <form name="formPlaceAdd" id="formPlaceAdd" method="post">
						<div class="bbs_write01">
							<ul>
								<li><span>평가장 추가</span>
								<select id="addrCodeSelect" name="addrCodeSelect" class="input_w26" style="width:100px">
								</select>
								<input type="text" class="input_w70" id="placeName" placeholder="평가실명을 등록하세요.">
								</li>								
							</ul>
						</div>

						<div class="btn_guide al fc_red mt10" id="errorplace">
						</div>

						<div class="btn_guide ar mt-20">
							<button type="button" class="btn_style02 btn_green" id="btnPlaceAdd">평가장 추가</button>
						</div>
						</form> -->
						<div class="bbs_write01">
							<ul>
								<li><span>평가장 추가</span>
								<select id="addrCodeSelect" name="addrCodeSelect" class="input_w20">
								</select>
								<input type="text" class="input_w60" id="placeName" placeholder="평가실명을 등록하세요.">
								<button type="button" class="btn_style02 btn_green" id="btnPlaceAdd">평가장 추가</button>
								</li>								
							</ul>
						</div>

						<div class="btn_guide al fc_red mt10" id="errorplace">
							<!-- 오류 : 동일한 평가장이 있습니다. -->
						</div>
						
						<!-- 평가실 목록 시작 -->
						<div class="bbs_list mt30 placeList">
								<table>
								
								<thead>
								  <tr>
									<th scope="col"><input type="checkbox" id="chkAll"></th>
									<th scope="col">위치</th>
									<th scope="col">평가실명</th>
									<th scope="col">사용여부</th>
									<th scope="col">등록일</th>
								  </tr>
								</thead>
								<tbody id="placeList">

								</tbody>
							</table>
						</div>
						<!-- 평가실 목록 끝 -->

						
						<div class="btn_guide al">
							<button type="button" class="btn_style02 btn_gray" id="btnPlaceDelete">선택삭제</button>
						</div>
					</div>
					<!-- e :bbs_write01 -->
					
					
					<!-- 평가장 정보 수정 -->
					<div>
						<h4>평가장 정보</h4>
						
						<form name="formPlaceModify" id="formPlaceModify" method="post">
						<div class="btn_guide ar mt-50 mb10">
							<button type="button" class="btn_style02 btn_green" id="btnPlaceModify">저장</button>
						</div>
						<div class="bbs_list">
							<table class="table_l">
							  <tbody>
								<tr>
								  <th scope="row">위치 *</th>
								  <td>
										<select id="addrCodeSelect2" name="addrCodeSelect2" class="input_w90">
										</select>
										<!-- <input type="text" class="input_w90" id="inputPlace" value=""> -->
								  </td>
								</tr>
								<tr>
								  <th scope="row">평가실 *</th>
								  <td>
									<input type="text" class="input_w90" id="inputPlaceName" value="">
								  </td>
								</tr>
								<!-- 
								<tr>
								  <th scope="row">주소</th>
								  <td>
									<input type="text" class="input_w20" id="postNumber">
									<button type="button" class="btn_style03 btn_gray" id="vuPost">우편번호 선택</button>
									<br>
									<input type="text" class="input_w90" id="address">
									<br>
									<input type="text" class="input_w90" id ="detailAddress">
								  </td>
								</tr>
								-->
								<tr> 
								  <th scope="row">사용설정 *</th>
								  <td>
									<label><input type="radio" name = "vuUse" value="1" checked> 사용</label>
									&nbsp;&nbsp;&nbsp;
									<label><input type="radio" name = "vuUse" value="0"> 미사용</label>
								  </td>
								</tr>
							  </tbody>
							</table>
						</div>
						</form>
						
                    </div>
					<!-- e : 담당자 정보 종료 --> 

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
	var emVuPk = "";
	// 평가장 행클릭
	$(document).on('click', '.subRow', function() {
		emVuPk = $(this).parents('tr').data('em_vu_pk');
		
	 	$.ajax({
			url : "/empo/resource/clickArea.do"
			, type : 'post'
			, data : { 'emVuPk' : emVuPk }
		}).done(function(res){
			res.list.forEach( function(row, index) {
				console.log(row)
				
				if (row.vuUse == 1) {
					$("input:radio[name='vuUse']:radio[value='1']").prop('checked', true); 	
				} else {
					$("input:radio[name='vuUse']:radio[value='0']").prop('checked', true); 	
				}
				
				var addrCode = row.addrCode;
				$(".arAddrCode").each(function(index, row) {
					if ( $(row).val() == addrCode ) {
						$(row).prop('selected', true);
					}
				});
				
				$('#inputPlaceName').val(row.vuTitle);
			});
			
		});
	});
	
	// 평가장 추가 버튼
	$("#btnPlaceAdd").click(function() {
		if ($('#placeName').val().length < 1) {
			alert("평가실명을 입력하세요.");
			$("#placeName").focus();
			return false;
		}
		
		var addrCode = $("#addrCodeSelect option:selected").val();
		
		var addrName = $("#addrCodeSelect option:selected").text();
		var vuTitle = "(" + addrName + ")" + $("#placeName").val();
		
		console.log(vuTitle);
		
		var data = {
			"addrCode" : addrCode
			, "vuTitle" : vuTitle
		}
		
		$.post("/empo/resource/isDataArea.do", data).done(function(res) {
			if (res.isDataCount == 1) {
				$('#errorplace').html("오류 : 동일한 평가장이 있습니다.");
				return false;
			} else {
				$('#errorplace').text("");
				alert("추가되었습니다.");
				res.list.forEach(function(row, index) {
					if(row.vuUse == 1){
						row.vuUse = "사용"
					} else {
						row.vuUse = "미사용"
					}
					$('#placeList').append(evaluationView(row));
					// 평가장 목록 커서
					$(".placeList > table > tbody> tr > td").css("cursor","pointer");
				});
				
			}
		}); 
		
	});
	
	// 평가장 정보 저장버튼
	$("#btnPlaceModify").click(function() {
		console.log(emVuPk);
		if (emVuPk == "") {
			alert("평가장을 먼저 선택하세요.");
			return false;
		}
		
		var addrCode = $("#addrCodeSelect2 option:selected").val();
		var vuTitle= $('#inputPlaceName').val();
		var vuUse = $('input[name="vuUse"]:checked').val();
		
		if (confirm("평가실 정보를 수정하시겠습니까?")) {
			var data = {
				'emVuPk' : emVuPk
				, 'addrCode' : addrCode
				, 'vuTitle' : vuTitle
				, 'vuUse' : vuUse
			}
			
			$.post("/empo/resource/updateArea.do", data).done(function(res) {
				if (res.isDataCount == 1) {
					$('#errorplace').html("오류 : 동일한 평가장이 있습니다.");
					alert("오류 : 동일한 평가장이 있습니다.");
					return false;
				} else {
					alert("수정되었습니다.");
					$('#errorplace').text("");
					res.list.forEach(function(row1, index) {
						$('.vuRow').each(function(index, row) {
							if ( $(row).data('em_vu_pk') == emVuPk ) {
								$(row).find('.rowAddrName').html(row1.addrName);
								$(row).find('.rowVuTitle').html(row1.vuTitle);
								if (row1.vuUse == 1) {
									$(row).find('.rowVuUse').html("사용");
								} else {
									$(row).find('.rowVuUse').html("미사용");
								}
								
							}
						});
					});
				}
				
			});
		}
	});
	
	// 선택 삭제 버튼
	$("#btnPlaceDelete").click(function() {
		var valueArr = new Array();
		if ($("input[name=checkField]:checkbox:checked").length == 0) {
			alert("삭제할 항목을 선택하세요.");
			return false;
		} else {
			if (confirm("선택하신 항목을 삭제하시겠습니까?")) {
				var check = $("input[name='checkField']").filter(function(index, row) {
					if($(row).is(':checked')) {
						var em_vu_pk = $(this).parents('tr').data('em_vu_pk');
						valueArr.push(em_vu_pk);
					}
				});
				
				console.log(valueArr);
				$.post("/empo/resource/deleteArea.do", { "emVuPk" : valueArr }).done(function() {
					alert("삭제되었습니다.");
					$("#chkAll").prop('checked', false);
					
					var check = $("input[name='checkField']").filter(function() {
						if ($(this).is(':checked') == true) {
							$(this).parents('tr').remove();
						}
					});
					
				});
				
				
				/* $.post('/empo/process/eMAU00D02CheckListDelete.do', { "clPk" : valueArr }).done(function() { 
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
				}) */
			} 
		}
		/* var checkRow = $('#placeList').find('input[name="checkField"]:checked');
		var data = checkRow.parents('tr').data();
		var vuTitle = data.vutitle
		if ($("input[name=checkField]:checkbox:checked").length == 0) {
			alert("삭제할 평가장을 선택해 주세요.");
			return false;
		} else {
			$.ajax({
				type : "POST",
				url : "/empo/resource/deleteArea.do",
				data : {'vuTitle' : vuTitle}
			}).done(function() {
				var checkRow = $('#placeList').find('input[name="checkField"]:checked');
					if ( checkRow.length == 0 ) {
					}else{
							checkRow.parents('tr').remove();	
					}	
				alert('삭제되었습니다.');
			}).fail(function(){
			}) 
		} */
	});
	
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
	
	$(function() {
		initList();		
	});
	
	var evaluationView = function(row) {
		var data = '<tr class="vuRow" data-vuTitle="'+  row.vuTitle + '" data-em_vu_pk="' + row.emVuPk + '">'
				+ '	<td ><input type="checkbox" name="checkField"></td>'
				+ '	<td class="subRow rowAddrName" >'
				+ row.addrName
				+ '</td>'
				+ '	<td class="subRow rowVuTitle" >'
				+ row.vuTitle
				+ '</td>'
				+ '	<td class="subRow rowVuUse" >'
				+ row.vuUse
				+ '</td>'
				+ '	<td class="subRow" >'
				+ row.writeTime
				+ '</td>'
				+ '</tr>';

		return $(data);
	}
	
	var initList = function() {
		//부서정보 호출
		$.post('/empo/resources/selectAreaCateList.do').done(function(res) {
			res.list.forEach( function(row, index) {
				var option = $('<option value="'+ row.addrCode +'">'+ row.addrName +'</option>');
				$('#addrCodeSelect').append(option);
				//$('#addrCodeSelect2').append(option);
			});
			
			res.list.forEach( function(row, index) {
				var option = $('<option class="arAddrCode" value="'+ row.addrCode +'">'+ row.addrName +'</option>');
				$('#addrCodeSelect2').append(option);
			});
		});
		
		$.post("/empo/resource/selectAreaList2.do").done(function(res) {
			res.list.forEach(function(row, index) {
				if (row.vuUse == 1) {
					row.vuUse = "사용"
				} else {
					row.vuUse = "미사용"
				}
				
				$('#placeList').append(evaluationView(row));
				
				// 평가장 목록 커서
				$(".placeList > table > tbody> tr > td").css("cursor","pointer");
			});
		});
	}
	
})();
</script>
</html>
