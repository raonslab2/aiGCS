<%--
  Class Name : EgovLoginUsr.jsp
  Description : Login 인증 화면
  Modification Information
 
      수정일         수정자                   수정내용
    -------    --------    ---------------------------
     2021.07.13    민병안          최초 생성 
 
    author   : 로그인기능
    since    : 2021.07.13 
--%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>GCS</title> 
    <c:import url="/EmpPageLink.do?link=main/include/src" />
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0"> 
    <link rel="stylesheet" href="/css/gcs/empilogin.css">
    
 
</head>
<body style="overflow-x: hidden;overflow-y: hidden">
<div id="wrap" class="login_wrap" >
    <div id="absoluteCenteredDiv">
        <form:form name="loginForm" method="post" action="#LINK">
            <input type="hidden" name="message" value="${message}" />
            <input type="hidden" name="userSe"  value="USR"/>
            <input type="hidden" id="smtechId" name="smtechId" />
            <div class="box">
                <h1>UAM 관제 시뮬레이터</h1>
                <input class="username" name="id" id="id" type="text" placeholder="User Name">
                <input class="username" id="password" onkeyup="enterkey()" name="password" type="password" placeholder="Password">
                <a href="#"><div class="button" id="loginBtn" onclick="javascript:actionLogin()">Sign In</div></a>
            </div>
        </form:form> 
        <p> </p>
    </div>   
</div>  
 <script src="/js/gcs/empilogin.js"></script>
</body>
</html>