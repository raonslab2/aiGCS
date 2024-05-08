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
    <style>
        body{
          font-family: 'Open Sans', sans-serif;
          background:#3498db;
          margin: 0 auto 0 auto;  
          width:100%; 
          text-align:center;
          margin: 20px 0px 20px 0px;   
        }
        p{
          font-size:12px;
          text-decoration: none;
          color:#ffffff;
        }
        h1{
          font-size:1.5em;
          color:#525252;
        }
        .box{
          background:white;
          width:300px;
          border-radius:6px;
          margin: 0 auto 0 auto;
          padding:0px 0px 70px 0px;
          border: #2980b9 4px solid; 
        }
        .username{
          background:#ecf0f1;
          border: #ccc 1px solid;
          border-bottom: #ccc 2px solid;
          padding: 8px;
          width:250px;
          color:#AAAAAA;
          margin-top:10px;
          font-size:1em;
          border-radius:4px;
        }
        .button{
          background:#2ecc71;
          width:125px;
          padding-top:5px;
          padding-bottom:5px;
          color:white;
          border-radius:4px;
          border: #27ae60 1px solid;
          margin-top:20px;
          margin-bottom:20px;
          float:left;
          margin-left:88px;
          font-weight:800;
          font-size:0.8em;
        }
        .button:hover{
          background:#2CC06B; 
        }
        .fpwd{
            color:#f1c40f;
            text-decoration: underline;
        }
       #absoluteCenteredDiv{
            position: absolute;
            top:0;
            bottom: 0;
            left: 0;
            right: 0;
            margin: auto;
            width:400px;
            height: 300px;
            text-align: center;
       }
    </style>
    
<script type="text/javascript">

function enterkey() {
	if (window.event.keyCode == 13) {
    	// 엔터키가 눌렸을 때
    	actionLogin();
    }
}
	
	
<!--
function actionLogin() { 

    if (document.loginForm.id.value =="") {
        alert("아이디를 입력하세요");
        return false;
    } else if (document.loginForm.password.value =="") {
        alert("비밀번호를 입력하세요");
        document.loginForm.password.focus();;
        return false;
    } else {
        document.loginForm.action="<c:url value='/gcs/login/actionLogin2.do'/>";
        //document.loginForm.j_username.value = document.loginForm.userSe.value + document.loginForm.username.value;
        //document.loginForm.action="<c:url value='/j_spring_security_check'/>";
        document.loginForm.submit();
    }
}

function setCookie (name, value, expires) {
    document.cookie = name + "=" + escape (value) + "; path=/; expires=" + expires.toGMTString();
}

function getCookie(Name) {
    var search = Name + "="
    if (document.cookie.length > 0) { // 쿠키가 설정되어 있다면
        offset = document.cookie.indexOf(search)
        if (offset != -1) { // 쿠키가 존재하면
            offset += search.length
            // set index of beginning of value
            end = document.cookie.indexOf(";", offset)
            // 쿠키 값의 마지막 위치 인덱스 번호 설정
            if (end == -1)
                end = document.cookie.length
            return unescape(document.cookie.substring(offset, end))
        }
    }
    return "";
}

function saveid(form) {
    var expdate = new Date();
    // 기본적으로 30일동안 기억하게 함. 일수를 조절하려면 * 30에서 숫자를 조절하면 됨
    if (form.checkId.checked)
        expdate.setTime(expdate.getTime() + 1000 * 3600 * 24 * 30); // 30일
    else
        expdate.setTime(expdate.getTime() - 1); // 쿠키 삭제조건
    setCookie("saveid", form.id.value, expdate);
}

function getid(form) {
    //form.checkId.checked = ((loginForm.id.value = getCookie("saveid")) != "");
}

function fnInit() {
    var message = document.loginForm.message.value;
    if (message != "") {
        alert(message);
    }
    getid(document.loginForm);
}

var smtechId = function() {
	$.post("/empo/login/seeSmtechId.do", {"id" : $(this).val()} ).done(function(res) {
		console.log(res.list);
		if (res.list == null) {
			$("#smtechId").val("");
		} else {
			if (res.list.smtechId == "NULL") {
				$("#smtechId").val("");
			} else {
				$("#smtechId").val(res.list.smtechId);	
			}
		}
		
	});
}

$(function() {
	$("#id").change(smtechId);
	
	fnInit();
});
//-->
</script>
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
                <a href="#"><div class="button" id="loginBtn" onclick="javascript:actionLogin()">DID Sign In</div></a>
            </div>
        </form:form> 
        <p> </p>
    </div>   
</div>  
    <script type="text/javascript">
        $(document).ready(function(){
            $('#id').focus();
        });

    </script>
</body>
</html>