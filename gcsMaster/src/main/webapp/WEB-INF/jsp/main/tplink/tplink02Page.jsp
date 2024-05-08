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
	var tlPk = "";
	var seq = $("#tlinkMenuDivIndex").val();
	var name = $("#tlinkMenuDivClass").val();
	var loginGrmCode = "";
	var loginMbCode = "";
	var grpCode = "";
	$(document).ready(function() {
		$.ajax({
			type : "POST",
			url : "/empo/rpa/businessDepart.do"
		}).done(function(res) {
			loginMbCode = res.list.mbCode;
			loginGrmCode = res.list.grmCode;
			console.log(loginMbCode);
			console.log(loginGrmCode); // 로그인 정보연계(지난목록 보기가 로그인정보만 보여지게 될 경우)
		});
		
		// 전체조회
		$.ajax({
			type : "POST"
			,url : "/empo/tplink/allListView.do"
			,data : {'loginMbCode' : loginMbCode , 'loginGrmCode' : loginGrmCode}
		}).done(function(res) {
			res.list.forEach(function(row, index) {
				$('#resultList').append(DataListView(row));
			});
		}).fail(function(){
			alert('실패');
		})
		
		// 부서정보 호출
		$.post('/empo/auth/eMAU00F01SearchFirstOption.do').done(function(res) {
			res.list.forEach( function(row, index) {
				var option = $('<option value="'+ row.grmCode +'">'+ row.grmName +'</option>');
				$('#groupPart1').append(option)
			})
		}).fail(function() {
			alert("실패");
		});
		
		$(function() {
			$('#groupPart1').change(groupCode);
		});
		
		// 서브 그룹
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
					grpCode = data;
					console.log(grpCode)
				}).fail(function() {
					alert("실패")
				});
			}
		}
		
		// 서브서브 그룹
		$(function() {
			$('#groupPart2').change(Name);
		});
		
		var Name = function() {
			var el = $(this);
			var data = el.val();
			var id = el.attr('id');
			var data2 = $('#groupPart1').val();
			
			if (id == 'groupPart2') {
				$('#groupPart3').children('option:not(:first)').remove();
				
				$.get( '/empo/tplink/eMAU00H1SearchSubOption2.do', { "grmCode" : data, "grpCode" : data2} ).done(function(res) {
					res.list.forEach( function(row, index) {
						var option = $('<option value="'+ row.mbCode +'">'+ row.mbName +'</option>');
						$('#groupPart3').append(option);
					})
				}).fail(function() {
					alert("실패")
				});
			}
		}
		
		$("#requestData").click(function() {
			var grmCode1 = $("#groupPart1 option:selected").val();
			var grmCode2 = $("#groupPart2 option:selected").val();
			var mbCode = $("#groupPart3 option:selected").val();
			var date1 = $('#searchDate1').val();
			var date2 = $('#searchDate2').val();
			var text = $('#searchName').val();
			console.log(grpCode)
			$.ajax({
				type : "POST"
				,url : "/empo/tplink/requestData.do"
				,data : {
						'mbCode' : mbCode
						,'grmCode1' : grmCode1
						,'grmCode2' : grmCode2
						, 'date1' : date1
						, 'date2' : date2
						, 'text' : text
						, 'grpCode' : grpCode
						}
			}).done(function(res) {
				$('#resultList > tr').empty();
				res.list.forEach(function(row, index) {
					console.log(row)
					if(row.grmName != null)
					$('#resultList').append(DataListView(row));
				});
			});
		});
		var DataListView = function(row) {
			var data = 
			'<tr data-tl_title= '+  row.tlTitle + '>' +
			'	<td data-tl_pk="'+ row.tlPk +'"><a href="#" class="subjectPopupLink">' + row.tlTitle + '</td>' +
			'	<td class="subRow">' + row.mbName + '</td>' +
			'	<td class="subRow">' + row.grmName + '</td>' +
			'	<td class="subRow">' + row.tlWorkMbName + '</td>' +
			'	<td class="subRow">' + row.tlWorkGrmName + '</td>' +
			'	<td class="subRow">' + row.tlWriteTime + '</td>' +
			'	<td class="subRow">' + row.tlEndDay + '</td>' +
			'</tr>' ;
		return $(data);
		}
		
		// 달력 입력 datepicker 설정
		$('.inputCalendar').datepicker({
			dateFormat : 'yyyy.mm.dd'		// 날짜 형태 설정		
		});


		// 기간검색 버튼 클릭
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

			$("#searchDate1").val(searchDate1);
			$("#searchDate2").val(searchDate2);
		});
		
		// 일자별 부서별 팝업창 오픈
		$(document).on('click', '.subjectPopupLink', function() {
			var data = $(this).parents('td').data();
			tlPk = data.tl_pk
			console.log(tlPk)
			var name = $("#tlinkMenuDivClass").val();
			var seq = $("#tlinkMenuDivIndex").val();
			fnPopupOpen("/empo/tplink/eMAU00H04Main.do?name="+name+"&seq="+seq, "");	// ../js/popup.js 참고
		});
	});
	
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
				<h3>지난목록</h3>

				<c:import url="/EmpPageLink.do?link=main/include/top" />
			</div>
			<!-- 화면 상단 종료 -->
			
			<!-- s :contents_guide -->
			<div class="contents_guide">
				
				<form name="searchForm" id="searchForm" method="post">
				<!-- s :bbs_write01 -->
                <div class="bbs_write01 box_style02">
                    <ul class="line_no">
                        <li><span>구분</span>                       
						<select class="input_w20">
                            <option>중소기업진흥원</option>
                        </select>
						<select id="groupPart1" name="groupPart1" class="input_w30" style="width:200px">
						<option value="">선택</option>
						</select>
						<select id="groupPart2" name="groupPart2" class="input_w20" style="width:200px">
						<option value="">선택</option>
						</select>

                        </li>
						<li class="w40p"><span>담당자</span>                     
						<select id="groupPart3" name="groupPart3" class="input_w40" style="width:200px">
						<option value="">선택</option>
						</select>
                        </li>
						<li class="w60p"><span>기간</span>
							<input type="text" class="inputCalendar" name="searchDate1" id="searchDate1">
							~
							<input type="text" class="inputCalendar" name="searchDate2" id="searchDate2">

							<div class="period">
								<a href="#">오늘</a>
								<a href="#">7일</a>
								<a href="#">15일</a>
								<a href="#">1개월</a>
								<a href="#">5개월</a>
								<a href="#" class="active">전체</a>
							</div>
                        </li>
                        <li><span>검색어</span>
						<input type="text" class="input_w40" id="searchName" placeholder="요청제목을 입력해주세요.">
                        </li>
                    </ul>
                </div>
                <!-- e :bbs_write01 -->
					
                <div class="btn_guide ac mt20 mb30">
                    <button type="button" class="btn_style01 sb_style btn_red" id="requestData">자료조회</button>
                </div>
				</form>
                <!-- e :btn_guide -->
				
					
				<div class="bbs_list">
					<table>
  						<thead>
							<tr>
							  <th scope="col">제목</th>
							  <th scope="col">담당자</th>
							  <th scope="col">담당부서</th>
							  <th scope="col">요청자</th>
							  <th scope="col">요청기관</th>
							  <th scope="col">요청일시</th>
							  <th scope="col">완료일</th>
							</tr>
						</thead>
						<tbody id="resultList">

						</tbody>
					</table>
				</div>
				<!-- e :bbs_list -->
					
				<div class="bbs_page">
				  <ul>
					<li class="first"><a href="#" title="첫 페이지 바로가기"><img src="../../images/bbs_prev02.gif" alt="첫 페이지"></a></li>
					<li class="prev"><a href="#" title="이전 페이지(1page) 바로가기"><img src="../../images/bbs_prev01.gif" alt="이전 페이지"></a></li>
					<li class="active">1</li>
					<li class=""><a href="#" title="2페이지 바로가기">2</a></li>
					<li class=""><a href="#" title="3페이지 바로가기">3</a></li>
					<li class=""><a href="#" title="4페이지 바로가기">4</a></li>
					<li class=""><a href="#" title="5페이지 바로가기">5</a></li>
					<li class="next"><a href="#" title="다음 페이지(11page) 바로가기"><img src="../../images/bbs_next01.gif" alt="다음 페이지"></a></li>
					<li class="last"><a href="#" title="끝 페이지(67page) 바로가기"><img src="../../images/bbs_next02.gif" alt="마지막 페이지"></a></li>
				  </ul>
				</div>
				<!-- e :bbs_page -->
				
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
</html>
