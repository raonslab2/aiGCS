<%--
  Class Name : EgovMainView.jsp 
  Description : 메인화면
  Modification Information
 
      수정일         수정자                   수정내용
    -------    --------    ---------------------------
     2011.08.31   JJY       경량환경 버전 생성
 
    author   : 실행환경개발팀 JJY
    since    : 2011.08.31 
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

<title>Simple Layout Demo</title>

<script type="text/javascript" src="<c:url value='/'/>js/jquery.min.3.1.1.js"></script>
<script type="text/javascript" src="<c:url value='/'/>js/jquery.ui.all.js"></script>
<script type="text/javascript" src="<c:url value='/'/>js/jquery.layout.js"></script>
<link href="<c:url value='/'/>css/layout_all.css" rel="stylesheet" type="text/css">

<script type="text/javascript">
	var myLayout; // a var is required because this page utilizes: myLayout.allowOverflow() method

	$(document).ready(function() {
		myLayout = $('body').layout({
			// enable showOverflow on west-pane so popups will overlap north pane
			west__showOverflowOnHover : true

		//,	west__fxSettings_open: { easing: "easeOutBounce", duration: 750 }
		});
	});

</script>


</head>
<body>
	<!-- manually attach allowOverflow method to pane -->
	<div class="ui-layout-north"
		onmouseover="myLayout.allowOverflow('north')"
		onmouseout="myLayout.resetOverflow(this)">
		<c:import url="/EmpPageLink.do?link=main/include/EmpIncHeader" />
	</div>

	<!-- allowOverflow auto-attached by option: west__showOverflowOnHover = true -->
	<div class="ui-layout-west">
		<c:import url="/EmpPageLink.do?link=main/include/EmpIncMenu" />
	</div>

	<div class="ui-layout-south">
		하단 &nbsp;
		<button onclick="myLayout.toggle('north')">Toggle North Pane</button>
	</div>
	
	<style>
	.left {
        width: 50%;
        float: left;
        box-sizing: border-box;
      }
    .right {
        width: 50%;
        float: right;
        box-sizing: border-box;
      }
	
	</style>
	<div class="ui-layout-east">
		This is the east pane, closable, slidable and resizable

		<!-- attach allowOverflow method to this specific element -->
		<ul onmouseover="myLayout.allowOverflow(this)"
			onmouseout="myLayout.resetOverflow('east')">
			<li>
				<ul>
					<li>one</li>
					<li>two</li>
					<li>three</li>
					<li>four</li>
					<li>five</li>
				</ul> Pop-Up <!-- put this below so IE and FF render the same! -->
			</li>
		</ul>

		<p>
			<button onclick="myLayout.close('east')">닫기</button>
		</p>

		<p>...</p>
		<p>...</p>
		<p>...</p>
		<p>...</p>
		<p>...</p>
		<p>...</p>
		<p>...</p>
		<p>...</p>
		<p>...</p>
		<p>...</p>
		<p>...</p>
		<p>...</p>
		<p>...</p>
		<p>...</p>
		<p>...</p>
		<p>...</p>
		<p>...</p>
		<p>...</p>
		<p>...</p>
		<p>...</p>
		<p>...</p>
		<p>...</p>
		<p>...</p>
		<p>...</p>
		<p>...</p>
		<p>...</p>
		<p>...</p>
		<p>...</p>
		<p>...</p>
		<p>...</p>
		<p>...</p>
		<p>...</p>
		<p>...</p>
		<p>...</p>
		<p>...</p>
		<p>...</p>
	</div>

	<div class="ui-layout-center">
		<form id="deleteForm" action="/empo/auth/eMAU00F01authDelete.do" method="get">
    		<input type="hidden" name="pageName" value="project"/>
    		<input type="hidden" id="deleteId" name="pjAuId">
    	</form>
    	
		<table style="width: 500px;">
			<tr>
				<td colspan="3">
					<h1>권한관리_담당자별</h1>
				</td>
			</tr>
			<tr>
				<td><a href="<c:url value='/empo/auth/eMAU00F01Main.do'/>">담당자별</a></td>
				<td><a href="<c:url value='/empo/auth/eMAU00F02Main.do'/>">사업별</a></td>
			</tr>
		</table>
		<!-- container 시작 -->
		<div id="container" style="margin-top: 10px">

			<!-- 현재위치 네비게이션 시작 -->
			<div id="content">
				<!-- 검색 필드 박스 시작 -->
				<form id="searchForm" method="post">
					<div id="search_field">
						<select name="searchOption">
							<option value="">전체</option>
							<option value="2020">2020</option>
							<option value="2021">2021</option>
							<%-- <c:forEach var="searchOption" items="${searchOption}" varStatus="status">
								<option><c:out value="${searchOption.grSumName}" /></option>
							</c:forEach> --%>
						</select> 
						<input type="text" name="searchName" /> 
						<input type="button" id="search" value="검색" />
					</div>
				</form>
				<!-- //검색 필드 박스 끝 -->
				<div id="parentDiv" class="left"></div>
				<div class="right">
					사업년도 : <input type="text" id="projectYear"/><br/>
					사업명 : <input type="text" id="projectName"/><br/>
					상위사업명 : <input type="text" id="projectPName"/><br/>
					사용설정 : 
					<input type="radio" name="projectUse" id="use" /><label for="use">사용</label>
					<input type="radio" name="projectUse" id="unUse" /><label for="unUse">미사용</label>
					<br/><br/><br/>
					사업권한 가져오기
					<br/>
					<form id="projectAuthSelectForm" method="post">
						<select>
							<option value="">전체</option>
							<option value="2020">2020</option>
							<option value="2021">2021</option>
						</select>
						<input type="text" name="searchName" id="projectSearch"/> 
						<input type="button" id="projectAuthSelect" value="선택" />
					</form>
					
					
					<br/><br/><br/>
					부서별 권한설정
					<br/>
					사업부서 : <input type="text" id="projectGroup"/><br/> 
					권한그룹선택 : 
					<br/><input type="radio" name="projectAuth" id="systemManagement" value="시스템관리" /><label for="systemManagement">시스템관리</label><br/>
					<input type="radio" name="projectAuth" id="projectManagement" value="사업관리" /><label for="projectManagement">사업관리</label><br/>
					<input type="radio" name="projectAuth" id="manager" value="담당간사"/><label for="manager">담당간사</label><br/>
					<input type="radio" name="projectAuth" id="practitioner" value="실무자"/><label for="practitioner">실무자</label>
					<br/><br/><br/>
					
					
					<form id="createForm" method="post">
						<input type="hidden" name="pageName" value="project"/>
						<input type="hidden" name="auCode" id="createAuCode"/>
						<input type="hidden" name="mbCode" id="createMbCode"/>
						<input type="hidden" name="pjCode" id="createPjCode"/>
						<input type="hidden" name="pjYear" id="createPjYear"/>
					</form>
					
					<div>
						<!-- 
						사업 : <input type="text" /><br/>
						사업부서 : <input type="text" id="selectGroupName"/><br/>
						이름 : <input type="text" id="selectMemberName"/><br/>
						 -->
						 
						<form id="managerSearchForm">
							<div id="search_field">
								<select id="groupPart1" name="groupPart1">
									<option value="" >전체</option>
									<c:forEach var="searchOption" items="${searchOption}" varStatus="status">
										<option value='<c:out value="${searchOption.grmCode}" />'><c:out value="${searchOption.grmName}" /></option>
									</c:forEach>
								</select>
								<select id="groupPart2" name="groupPart2">
									<option value="" >전체</option>
								</select>  
								<input type="text" name="searchName"/>
								<input type="button" id="managerSearch" value="검색"/>
							</div>
						</form>
						<div id="searchResult">
							
						</div>
						권한그룹선택 : 
						<br/><input type="radio" name="createProjectAuth" id="systemManagement" value="CODE00001" /><label for="systemManagement">시스템관리</label><br/>
						<input type="radio" name="createProjectAuth" id="projectManagement" value="CODE00002" /><label for="projectManagement">사업관리</label><br/>
						<input type="radio" name="createProjectAuth" id="manager" value="CODE00003"/><label for="manager">담당간사</label><br/>
						<input type="radio" name="createProjectAuth" id="practitioner" value="CODE00004"/><label for="practitioner">실무자</label>
						<br/><br/><br/>
						<button id="managerCreate" class="btn w85 type1">담당자추가</button>
					</div>
					
					<br/><br/><br/>
					담당자별 설정
					<div>
						<button id="managerDelete" class="btn w85 type1" style=>담당자삭제</button>
					</div>
					<div class="default_tablestyle" style="margin-top:10px">
						<table summary="번호,게시판명,사용 커뮤니티 명,사용 동호회 명,등록일시,사용여부   목록입니다" cellpadding="0" cellspacing="0">
							<caption>사용자목록관리</caption>
							<colgroup>
								<col width="5%">
			                    <col width="25%">  
			                    <col width="20%">
			                    <col width="20%">
			                    <col width="15%">
			                    <col width="15%">
		                    </colgroup>
		                    <thead>
		                    	<tr>
		                    		<th scope="col" nowrap="nowrap"><input type="checkbox" id="ckAll"/></th>
			                        <th scope="col" nowrap="nowrap">부서명</th>
			                        <th scope="col" nowrap="nowrap">이름</th>
			                        <th scope="col" nowrap="nowrap">직급</th>
			                        <th scope="col" nowrap="nowrap">아이디</th>
			                        <th scope="col" nowrap="nowrap">권한</th>
		                    	</tr>
		                    </thead>
		                    <tbody id="projectMemberAuthList">
		                    	
		                    </tbody>
						</table>
					</div>
				</div>

			</div>
			<!-- //content 끝 -->
		</div>
		<!-- //container 끝 -->
	</div>

