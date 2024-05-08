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
<title>Wrok Chat</title>

<!-- Common js,css -->
    <!-- jQuery --> 
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<link href="/css/gcs/TodayWork906.css" rel="stylesheet"> 
<script type="text/javascript" src="/js/gcs/TodayWork906.js"></script>

<!-- CKEditor CDN -->
<script src="https://cdn.ckeditor.com/4.16.2/standard/ckeditor.js"></script>
</head>

<body>
    <div class="chat-container">
        <div class="chat-list"> 
         <form class="chat-list-form" id="chatListForm" name="chatListForm" method="post">
             <input type="hidden" id="page" name="page" value="">  
             <input type="hidden" id="pageUnit" name="pageUnit" value="999">  
         </form>
			<div class="work-list" style="height:50px;">
			    <div class="profile-info"> 
			        <h3 class="user-name">Raons</h3>
			    </div> 
			</div> 
			<div class="chat-room-list" id="chat-room-list">
			   <%-- 
	            <div class="chat-room">
	                <img src="/images/profile1.jpg" alt="Profile Image">
	                <div class="room-info ">
	                    <span>Business chat room</span>
	                    <p>Raonslab Chatting Room.</p>
	                </div>
	            </div>
	            --%>
			</div> 
        </div>
        <div class="chat-window">
			<div class="user-profile">
			    <div class="profile-info">
			        <img src="/images/profile.jpg" alt="Profile Image" class="profile-image">
			        <h3 class="user-name" id="chatTitle">RaonsLab<br>Chat</h3>
			        <%-- 
			        <span id="twRequester" style="padding:10px;"></span>(Requester)
			        <span id="twWorker" style="padding:10px;"></span>(Worker)
			        --%>
			        <span id="detailLink" style="padding:10px;margin-left:10px;">Detail link</span>
			    </div>
			    <div class="search-icon">
			        <i class="fas fa-search"></i> <!-- 검색 아이콘은 Font Awesome 아이콘을 사용하였습니다 -->
			    </div>
			</div>
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
            <!-- Add more messages as needed -->
	       <!-- Add more messages here -->
		<div class="message-input">
		    <input type="text" placeholder="Type your message here">
		    <button id="msgSend">Send</button> 
		</div>

        </div>
    </div>
</body>

</html>
                