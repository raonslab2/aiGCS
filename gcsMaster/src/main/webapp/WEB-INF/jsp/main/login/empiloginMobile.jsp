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
    <link rel="stylesheet" href="/css/gcs/empiloginMobile.css">
    
 
</head>
<body>
    <main>
        <div class="row"> 
        <form:form name="loginForm" method="post" action="#LINK">
            <input type="hidden" name="message" value="${message}" />
            <input type="hidden" name="userSe"  value="USR"/>
            <input type="hidden" id="smtechId" name="smtechId" />
            <div class="colm-form">
                <div class="form-container">

                    <input name="id" id="id" type="text" placeholder="Email address or phone number">
                    <input name="password" id="password" type="password" placeholder="Password"> 
                    <div class="btn-login" id="loginBtn" onclick="javascript:actionLogin()">Sign In</div>
                    <a href="#">Forgotten password?</a>
                    <button class="btn-new">Create new Account</button>
                </div>
                <p><a href="#"><b>Create a Page</b></a> for a celebrity, brand or business.</p>
            </div>
        </form:form> 
        </div>
    </main>
    <footer>
        <div class="footer-contents">
            <ol>
                <li>English (UK)</li>
                <li><a href="#">മലയാളം</a></li>
                <li><a href="#">தமிழ்</a></li>
                <li><a href="#">తెలుగు</a></li>
                <li><a href="#">বাংলা</a></li>
                <li><a href="#">اردو</a></li>
                <li><a href="#">हिन्दी</a></li>
                <li><a href="#">ಕನ್ನಡ</a></li>
                <li><a href="#">Español</a></li>
                <li><a href="#">Português (Brasil)</a></li>
                <li><a href="#">Français (France)</a></li>
                <li><button>+</button></li>
           
            
               
                
                
            </ol>
            <small>RaonsLab © 2020</small>
        </div>
    </footer>
 <script src="/js/gcs/empiloginMobile.js"></script>
</body>
</html>