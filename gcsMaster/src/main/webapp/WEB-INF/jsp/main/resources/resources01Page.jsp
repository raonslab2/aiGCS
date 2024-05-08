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

<script type="text/javascript">
	$(document).ready(function() {
		setDateBox();
		searchEmPjDiCode();
		
		
		
	
		// 검색조건 추가 버튼
		$("#btnSearchAdd").click(function() {
			var chk = $("#addSearchArea").css("display");

			if (chk == "none") {
				$("#addSearchArea").css("display","block");
				$("#btnSearchAdd > span").text("▲");
			}
			else {
				$("#addSearchArea").css("display",'none');
				$("#btnSearchAdd > span").text("▼");
			}
		});

		
		// 달력 입력 datepicker 설정
		$('.inputCalendar').datepicker({
			dateFormat : 'yyyy.mm.dd'		// 날짜 형태 설정		
		});	


		// 평가기간 버튼 클릭
		$(".period > a").click(function() {

			$(".period > a").removeClass("active");
			$(this).addClass("active");
			
			var searchDate1 = "";
			var searchDate2 = "";
			var dateDiv = $(this).index();
			var now = new Date();
			
			var yy = now.getFullYear();
			var mm = ('0' + (now.getMonth() + 1)).slice(-2);
			var dd = ('0' + now.getDate()).slice(-2);
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

			$("#searchVuDayStart").val(searchDate1);
			$("#searchVuDayEnd").val(searchDate2);
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

		
		// 기본검색 (연도 및 사업명 검색) 처리
		/* $("#searchForm").submit(function () {
			alert("기본검색 처리 입니다.");
			return false;
		}); */
		
		// 검색조건 추가 검색 처리
		$("#addSearchForm").submit(function () {
			alert("검색조건 추가 검색 처리 입니다.");
			return false;
		});


		// 등록화면 이동
		/*  $(".btnMoveReg").click(function() {
			window.location.href = "/empo/resources/eMAU00C011Main.do";
		}); */
	});
	
	
 
	function fnListModify() {
		window.location.href = "/empo/resources/eMAU00C011Main.do";
	}
	
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
	
	function searchEmPjDiCode(){
	    //평가종류
		$('#searchVuDiCode').children('option:not(:first)').remove();
		var data = "";
		$.get( '/empo/resources/searchEmPjDiCode.do', { "searchCode" : data } ).done(function(res) {
			console.log(res.list)
			res.list.forEach( function(row, index) {
				var option = $('<option value="'+ row.vuDiCode +'">'+ row.vuDiTitle +'</option>');
				$('#searchVuDiCode').append(option)
			})
		}).fail(function() {
			alert("실패")
		});
	}
	
	
	
	function checkAll() {
        if ($("#checkAll").is(':checked')) {
            $("input[type=checkbox]").prop("checked", true);
        } else {
            $("input[type=checkbox]").prop("checked", false);
        }
    }
	
</script>

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
						<%-- <li><a href="<c:url value='/empo/resources/eMAU00C03Main.do'/>">가용자원 조회(평가장) 삭제예정</a></li> --%>
					</ul>
				</div>
				
				<!-- <div class="btn_guide ar mt-65 mb30">
					<button type="button" class="btn_style01 btn_blue  btnMoveReg">등록</button>
				</div> -->
				<!-- e :btn_guide -->
				
				<!-- 검색 필드 박스 시작 -->
				<div class="search_box01">
					<form name="searchForm" id="searchForm" method="post">
					<fieldset><legend>조건정보 영역</legend> 
					<select name="searchYear" id="searchYear" title="년도" class="select w80" >
					</select>
					
					<span class="search_box03 input_w40">
						<input type="text" name="searchName" id="searchName" placeholder="사업명 입력" >
						<button type="button" id="commonSearch" name="commonSearch" class="btn_search01">검색</button>
					</span>
					<button type="button" name="btnSearchAdd" class="btn_style01 btn_gray ml10" id="btnSearchAdd">검색조건 추가 <span>▼</span></button>
					</fieldset>
					
					<!-- s :search_box02 //검색조건 추가 버튼 클릭시 나타남-->
					<div class="search_box02" id="addSearchArea" style="display:none;"> 
						<ul>
							<li><span>평가기간</span>
								<input type="text" class="inputCalendar" name="searchVuDayStart" id="searchVuDayStart">
								~
								<input type="text" class="inputCalendar" name="searchVuDayEnd" id="searchVuDayEnd">

								<div class="period">
									<a href="#">오늘</a>
									<a href="#">7일</a>
									<a href="#">15일</a>
									<a href="#">1개월</a>
									<a href="#">5개월</a>
									<a href="#" class="active">전체</a>
							</li>
							<!-- <li><span>평가종류</span>
								<select id="searchVuDiCode" name="searchVuDiCode">
									<option value="" >전체</option> 
								</select> 
							</li> -->
							<li><button type="button" class="btn_style01 btn_gray" id="commonSearch2">검색</button></li>
						</ul>						
					</div>
					<input type="hidden" id="page" name="page" value="" />
					</form>
					<!-- e :search_box02 -->
				</div>
				<!-- e :search_box01 -->
				
				<div class="btn_guide ar">
					<button type="button" class="btn_style02 btn_green" id="btnExcelDownload">선택 엑셀 다운로드</button>
				</div>
				<!-- e :btn_guide -->

                <div class="bbs_list" >
                	<table id="bbs_list1">
					  	<caption>분과구성현황으로 현황, 사업명, 평가종류, 분과번호, 분과위원회명, 담당간사, 평가장소, 평가시작일시, 평가종료일시, 등록일을 보여주는 리스트화면</caption>
						
						<thead>
						<tr>
						  <th scope="col"><input type="checkbox" id="checkAll" onclick="checkAll();"></th>
						  <th scope="col">현황</th>
						  <th scope="col">사업명</th>
						  <th scope="col">평가종류</th>
						  <th scope="col">분과번호</th>
						  <th scope="col">분과위원회명</th>
						  <th scope="col">담당간사</th>
						  <th scope="col">평가장소</th>
						  <th scope="col">평가시작일시</th>
						  <th scope="col">평가종료일시</th>
						  <th scope="col">등록일</th>
						</tr>
						</thead>
						<tbody id="resultList">
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
				<!-- e :bbs_list -->
					
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
				<!-- e :bbs_page -->
				
				<table id="excelDownloadTable" style="display:none">
						<thead>
							<tr>
							  <th scope="col">현황</th>
							  <th scope="col">사업명</th>
							  <th scope="col">평가종류</th>
							  <th scope="col">분과번호</th>
							  <th scope="col">분과위원회명</th>
							  <th scope="col">담당간사</th>
							  <th scope="col">평가장소</th>
							  <th scope="col">평가시작일시</th>
							  <th scope="col">평가종료일시</th>
							  <th scope="col">등록일</th>
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
			<!-- e :contents_guide -->
		</div>
		<!-- e :right_guide -->
	</div>
	<!-- e :wrap -->
</body>

<script type="text/javascript">
;(function(){
	var searchOption = "";
	$(document).ready(function() {
		initList();
		$('#commonSearch').click(search);
		$('#commonSearch2').click(search2);
	}); 
	
	var search = function () {
		$("#page").val("");
		
		searchOption = "1";
		var formSer = $('#searchForm').serialize();
		
		$.post('/empo/resources/searchBusinessList.do', formSer).done(function(res){
			$('.subTr').remove();
			console.log(res);
			if(res.totalCnt=='0'){
				var data =  "<tr class='subTr'><td colspan='11' style='height:100px;'>자료가 존재하지 않습니다.</td></tr>" ;
				$("#resultList").append(data);
			}else{
				$('#resultList').children().remove();
				$('.pagination').children().remove();
				res.list.forEach(function(row, index) {
					$('#resultList').append(checkListView(row));
				});
				
				$('.pagination').append(paginationView(res.paginationInfo));
				$('.' + res.paginationInfo.currentPageNo ).addClass("active");
				$('.pagination > li').css('cursor', 'pointer');
			}
		}).fail(function() {
			alert("실패");
		});
	} 
	
	var search2 = function () {
		$("#page").val("");
		 
		searchOption = "2";
		var formSer = $('#searchForm').serialize();
		
		$.post('/empo/resources/searchAddList.do', formSer).done(function(res){
			$('.subTr').remove();
		console.log(res.totalCnt);
			if(res.totalCnt=='0'){
				var data =  "<tr class='subTr'><td colspan='11' style='height:100px;'>자료가 존재하지 않습니다.</td></tr>" ;
				$("#resultList").append(data);
			}else{
				$('#resultList').children().remove();
				$('.pagination').children().remove();
				res.list.forEach(function(row, index) {
					$('#resultList').append(checkListView(row));
				});
				
				$('.pagination').append(paginationView(res.paginationInfo));
				$('.' + res.paginationInfo.currentPageNo ).addClass("active");
				$('.pagination > li').css('cursor', 'pointer');
			}
		}).fail(function() {
			alert("실패");
		});
	} 
	 
	 $(document).on('click', '.availInsert', function() {
		 //'/empo/resources/eMAU00C011Main.do'
		 var pjCode = $(this).data('pj_code');
		 var pjYear = $(this).data('pj_year');
		 console.log(pjCode)
		 console.log(pjYear)
		 $.post("/empo/resources/eMAU00C011Main.do", { "pjCode" : pjCode, "pjYear" : pjYear }).done(function() {
			 
		 }).fail(function() {
			 alert("실패");
		 });
	 });
	 
	 /* function excelDownload(fileName, sheetName, sheetHtml) {
		var html = 
			'<html xmlns:x="urn:schemas-microsoft-com:office:excel">' +
			'	<head>' +
			'	<meta http-equiv="content-type" content="application/vnd.ms-excel; charset=UTF-8">' +
			'		<xml>' +
			'			<x:ExcelWorkbook>' +
			'				<x:ExcelWorksheets>' +
			'					<x:ExcelWorksheet>' +
			'						<x:Name>' + sheetName + '</x:Name>' +
			'						<x:WorksheetOptions><x:Panes></x:Panes></x:WorksheetOptions>' +
			'					</x:ExcelWorksheet>' +
			'				</x:ExcelWorksheets>' +
			'			</x:ExcelWorkbook>' +
			'		</xml>' +
			'	</head>' +
			'	<body>' + sheetHtml +
			'	</body>' +
			'</html>' ;
			
		var data_type = 'data:application/vnd.ms-excel';
		var ua = window.navigator.userAgent;
		var blob = new Blob([html], {type: "application/csv;charset=utf-8;"});
		
		if ((ua.indexOf("MSIE") > 0) || !!navigator.userAgent.match(/Trident.*rv\:11\./)) {
			if(window.navigator.msSaveBlob) {
				navigator.msSaveBlob(blob, fileName);
			}
		} else {
			var anchor = window.document.createElement('a');
			anchor.href = window.URL.createObjectURL(blob);
			anchor.download = fileName;
			document.body.appendChild(anchor);
			anchor.click();
			document.body.removeChild(anchor);
		}
	} */
	 
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
						
					"pjtitle" : $(row).data('pj_title')
					, "coCateName" : $(row).data('co_cate_name')
					, "mbName" : $(row).data('mb_name')
					
				}
				paramArr.push(data);
			});
			
			console.log(paramArr);
			$.ajax({
				url : "/empo/resource/excelDownloadList.do"
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
						navigator.msSaveBlob(blob, "test.xls");
					}
				} else {
					var anchor = window.document.createElement('a');
					anchor.href = window.URL.createObjectURL(blob);
					anchor.download = "test.xls";
					document.body.appendChild(anchor);
					anchor.click();
					document.body.removeChild(anchor);
				}
			}
			
		}
	});
	
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
		
		if (searchOption == "1") {
			var formSer = $('#searchForm').serialize();
			$.post('/empo/resources/searchBusinessList.do', formSer).done(function(res){
				$('.subTr').remove();
				console.log(res);
				if(res.totalCnt=='0'){
					var data =  "<tr class='subTr'><td colspan='11' style='height:100px;'>자료가 존재하지 않습니다.</td></tr>" ;
					$("#resultList").append(data);
				}else{
					$('#resultList').children().remove();
					$('.pagination').children().remove();
					res.list.forEach(function(row, index) {
						$('#resultList').append(checkListView(row));
					});
					
					$('.pagination').append(paginationView(res.paginationInfo));
					$('.' + res.paginationInfo.currentPageNo ).addClass("active");
					$('.pagination > li').css('cursor', 'pointer');
				}
			}).fail(function() {
				alert("실패");
			});
		} else if (searchOption == "2") {
			var formSer = $('#searchForm').serialize();
			$.post('/empo/resources/searchAddList.do', formSer).done(function(res){
				$('.subTr').remove();
				console.log(res.totalCnt);
				if(res.totalCnt=='0'){
					var data =  "<tr class='subTr'><td colspan='11' style='height:100px;'>자료가 존재하지 않습니다.</td></tr>" ;
					$("#resultList").append(data);
				}else{
					$('#resultList').children().remove();
					$('.pagination').children().remove();
					res.list.forEach(function(row, index) {
						$('#resultList').append(checkListView(row));
					});
					
					$('.pagination').append(paginationView(res.paginationInfo));
					$('.' + res.paginationInfo.currentPageNo ).addClass("active");
					$('.pagination > li').css('cursor', 'pointer');
				}
			}).fail(function() {
				alert("실패");
			})
		} else {
			var param = $("#searchForm").serialize();
			$.post('/empo/resources/eMAU00C01List.do', param).done(function(res) {
				console.log(res)
				$('#resultList').children().remove();
				$('.pagination').children().remove();
				res.list.forEach(function(row, index) {
					$('#resultList').append(checkListView(row));
				});
				
				$('.pagination').append(paginationView(res.paginationInfo));
				$('.' + res.paginationInfo.currentPageNo ).addClass("active");
				$('.pagination > li').css('cursor', 'pointer');
			});
		}
		
	});
	
	var excelDownload = function(row) { 
		var pjDataTitle = "";
		if(row.pjState == '0'){
			pjDataTitle = "대기";
		}else if(row.pjState == '1'){
			pjDataTitle = "진행중";
		}else if(row.pjState == '2'){
			pjDataTitle = "완료";
		}
		
		var vuDiCodeTitle = "";
		if(row.vuDiCode == '1'){
			vuDiCodeTitle = "전자평가";
		}else if(row.vuDiCode == '2'){
			vuDiCodeTitle = "온라인평가";
		}else if(row.vuDiCode == '3'){
			vuDiCodeTitle = "오프라인평가";
		}
		
        var data = 
        	" <tr class='subTr' style='text-align: center;border: 1px solid #ddd;height:28px;'>\r\n" + 
			"	<td>"+ pjDataTitle +"</td>\r\n" + 
			"	<td style='text-align: center;'>"+row.pjTitle+"</td>\r\n" +  
			"	<td>"+vuDiCodeTitle+"</td>\r\n" + 
			"	<td>-</td>\r\n" ; 
		if (row.coCateName != "") {
			data += "	<td>" + row.coCateName + "</td>\r\n" ;
		} else {
			data += " <td></td>"
			//data += " <td><button type='button' data-pj_code='" + row.pjCode + "' data-pj_year='" + row.pjYear + "' class='btn_style03 btn_red availInsert'>등록</button>"
		}
		
		if (row.mbName != "") {
			data += "	<td>" + row.mbName + "</td>\r\n" ;
		} else {
			data += " <td></td>"
			//data += " <td><button type='button' data-pj_code='" + row.pjCode + "' data-pj_year='" + row.pjYear + "' class='btn_style03 btn_red availInsert'>등록</button>"
		}
		
		if (row.emVuTitle != "") {
			data += "	<td>" + row.emVuTitle + "</td>\r\n" ;
		} else {
			data += " <td></td>"
			//data += " <td><button type='button' data-pj_code='" + row.pjCode + "' data-pj_year='" + row.pjYear + "' class='btn_style03 btn_red availInsert'>등록</button>"
		}
			
		data += 
			"	<td>"+ row.vuDayStart +"</td>\r\n" + 
			"	<td>"+ row.vuDayEnd +"</td>\r\n" + 
			"	<td>"+ row.vuDayWrite +"</td>\r\n" + 
			" </tr>";
			
		return  $(data);
	} 
	 
	 var checkListView = function(row) { 
			var pjDataTitle = "";
			if(row.pjState == '0'){
				pjDataTitle = "대기";
			}else if(row.pjState == '1'){
				pjDataTitle = "진행중";
			}else if(row.pjState == '2'){
				pjDataTitle = "완료";
			}
			
			var vuDiCodeTitle = "";
			if(row.vuDiCode == '1'){
				vuDiCodeTitle = "전자평가";
			}else if(row.vuDiCode == '2'){
				vuDiCodeTitle = "온라인평가";
			}else if(row.vuDiCode == '3'){
				vuDiCodeTitle = "오프라인평가";
			}
			
			if(row.pjGubun != ''){
				vuDiCodeTitle = row.pjGubun;
			}
			
	        var data = 
	        	" <tr class='subTr' style='text-align: center;border: 1px solid #ddd;height:28px;'>\r\n" + 
 			"	<td style='text-align: center;' ><input type=\"checkbox\" name='checkField' data-pj_title='" + row.pjTitle + "' data-co_cate_name='" + row.coCateName + "' data-mb_name='" + row.mbName + "' /></td>\r\n" + 
 			"	<td>"+ pjDataTitle +"</td>\r\n" + 
 			"	<td style='text-align: center;'>"+row.pjTitle+"</td>\r\n" +  
 			"	<td>"+vuDiCodeTitle+"</td>\r\n" + 
 			"	<td>-</td>\r\n" ; 
 		if (row.coCateName != "") {
 			data += "	<td>" + row.coCateName + "</td>\r\n" ;
 		} else {
 			data += " <td><a href='/empo/resources/eMAU00C011Main.do?pjYear="+row.pjYear+"&pjCode="+row.pjCode+"' class='btn_style03 btn_red'>등록</a>"
 			//data += " <td><button type='button' data-pj_code='" + row.pjCode + "' data-pj_year='" + row.pjYear + "' class='btn_style03 btn_red availInsert'>등록</button>"
 		}
 		
 		if (row.mbName != "") {
 			data += "	<td>" + row.mbName + "</td>\r\n" ;
 		} else {
 			data += " <td><a href='/empo/resources/eMAU00C011Main.do?pjYear="+row.pjYear+"&pjCode="+row.pjCode+"' class='btn_style03 btn_red'>등록</a>"
 			//data += " <td><button type='button' data-pj_code='" + row.pjCode + "' data-pj_year='" + row.pjYear + "' class='btn_style03 btn_red availInsert'>등록</button>"
 		}
 		 
 		
 		if (row.emVuTitle != "") {
 			data += "	<td>" + row.emVuTitle + "</td>\r\n" ;
 		} else {
 			data += " <td><a href='/empo/resources/eMAU00C011Main.do?pjYear="+row.pjYear+"&pjCode="+row.pjCode+"' class='btn_style03 btn_red'>등록</a>"
 			//data += " <td><button type='button' data-pj_code='" + row.pjCode + "' data-pj_year='" + row.pjYear + "' class='btn_style03 btn_red availInsert'>등록</button>"
 		}
 			
 		data += 
 			"	<td>"+ row.vuDayStart +"</td>\r\n" + 
 			"	<td>"+ row.vuDayEnd +"</td>\r\n" + 
 			"	<td>"+ row.vuDayWrite +"</td>\r\n" + 
 			" </tr>";
 			
		return  $(data);
	 } 
	 
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
	 
	 function initList(){ 
			$('#table_default > tbody > tr').remove();
			
			var param = $("#searchForm").serialize();
		    $.ajax({
		        type : 'POST',
		        url : '/empo/resources/eMAU00C01List.do',
		        dataType : 'json',
		        data :param,
		        success : function(result) { 
		        	console.log(result);
					result.list.forEach(function(row, index) {
						$('#resultList').append(checkListView(row));
					});
					
					$('.pagination').append(paginationView(result.paginationInfo));
					
					$('.' + result.paginationInfo.currentPageNo ).addClass("active");
					$('.pagination > li').css('cursor', 'pointer');
	 
		        },
		        error: function(request, status, error) {
		             // 에러 출력을 활성화 하려면 아래 주석을 해제한다. 

		            //console.log(request + "/" + status + "/" + error);
		        }
		    }); // End Ajax Request
		  
		}
		
		
})();
</script>

</html>
