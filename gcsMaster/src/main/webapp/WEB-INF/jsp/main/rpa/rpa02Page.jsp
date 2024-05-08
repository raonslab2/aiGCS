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
				<h3>RPA 자료</h3>
				<c:import url="/EmpPageLink.do?link=main/include/top" /> 
			</div>
			<!-- 화면 상단 종료 -->
			
			<!-- s :contents_guide -->
			<div class="contents_guide">
				<div class="submenu_guide">
					<ul>
						<!-- 2차메뉴명 -->
						<li><a href="<c:url value='/empo/rpa/eMAU00G01Main.do'/>" >RPA 자료요청</a></li>
						<li><a href="<c:url value='/empo/rpa/eMAU00G02Main.do'/>" class="active">RPA 자료조회</a></li>
					</ul>
				</div>

				<form name="searchForm" id="searchForm" method="post">
				<!-- s :bbs_write01 -->
	            	<div class="bbs_write01 box_style02">
	            		<ul class="line_no">
		   				<li><span>자료구분 *</span> 
						<!-- <label class="mr20"><input type="radio" id="datagubun1" name="datagubun" value="사업접수결과보고_결재" checked> 사업접수결과보고_결재</label> -->
						<label class="mr20"><input type="radio" id="datagubun1" name="datagubun" value="" checked> 전체 </label>
						<label class="mr20"><input type="radio" id="datagubun2" name="datagubun" value="중복성검토및요검검토자료취합"> 중복성검토및요검검토자료취합</label>
						<label class="mr20"><input type="radio" id="datagubun3" name="datagubun" value="평가결과보고"> 평가결과보고</label>
						<label class="mr20"><input type="radio" id="datagubun4" name="datagubun" value="사업접수결과"> 사업접수결과</label>
						</li>
							<li>
								<span>공고선택 *</span>
									<!-- <select name="pjYear" id="pjYear">
									</select> -->
									<input type="text" class="input_w50" id="searchRpaPjList1" placeholder="공고명 입력" size="32">
	                        </li>
	                    </ul>
	                </div>
	                <!-- e :bbs_write01 -->
						
	                <div class="btn_guide ac mt20 mb30">
	                    <button type="button" class="btn_style01 sb_style btn_red" id="searchbutton1">자료조회</button>
	                <!--<button type="button" class="btn_style01 sb_style btn_white" id="searchbutton2">테스트</button> -->
	                </div>
				</form>
		  
				<div class="bbs_list">
					* 사업부서가 해당 사업의 담당부서인지 조회한 담당자의 담당부서인지 확인 필요
					<table border="0" summary="자료구분 공고명 공고코드 사업부서 자료다운로드 등록일 페이지 입니다." >
						<caption>사용자목록관리</caption>
						<colgroup>
							<col width="3%">
							<col width="10%">
							<col width="25%">
							<col width="12%">
							<col width="">
							<col width="7%">
		                </colgroup>
						<thead>
				        	<tr>
				            	<th scope="col" nowrap="nowrap"><input type="checkbox" id="chkAll" name="checkField" onclick="checkAll();"></th>
				                <th scope="col" nowrap="nowrap">자료구분</th>
					            <th scope="col" nowrap="nowrap">공고명</th> 
					            <th scope="col" nowrap="nowrap">사업부서</th> 
					            <th scope="col" nowrap="nowrap">자료다운로드</th> 
					            <th scope="col" nowrap="nowrap">등록일</th> 
				           	</tr>
				        </thead>
		                <tbody id="resultList">
		                    <tr>
								<td id="noData" colspan='7'>자료가 없습니다.</td>
							</tr>
		                </tbody>
					</table>
				</div>
			<!-- e :contents_guide -->
			</div>
		<!-- e :right_guide -->
		</div>
	<!-- e :wrap -->
	</div>
	
