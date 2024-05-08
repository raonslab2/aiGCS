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
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="egovframework.com.cmm.LoginVO" %>

<%
    String url = request.getRequestURI() ;
	LoginVO user = (LoginVO) request.getSession().getAttribute("LoginVO");
	String grmName = (String) user.getGrmName();
	String mbAuth = (String) user.getMbAuth();
	System.out.println(mbAuth);
%>

<div class="menu_guide">
    <div style="text-align:center;height:50px;"><p style="color:white;">Burone 3.0</p></div>
    <div id="nav">
	<ul>
        <li class="menu01"><a <% if (url.indexOf("gA01Main") > -1) { %> class="active" <% } %> href="<c:url value='/gcs/dashboard/gA01Main.do'/>" >DATA</a></li>
        <li class="menu02"><a <% if (url.indexOf("gA02Main") > -1) { %> class="active" <% } %> href="<c:url value='/gcs/dashboard/gA02Main.do'/>" >PLAN</a></li>
  
		<li class="menu03"><a <% if (url.indexOf("gA03Main") > -1) { %> class="active" <% } %> href="<c:url value='/gcs/dashboard/gA03Main.do'/>" >SETUP</a></li>
		<li class="menu04"><a <% if (url.indexOf("process") > -1) { %> class="active" <% } %> href="<c:url value='/gcs/dashboard/gA04Main.do'/>" >CONFIG</a></li>
		<li class="menu05"><a <% if (url.indexOf("business") > -1) { %> class="active" <% } %> href="<c:url value='/gcs/dashboard/gA05Main.do'/>" >BIG DATA</a></li>
		<li class="menu06"><a <% if (url.indexOf("auth") > -1) { %> class="active" <% } %> href="<c:url value='/gcs/dashboard/gA06Main.do'/>" >Manage</a></li>
 
    </ul>
	</div>
</div>