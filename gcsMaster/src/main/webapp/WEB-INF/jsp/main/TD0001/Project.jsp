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
<title>Today Work NEW</title>  
        <meta name="viewport"
            content="width=device-width, initial-scale=1, maximum-scale=1, minimum-scale=1, user-scalable=no">
        <c:import url="/EmpPageLink.do?link=main/include/src" />  

    
    <link href="/assets/vendor/fontawesome/css/fontawesome.min.css" rel="stylesheet">
    <link href="/assets/vendor/fontawesome/css/solid.min.css" rel="stylesheet">
    <link href="/assets/vendor/fontawesome/css/brands.min.css" rel="stylesheet">
    <link href="/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="/assets/css/master.css" rel="stylesheet">
    <link href="/assets/vendor/flagiconcss/css/flag-icon.min.css" rel="stylesheet">
    <link href="/css/gcs/Project.css" rel="stylesheet">
    
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

<body>
    <div class="wrapper">
        <!-- left menu -->
        <c:import url="/EmpPageLink.do?link=main/include/menu3" /> 
        <div id="body" class="active">
            <!-- navbar navigation component -->
            <c:import url="/EmpPageLink.do?link=main/include/menu_sub1" />    
            <!-- end of navbar navigation -->
			<div class="content">
				<!-- content st -->
  <h1>프로젝트 목록</h1>
  <button id="addProjectBtn">프로젝트 추가</button>
  <table class="project-list">
    <thead>
      <tr>
        <th>프로젝트 이름</th>
        <th>고객</th>
        <th>계약일</th>
        <th>작업 시작일</th>
        <th>예상 종료일</th>
        <th>실제 종료일</th>
        <th>결제 수령일</th>
        <th>계약 문서</th>
      </tr>
    </thead>
    <tbody>
      <!-- 여기에 각 프로젝트 항목을 추가합니다. -->
      <tr>
        <td>프로젝트 이름</td>
        <td>고객 이름</td>
        <td>YYYY-MM-DD</td>
        <td>YYYY-MM-DD</td>
        <td>YYYY-MM-DD</td>
        <td>YYYY-MM-DD</td>
        <td>YYYY-MM-DD</td>
        <td><a href="contract_document.pdf">계약 문서 다운로드</a></td>
      </tr>
      <tr>
        <td>프로젝트 이름</td>
        <td>고객 이름</td>
        <td>YYYY-MM-DD</td>
        <td>YYYY-MM-DD</td>
        <td>YYYY-MM-DD</td>
        <td>YYYY-MM-DD</td>
        <td>YYYY-MM-DD</td>
        <td><a href="contract_document.pdf">계약 문서 다운로드</a></td>
      </tr>
      <tr>
        <td>프로젝트 이름</td>
        <td>고객 이름</td>
        <td>YYYY-MM-DD</td>
        <td>YYYY-MM-DD</td>
        <td>YYYY-MM-DD</td>
        <td>YYYY-MM-DD</td>
        <td>YYYY-MM-DD</td>
        <td><a href="contract_document.pdf">계약 문서 다운로드</a></td>
      </tr>
      <!-- 다른 프로젝트 항목들도 유사한 방식으로 추가합니다. -->
    </tbody>
  </table>
				<!-- content st -->
			</div>
		</div>
    </div>
    <script src="/assets/vendor/jquery/jquery.min.js"></script>
    <script src="/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>  
    <script src="/assets/js/script.js"></script>
    
    <script type="text/javascript" src="/js/gcs/Project.js"></script>

 
</body>
</html>