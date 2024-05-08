<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
 

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

<script type="text/javascript">
	$(document).ready(function() {		
		setDateBox();
	});
	
	function setDateBox(){
        var dt = new Date();
        var year = "";
        var com_year = dt.getFullYear();
        // 발행 뿌려주기
        //$("#YEAR").append("<option value=''>년도</option>");
        // 올해 기준으로5년전을 보여준다.
        for(var y = (com_year-4); y < (com_year+3); y++){
        	if(y == com_year ){
        		$("#searchYear").append("<option selected value='"+ y +"'>"+ y + " 년" +"</option>");
        	}else{
        		$("#searchYear").append("<option value='"+ y +"'>"+ y + " 년" +"</option>");
        	}
            
        }
        // 월 뿌려주기(1월부터 12월)
        var month;
        $("#MONTH").append("<option value=''>월</option>");
        for(var i = 1; i <= 12; i++){
            $("#MONTH").append("<option value='"+ i +"'>"+ i + " 월" +"</option>");
        }
    }
	function checkAll() {
        if ($("#checkAll").is(':checked')) {
            $("input[type=checkbox]").prop("checked", true);
        } else {
            $("input[type=checkbox]").prop("checked", false);
        }
    }
	
</script>

 
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
				<h3>Schedule</h3>
                <c:import url="/EmpPageLink.do?link=main/include/top" /> 
			</div>
			<!-- 화면 상단 종료 -->
			<!-- s :contents_guide -->
			<div class="contents_guide">
				<div class="schedule_guide">
				
					<div class="schedule_all2">
						<div class="schedule_top">
							<ul class="view_btn">
								<li><a href="<c:url value='/'/>empo/schedule/eMAU00B01Main.do" >YEAR</a></li>
								<li><a href="<c:url value='/'/>empo/schedule/eMAU00B02Main.do">MONTH</a></li>
								<li><a href="<c:url value='/'/>empo/schedule/eMAU00B03Main.do">WEEK</a></li>
								<li><a href="<c:url value='/'/>empo/schedule/eMAU00B04Main.do" class="active">과제(상세)</a></li>
							</ul>
						</div>
						<!-- e :schedule_top -->
						
					</div>
				</div>
					<!-- 검색 필드 박스 시작 -->
				<div class="search_box01">
					<form name="searchForm" id="searchForm" method="post">
						<fieldset><legend>조건정보 영역</legend> 
						<input type="hidden" id="page" name="page" value="" />
						<select name="searchYear" id="searchYear" title="년도" class="select w80" >	
						</select>
					
						<span class="search_box03 input_w40">
							<input type="text" name="searchName" id="searchName" placeholder="공고명 입력" >
							<button type="button" id="commonSearch" name="commonSearch" class="btn_search01">검색</button>
						</span>
						</fieldset>
					</form>
					<!-- e :search_box02 -->
				</div>
				
				<div class="btn_guide ar">
					<button type="button" class="btn_style02 btn_green" id="btnExcelDownload">선택 엑셀 다운로드</button>
					<button type="button" class="btn_style02 btn_red" id="print">인쇄</button>
				</div>
				<!-- e :search_box01 -->
				<div class="bbs_list" >
                	<table id="bbs_list1">
					  	<caption class="abc">과제현황으로 연번, 과제번호, 사업명, 내역 사업명, 내내역 사업명, 최종과제 진행구분명, 공고명, 세부공고명, 접수시작일, 접수 종료일,제출완료일 보여주는 리스트화면</caption>
						
						<thead>
						<tr>
						  <th scope="col"><input type="checkbox" id="checkAll" onclick="checkAll();"></th>
						  <th scope="col">사업년도</th>
						  <th scope="col">공고번호</th>
						  <th scope="col">사업명</th>
						  <th scope="col">내역 사업명</th>
						  <th scope="col">내내역 사업명</th>
						  <th scope="col">공고명</th>
						  <th scope="col">세부공고명</th>
						  <th scope="col">진행구분</th>
						  <th scope="col">일자</th>
						</tr>
						</thead>
						<tbody id="resultList">
						 <!-- <tr>
						  <td>1</td>
						  <td>2021</td>
						  <td>S000000</td>
						  <td>공정품질</td>
						  <td>현장형R&D</td>
						  <td>현장형R&D</td>
						  <td>평가진행중</td>
						  <td>202100201</td>
						  <td>2021년 공정품질</td>
						  <td>2021년 공정품질 1차</td>
						  <td>20210201</td> 
						  <td>20210215</td> 
						  <td>20210215</td> 
						  <td>접수마감</td>
						</tr>  -->
					  </tbody> 
					</table>
				</div>
				<!-- e :btn_guide -->
					
					<!-- e :schedule_all -->
				
					<!-- 선택보기 단계 표시 시작 
					<div class="process_guide">
						<div class="title">선택보기</div>
						<div class=" scroll sbox_h700">
						</div>
					</div>
					-->
					<!-- 선택보기 단계 표시 종료 -->
					<div class="bbs_page">
						<ul class="pagination">
							<!-- <li class="first"><a href="#" title="첫 페이지 바로가기"><img src="/images/bbs_prev02.gif" alt="첫 페이지" style="margin: 10px;"></a></li>
							<li class="prev"><a href="#" title="이전 페이지(1page) 바로가기"><img src="/images/bbs_prev01.gif" alt="이전 페이지" style="margin: 10px;"></a></li>
							<li class="active">1</li>
							<li class=""><a href="#" title="2페이지 바로가기">2</a></li>
							<li class=""><a href="#" title="3페이지 바로가기">3</a></li>
							<li class=""><a href="#" title="4페이지 바로가기">4</a></li>
							<li class=""><a href="#" title="5페이지 바로가기">5</a></li>
							<li class="next"><a href="#" title="다음 페이지(11page) 바로가기"><img src="/images/bbs_next01.gif" alt="다음 페이지" style="margin: 10px;"></a></li>
							<li class="last"><a href="#" title="끝 페이지(67page) 바로가기"><img src="/images/bbs_next02.gif" alt="마지막 페이지" style="margin: 10px;"></a></li> -->
						</ul>
					</div>
					
					<table id="excelDownloadTable" style="display:none">
						<thead>
							<tr>
						  <th scope="col">사업년도</th>
						  <th scope="col">공고번호</th>
						  <th scope="col">사업명</th>
						  <th scope="col">내역 사업명</th>
						  <th scope="col">내내역 사업명</th>
						  <th scope="col">공고명</th>
						  <th scope="col">세부공고명</th>
						  <th scope="col">진행구분</th>
						  <th scope="col">일자</th>
							</tr>
						</thead>
						<tbody id="tableExcel">
						 <!-- <tr>
						  <td><input type="checkbox" name="checkField"></td>
						  <td>대기</td>
						  <td>중소기업혁신개발사업(수출지향형) 1차</td>
						  <td>전자평가</td>
						  <td>-</td>
						  <td><a href="/empo/resources/eMAU00C011Main.do" class="btn_style03 btn_red">등록</a>  
						  <td><a href="/empo/resources/eMAU00C011Main.do" class="btn_style03 btn_red">등록</a></td>
						  <td><button type="button" class="btn_style03 btn_red btnMoveReg">등록</button></td>
						  <td>21.03.25 14:00</td>
						   <td>21.03.25 18:00</td>
						  <td>21.03.20</td> 
						</tr> -->
					  </tbody> 
					</table>
					
				</div>
				<!-- e :schedule_guide -->
				
			</div>
			</div>
			<!-- e :contents_guide -->
			
		<!-- e :right_guide -->
	<!-- e :wrap -->
	</body>
