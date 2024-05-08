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
  <title>Today Work</title>
  <link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css' rel='stylesheet'> 
  <!-- Common Css -->
  <link href="/css/gcs/TodayWorkCommon.css" rel="stylesheet"> 
  <link href="/css/gcs/TodayWork902.css" rel="stylesheet">
  
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"/>
  <!-- Common Js -->
  <script type="text/javascript" src="/js/gcs/TodayCommon.js"></script>
 
    <!-- Chart.js -->
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <!-- jQuery -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    
   
</head>

<body>

  
  <!-- left menu List -->
  <c:import url="/EmpPageLink.do?link=main/include/menu3" /> 

 
  <main>
   <!-- top menu -->
    <c:import url="/EmpPageLink.do?link=main/include/menutopTodayWork" /> 
  
  
<div class="container">
     <!-- container ST --> 
  
    <!-- search st -->
    <form class="searchForm" id="searchForm" name="searchForm" method="post">
    <input type="hidden" id="page" name="page" value="" />
        <div class="left-buttons">
             <%-- 
	        <input type="button" id="btnList" value="목록" class="greylist">
	          --%>
	        <input type="button" id="btnWrite" value="글작성" class="gradient">
        </div>
        <div class="right">
			<span class="grey" id="strong">기간 : </span>  
            <input type="date" class="setDate" id="searchTwRequestDateSt" name="searchTwRequestDateSt" >
            ~
			<input type="date" class="setDate" id="searchTwRequestDateEd" name="searchTwRequestDateEd">
 
 			<select id="searchTwStatus" name="searchTwStatus">
 
			</select> 
 
			<select id="searchTwWorker" name="searchTwWorker">
			<%-- 
			  <option value="">Worker</option>
			  <option value="손창주">손창주</option>
			  <option value="세진">세진</option>
			  <option value="은별">은별</option>
			  <option value="샤미">샤미</option>
			  <option value="민영">민영</option>
			  <option value="민병안">민병안</option>
			  --%>
			</select> 
            <input type="text">  
            <div class="submit-image2" id="searchList">SEARCH</div> 
        </div>
    </form>
    <!-- search ed -->
    <!-- search ed -->
		<table class="list-data">
			<thead>
				<tr>
					<th>순번</th>
					<th>상태</th>
					<th>분류</th> 
					<th>제목</th>
					<th>요청자
					</th>
					<th>담당자</th>
					<th>작성시간</th> 
				</tr>
			</thead>
			<tbody id="resultList">
				<%-- 
	    <tr>
	        <td class="center">1</td>
	        <td class="left">RPA</td>
	        <td class="center">Menu 1</td>
	        <td class="center">Menu 2</td>
	        <td class="center">work list test..xtext</td>  
	        <td class="center">
				<select id="status" name="status">
				  <option value="completed">Completed</option>
				  <option value="inprogress">In Progress</option>
				  <option value="onhold">On Hold</option>
				  <option value="cancelled">Cancelled</option>
				</select>
	        </td>   
	        <td class="center">
				<input type="date" id="date" name="date">
	        </td>    
	        <td class="center">
				<select id="names" name="names">
				  <option value="민병안">민병안</option>
				  <option value="세진">세진</option>
				  <option value="은별">은별</option>
				  <option value="손창주">손창주</option>
				  <option value="샤미">샤미</option>
				  <option value="민영">민영</option>
				</select>
	        </td>  
	        <td class="center">
				<select id="names" name="names">
				  <option value="민병안">민병안</option>
				  <option value="세진">세진</option>
				  <option value="은별">은별</option>
				  <option value="손창주">손창주</option>
				  <option value="샤미">샤미</option>
				  <option value="민영">민영</option>
				</select>
	        </td>        
	        <td class="center"><input type="datetime-local" id="dateSt" name="dateSt"></td>   
	        <td class="center"><input type="datetime-local" id="dateEd" name="dateEd"></td>  
	    </tr>
	   --%>
			</tbody>
		</table>
		<div class="bbs_page">
	<ul class="pagination">
	    <li class="first"><a href="#" title="첫 페이지 바로가기"><img src="/images/bbs_prev02.gif" alt="첫 페이지" style="margin: 10px;"></a></li>
		<li class="prev"><a href="#" title="이전 페이지(1page) 바로가기"><img src="/images/bbs_prev01.gif" alt="이전 페이지" style="margin: 10px;"></a></li>
		<li class="active">1</li>
		<li class=""><a href="#" title="2페이지 바로가기">2</a></li>
		<li class=""><a href="#" title="3페이지 바로가기">3</a></li>
		<li class=""><a href="#" title="4페이지 바로가기">4</a></li>
		<li class=""><a href="#" title="5페이지 바로가기">5</a></li>
		<li class="next"><a href="#" title="다음 페이지(11page) 바로가기"><img src="/images/bbs_next01.gif" alt="다음 페이지" style="margin: 10px;"></a></li>
		<li class="last"><a href="#" title="끝 페이지(67page) 바로가기"><img src="/images/bbs_next02.gif" alt="마지막 페이지" style="margin: 10px;"></a></li>  
	  </ul>
    </div>
    <br>

  
 
     <!-- container ED -->
    </div>
 
  </main>
   <footer>
        <p class="copyright">
            &copy; 2020 - <span>RaonsLab</span> All Rights Reserved.
        </p>
    </footer>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script type="text/javascript" src="/js/gcs/TodayWork902.js"></script>
  
</body>

</html>