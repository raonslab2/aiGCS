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
	/*
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
	*/
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
    	
		<table style="width:500px;">
			<tr> 
				<td colspan="3">
					<h1>프로세스 설정 </h1>
				</td> 
			</tr>
			<tr> 
				<td><a href="<c:url value='/empo/process/eMAU00D01Main.do'/>">프로세스 매핑</a></td>
				<td><a href="<c:url value='/empo/process/eMAU00D02Main.do'/>">프로세스 설정</a></td>
				<td><a href="<c:url value='/empo/process/eMAU00D03Main.do'/>">표준일정 설정</a></td>
				<td><a href="<c:url value='/empo/process/eMAU00D04Main.do'/>">휴일 설정</a></td>
			</tr>
		</table>	
		<!-- container 시작 -->
		<div id="container" style="margin-top: 10px">

			<!-- 현재위치 네비게이션 시작 -->
			<div id="content">
				<div id="parentDiv" class="left">
					<div class="default_tablestyle" style="margin-top:10px">
						<table summary="번호,게시판명,사용 커뮤니티 명,사용 동호회 명,등록일시,사용여부   목록입니다" cellpadding="0" cellspacing="0">
							<caption>사용자목록관리</caption>
							<colgroup>
								<col width="10%">
								<col width="10%">  
			                    <col width="20%">
			                    <col width="25%">
			                    <col width="15%">
			                    <col width="10%">
			                    <col width="10%">
		                    </colgroup>
		                    <thead>
		                    	<tr>
			                    	<th scope="col" nowrap="nowrap">Code</th>
			                        <th scope="col" nowrap="nowrap">사업년도</th>
			                        <th scope="col" nowrap="nowrap">사업명</th>
			                        <th scope="col" nowrap="nowrap">세부 사업명</th>
			                        <th scope="col" nowrap="nowrap">사업부서</th>
			                        <th scope="col" nowrap="nowrap">담당간사</th>
			                        <th scope="col" nowrap="nowrap">등록일</th>
		                    	</tr>
		                    </thead>
		                    <tbody id="projectList">
		                    	<c:forEach var="projectList" items="${projectList}" varStatus="status">
			                    	<tr class="loginUserProject" data-pjcode='<c:out value="${projectList.pjCode}" />' data-pj_cate_code='<c:out value="${projectList.pjCateCode1}" />'>
			                    		<td nowrap="nowrap" >
			                    			<c:out value="${projectList.pjCode}" />
			                    		</td>
			                    		<td nowrap="nowrap">
			                    			<c:out value="${projectList.pjYear}" />
			                    		</td>
			                    		<td nowrap="nowrap">
			                    			<c:out value="${projectList.pjCateName}" />
			                    		</td>
			                    		<td nowrap="nowrap">
			                    			<c:out value="${projectList.pjTitle}" />
			                    		</td>
			                    		<td nowrap="nowrap">
			                    			<c:out value="${projectList.grmName}" />
			                    		</td>
			                    		<td nowrap="nowrap">
			                    			<c:out value="${projectList.mbName}" />
			                    		</td>
			                    		<td nowrap="nowrap">
			                    			<c:out value="${projectList.writeTime}" />
		                    			</td>
		                    		</tr>	
	                    		</c:forEach>
		                    </tbody>
						</table>
					</div>
					
					
					<div class="default_tablestyle" style="margin-top:10px">
						프로세스 선택
						<table summary="번호,게시판명,사용 커뮤니티 명,사용 동호회 명,등록일시,사용여부   목록입니다" cellpadding="0" cellspacing="0">
							<caption>사용자목록관리</caption>
							<colgroup>
								<col width="30%">
			                    <col width="17%">
			                    <col width="17%">
			                    <col width="17%">
			                    <col width="17%">
		                    </colgroup>
		                    <thead>
		                    	<tr>
			                    	<th scope="col" nowrap="nowrap">프로세스</th>
			                        <th scope="col" nowrap="nowrap">주요일정</th>
			                        <th scope="col" nowrap="nowrap">사용여부</th>
			                        <th scope="col" nowrap="nowrap">시작일</th>
			                        <th scope="col" nowrap="nowrap">완료일</th>
		                    	</tr>
		                    </thead>
		                    <tbody id="processCheckList">
		                    	
		                    </tbody>
						</table>
					</div>
				</div>
				<div class="right">
				
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
	var pjCode, pjCateCode;
	
	var loginUserProjectList = function () {
		console.log(pjCode);
		if (pjCode != $(this).data('pjcode')) {
			$('.workPoint').children().prop('checked', false)
			$('.use').children().prop('checked', false);
			$('.pcWorkPoint1').prop('checked', true);
			$('.pcUse1').prop('checked', true);
			$('.startDate').children().val("");
			$('.endDate').children().val("");
		}
		
		pjCode = $(this).data('pjcode');
		pjCateCode = $(this).data('pj_cate_code');
		
		$.post('/empo/auth/eMAU00D02projectProcessList.do', { "pjCode" : pjCode }).done(function(res) {
			console.log(res.list)
			
			res.list.forEach(function(row, index) {
				var trClass = $('.' + row.pcCode);
				
				var workPointCheckBoxClass = trClass.children('.workPoint').children();
				var isUseClass = trClass.children('.use').children();
				var startDateClass = trClass.children('.startDate').children();
				var endDateClass = trClass.children('.endDate').children();
				//console.log(workPointCheckBoxClass)
				if (row.pcWorkPoint == 0) {
					workPointCheckBoxClass.prop("checked", false);
				} else {
					workPointCheckBoxClass.prop("checked", true);
				}
				
				if(row.pcUse == 0) {
					isUseClass.prop("checked", false);
				} else {
					isUseClass.prop("checked", true);
				}
				
				startDateClass.val(row.pcDayStart);
				endDateClass.val(row.pcDayEnd);
				
			});
		}).fail(function() {
			alert("실패");
		});
	}
	
	var createDiv = function(row) {
		
		var data = 
		'<td class="subRow" nowrap="nowrap" data-pccode="' + row.pcCode + '" data-pcname="' + row.pcName + '">' + row.pcName + '</td>' + 
		'<td nowrap="nowrap" class="workPoint"><input type="checkbox" name="pcWorkPoint" class="pcWorkPoint' + row.pcScheduleCode + '" /></td>' +
		'<td nowrap="nowrap" class="use"><input type="checkbox" name="pcUse" class="pcUse' + row.pcUse + '" /></td>' + 
		'<td nowrap="nowrap" class="startDate"><input type="date" class="start"/></td>' + 
		'<td nowrap="nowrap" class="endDate"><input type="date" class="end"/></td>';
		
		return $(data)
		
		//return $('<td class="subRow" nowrap="nowrap" data-pccode="' + row.pcCode + '">' + row.pcName + '</td><td nowrap="nowrap" class="workPoint"><input type="checkbox" class="pcWorkPoint' + row.pcScheduleCode + '" /></td><td nowrap="nowrap" class="use"><input type="checkbox" class="pcUse' + row.pcUse + '" /></td><td nowrap="nowrap" class="startDate"><input type="date" /></td><td nowrap="nowrap" class="endDate"><input type="date" /></td>');
	}
	
	var createData = {
			"pjCode": ""
			, "pcCode": ""
			, "pcOrderBy": ""
			, "pcWorkPoint": ""
			, "pcUse": ""
			, "pcDayStart" : "0000-00-00"
			, "pcDayEnd" : "0000-00-00"
			, "pcName" : ""
			, "pjCateCode" : ""
		};
	
	var pcWorkPoint =  function() {
		if (pjCode == undefined) {
			alert("프로젝트를 먼저 선택해주세요.");
			return false;
		}
		
		var workPoint, useYN;
		var pcName = $(this).parents('tr').children('.subRow').data('pcname')
		console.log(pcName)
		var pcCode = $(this).parents('tr').attr('class');
		
		if ($(this).is(":checked")) {
			workPoint = "1"; 
		} else {
			workPoint = "0";
		}
		
		if ($(this).parent('td').next().children().is(":checked")) {
			useYN = "1";
		} else {
			useYN = "0";
		}
		
		var startDate = $(this).parent('td').next().next().children().val();
		var endDate = $(this).parent('td').next().next().next().children().val();
		
		if ( ! startDate == "") {
			createData.pcDayStart = startDate;
		} else {
			createData.pcDayStart = "0000-00-00";
		}
		if ( ! endDate == "") {
			createData.pcDayEnd = endDate;
		} else {
			createData.pcDayEnd = "0000-00-00";
		}
		
		createData.pjCode = pjCode;
		createData.pcCode = pcCode;
		createData.pcOrderBy = pcCode; 
		createData.pcWorkPoint = workPoint;
		createData.pcUse = useYN;
		createData.pcName = pcName;
		createData.pjCateCode = pjCateCode;
		
		console.log(createData)
		
		$.post('/empo/auth/eMAU00D02projectProcessSave.do', createData ).done(function(res) {
			console.log(res)
		}).fail(function() {
			alert("실패");
		});
		
	};
	
	$(document).on('click', 'input[name="pcUse"]', function() {
		if (pjCode == undefined) {
			alert("프로젝트를 먼저 선택해주세요.");
			return false;
		}
		
		var workPoint, useYN;
		var pcName = $(this).parents('tr').children('.subRow').data('pcname');
		var pcCode = $(this).parents('tr').attr('class');
		
		if($(this).is(":checked")) {
			useYN = "1"; 
		} else {
			useYN = "0";
		}
		
		if ($(this).parent('td').prev().children().is(":checked")) {
			workPoint = "1";
		} else {
			workPoint = "0";
		}

		var startDate = $(this).parent('td').next().children().val();
		var endDate = $(this).parent('td').next().next().children().val();
		
		if ( ! startDate == "") {
			createData.pcDayStart = startDate;
		} else {
			createData.pcDayStart = "0000-00-00";
		}
		if ( ! endDate == "") {
			createData.pcDayEnd = endDate;
		} else {
			createData.pcDayEnd = "0000-00-00";
		}
		
		createData.pjCode = pjCode;
		createData.pcCode = pcCode;
		createData.pcOrderBy = pcCode; 
		createData.pcWorkPoint = workPoint;
		createData.pcUse = useYN;
		createData.pcName = pcName;
		createData.pjCateCode = pjCateCode;
		
		console.log(createData)
		
		$.post('/empo/auth/eMAU00D02projectProcessSave.do', createData ).done(function(res) {
			console.log(res)
		}).fail(function() {
			alert("실패");
		});
		
	});
	
	$(document).on('change', '.start', function() {
		if (pjCode == undefined) {
			alert("프로젝트를 먼저 선택해주세요.");
			$(this).val("");
			return false;
		}
		
		var workPoint, useYN;
		var pcName = $(this).parents('tr').children('.subRow').data('pcname');
		var pcCode = $(this).parents('tr').attr('class');
		
		if($(this).parent('td').prev().children().is(":checked")) {
			useYN = "1"; 
		} else {
			useYN = "0";
		}
		
		console.log($(this).parent('td').prev().prev().children().is(":checked"));
		if ($(this).parent('td').prev().prev().children().is(":checked")) {
			workPoint = "1";
		} else {
			workPoint = "0";
		}
		
		var endDate = $(this).parent('td').next().children().val();
		
		if ( ! endDate == "") {
			createData.pcDayEnd = endDate;
		} else {
			createData.pcDayEnd = "0000-00-00"
		}
		
		createData.pjCode = pjCode;
		createData.pcCode = pcCode;
		createData.pcOrderBy = pcCode; 
		createData.pcWorkPoint = workPoint;
		createData.pcUse = useYN;
		createData.pcName = pcName;
		createData.pjCateCode = pjCateCode;
		createData.pcDayStart = $(this).val();
		
		console.log(createData)
		
		$.post('/empo/auth/eMAU00D02projectProcessSave.do', createData ).done(function(res) {
			console.log(res)
		}).fail(function() {
			alert("실패");
		});
	});
	
	$(document).on('change', '.end', function() {
		if (pjCode == undefined) {
			alert("프로젝트를 먼저 선택해주세요.");
			$(this).val("");
			return false;
		}
		
		var workPoint, useYN;
		var pcName = $(this).parents('tr').children('.subRow').data('pcname');
		var pcCode = $(this).parents('tr').attr('class');
		
		if($(this).parent('td').prev().prev().children().is(":checked")) {
			useYN = "1"; 
		} else {
			useYN = "0";
		}
		
		if ($(this).parent('td').prev().prev().prev().children().is(":checked")) {
			workPoint = "1";
		} else {
			workPoint = "0";
		}
		
		var startDate = $(this).parent('td').prev().children().val();
		
		if ( ! startDate == "") {
			createData.pcDayStart= startDate;
		} else {
			createData.pcDayStart = "0000-00-00"			
		}
		
		createData.pjCode = pjCode;
		createData.pcCode = pcCode;
		createData.pcOrderBy = pcCode; 
		createData.pcWorkPoint = workPoint;
		createData.pcUse = useYN;
		createData.pcName = pcName;
		createData.pjCateCode = pjCateCode;
		createData.pcDayEnd = $(this).val();
		
		console.log(createData)
		
		$.post('/empo/auth/eMAU00D02projectProcessSave.do', createData ).done(function(res) {
			console.log(res)
		}).fail(function() {
			alert("실패");
		});
	});
	
	var getTree = function (processTree) {
		processTree.forEach( function( row, index ) {
			row.subs = [];
		    if (row.pcPCode != "0") {
		    	var parentRow = processTree.find(obj => obj.pcCode == row.pcPCode);
		    	parentRow.subs.push(row);
		    }
		});
		return processTree.filter(obj => obj.pcPCode == '0');
	}
	
	var addSubs = function(parentTbody, subs) {
		var tr = $('<tr class="1">');
		parentTbody.append(tr);
		
		subs.forEach(function(row) {
			var nextTR = $("<tr class='" + row.pcCode + "'>");
			if($('.subRow').length > 0 ) {
				parentTbody.append(nextTR);
				var subtd = createDiv(row);
				nextTR.append(subtd)
				
				if (row.subs.length > 0) {
					row.subs.forEach(function(row) {
						var nextTR = $("<tr class='" + row.pcCode + "'>");
						parentTbody.append(nextTR);
						var subtd = createDiv(row);
						nextTR.append(subtd)
					});
					/* parentTbody.append(nextTR);
					var subtd = createDiv(row.subs);
					nextTR.append(subtd) */
				}
			} else {
				var subtd = createDiv(row);
				tr.append(subtd);
				row.subs.forEach(function(row) {
					nextTR = $("<tr class='" + row.pcCode + "'>");
					parentTbody.append(nextTR);
					var subtd = createDiv(row);
					nextTR.append(subtd)
				});
			}
			
		});
		
	}
	
	
	$(function() {
		var url = '/empo/auth/eMAU00D02processList.do';
		$.ajax({
			url: url
			, type: 'post'
			, contentType : "application/json; charset=utf-8"
			, data : {}
		}).done(function(res) {
			var subs = getTree(res.list);
			addSubs( $('#processCheckList'), subs);
			
			$('.pcWorkPoint1').prop('checked', true);
			$('.pcUse1').prop('checked', true);
		}).fail(function(){
			alert("실패");
		});
		
		$(document).on('click', '.loginUserProject', loginUserProjectList);
		$(document).on('click', 'input[name="pcWorkPoint"]', pcWorkPoint);
		
	});
	
})();
	
</script>