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
	String dataYear = request.getParameter("dataYear");
	String dataBbrdnBusiNm = request.getParameter("dataBbrdnBusiNm");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"> 
<head>

<script src="../../js/jquery.timepicker.js"></script>

<form id="searchForm1">
	<input type="hidden" id="page" name="page" value="" />
	<input type="hidden" id="searchYear" name="searchYear" value="<%=dataYear %>" />
	<input type="hidden" id="searchName" name="searchName" value="<%=dataBbrdnBusiNm %>" />
</form>
<!-- 업무요청 -->
<div class="popup_guide" style="width:1800px; height:900px;">
	<a href="javascript:void(0)" class="closebtn" onclick="fnPopupClose()">닫기</a>
	<h3>과제(상세)</h3>
	<div class="popup_content" style="height: 95%; overflow: scroll;">
		<div class=" content_col1 bg">
			<div>
				<ul>
					<li class="date_tit"></li>
				</ul>
			</div>
			<div class="bbs_list">
				<table id="bbs_list1">
					  	<caption class="abc">과제현황으로 연번, 과제번호, 사업명, 내역 사업명, 내내역 사업명, 최종과제 진행구분명, 공고명, 세부공고명, 접수시작일, 접수 종료일,제출완료일 보여주는 리스트화면</caption>
						
						<thead>
						<tr>
						  <th scope="col">사업년도</th>
						  <th scope="col">과제번호</th>
						  <th scope="col">사업명</th>
						  <th scope="col">내역 사업명</th>
						  <th scope="col">내내역 사업명</th>
						  <th scope="col">과제명</th>
						  <th scope="col">주관기관명</th>
						  <th scope="col">사업자번호</th>
						  <th scope="col">최종평가일자</th>
						  <th scope="col">위원회명</th>
						  <th scope="col">평가장소</th>
						  <th scope="col">최종평가점수</th>
						  <th scope="col">최종평가결과</th>
						  <th scope="col">간사(이름)</th>
						  <th scope="col">최종평가결과통보일자</th>						  
						</tr>
						</thead>
						<tbody id="resultList1">
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
				<!-- e :btn_guide -->
			</div>
			<!-- e :bbs_write01 -->
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
		</div>
		<!-- e :content_col2 -->
	</div>
	<!-- e :popup_content -->
</div>
<!-- e :popup_guide -->

<script>
;(function() {
	
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
		
		var formSer = $('#searchForm1').serialize();
		
		$.ajax({
			url : '/empo/schedule/finalProjectList.do'
			, type : 'post'
			, data :formSer
		}).done(function(res) { 
			console.log(res);
			$('#resultList1').children().remove();
			$('.pagination').children().remove();
			//목록 출력
			res.list.forEach(function(row, index) {
				
				$('#resultList1').append(projectListView(row));
				//pjCode = row.pjCode;
			});
			
			$('.pagination').append(paginationView(res.paginationInfo));
			
			$('.' + res.paginationInfo.currentPageNo ).addClass("active");
			$('.pagination > li').css('cursor', 'pointer');
			
		}).fail(function() {
			alert("실패");
		});
		
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
	
	var projectListView = function(row) {
		console.log(row);
		var data = 
			'<tr id="subRow" class="subTr" style="cursor:pointer;" >' +
			'	<td class="subRow"> ' + row.busiYy + '</td>' +
			'	<td class="subRow">' + row.sbjtId + '</td>' +
			'	<td class="subRow">' + row.busiNm + '</td>' +
			'	<td class="subRow">' + row.brdnBusiNm + '</td>' +
			'	<td class="subRow">' + row.bbrdnBusiNm + '</td>' +
			'	<td class="subRow">' + row.sbjtNm + '</td>' +
			'	<td class="subRow">' + row.svorgnNm + '</td>' +
			'	<td class="subRow"></td>' +
			'	<td class="subRow">' + row.lastEvalYmd  + '</td>' +
			'	<td class="subRow">' + row.ecmitNm + '</td>' +
			'	<td class="subRow">' + row.plcNm  + '</td>' +
			'	<td class="subRow">' + row.evalGd + '</td>' +
			'	<td class="subRow">' + row.rsltNm + '</td>' +
			'	<td class="subRow">' + row.mbrNm2 + '</td>' +
			'	<td class="subRow">' + row.pjYmd + '</td>' +
			'</tr>' ;
			
			return $(data);
	} 
	
	$(function() {
		var formSer = $("#searchForm1").serialize();
		
		$.post('/empo/schedule/finalProjectList.do', formSer).done(function(res) {
			console.log(res.list);
			res.list.forEach( function(row, index) {
				$('#resultList1').append(projectListView(row));
			});
			
			$('.pagination').append(paginationView(res.paginationInfo));
			
			$('.' + res.paginationInfo.currentPageNo ).addClass("active");
			$('.pagination > li').css('cursor', 'pointer');
		});
	});
	
	
})();
</script>