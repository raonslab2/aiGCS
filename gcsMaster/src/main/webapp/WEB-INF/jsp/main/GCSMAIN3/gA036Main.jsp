<%--
  Class Name : gA02Main.jsp
  Description : GCS
  Modification Information
 
      수정일         수정자                   수정내용
    -------    --------    ---------------------------
     2021.11.01   SCJ       GCS 생성
 
    author   : SCJ
    since    : 2021.11.01
--%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page import="egovframework.com.cmm.LoginVO" %>
 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta charset="utf-8">
<link rel="icon" href="/images/favicon.svg" type="image/svg+xml" />
<title>DID Blockchain 기반 군집드론 플랫폼</title>  
        <meta name="viewport"
            content="width=device-width, initial-scale=1, maximum-scale=1, minimum-scale=1, user-scalable=no">
        <c:import url="/EmpPageLink.do?link=main/include/src" />  

    
    <link href="/assets/vendor/fontawesome/css/fontawesome.min.css" rel="stylesheet">
    <link href="/assets/vendor/fontawesome/css/solid.min.css" rel="stylesheet">
    <link href="/assets/vendor/fontawesome/css/brands.min.css" rel="stylesheet">
    <link href="/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="/assets/css/master.css" rel="stylesheet">
    <link href="/assets/vendor/flagiconcss/css/flag-icon.min.css" rel="stylesheet">
</head>

<body>
    <div class="wrapper">
        <!-- left menu -->
        <c:import url="/EmpPageLink.do?link=main/include/menu3" /> 
        <div id="body" class="active">
            <!-- navbar navigation component -->
            <c:import url="/EmpPageLink.do?link=main/include/menu_sub1" />    
            <!-- end of navbar navigation -->  
            <div class="content">
                <div class="container">
                     <div class="page-title">
						<!-- 검색 form 시작 -->
						<form id="searchForm" name="searchForm" method="post"> 
						<input type="hidden" id="dlPk" name="dlPk" value="" />
						<input type="hidden" id="page" name="page" value="" />
							<div class="mb30 ac">
	 
								<span class="search_box03 input_w30"> 
									<input class="gSearch" type="text" id="searchName" name="searchName" placeholder="검색" onfocus="this.placeholder=''"> <!-- class="gSearch"  type="search" size="30"  value='<c:out value="${searchVO.searchPjTitle}" />' placeholder="사업명 입력" onfocus="this.placeholder=''" onblur="this.placeholder='사업명 입력'" name="searchPjTitle" id="searchPjTitle" -->
									<button type="button" id="commonSearch" name="commonSearch" class="btn_search01">검색</button>
								</span>
							</div>
						</form>
						<!-- 검색 form 종료 --> 
                    </div>
                    <div class="row">
                        <div class="col-md-12 col-lg-12">
                            <div class="card">
                                <div class="card-header">Drone Approval List</div>
                                <div class="card-body"> 
                                    <div class="table-responsive">
                                        <table class="table">
                                            <thead>
                                                <tr>
                                                    <th>ID</th>
                                                    <th>User ID</th>
                                                    <th>User Name</th>
                                                    <th>Agency</th>
                                                    <th>registrant name</th>
                                                    <th>register Time</th>
                                                </tr>
                                            </thead>
											<tbody id="resultList">
							 
											  
										    </tbody>  
                                        </table> 
                                    </div>
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
                                </div>
                            </div>
                        </div>
                    </div>
                    
                </div>
            </div>
        </div>
    </div>
    <script src="/assets/vendor/jquery/jquery.min.js"></script>
    <script src="/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="/assets/vendor/chartsjs/Chart.min.js"></script>
    <script src="/assets/js/dashboard-charts.js"></script>
    <script src="/assets/js/script.js"></script>


	<script>
;(function() { 

	
	$(function() { 
		initList();
	});
 
	

	var initList = function() {
		
		var formSer = $('#searchForm').serialize();
		
		$.ajax({
			url : '/gcs/dashboard/gA035MainList.do'
			, type : 'post'
			, data :formSer
		}).done(function(res) { 
			$('#resultList').children().remove();
			$('.pagination').children().remove();
			$('.subTr').remove();
			if(res.totalCnt == '0'){
				var data =  "<tr class='subTr'><td colspan='9' style='height:100px;'>자료가 존재하지 않습니다.</td></tr>" ;
				$('#resultList').append(data);
				$('.pagination').append(paginationView(res.paginationInfo));
				
				$('.' + res.paginationInfo.currentPageNo ).addClass("active");
				$('.pagination > li').css('cursor', 'pointer');
			}else{
				res.list.forEach(function(row, index) {
					console.log(row)
					$('#resultList').append(projectListView(row));
					//mbCode = row.mbCode;	
				});
				$('.pagination').children().remove();
				$('.pagination').append(paginationView(res.paginationInfo));
				$('.' + res.paginationInfo.currentPageNo ).addClass("active");
				$('.pagination > li').css('cursor', 'pointer');
			}
		}).fail(function() {
			alert("실패");
		});
		
	};
	
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
		console.log($("#page").val());
		var formSer = $('#searchForm').serialize();
		//목록
		$.post('/gcs/dashboard/gA035MainList.do', formSer).done(function(res) {
			console.log(res.list);
			$("#resultList").children().remove();
			$('.pagination').children().remove();
			res.list.forEach(function(row, index) {
				if (row.smtechId == "NULL") {
					row.smtechId = "";
				}
				$('#resultList').append(projectListView(row));
			});
			
			$('.pagination').append(paginationView(res.paginationInfo));
			
			$('.' + res.paginationInfo.currentPageNo ).addClass("active");
			$('.pagination > li').css('cursor', 'pointer');
			
			// 회원정보 목록 커서
			//$(".userList > table > tbody> tr > td").css("cursor","pointer");

			//$('.rowTD')[0].click(); 
		}).fail(function() {
			alert("실패");
		});
		
	});
	
	var projectListView = function(row) {
		var data = "<tr>\r\n"
			+ "	<th scope=\"row\">"+ row.grPcode +"</th>\r\n"
			+ "	<td>"+ row.mbCode +"</td>\r\n"
			+ "	<td>"+ row.mbName +"</td>\r\n"
			+ "	<td>"+ row.grMname +"</td>\r\n"
			+ "	<td>"+ row.mbHp +"</td>\r\n"
			+ "	<td>"+ row.timeWrite +"</td>\r\n"
			+ "</tr>";
		
 
			
			return $(data);
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
 
})();
</script>
</body>
</html>