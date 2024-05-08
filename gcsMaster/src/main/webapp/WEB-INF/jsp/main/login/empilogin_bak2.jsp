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
<meta charset="utf-8">
<title>DID Blockchain based Swarm drone platform</title> 
<c:import url="/EmpPageLink.do?link=main/include/src" />

<script type="text/javascript">
<!--
function actionLogin() {

    if (document.loginForm.id.value =="") {
        alert("아이디를 입력하세요");
        return false;
    } else if (document.loginForm.password.value =="") {
        alert("비밀번호를 입력하세요");
        return false;
    } else {
        document.loginForm.action="<c:url value='/gcs/login/actionLogin.do'/>";
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
    form.checkId.checked = ((form.id.value = getCookie("saveid")) != "");
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

<body>
	<!-- s :wrap -->
	<div id="wrap" class="login_wrap">
		<!-- s :login_guide -->
		<div class="login_guide">
			<h2>
				<span>DID Blockchain based Platform</span> 
			</h2>
            <br>
			<form:form name="loginForm" method="post" action="#LINK">
            <input type="hidden" name="message" value="${message}" />
            <input type="hidden" name="userSe"  value="USR"/>
			<ul class="login_info">
				<li><strong>ID</strong></li>
				<li><input type="text" id="id" name="id"></li>
				<li><strong>PW</strong></li>
				<li><input type="password" id="password" name="password" placeholder="숫자, 영문 8자 이상"
				onkeydown="javascript:if (event.keyCode == 13) { actionLogin(); }"/>
				 </li> 
				<li><input type="hidden" id="smtechId" name="smtechId" />
				 </li>
				<li><input type="checkbox" checked name="checkId" onclick="javascript:saveid(this.form);"> 로그인 상태 유지</li>				
				<li><button type="submit" id="btnLogin" onclick="javascript:actionLogin()">로그인</button></li>
				<%-- <li class="info_txt"><a href="<c:url value='/'/>empo/login/eMAU00002Main.do" >비밀번호가 기억이 안나요</a></li> --%>
			</ul>
			</form:form> 
		</div>
		<!-- e :lnb_guide -->
	</div>
	<!-- e :wrap -->
</body>
</html>