</body>
</html>
<script>
;(function() {
	
	// 사업별 검색 Event (안됨)
	var search = function() {
		$('#searchForm').attr('action', '/empo/auth/eMAU00F02Main.do');
		$('#searchForm').submit();
	}
	
	// 담당자 목록 row 추가
	var authListView = function(row) {
		return  $('<tr class="rowAuth"><td nowrap="nowrap"><input type="checkbox" name="check[]" data-pj_au_id=' + row.pjAuId + ' /></td><td nowrap="nowrap">' + row.grmName + '</td><td nowrap="nowrap">' + row.mbName + '</td><td nowrap="nowrap">' + row.mbRankName + '</td><td nowrap="nowrap">' + row.smtechId + '</td><td nowrap="nowrap">' + row.auName + '</td></tr>');
	}
	
	// 사업권한 가져오기
	var projectAuthSelect = function() {
		var projectName = $('#projectSearch').val();
		$.get('/empo/auth/eMAU00F01fetchProjectName.do', { "projectName" : projectName }).done(function(res) {
			if(res.list.length == 0) {
				return false;
			} else {
				searchPjCode = res.list[0].pjCode
				
				var data = {
						'pjCode' : searchPjCode
					}
				
				var jsonData = JSON.stringify(data);
				
				$('.rowAuth').remove();
				var url = '/empo/auth/eMAU00F01ProjectDetail.do';
				$.ajax({
					url : url
					, type: 'post'
					, contentType : "application/json; charset=utf-8"
					, data : jsonData
				}).done(function(res) {
					
					$('#projectGroup').val(res.list.GR_M_NAME)
					
					$('input[name="projectAuth"]').filter(function(index, row) {
						if( $(row).val() == res.list.AU_NAME ) {
							$(row).prop('checked', true);
							return false;
						} else {
							$(row).prop('checked', false);
						}
					});
					
					$.ajax({
						url : '/empo/auth/eMAU00F01projectAuthList.do'
						, type: 'post'
						, contentType : "application/json; charset=utf-8"
						, data : jsonData
					}).done(function(res) {
						res.list.forEach(function(row, index) {
							$('#projectMemberAuthList').append(authListView(row));
						})
					}).fail(function() {
						alert("실패");
					})
				}).fail(function(){
					alert("실패");
				})
			}
		}).fail(function() {
			alert("실패");
		})	
		
	};
	
	// 사업 선택 했을 때 Event
	var select = function() {
		// 담당자별 설정 row 삭제
		$('.rowAuth').remove();
		
		// 체크박스 선택 되어 있으면 체크 해제
		if ( $('#ckAll').prop('checked') ) {
			$('#ckAll').prop('checked', false);
		}
		
		// 선택한 사업 코드
		var selectData = $(this).data('pj_cate_code')
		
		var data = {
			'pjCode' : selectData
		}
		var jsonData = JSON.stringify(data);
		
		// 선택한 사업 기본정보
		var url = '/empo/auth/eMAU00F01ProjectDetail.do';
		$.ajax({
			url : url
			, type: 'post'
			, contentType : "application/json; charset=utf-8"
			, data : jsonData
		}).done(function(res) {
			console.log(res.list)
			$('#createPjCode').val(res.list.PJ_CODE);
			$('#createPjYear').val(res.list.PJ_YEAR);
			
			$("#projectYear").val(res.list.PJ_YEAR);
			$("#projectName").val(res.list.PJ_TITLE);
			$("#projectPName").val(res.list.PJ_CATE_NAME);
			if (res.list.PJ_USE == 1) {
				$("#use").prop('checked', true);
			} else if (res.list.PJ_USE == 0) {
				$("#unUse").prop('checked', true);
			} else {
				$("#use").prop('checked', false);
				$("#unUse").prop('checked', false);
			}
			
			// 선택한 사업 부서별 권한 설정 정보			
			$('#projectGroup').val(res.list.GR_M_NAME)
			$('input[name="projectAuth"]').filter(function(index, row) {
				if( $(row).val() == res.list.AU_NAME ) {
					$(row).prop('checked', true);
					return false;
				} else {
					$(row).prop('checked', false);
				}
			});
			
			// 선택한 사업 담당자 정보
			$.ajax({
				url : '/empo/auth/eMAU00F01projectAuthList.do'
				, type: 'post'
				, contentType : "application/json; charset=utf-8"
				, data : jsonData
			}).done(function(res) {
				res.list.forEach(function(row, index) {
					$('#projectMemberAuthList').append(authListView(row));
				})
			}).fail(function() {
				alert("실패");
			})
		}).fail(function(){
			alert("실패");
		})
	}
	
	// 체크박스 전체 선택 Event(공통)
	var checkAll = function () {
		if($(this).prop("checked")){
			$("input[name='check[]']").prop("checked", true);
		} else {
			$("input[name='check[]']").prop("checked", false);
		}
	}
	
	// 담당자 추가 - 서브 그룹
	var groupCode = function() {
		var el = $(this);
		var data = el.val();
		var id = el.attr('id');
		
		if (id == 'groupPart1') {
			$('#groupPart2').children('option:not(:first)').remove();
			
			$.get( '/empo/auth/eMAU00F01SearchSubOption.do', { "grpCode" : data } ).done(function(res) {
				console.log(res.list)
				res.list.forEach( function(row, index) {
					var option = $('<option value="'+ row.grmCode +'">'+ row.grmName +'</option>');
					$('#groupPart2').append(option)
				})
			}).fail(function() {
				alert("실패")
			})
		}
		
	}
	
	var managerSearch = function() {
		var formSer = $('#managerSearchForm').serializeArray();
		console.log(formSer)
		var jsonData = JSON.stringify(formSer);

		$.ajax({
			url : "/empo/auth/eMAU00F01managerSearch.do"
			, type: 'post'
			, contentType : "application/json; charset=utf-8"
			, data : jsonData
		}).done(function(res) {
			if($('.result').length > 0) {
				$('.result').remove();
			}
			
			console.log(res.list)
			res.list.forEach(function(row, index) {
				console.log(row)
				$('#searchResult').append('<div class="result" data-mbcode="' + row.mbCode + '">' + row.mbName + '<input type="button" class="ManagerSelect" value="선택" /></div>')
			})
		}).fail(function() {
			alert("실패");
		})
		
	}
	
	$(document).on('click', '.ManagerSelect', function() {
		$('.select').remove();
		$(this).parent('div').append("<span class='select'>선택함</span>")
		var mbCode = $(this).parent('div').data('mbcode');
		$('#createMbCode').val(mbCode);
		
	})
	
	// 담당자 추가
	var managerCreate = function() {
		var radioVal = $('input[name="createProjectAuth"]:checked').val();
		$('#createAuCode').val(radioVal);
		
		if ($('#createAuCode').val() == undefined) {
			alert("라디오를 선택");
			return false;
		}
		if ($("#createMbCode").val() == "") {
			alert("담당자 선택");
			return false;
		}
		if ($("#createPjCode").val() == "") {
			alert("프로젝트 선택");
			return false;
		}
		$('#createForm').attr("action", "/empo/auth/eMAU00F01authCreate.do").submit();
	}
	
	
	// 담당자 삭제(공통)
	var managerDelete = function() {
		var valueArr = new Array();
		
		var check = $("input[name='check[]']").filter(function() {


				var pjAuId = $(this).data('pj_au_id');
				console.log(pjAuId)
				valueArr.push(pjAuId)
			}
		})
		
		if (valueArr.length == 0) {
			alert("선택된 글이 없습니다.");
		} else {
			if( ! confirm("삭제 하시겠습니까?") ){
				return false;
			} else {
				$('#deleteId').val(valueArr)
				$('#deleteForm').submit();
			}
		}
	}
	
	
	
	// 사업별 목록 row 추가
	var createDiv = function(row) {
		return  $('<div><a class="subRow" data-pj_cate_code="' + row.pjCateCode1 + '">' + row.pjCateName1 + '</a>');
	}
	
	// 사업별 Tree 형식 목록
	var getTree = function (projectTree) {
		projectTree.forEach( function( row, index ) {
			row.subs = [];
		    if (row.pjCateCodeP1 != "00000") {
		    	var parentRow = projectTree.find(obj => obj.pjCateCode1 == row.pjCateCodeP1);
		    	parentRow.subs.push(row);
		    }
		});
		return projectTree.filter(obj => obj.pjCateCodeP1 == '00000');
	}
	
	// 사업별 Tree 형식 목록 View
	var addSubs = function(parentDiv, subs) {
		var div = $("<div style='padding-left: 20px;'>");
		parentDiv.append(div);
		
		subs.forEach(function(row) {
			var subDiv = createDiv(row);
			div.append(subDiv);
			if (row.subs.length > 0) {
				addSubs(subDiv, row.subs);
			}
			
		});
	}
	
	$(function() {
		var url = '/empo/auth/eMAU00F02projectList.do';
		$.ajax({
			url: url
			, type: 'post'
			, contentType : "application/json; charset=utf-8"
			, data : {}
		}).done(function(res) {
			console.log(res)
			var subs = getTree(res.list);
			addSubs( $('#parentDiv'), subs);
		}).fail(function(){
			alert("실패");
		});
		
		
		$('#search').click( search );
		$('#projectAuthSelect').click( projectAuthSelect );
		$(document).on("click", ".subRow", select);
		$('#ckAll').click( checkAll );
		$('#groupPart1').change( groupCode );
		$('#managerSearch').click( managerSearch );
		$('#managerCreate').click ( managerCreate );
		$('#managerDelete').click( managerDelete );
		
		
	});
	
})();
	
</script>