<script type="text/javascript">
		function fn_downFile(atchFileId, fileSn){
		/* 	var atchFileId = "/home/rpa/work"; 
			var fileSn = "테스트.xlsx"; */
			window.open("<c:url value='/empo/rpa/FileDown.do?atchPath="+atchFileId+"&fileName="+fileSn+"'/>");
		}	 

	$("#searchRpaPjList1").autocomplete({
		source : function(request, response) {
			$.post('/empo/auth/searchProjectAutocomplete.do', { 
				/* "pjYear" : $('#pjYear').val() */
				"pjTitle" : $('#searchRpaPjList1').val() 
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
	
	$("#searchbutton2").click(function(res) {
		$.ajax({
			type : "POST",
			url : "/empo/rpa/fileTest.do"
		}).done(function(res) {
			for (var i = 0; i < res.list.length; i++) {
//				console.log(res.list[i])
				var url = res.list[i];
				downloadFile(url)
			}
		//	$('#tlFile').append($('<a id="fileDownload"  href="/' + row.flPath + '" download="' + row.flName + '">' + row.flName + '</a>'));
		});
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

	$('#searchbutton1').click(function() {
		/*
		var searchRpaPjList1 = $("#searchRpaPjList1").val();
		if ($.trim(searchRpaPjList1).length < 1) {
			alert("공고명을 입력하세요.");
			$("#searchRpaPjList1").focus();
			return false;
		} else {
			$('#resultList > tr').empty();
			initList();
		}
		*/
		initList();
	});

	var DataListView = function(row) { 
		var tmp = row.resultFile.split("||");
		var tmFile = "";
		for (var i = 0; i < tmp.length; i++) {
			if(i > 0){
				tmFile += "<br>";
			}
				//tmFile += tmp[i];
				tmp2 = tmp[i].split("/");
				var tmpLength = tmp2.length;
				var lastTmpName = tmp2[tmpLength-1];
				var tmPath = tmp[i].split(lastTmpName);
				tmFile += "<a href=\"#LINK\" onclick=\"javascript:fn_downFile('"+tmPath[0]+"','"+lastTmpName+"')\">"; 
				tmFile += lastTmpName; 
				tmFile += "</a>"; 
		}
		console.log(lastTmpName)
		var data = '<tr data-pj_title= '+  row.pjTitle + '>'
				+ '	<td ><input type="checkbox" name="checkField"></td>'
				+ '	<td class="subRow">'
				+ row.reGubun
				+ '</td>'
				+ '	<td class="subRow">'
				+ row.pjTitle
				+ '</td>'
				+ '	<td class="subRow">'
				+ row.grmName
				+ '</td>'
				+ '	<td class="subRow" style = "text-align:left; word-break:break-all">'
//				+ <a href="#LINK" onclick="javascript:fn_downFile('<c:out value="tt"/>','<c:out value="ttt"/>')">
				+ tmFile + '</td>' 
				+ '<td class="subRow">' + row.sysWriteTime + '</td>' + '</tr>';
		return $(data);
	}

	$(function() {
		var dt = new Date();
		var com_year = dt.getFullYear();
		
		initList();

		/* $("select[name='pjYear']").each(function(index, row) {
			for (var y = (com_year - 5); y <= (com_year + 1); y++) {
				$(row).append("<option value='" + y + "'>" + y + " 년" + "</option>");
			}	
		}); */

		/* $("select[name='pjYear']").children().each(function(index, row) { 
			if ($(row).val() == com_year) {
				$(row).prop('selected', true);
			}
		}); */
	});

	var initList = function() {
		var pj_title = $('#searchRpaPjList1').val(); 
		var re_gubun = $('input[name="datagubun"]:checked').val();
		/* var year = $("#pjYear option:selected").val(); */
		$.ajax({
					type : "POST",
					url : "/empo/rpa/searchRpaPjList1.do",
					data : {
						'pj_title' : pj_title,
						're_gubun' : re_gubun
					}
				}).done(function(res) {
					$("#resultList").children().remove();
					if (res.list.length > 0) { 
					$('#noData').parents('tr').remove(); 
							
					res.list.forEach(function(row, index) {
					console.log(row)
					if (row.resultFile != null) {
						// var a = row.resultFile.substring(26);
						// row.resultFile = a;
						if(row.grmName == null){row.grmName = '등록부서 없음'}
						$('#resultList').append(DataListView(row));
					}
				});
			} else {
				if ($('#noData').length == 0) {
					$('#resultList').append($("<tr><td id='noData' colspan='7'>자료가 없습니다.</td></tr>"));
				}
			}

		}).fail(function(res) {
	alert('실패')
})
}
</script>
<br><br><br><br><br><br><br><br>
</body>
</html>

