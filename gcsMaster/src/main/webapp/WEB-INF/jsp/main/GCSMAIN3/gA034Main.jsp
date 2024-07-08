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
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>User List</title>
  <link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css' rel='stylesheet'> 
  <!-- Common Css -->
  <link href="/css/gcs/TodayWorkCommon.css" rel="stylesheet"> 
  <link href="/css/gcs/gA034Main.css" rel="stylesheet">
  
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"/>
  <!-- Common Js -->
  <script type="text/javascript" src="/js/gcs/TodayCommon.js"></script>
  <!-- jQuery -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
		<script> 
		 
		function fn_waypoint(dlPk) { 
			document.searchForm.action = "<c:url value='/gcs/dashboard/gA034MainWrite.do'/>"; 
			document.searchForm.dlPk.value = dlPk; 
			document.searchForm.submit();	
		} 
		
		function fn_del(aiPk) { 
			
			var result = confirm('Are you sure you want to do this?');
			if(result){
				$.ajax({
					url : '/gcs/dashboard/gA034MainDelete.do'
					, type : 'post' 
					, data : { "aiPk" : aiPk }
					, async : false
				}).done(function(res) { 
					console.log(res.list);    
					alert("Success");
					//$("#aiPk").val(res.list.aiPk); 
					$(location).attr('href', '/gcs/dashboard/gA034Main.do');
				}).fail(function() {
					alert("실패");
				});
			}
		}
			 
		</script>
</head>

<body page-data="menu-status">
     <!-- head menu -->
    <c:import url="/EmpPageLink.do?link=main/include/projectMainHead" />
 
  <main> 
   <!-- top menu -->
    <c:import url="/EmpPageLink.do?link=main/include/menutopGcs" /> 
     <!-- content st -->
            <div class="content">
                <div class="container">
                     <div class="page-title">
						<!-- 검색 form 시작 -->
						<form id="searchForm" name="searchForm" method="post"> 
						<input type="hidden" id="dlPk" name="dlPk" value="" />
						<input type="hidden" id="page" name="page" value="" />
			 
						</form>
						<!-- 검색 form 종료 --> 
                    </div>
                    <div class="row">
                        <div class="col-md-12 col-lg-12">
                            <div class="card">
                                <div class="card-header">  <a style="color:blue" href="<c:url value='/gcs/dashboard/gA034MainWrite.do'/>"><button type="button" class="btn_style02 btn_green" id="btnExcelDownload">
                                Add New Device<span>▷</span></button>
					             </a></div>
                                <div class="card-body" style="margin-top:20px;"> 
                                    <div class="table-responsive">
                                        <table class="table">
                                            <thead>
                                                <tr>
                                                    <th>ID</th>
                                                    <th>USE</th>
                                                    <th>Device Name</th>
                                                    <th>Device Alias</th>
                                                    <th>Device type</th>
                                                    <th>Agency</th>
                                                    <th>registrant name</th>
                                                    <th>Memo</th>
                                                    <th>Edit</th>
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
     <!-- content ed -->
 
  </main>

    <footer>
        <p class="copyright">
            &copy; 2020 - <span>RaonsLab</span> All Rights Reserved.
        </p>
    </footer>
 <script type="text/javascript" src="/js/gcs/gA034Main.js"></script>
</body>

</html>