<script>
;(function() {
	$("#print").click(function() {
		$('.abc').remove();
		var printHtml =$('.bbs_list').html();
		var win = window.open('','_blank','fullscreen');
		win.document.write("<html><head></head></html>")
		win.document.write(printHtml);
		win.document.write("</body></html>");
		win.document.close();
		win.focus();
		win.print();
		$('.bbs_list').load(window.location.herf + ".bbs_list");
		win.close();
	});
	// 선택 엑셀 다운로드 버튼
	$("#btnExcelDownload").click(function() {
		if ($("input[name=checkField]:checkbox:checked").length == 0) {
			alert("엑셀 다운로드 할 사업을 선택해 주세요.");
			return false;
		} else {
			var paramArr = new Array();
			
			// 엑셀다운로드 프로세스 삽입
			$("input[name=checkField]:checkbox:checked").filter(function(index, row) {
				var data = {
					"ancmId" : $(row).data('ancm_id')
					
				}
				paramArr.push(data);
			});
			
			console.log(paramArr);
			$.ajax({
				url : "/empo/schedule/excelDownloadList.do"
				, type : 'post'
				, data : JSON.stringify(paramArr)
				, async : false
				, contentType : "application/json; charset=utf-8"
			}).done(function(res) {
				alert("엑셀 다운로드가 진행됩니다.");
				$('#tableExcel').children().remove();
				res.list.forEach(function(row1, index) {
					row1.forEach(function(row2, index) {
						$('#tableExcel').append(excelDownload(row2));
					});
				});
				
			});
			var table = $("#excelDownloadTable");
			
			if (table) {
				var html = 
					'<html xmlns:x="urn:schemas-microsoft-com:office:excel">' +
					'	<head>' +
					'	<meta http-equiv="content-type" content="application/vnd.ms-excel; charset=UTF-8">' +
					'		<xml>' +
					'			<x:ExcelWorkbook>' +
					'				<x:ExcelWorksheets>' +
					'					<x:ExcelWorksheet>' +
					'						<x:Name>' + "sheet1" + '</x:Name>' +
					'						<x:WorksheetOptions><x:Panes></x:Panes></x:WorksheetOptions>' +
					'					</x:ExcelWorksheet>' +
					'				</x:ExcelWorksheets>' +
					'			</x:ExcelWorkbook>' +
					'		</xml>' +
					'	</head>' +
					'	<body>' + table[0].outerHTML +
					'	</body>' +
					'</html>' ;
					
				var data_type = 'data:application/vnd.ms-excel';
				var ua = window.navigator.userAgent;
				var blob = new Blob([html], {type: "application/csv;charset=utf-8;"});
				
				if ((ua.indexOf("MSIE") > 0) || !!navigator.userAgent.match(/Trident.*rv\:11\./)) {
					if(window.navigator.msSaveBlob) {
						navigator.msSaveBlob(blob, "test1.xls");
					}
				} else {
					var anchor = window.document.createElement('a');
					anchor.href = window.URL.createObjectURL(blob);
					anchor.download = "test1.xls";
					document.body.appendChild(anchor);
					anchor.click();
					document.body.removeChild(anchor);
				}
			}
			
		}
	});
	
	var excelDownload = function(row) { 
		var data = 
			'<tr id="subRow" class="subTr" >' +
			'	<td class="subRow"> ' + row.busiYy + '</td>' +
			'	<td class="subRow">' + row.ancmId + '</td>' +
			'	<td class="subRow">' + row.busiNm + '</td>' +
			'	<td class="subRow">' + row.brdnBusiNm + '</td>' +
			'	<td class="subRow">' + row.bbrdnBusiNm + '</td>' +
			'	<td class="subRow">' + row.ancmNm + '</td>' +
			'	<td class="subRow">' + row.dtlAncmNm + '</td>' +
			'	<td class="subRow">' + row.pjGubun + '</td>' +
			'	<td class="subRow">' + row.pjYmd + '</td>' +
			'</tr>' ;
			
			return $(data);
			
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
		
		var formSer = $('#searchForm').serialize();
		
		$.ajax({
			url : '/empo/schedule/selectProjectList.do'
			, type : 'post'
			, data :formSer
		}).done(function(res) { 
			console.log(res);
			$('#resultList').children().remove();
			$('.pagination').children().remove();
			//목록 출력
			res.list.forEach(function(row, index) {
				
				$('#resultList').append(projectListView(row));
				//pjCode = row.pjCode;
			});
			
			$('.pagination').append(paginationView(res.paginationInfo));
			
			$('.' + res.paginationInfo.currentPageNo ).addClass("active");
			$('.pagination > li').css('cursor', 'pointer');
			
		}).fail(function() {
			alert("실패");
		});
		
	});
	
	$(function() { 
		initList();
		$('#commonSearch').click( search );
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
	
	var initList = function() {
		var formSer = $("#searchForm").serialize();
		//과제리스트 호출
		$.post('/empo/schedule/selectProjectList.do', formSer).done(function(res) {
			res.list.forEach( function(row, index) {
				$('#resultList').append(projectListView(row));
			});
			
			$('.pagination').append(paginationView(res.paginationInfo));
			
			$('.' + res.paginationInfo.currentPageNo ).addClass("active");
			$('.pagination > li').css('cursor', 'pointer');
			
		}).fail(function() {
			alert("실패");
		});
	}
	var projectListView = function(row) {
		var data = 
			'<tr id="subRow" class="subTr">' +
			"<td class='checkboxClass' style='text-align: center;' ><input type=\"checkbox\" name='checkField' data-ancm_id= '" + row.ancmId + "'  /></td>" +
			/* '	<td class="subRow" data-pj_code=' + row.pjCode +  '>' + row.pjCode + '</td>' +*/
			'	<td class="subRow"> ' + row.busiYy + '</td>' +
			'	<td class="subRow">' + row.ancmId + '</td>' +
			'	<td class="subRow">' + row.busiNm + '</td>' +
			'	<td class="subRow">' + row.brdnBusiNm + '</td>' +
			'	<td class="subRow">' + row.bbrdnBusiNm + '</td>' +
			'	<td class="subRow">' + row.ancmNm + '</td>' +
			'	<td class="subRow">' + row.dtlAncmNm + '</td>' +
			'	<td class="subRow">' + row.pjGubun + '</td>' +
			'	<td class="subRow">' + row.pjYmd + '</td>' +
			'</tr>' ;
			
			return $(data);
	} 
	
	var search = function() {
		$("#page").val("");
		var formSer = $('#searchForm').serialize();
		
		$.post('/empo/schedule/selectProjectList.do', formSer).done(function(res) {
			
			$('#resultList').children().remove();
			$('.pagination').children().remove();
			$('.subTr').remove();  
			if(res.totalCnt == '0'){
				var data =  "<tr class='subTr'><td colspan='7' style='height:100px;'>자료가 존재하지 않습니다.</td></tr>" ;
				$('#resultList').append(data);
				$('.pagination').append(paginationView(res.paginationInfo));
				
				$('.' + res.paginationInfo.currentPageNo ).addClass("active");
				$('.pagination > li').css('cursor', 'pointer');
				
			}else{
				res.list.forEach(function(row, index) {
					console.log(row)
					$('#resultList').append(projectListView(row));
					mbCode = row.mbCode;	
				});
				
				$('.pagination').append(paginationView(res.paginationInfo));
				
				$('.' + res.paginationInfo.currentPageNo ).addClass("active");
				$('.pagination > li').css('cursor', 'pointer');
			} 
			
		}).fail(function() {
			alert("실패");
		})
	};
})();

</script>
</body>
</html>
