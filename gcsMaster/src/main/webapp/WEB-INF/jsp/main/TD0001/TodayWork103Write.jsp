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
<%@ page import="egovframework.com.cmm.LoginVO"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta charset="utf-8">
<link rel="icon" href="/images/favicon.svg" type="image/svg+xml" />
<title>Today Work [ Write ]</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, minimum-scale=1, user-scalable=no">
<c:import url="/EmpPageLink.do?link=main/include/src" />


<link href="/assets/vendor/fontawesome/css/fontawesome.min.css"
	rel="stylesheet">
<link href="/assets/vendor/fontawesome/css/solid.min.css"
	rel="stylesheet">
<link href="/assets/vendor/fontawesome/css/brands.min.css"
	rel="stylesheet">
<link href="/assets/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link href="/assets/css/master.css" rel="stylesheet">
<link href="/assets/vendor/flagiconcss/css/flag-icon.min.css"
	rel="stylesheet">

<link href="/css/gcs/TodayWork103Write.css" rel="stylesheet">

<script type="text/javascript" src="/js/gcs/TodayWork103Write.js"></script>
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
					<!-- label ui st  -->
 <h1>게시판</h1>
  <ul class="post-list">
    <li>
      <div class="post">
        <h2 class="post-title">게시물 제목 1</h2>
        <p class="post-author">작성자: 홍길동</p>
        <p class="post-date">작성일: 2024-02-25</p>
      </div>
    </li>
    <li>
      <div class="post">
        <h2 class="post-title">게시물 제목 2</h2>
        <p class="post-author">작성자: 임꺽정</p>
        <p class="post-date">작성일: 2024-02-24</p>
      </div>
    </li>
    <!-- 추가적인 게시물들 -->
  </ul>
  <div class="pagination">
    <a href="#" class="prev">&laquo; 이전</a>
    <a href="#" class="page">1</a>
    <span class="current">2</span>
    <a href="#" class="page">3</a>
    <a href="#" class="next">다음 &raquo;</a>
  </div>
					<!-- label ui ed  -->
				</div>
			</div>
		</div>
	</div>
	<script src="/assets/vendor/jquery/jquery.min.js"></script>
	<script src="/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  
	<script src="/assets/js/script.js"></script>



</body>
</html>