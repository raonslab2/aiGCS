<%--
  Class Name : EgovIncHeader.jsp
  Description : 화면상단 Header(include)
  Modification Information
 
      수정일         수정자                   수정내용
    -------    --------    ---------------------------
     2021.05.18   MBA       신규
 
    author   : 평가계획관리시스템 MBA
    since    : 2021.05.18 
--%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import ="egovframework.com.cmm.LoginVO" %>

<link href="<c:url value='/'/>css/common.css" rel="stylesheet" type="text/css" >
<div style="float:right;height:;26px;">
    <%
       LoginVO loginVO = (LoginVO)session.getAttribute("LoginVO"); 
       if(loginVO == null){ 
    %>
       <a href="<c:url value='/empo/login/eMAU00001Main.do'/>">Login</a>
    <% }else { %>
      <c:set var="loginName" value="<%= loginVO.getName()%>"/>
      <a href="#LINK" onclick="alert('개인정보 확인 등의 링크 제공'); return false;"><c:out value="${loginName}"/> 님</a>
         관리자로 로그인하셨습니다. 
     <a href="<c:url value='/empo/login/actionLogout.do'/>">로그아웃</a>
    <% } %> 
</div>