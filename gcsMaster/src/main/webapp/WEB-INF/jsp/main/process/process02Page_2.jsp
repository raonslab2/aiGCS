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
					<button id="processCreate" >대분류 추가</button>&nbsp;
					<button id="processDelete" >삭제</button>
				</div>
				<div class="right">
					분류정보
					<div>
						분류명 : <input type="text" id="processName"/><br/>
						상위 분류명 : <input type="text" id="processParentName"/><br/>
						일정표시 : 
						<br/>
						<input type="radio" name="scheduleDisplay" id="mainSchedule" value="1" /><label for="mainSchedule">주요일정</label>
						<input type="radio" name="scheduleDisplay" id="detailSchedule" value="2" /><label for="detailSchedule">세부일정</label>
						<input type="radio" name="scheduleDisplay" id="displayNone" value="3" /><label for="displayNone">표시안함</label>
						<br/>
						사용설정 : 
						<br/>
						<input type="radio" name="useYN" id="use" value="1" /><label for="use">사용</label>
						<input type="radio" name="useYN" id="unUse" value="0" /><label for="unUse">미사용</label>
						<br/>
					</div>
					<br/><br/><br/>
					<div>
						<input type="text" id="checkListName" />
						<button id="checkListCreate" class="btn w85 type1">항목 추가</button>
					</div>
					<br/><br/><br/>
					CHECK LIST<br/>
					<button id="checkListDelete" class="btn w85 type1">항목 삭제</button>
					
					<div class="default_tablestyle" style="margin-top:10px">
						<table summary="번호,게시판명,사용 커뮤니티 명,사용 동호회 명,등록일시,사용여부   목록입니다" cellpadding="0" cellspacing="0">
							<caption>사용자목록관리</caption>
							<colgroup>
								<col width="5%">
			                    <col width="55%">  
			                    <col width="40%">
		                    </colgroup>
		                    <thead>
		                    	<tr>
		                    		<th scope="col" nowrap="nowrap"><input type="checkbox" id="ckAll"/></th>
			                        <th scope="col" nowrap="nowrap">항목명</th>
			                        <th scope="col" nowrap="nowrap">사용유무</th>
		                    	</tr>
		                    </thead>
		                    <tbody id="processCheckList">
		                    	
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
	var container = $('#parentDiv');
	var pcCode;
	
	var checkListView = function(row) {
		return  $('<tr class="rowAuth"><td nowrap="nowrap"><input type="checkbox" name="check[]" data-cl_pk=' + row.clPk + ' /></td><td nowrap="nowrap">' + row.clTitle + '</td><td nowrap="nowrap"><input type="radio" name="checkListUse' + row.clPk + '" value="1" /><label for="checkListUse">사용</label><input type="radio" name="checkListUse' + row.clPk + '" value="0" /><label for="checkListUnUse">미사용</label></td></tr>');
	}
	
	var processCreate = function() {
		$('#parentDiv').children('div').append('<div class="0"><input type="text" id="createProcessName" /></div>');
		$('#createProcessName').focus();
	}
	
	$(document).on('change', '#createProcessName' ,function() {
		var createProcessName = $(this).val();
		console.log(createProcessName);
		$(this).parent().append('<a class="subRow">' + createProcessName + '</a>');
		$(this).remove();
	});
	
	var checkListCreate = function() {
		if(pcCode == undefined) {
			alert("해당 프로세스를 선택해주세요.");
			return false;
		} else {
			checkListName = $('#checkListName').val()
			
			data = {
				"clTitle" : checkListName
				, "pcCode" : pcCode
			}
			
			if( ! confirm("등록된 정보를 저장하지 않습니다.") ) {
				return false;
			} else {
				$.post("/empo/auth/eMAU00D02CheckListCreate.do", data).done(function (res) {
					alert("체크리스트가 추가되었습니다.")
					$('#processCheckList').append(checkListView(res.list));
					
					var clPk = res.list.clPk;
					console.log(clPk)
					$('input[name="checkListUse' + clPk + '"]').filter(function(index, row) {
						if(res.list.clUse == $(row).val()) {
							$(row).prop('checked', true);
						}
					});
					
				}).fail(function() {
					alert("실패");
				})
			}
			
		}
	}
	
	var checkListDelete = function() {
		var valueArr = new Array();
		console.log(pcCode)
		var check = $("input[name='check[]']").filter(function() {
			if($(this).is(':checked') == true) {
				var clPk = $(this).data('cl_pk');
				console.log(clPk)
				valueArr.push(clPk)
			}
		})
		
		if (valueArr.length == 0) {
			alert("선택된 글이 없습니다.");
		} else {
			if( ! confirm("삭제 하시겠습니까?") ){
				return false;
			} else {
				$.post('/empo/auth/eMAU00D02CheckListDelete.do', { "clPk" : valueArr }).done(function() {
					alert("삭제되었습니다.");
					$('input[name="check[]"]').filter(function(index, row) {
						if($(row).is(':checked') == true) {
							$(row).parents('.rowAuth').remove()
						}
						if ( $('#ckAll').prop('checked') ) {
							$('#ckAll').prop('checked', false);
						}
						
					})
				}).fail(function() {
					alert("실패");
				})
			}
		}
	}
	
	// 체크박스 전체 선택 Event(공통)
	var checkAll = function () {
		if($(this).prop("checked")){
			$("input[name='check[]']").prop("checked", true);
		} else {
			$("input[name='check[]']").prop("checked", false);
		}
	}
	
	var select = function() {
		
		pcCode = $(this).data('pc_code');
		
		$('.rowAuth').remove();
		
		if ( $('#ckAll').prop('checked') ) {
			$('#ckAll').prop('checked', false);
		}
		
		$.post('/empo/auth/eMAU00D02processDetail.do', { 'pcCode' : pcCode }).done(function(res) {
			console.log(res.list)
			$('#processName').val(res.list.PC_NAME);
			$('#processParentName').val(res.list.PC_NAME_P);
			$('input[name="scheduleDisplay"]').filter(function(index, row) {
				if(res.list.PC_SCHEDULE_CODE == $(row).val()) {
					$(row).prop('checked', true);
				}
			});
			
			$('input[name="useYN"]').filter(function(index, row) {
				if(res.list.PC_USE == $(row).val()) {
					$(row).prop('checked', true);
				}
			});
			
			$.post('/empo/auth/eMAU00D02processCheckList.do',  { 'pcCode' : pcCode }).done(function(res) {
				var clUseList = [];				
				res.list.forEach(function(row, index) {
					clUseList.push(row.clUse)
					console.log(clUseList)
					$('#processCheckList').append(checkListView(row));
				})
				
				$('.rowAuth').filter(function (index, row) {
					var checkListUse = $(row).find('input[type="radio"]')
					var clUse = clUseList[index]
					checkListUse.filter(function(index, row) {
						if(clUse == $(row).val()) {
							$(row).prop('checked', true);
						} 
					});
				});
			})
		}).fail(function() {
			alert("실패");
		})
		/*
		var data = {
			'pcCode' : selectData
		}
		var jsonData = JSON.stringify(data);
		
		$.ajax({
			url : ''
			, type: 'post'
			, contentType : "application/json; charset=utf-8"
			, data : jsonData
		}).done(function(res) {
			console.log(res.list);
		}).fail(function() {
			
		})
		*/
	}
	
	var createDiv = function(row) {
		return  $('<div class="'+ row.pcPCode+'"><a class="subRow" data-pc_code="' + row.pcCode + '">' + row.pcName + '</a>');
	}
	
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
	
	var addSubs = function(parentDiv, subs) {
		var div = $("<div style='padding-left: 20px;' >");
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
		var url = '/empo/auth/eMAU00D02processList.do';
		$.ajax({
			url: url
			, type: 'post'
			, contentType : "application/json; charset=utf-8"
			, data : {}
		}).done(function(res) {
			var subs = getTree(res.list);
			addSubs( $('#parentDiv'), subs);
			$('.containerDiv').children('.0').children('a').append('<button id="button" style="width: 20px;">+</button>');
		}).fail(function(){
			alert("실패");
		});
		
		$(document).on('click', '.subRow', select);
		$('#ckAll').click( checkAll );
		$('#checkListDelete').click( checkListDelete );
		$('#checkListCreate').click( checkListCreate );
		$('#processCreate').click( processCreate );
	});
	
	
})();
	
</script>