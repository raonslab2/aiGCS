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
    <title>Work Chat</title>

    <!-- Common js,css -->
    <!-- jQuery -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <link href="/css/gcs/TodayWork905.css" rel="stylesheet">
    <script type="text/javascript" src="/js/gcs/TodayWork905.js"></script>

    <!-- CKEditor CDN -->
    <script src="https://cdn.ckeditor.com/4.16.2/standard/ckeditor.js"></script>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

    <!-- Disable caching-->
    <meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate">
    <meta http-equiv="Pragma" content="no-cache">
    <meta http-equiv="Expires" content="0">
	<script>
	// jQuery를 사용하여 로그아웃 버튼에 클릭 이벤트 추가
	$(document).ready(function() {
		$("#menu-logout").on("click", function() {
		    // 클릭 시 실행할 동작을 정의합니다.
		    // 예를 들어, 로그아웃 기능을 여기에 추가할 수 있습니다.
			  $(location).attr('href', '/gcs/login/actionLogoutMobile.do');
		});
	});
	</script>     
 </head>

<body>
    <div class="chat-container">
        <div class="chat-list"> 
         <form class="chat-list-form" id="chatListForm" name="chatListForm" method="post">
             <input type="hidden" id="page" name="page" value="">  
             <input type="hidden" id="pageUnit" name="pageUnit" value="999">  
             <input type="hidden" id="twPk" name="twPk" value="">   
             <input type="hidden" id="userId" name="userId" value="${userId}">  
             
         </form>
			<div class="work-list" >
			    <div class="profile-info"> 
			        <h3 class="user-name">RaonsLap 
			        </h3>
			    </div> 
		        <div class="menu-logout" id="menu-logout">
		           <span>logout</span>
		        </div>
			</div> 
			<div class="work-list-tap" >
			    <ul>
			       <li page-data="1">전체업무</li>
			       <li class="selected" page-data="2">담당 업무</li> 
			       <li page-data="4">협업 업무</li> 
			    </ul>
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
			        <div >
						<!-- 뒤로가기 버튼 -->
						<button class="back-button" id="btnBack">
						  <i class="fas fa-arrow-left"></i>
						</button>
						<!-- 즐겨찾기 버튼 
						<button class="bookmark-button not-bookmarked" id="btnBookmark">
						  <i class="fas fa-bookmark"></i> Bookmark
						</button>
						-->
			        </div>  
			        <div class="user-name" id="chatTitle"> </div>
			        <div id="detailLink" style="padding:10px;margin-left:10px;"></div> 
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
			    <textarea placeholder="Type your message here"></textarea>
			    <button id="msgSend">Send</button> 
			</div>

        </div>
    </div> 
</body>

</html>
                