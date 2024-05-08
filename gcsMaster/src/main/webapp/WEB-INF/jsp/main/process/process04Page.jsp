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
<%@ include file = "../include/src.jsp" %>

<script type="text/javascript">
	$(document).ready(function() {

		// 달력 입력 datepicker 설정
		$('.inputCalendar').datepicker({
			dateFormat : 'yyyy.mm.dd'		// 날짜 형태 설정		
		});	
		

	
		$("#formHoliday").submit(function () {
			
			var holidayName = $("#holidayName").val();
			var holidayDate = $("#holidayDate").val();

			if ($.trim(holidayName).length < 1) {
				alert("휴일명을 입력하세요.");
				$("#holidayName").focus();
				return false;
			}
			
			if ($.trim(holidayDate).length < 10) {
				alert("일자를 YYYY.MM.DD 형태로 입력하세요.");
				$("#holidayDate").focus();
				return false;
			}

			if (confirm("휴일정보를 저장하시겠습니까?"))	{
				
			}
			else {
				return false;
			}
		})
	});

</script>

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
				<h3>프로세스 관리</h3>

				<c:import url="/EmpPageLink.do?link=main/include/top" />  
			</div>
			<!-- 화면 상단 종료 -->
			
			<!-- s :contents_guide -->
			<div class="contents_guide">
				<div class="submenu_guide">
					<ul>
						<!-- 2차메뉴명 -->
						<li><a href="/empo/process/eMAU00D01Main.do">프로세스 매핑</a></li>
						<li><a href="/empo/process/eMAU00D02Main.do">프로세스 설정</a></li>
						<li><a href="/empo/process/eMAU00D03Main.do">표준일정 설정</a></li>
						<li><a href="/empo/process/eMAU00D04Main.do" class="active">휴일설정</a></li>
					</ul>
				</div>
				
				<!-- s :content_col2 -->
				<div class="content_col2 bg">
					<div>
						
						<h4>휴일현황</h4>

						<div class="btn_guide ar mb-20 mt-50">
							<button type="button" class="btn_style02 btn_green" id="btnUserAdd">휴일 추가</button>
						</div>
						
						<!-- 휴일 목록 시작 -->
						<div class="bbs_list mt30 holidayList">
							<table>
								<colgroup>
									<col width="40%">
									<col width="30%">
									<col width="25%">
								</colgroup>
								<thead>
								  <tr>
									<th scope="col">휴일명</th>
									<th scope="col">일자</th>
									<th scope="col">반복주기</th>
								  </tr>
								</thead>
								<tbody id="resultList">
								  <!-- <tr class="over"> 선택된 휴일 tr 표시
									<td>삼일절</td>
									<td>2021.03.01</td>
									<td>매년</td>
								  </tr>
								  <tr>
									<td>어린이날</td>
									<td>2021.05.05</td>
									<td>매년</td>
								  </tr>
								  <tr>
									<td>부처님오신날</td>
									<td>2021.05.19</td>
									<td>매년</td>
								  </tr>
								  <tr>
									<td>현충일</td>
									<td>2021.06.06</td>
									<td>매년</td>
								  </tr>
								  <tr>
									<td>추석</td>
									<td>2021.09.20</td>
									<td>-</td>
								  </tr>
								  <tr>
									<td>추석</td>
									<td>2021.09.21</td>
									<td>-</td>
								  </tr>
								  <tr>
									<td>추석</td>
									<td>2021.09.22</td>
									<td>-</td>
								  </tr> -->
								  <tr>
									<td>
										<input type="text" class="input_w100" name="listHolidayName" id="listHolidayName">
									</td>
									<td>							
										<input type="text" class="inputCalendar" name="listHolidayDate" id="listHolidayDate">
									</td>
									<td>
										<label><input type="radio" name="listHolidayDiv" value="" checked> 매년</label>
										&nbsp;&nbsp;&nbsp;
										<label><input type="radio" name="listHolidayDiv" value=""> 안함</label>
									</td>
								  </tr>
								</tbody>
							</table>
						</div>
						<!-- 휴일 목록 끝 -->
					</div>
					<!-- e :bbs_write01 -->
					
					

					<!-- s : 휴일정보 입력 시작 --> 
					<div>
						<h4>휴일정보</h4>

						<form name="formHoliday" id="formHoliday"  method="post">
						<div class="btn_guide ar mt-50">
							<button type="submit" class="btn_style02 btn_green" id="btnSave">저장</button>
						</div>

						<div class="bbs_list">
							<table class="table_l">
							  <tbody>
								<tr>
								  <th scope="row">휴일명 *</th>
								  <td><input type="text" class="input_w100" name="holidayName" id="holidayName"></td>
								</tr>
								<tr>
								  <th scope="row">일자 *</th>
								  <td>				
									<input type="text" class="inputCalendar" name="holidayDate" id="holidayDate">
								  </td>
								</tr>
								<tr>
								  <th scope="row">반복주기 * </th>
								  <td>
									<label><input type="radio" name="holidayDiv" value="" checked> 매년</label>
									&nbsp;&nbsp;&nbsp;
									<label><input type="radio" name="holidayDiv" value=""> 안함</label>
								  </td>
								</tr>
								<tr>
								  <th scope="row">사용설정 *</th>
								  <td>
									<label><input type="radio" name="useDiv" value="" checked> 사용</label>
									&nbsp;&nbsp;&nbsp;
									<label><input type="radio" name="useDiv" value=""> 미사용</label>
								  </td>
								</tr>
							  </tbody>
							</table>
						</div>
						</form>
						
                    </div>
					<!-- e : 휴일정보 입력 종료 --> 

				</div>
				<!-- e :content_col2 -->

			</div>
			<!-- e :contents_guide -->
		</div>
		<!-- e :right_guide -->
	</div>
	<!-- e :wrap -->
</body>
<script>
;(function() {
	$('#btnUserAdd').click(function() {
		console.log($('#listHolidayDate').val())
	})
	$(function() {
		
		
		initList();
	});
	
	var holidayListView = function(row) {
		var data = 
			'<tr class="row">' +
			'	<td>' + row.hoName + '</td>' +
			'	<td>' + row.hoHoliday + '</td>' +
			'	<td>' + row.hoRepeatCycleName + '</td>' +
			'</tr>' ;
			
		return $(data)
	}
	var initList = function() {
		
		
		$.post('/empo/auth/eMAU00D04HolidayList.do').done(function(res) {
			console.log(res.list);
			res.list.forEach(function(row, index) {
				$("#resultList").append(holidayListView(row));
			});
			
			// 회원정보 목록 커서
			$(".holidayList > table > tbody> tr > td").css("cursor","pointer");
		}).fail(function() {
			
		});
	}
})();
</script>
</html>
