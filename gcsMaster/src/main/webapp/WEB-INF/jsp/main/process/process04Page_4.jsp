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

<script type="text/javascript"
	src="<c:url value='/'/>js/jquery.min.3.1.1.js"></script>
<script type="text/javascript"
	src="<c:url value='/'/>js/jquery.ui.all.js"></script>
<script type="text/javascript"
	src="<c:url value='/'/>js/jquery.layout.js"></script>
<link href="<c:url value='/'/>css/layout_all.css" rel="stylesheet"
	type="text/css">

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

		<table style="width: 500px;">
			<tr>
				<td colspan="3">
					<h1>휴일 설정</h1>
				</td>
			</tr>
			<tr>
				<td><a href="<c:url value='/empo/process/eMAU00D01Main.do'/>">프로세스
						매핑</a></td>
				<td><a href="<c:url value='/empo/process/eMAU00D02Main.do'/>">프로세스
						설정</a></td>
				<td><a href="<c:url value='/empo/process/eMAU00D03Main.do'/>">표준일정
						설정</a></td>
				<td><a href="<c:url value='/empo/process/eMAU00D04Main.do'/>">휴일
						설정</a></td>
			</tr>
		</table>
		<!-- container 시작 -->
		<div id="container" style="margin-top: 10px">

			<!-- 현재위치 네비게이션 시작 -->
			<div id="content">
				<div class="default_tablestyle" style="margin-top: 10px">
					<table summary="번호,게시판명,사용 커뮤니티 명,사용 동호회 명,등록일시,사용여부   목록입니다"
						cellpadding="0" cellspacing="0">
						<caption>사용자목록관리</caption>
						<colgroup>
							<col width="35%">
							<col width="35%">
							<col width="25%">
						</colgroup>
						<thead>
							<tr>
								<th scope="col" nowrap="nowrap">휴일명</th>
								<th scope="col" nowrap="nowrap">일자</th>
								<th scope="col" nowrap="nowrap">반복주기</th>
							</tr>
						</thead>
						<tbody id="resultList">

						</tbody>
					</table>
				</div>
				<!-- 페이지 네비게이션 시작 -->
				<div id="paging_div">
					<ul class="paging_align">
					</ul>
				</div>
				<!-- //페이지 네비게이션 끝 -->

				<div class="left">
					휴일명 : <input type="text" id="holidayname" /><br /> 일자 : <input
						type="text" id="holidayday" /><br /> 반복주기 : <input type="radio"
						name="repeatCycle" id="holidayyear" value=1> 매년 <input
						type="radio" name="repeatCycle" id="holidayox" value=0> 안함
					<br /> 사용설정 : <input type="radio" name="use" id="holidayuse"
						value=1> 사용 <input type="radio" name="use"
						id="holidayusex" value=0> 미사용
				</div>
				<br /> <br />
				<div class="right">
					휴일명 : <input type="text" id="holidayname1" /><br /> 일자 : <input
						type="date" id="holidayday1" /><br /> 반복주기 : <select name="pets"
						id="pet-select">
						<option value="1">매년</option>
						<option value="0">-</option>
					</select> <br />
					<button id="storeName">저장</button>

				</div>


			</div>
			<!-- //content 끝 -->
		</div>
		<!-- //container 끝 -->
	</div>

</body>
</html>
<script>
	$(function() {
		initList();
	});

	var ListView = function(row) {
		console.log(row.hoName)
		var data = "<tr data-ho_pk='" + row.hoPk + "' data-ho_name='" + row.hoName + "' data-ho_holiday='" + row.hoHoliday +"'>" + "	<td class = 'row'>"
				+ row.hoName + "</td>" + "	<td class = 'row'>" + row.hoHoliday
				+ "</td>" + "	<td class = 'row'>" + row.hoRepeatCycle
				+ " </td>" + "</tr>";

		return $(data);
	}

	$(document).on('click', '.row', function() {
		var ho_pk = $(this).parent('tr').data('ho_pk');

		$.ajax({
			url : "/empo/auth/eMAU00D01choiceholiday.do"
			, type : 'post'
			, data : { 'ho_pk' : ho_pk }
		}).done(function(result){
			console.log(result.list)
		}) 
	});

	var initList = function() {

		$.ajax({
			url : "/empo/auth/eMAU00D01holidaylist.do",
			type : 'post'
		}).done(function(res) {

			res.list.forEach(function(row, index) {

				$('#resultList').append(ListView(row))
				
			})
		}).fail(function() {
			alert("실패")
		})

	}
</script>