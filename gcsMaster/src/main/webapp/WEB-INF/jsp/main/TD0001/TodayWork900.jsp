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
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Dash Board</title>

<!-- Common js,css -->
<c:import url="/EmpPageLink.do?link=main/include/gcsCommon" />

<link href="/css/gcs/TodayWork900.css" rel="stylesheet">
<script type="text/javascript" src="/js/gcs/TodayWork900.js"></script>
</head>

<body> 
<!-- Left Menu List -->
<c:import url="/EmpPageLink.do?link=main/include/menu3" />

<main> 
    <!-- Top Menu -->
    <c:import url="/EmpPageLink.do?link=main/include/menutopTodayWork" />

    <div class="container">
        <!-- Start of container --> 
            <div class="container-left">
                <div class="top-service">
                    <!-- Today Work Form -->
                    <form class="search-form" id="searchTodayForm" name="searchTodayForm" method="post">
                        <span class="title">Work </span>
                        <input type="hidden" id="page" name="page" value=""> 
                        <input type="hidden" id="twPk" name="twPk" value=""> 
                        <div class="input-group">
                            <input type="date" id="searchTwRequestDateSt" name="searchTwRequestDateSt"> <span>~</span> <input type="date" id="searchTwRequestDateEd" name="searchTwRequestDateEd">
                            <select id="pageUnit" name="pageUnit">
                                <option value="5" selected>5P</option>
                                <option value="10">10P</option>
                                <option value="20">20P</option>
                            </select>
                            <button type="submit">Search</button>
                        </div>
                    </form>

                    <!-- Today Work Table -->
                    <table class="task-table" id="todayList">
                        <thead>
                            <tr> 
                                <th>제목</th>
                                <th>날짜</th>
                            </tr>
                        </thead>
                        <tbody id="resultList" class="resultList">
                            <!-- Dynamic rows will be added here -->
                        </tbody>
                    </table>
                    <!-- Pagination -->
                    <div class="pagination" id="pagination">
                        <!-- Pagination buttons will be dynamically added here -->
                    </div>
                </div>
                <div class="bottom-service">
                    <form class="search-form">
                        <span class="title">History</span>
                        <div class="input-group">
                            <input type="date" id="start-date" name="start-date"> <span>~</span>
                            <input type="date" id="end-date" name="end-date">
                            <button type="submit">Search</button>
                        </div>
                    </form>

                    <!-- History Table -->
                    <table class="task-table">
                        <thead>
                            <tr>
                                <th>작성자</th>
                                <th>제목</th>
                                <th>날짜</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>MIN</td>
                                <td>Description of Task 1</td>
                                <td>23-03-08 10</td>
                            </tr>
                            <!-- Additional rows will follow the same format -->
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="container-middle">
               <div class="container-middle-state">
					<select class="twStatus complete-button" id="twStatus" name="twStatus">
					  <%-- 
					  <option value="Request">진행상태변경</option>
					  <option value="Request">Request</option>
					  <option value="completed">completed</option>
					  <option value="inprogress">inprogress</option>
					  <option value="onhold">onhold</option>
					  <option value="cancelled">cancelled</option>
					  --%>
					</select>
				</div>
                <!-- Service 3 Section --> 
                <div class="service3" id="progressStatus" style="min-height: 140px;">
                    <!-- Progress status details -->
                </div> 
                <textarea name="twContent" id="twContent" class="ckeditor" style="height: 600px;"></textarea>
                

                <!-- Attachment List -->
                <span class="title" style="padding:10px;">첨부파일</span>
 
                <!-- End of Service 3 Section -->
            </div>
            <div class="container-right"> 
	         <form  id="chatListForm" name="chatListForm" method="post">   
	             <input type="hidden" id="userId" name="userId" value="${userId}">  
	             
	         </form>
	           <div class="chat-list">
					<div class="message-window" id="message-window">
					    <%-- 
			            <div class="message received">
			                <p>Hello, how are you?</p>
			                <span class="time">10:30 AM</span>
			            </div> 
			            <div class="message sent">
			                <p>ff!</p>
			                <span class="time">10:40 AM</span>
			            </div> 
			            --%>
					</div>
					<div class="message-input">
					    <input type="text" placeholder="Type your message here">
					    <button id="msgSend">Send</button> 
					</div>
	                <!-- Result Report -->
	                <div class="bottom-service">
	           
	
	                    <!-- Additional details -->
	                </div>
	           </div> 
            </div>
      
        <!-- End of container -->
    </div>
</main>

	
	<!-- footer -->
	<c:import url="/EmpPageLink.do?link=main/include/gcsFooter" />



</body>

</html>