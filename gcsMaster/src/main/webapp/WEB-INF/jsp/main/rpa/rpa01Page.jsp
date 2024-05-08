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
<%
	request.setCharacterEncoding("utf-8");
%>

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
				<h3>RPA 자료</h3>
				<c:import url="/EmpPageLink.do?link=main/include/top" />
			</div>
			<!-- 화면 상단 종료 -->

			<!-- s :contents_guide -->
			<div class="contents_guide">
				<div class="submenu_guide">
					<ul>
						<!-- 2차메뉴명 -->
						<li><a href="<c:url value='/empo/rpa/eMAU00G01Main.do'/>" class="active">RPA 자료요청</a></li>
						<li><a href="<c:url value='/empo/rpa/eMAU00G02Main.do'/>">RPA 자료조회</a></li>
					</ul>
				</div>
				<div class="bbs_write01 box_style02" style="padding: 10px;">
				<ul class="line_no">
				<li><span>자료구분 *</span> 
						<!-- <label class="mr20"><input type="radio" id="datagubun1" name="datagubun" value="사업접수결과보고_결재" checked> 사업접수결과보고_결재</label> -->
						<label class="mr20"><input type="radio" id="datagubun2" name="datagubun" value="중복성검토및요검검토자료취합" checked> 중복성검토및요검검토자료취합</label>
						<label class="mr20"><input type="radio" id="datagubun3" name="datagubun" value="평가결과보고"> 평가결과보고</label>
						<label class="mr20"><input type="radio" id="datagubun4" name="datagubun" value="사업접수결과"> 사업접수결과</label>
						</li>
				</ul>
				</div>
				<!-- s :content_col2 -->
				<div class="content_col2 bg">
					<div>
						<ul class="line_no">
							<li class="w50p">
								<span>공고명 *</span>&nbsp;
							<!-- 	<select name="pjYear" id="pjYear" >
								</select> -->
								<input type="text" class="input_w60" id="searchRpaPjList" name="searchRpaPjList" placeholder="공고명 입력">
								<button type="button" class="btn_style01 btn_gray" id="btnBusinessNameSelect">검색</button>
							</li>
						</ul>
						<div class="bbs_list mt30">
							<table>
								<tbody id="resultList">
								<colgroup>
									<col width="20%">
									<col width="40%">
									<col width="20%">
									<col width="15%">
								</colgroup>
								<thead>
									<tr>
										<th scope="col" nowrap="nowrap">사업코드</th>
										<th scope="col" nowrap="nowrap">세부공고명</th>
										<th scope="col" nowrap="nowrap">담당부서</th>
										<th scope="col" nowrap="nowrap">선택</th>
									</tr>
								</thead>
								</tbody>
							</table>
						</div>

					</div>
					<!-- e :bbs_write01 -->




					<div id="divUserInfoView">
						<input type="hidden" id="grmCode" name="grmCode" /> 
						<input type="hidden" id="mbCode" name="mbCode" />
						<li class="w50p"><span>사업부서 / 담당자 정보</span> 
						<input type="text" id="businessDepart" name="businessDepart" readOnly>
						<input type="text" id="ContactInfo" name="ContactInfo" readOnly>
						</li> <br />
						<div class="bbs_list">
							<table>
								<colgroup>
									<col width="15%">
									<col width="45%">
									<col width="20%">
									<col width="15%">
								</colgroup>
								<thead>
									<tr>
										<th scope="col" nowrap="nowrap">사업코드</th>
										<th scope="col" nowrap="nowrap">사업명</th>
										<th scope="col" nowrap="nowrap">담당부서</th>
										<th scope="col" nowrap="nowrap">삭제</th>
									</tr>
								</thead>
								<tbody id="selectBusiness">
									<tr>
										<td id="noData" colspan='4'>선택된 자료가 없습니다.</td>
									</tr>
								</tbody>
							</table>
						</div>

						<div id="div_append" class="btn_guide ac mt20 mb30">
							<!-- <button type="submit" id="dataRequestbtn" class="btn_style01 sb_style btn_red" >자료요청</button> -->
						</div>

					</div>
				</div>
				<!-- e :content_col2 -->


				<!-- 팝업 띄울 공간 -->
				<div id="divPopup" class="overlay"></div>

			</div>
			<!-- e :contents_guide -->
		</div>
		<!-- e :right_guide -->
	</div>
	<!-- e :wrap -->


	<script>
		// 사업부서 및 담당자 정보 수정X (로그인계정)
		
		$(document).ready(function() {
			
			var dt = new Date();
		    var com_year = dt.getFullYear();
		    
		   /*  $("select[name='pjYear']").each(function(index, row) {
		    	for (var y = (com_year - 5); y <= (com_year + 1); y++) {
					$(row).append("<option value='" + y + "'>" + y + " 년" + "</option>");
				}	
		    }); 
			
			$("select[name='pjYear']").children().each(function(index, row) { 
				if ($(row).val() == com_year) {
					$(row).prop('selected', true);
				}
			});
			*/
			$.ajax({
				type : "POST",
				url : "/empo/rpa/businessDepart.do"
			}).done(function(res) {
				$('#grmCode').val(res.list.grmCode);
				$('#mbCode').val(res.list.mbCode);
				$('#businessDepart').val(res.list.grSumName);
				$('#ContactInfo').val(res.list.mbName);
			});
		});
		
		/* 검색어 자동완성(보류)
		$("#searchRpaPjList").autocomplete({
			source : function(request, response) {
				$.post('/empo/auth/searchProjectAutocomplete.do', { 
					"pjYear" : $('#pjYear').val() 
					"pjTitle" : $('#searchRpaPjList').val() 
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
 */
		// 사업명 검색버튼 클릭
		$("#btnBusinessNameSelect").click(function() {
			var searchRpaPjList = $("#searchRpaPjList").val();
			if ($.trim(searchRpaPjList).length < 1) {
				alert("공고명을 입력하세요.");
				$("#searchRpaPjList").focus();
				return false;
			} else {
				$('#resultList > tr').empty();
				pjtitlelist();
			}
		});
		var DataListView = function(row) {
			var data = '<tr data-pj_title="'+  row.pjTitle2 + '" data-pj_code="'+ row.pjCode+ '" data-grm_name="'+ row.grmName + '">'
					+ '	<td class="subRow" id="pjCode">'
					+ row.pjCode
					+ '</td>'
					+ '	<td class="subRow">'
					+ row.pjTitle2
					+ '</td>'
					+ '	<td class="subRow">'
					+ row.grmName
					+ '</td>'
					+ '	<td ><button type="button" class="btn_style03 btn_white putProject"> 추가 </button></td>'
					+ '</tr>';
			return $(data);
		}
		
		// 리스트
		var pjtitlelist = function() {
			var pj_title = $('#searchRpaPjList').val();
			$.ajax({
				type : "POST",
				url : "/empo/rpa/searchRpaPjList.do",
				data : {
					"pj_title" : pj_title
				}
			}).done(function(res) {
				res.list.forEach(function(row, index) {
					if(row.grmName == null){
						row.grmName = '등록부서 없음'
					}
					$('#resultList').append(DataListView(row));	
				});
			});
		}
		
		// 사업명 입력후 검색버튼을 클릭할때 끝 
		var putListView = function(row) {
			var data = '<tr data-pj_title="'+  row.pj_title + '" data-pj_code="'+ row.pj_code+ '" data-grm_name="'+ row.grm_name + '">'
					+ '	<td class="subRow" id="pjCode">'
					+ row.pj_code
					+ '</td>'
					+ '	<td class="subRow" id="chk">'
					+ row.pj_title
					+ '</td>'
					+ '	<td class="subRow">'
					+ row.grm_name
					+ '</td>'
					+ '	<td><button type="button" class="btn_style03 btn_white deleteProject"> 삭제 </button></td>'
					+ '</tr>';

			return $(data);
		}

		// 추가버튼 클릭시 선택한 사업목록으로 이동
		$(document).on('click', '.putProject', function(row) {
			console.log(row);
			$('#noData').parents('tr').remove();
			if ($('#dataRequestbtn').length == 0) {
				$('#div_append').append($("<button id='dataRequestbtn' class='btn_style01 sb_style btn_red'> 자료요청 </button>"));
			}
			
			var data = $(this).parents('tr').data();
			var dataPjTitle = data.pj_title;
			var dataGrmName = data.grm_name;
			var rtn = "";
			
			if ($('#selectBusiness').children().length != 0) {
				$('#selectBusiness').children().filter(function(index, row) {
					if ( (dataPjTitle == $(row).data('pj_title')) && dataGrmName == $(row).data('grm_name')) {
						rtn = "중복";
					} 
				});	
				
				if (rtn == "중복") {
					return false;
				} else {
					$('#selectBusiness').append(putListView(data));	
				}
			} else {
				$('#selectBusiness').append(putListView(data));
			}
			
		});


		// 삭제버튼클릭시 삭제
		$(document).on('click', '.deleteProject', function(row) {
			$(this).parents('tr').remove();

			if ($('.deleteProject').length == 0) {
				$('#selectBusiness').append($("<tr><td id='noData' colspan='4'>선택된 자료가 없습니다.</td></tr>"));
				$('#dataRequestbtn').remove();
			}
		});

		$(document).on('click', '#dataRequestbtn', function(res) {

			var list = new Array();
			var reGubun = $('input[name="datagubun"]:checked').val();

			$('#selectBusiness').children('tr').filter(function(index, row) {
				var dataPjTitle = $(row).data('pj_title');
				var dataPjCode = $(row).data('pj_code');

				var data = {
					"pjCode" : dataPjCode,
					"pjTitleNum" : '1',
					"pjTitle" : dataPjTitle,
					"reGubun" : reGubun,
					"grmCode" : $('#grmCode').val(),
					"mbCode" : $('#mbCode').val()
				}
				list.push(data);
				console.log(data)
			});
			
			if(reGubun == ("중복성검토및요검검토자료취합" || "사업접수결과")){
				var table = $("#selectBusiness").children('tr').length;
				if(table > 1){
					alert('중복성검토 및 요검검토 자료취합 및 사업접수결과는 공고 하나만 요청할 수 있습니다.')
					return false;
				}else{
					$.ajax({
						type : "POST",
						url : "/empo/rpa/dataRequest.do",
						data : JSON.stringify(list),
						contentType : "application/json; charset=utf-8"
					}).done(function() {
						alert('자료요청 프로세스 처리완료');
						if(reGubun == '사업접수결과보고_결재'){
							$.ajax({
								url: 'http://10.0.0.114:8080/api/task/run/40a77c63-5cae-40d2-8b01-63cc7556ed5a?X-RPA-API-KEY=15c76e30ff344440b31dd3b041f9f793&bots=a4c157c2-9504-4f6f-9f1a-780c5e55cc49,0ff74f67-a39b-46f7-b402-570ee1f4de2f',
								type: 'GET',
								dataType: 'jsonp',
								jsonpCallback: 'callback',
								success: function(resp) {
									// alert('요청 성공');
									console.log(resp);
								},
								error: function() {
									alert('요청 실패');
								}
							})
						}
							if(reGubun == '중복성검토및요검검토자료취합'){
								$.ajax({
									url: 'http://10.0.0.114:8080/api/task/run/37565e3d-9894-4326-8987-3e23e113bd6a?X-RPA-API-KEY=15c76e30ff344440b31dd3b041f9f793&bots=e319f478-b8c2-4b7b-affa-d7705d13c1ec',
									type: 'GET',
									dataType: 'jsonp',
									jsonpCallback: 'callback',
									success: function(resp) {
										// alert('요청 성공');
										console.log(resp);
									},
									error: function() {
										alert('요청 실패');
									}
								})
							}
								if(reGubun == '평가결과보고'){
									$.ajax({
										url: 'http://10.0.0.114:8080/api/task/run/97d6ffd1-4fba-463b-95aa-f14163b09107?X-RPA-API-KEY=15c76e30ff344440b31dd3b041f9f793&bots=a4c157c2-9504-4f6f-9f1a-780c5e55cc49,0ff74f67-a39b-46f7-b402-570ee1f4de2f',
										type: 'GET',
										dataType: 'jsonp',
										jsonpCallback: 'callback',
										success: function(resp) {
											// alert('요청 성공');
											console.log(resp);
										},
										error: function() {
											alert('요청 실패');
										}
									})
								}
									if(reGubun == '사업접수결과'){
										$.ajax({
											url: 'http://10.0.0.114:8080/api/task/run/4e2de59f-112a-4d2e-b014-8f85c585e0ab?X-RPA-API-KEY=15c76e30ff344440b31dd3b041f9f793&bots=a4c157c2-9504-4f6f-9f1a-780c5e55cc49,0ff74f67-a39b-46f7-b402-570ee1f4de2f',
											type: 'GET',
											dataType: 'jsonp',
											jsonpCallback: 'callback',
											success: function(resp) {
												// alert('요청 성공');
												console.log(resp);
											},
											error: function() {
												alert('요청 실패');
											}
										})
									}
						
					});
				}
			}else{
				$.ajax({
					type : "POST",
					url : "/empo/rpa/dataRequest.do",
					data : JSON.stringify(list),
					contentType : "application/json; charset=utf-8"
				}).done(function() {
					alert('자료요청 프로세스 처리완료');
					if(reGubun == '사업접수결과보고_결재'){
						$.ajax({
							url: 'http://10.0.0.114:8080/api/task/run/40a77c63-5cae-40d2-8b01-63cc7556ed5a?X-RPA-API-KEY=15c76e30ff344440b31dd3b041f9f793&bots=a4c157c2-9504-4f6f-9f1a-780c5e55cc49,0ff74f67-a39b-46f7-b402-570ee1f4de2f',
							type: 'GET',
							dataType: 'jsonp',
							jsonpCallback: 'callback',
							success: function(resp) {
								// alert('요청 성공');
								console.log(resp);
							},
							error: function() {
								alert('요청 실패');
							}
						})
					}
						if(reGubun == '중복성검토및요검검토자료취합'){
							$.ajax({
								url: 'http://10.0.0.114:8080/api/task/run/37565e3d-9894-4326-8987-3e23e113bd6a?X-RPA-API-KEY=15c76e30ff344440b31dd3b041f9f793&bots=e319f478-b8c2-4b7b-affa-d7705d13c1ec',
								type: 'GET',
								dataType: 'jsonp',
								jsonpCallback: 'callback',
								success: function(resp) {
									// alert('요청 성공');
									console.log(resp);
								},
								error: function() {
									alert('요청 실패');
								}
							})
						}
							if(reGubun == '평가결과보고'){
								$.ajax({
									url: 'http://10.0.0.114:8080/api/task/run/97d6ffd1-4fba-463b-95aa-f14163b09107?X-RPA-API-KEY=15c76e30ff344440b31dd3b041f9f793&bots=a4c157c2-9504-4f6f-9f1a-780c5e55cc49,0ff74f67-a39b-46f7-b402-570ee1f4de2f',
									type: 'GET',
									dataType: 'jsonp',
									jsonpCallback: 'callback',
									success: function(resp) {
										// alert('요청 성공');
										console.log(resp);
									},
									error: function() {
										alert('요청 실패');
									}
								})
							}
								if(reGubun == '사업접수결과'){
									$.ajax({
										url: 'http://10.0.0.114:8080/api/task/run/4e2de59f-112a-4d2e-b014-8f85c585e0ab?X-RPA-API-KEY=15c76e30ff344440b31dd3b041f9f793&bots=a4c157c2-9504-4f6f-9f1a-780c5e55cc49,0ff74f67-a39b-46f7-b402-570ee1f4de2f',
										type: 'GET',
										dataType: 'jsonp',
										jsonpCallback: 'callback',
										success: function(resp) {
											// alert('요청 성공');
											console.log(resp);
										},
										error: function() {
											alert('요청 실패');
										}
									})
								}
					
				});
			}
		}); // 자료요청버튼 클릭 끝
	</script>
</body>
</html>
