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

<link href="/css/gcs/TodayWork904.css" rel="stylesheet">
<script type="text/javascript" src="/js/gcs/TodayWork904.js"></script>
</head>

<body  >
    <header class="header">
        <div class="profile-picture">RaonsLap Chat</div>
         
    </header>
  <main>
 
  
<div class="container">
     <!-- container ST --> 
<div class="chat-container">
    <div class="chat-box" id="chatBox">
        <div class="message received">
            <div class="message-sender">John</div>
            <div class="message-text">
                Hello! How can I help you?
            </div>
            <div class="message-time">10:00 AM</div>
        </div>
        <div class="message sent">
            <div class="message-sender">You</div>
            <div class="message-text">
                Hi! I have a question about the product.
            </div>
            <div class="message-time">10:01 AM</div>
        </div> 
        <div class="message sent">
            <div class="message-sender">You</div>
            <div class="message-text">
                Hi! I have a question about the product.
            </div>
            <div class="message-time">10:01 AM</div>
        </div> 
        <div class="message sent">
            <div class="message-sender">You</div>
            <div class="message-text">
                Hi! I have a question about the product.
            </div>
            <div class="message-time">10:01 AM</div>
        </div> 
        <div class="message sent">
            <div class="message-sender">You</div>
            <div class="message-text">
                Hi! I have a question about the product.
            </div>
            <div class="message-time">10:01 AM</div>
        </div> 
        <div class="message sent">
            <div class="message-sender">You</div>
            <div class="message-text">
                Hi! I have a question about the product.
            </div>
            <div class="message-time">10:01 AM</div>
        </div> 
        <div class="message sent">
            <div class="message-sender">You</div>
            <div class="message-text">
                Hi! I have a question about the product.
            </div>
            <div class="message-time">10:01 AM</div>
        </div> 
        <div class="message sent">
            <div class="message-sender">You</div>
            <div class="message-text">
                Hi! I have a question about the product.
            </div>
            <div class="message-time">10:01 AM</div>
        </div> 
        <div class="message sent">
            <div class="message-sender">You</div>
            <div class="message-text">
                Hi! I have a question about the product.
            </div>
            <div class="message-time">10:01 AM</div>
        </div> 
        <div class="message received">
            <div class="message-sender">John</div>
            <div class="message-text">
                Hello! How can I help you?
            </div>
            <div class="message-time">10:00 AM</div>
        </div>
        <div class="message sent">
            <div class="message-sender">You</div>
            <div class="message-text">
                Hi! I have a question about the product.
            </div>
            <div class="message-time">10:01 AM</div>
        </div> 
        <!-- More messages can be added here -->
    </div>
    <div class="input-box">
        <input type="text" class="inputSend" id="messageInput" placeholder="Type your message...">
        <button id="sendButton">Send</button>
    </div>
</div>
     <!-- container ED -->
    </div>
 
  </main>

 

</body>

</html>