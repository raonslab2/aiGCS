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
    <div id="nav2">
	<ul>
        <li class="menu00"><a <% if (url.indexOf("gA030Main") > -1) { %> class="active" <% } %> href="<c:url value='/gcs/dashboard/gA030Main.do'/>" >Dashboard</a></li>
        <li class="menu01"><a <% if (url.indexOf("gA03Main") > -1) { %> class="active" <% } %> href="<c:url value='/gcs/dashboard/gA03Main.do'/>" >Drone Path List</a></li>
        <li class="menu02"><a <% if (url.indexOf("gA034Main") > -1) { %> class="active" <% } %> href="<c:url value='/gcs/dashboard/gA034Main.do'/>" >Drone Aircraft Management</a></li>
        <li class="menu03"><a <% if (url.indexOf("gA035Main") > -1) { %> class="active" <% } %> href="<c:url value='/gcs/dashboard/gA035Main.do'/>" >User management</a></li>
        <li class="menu04"><a <% if (url.indexOf("gA036Main") > -1) { %> class="active" <% } %> href="<c:url value='/gcs/dashboard/gA036Main.do'/>" >Flight approval management</a></li>
        <li class="menu05"><a <% if (url.indexOf("gA031Main") > -1) { %> class="active" <% } %> href="<c:url value='/gcs/dashboard/gA031Main.do'/>" >PATTERN PLAN</a></li>
        <li class="menu06"><a <% if (url.indexOf("gA032Main") > -1) { %> class="active" <% } %> href="<c:url value='/gcs/dashboard/gA032Main.do'/>" >PLAN POLYGON</a></li>
        <li class="menu07"><a <% if (url.indexOf("gA033Main") > -1) { %> class="active" <% } %> href="<c:url value='/gcs/dashboard/gA033Main.do'/>" >PLAN POLYGON2</a></li>

 
    </ul>
	</div>
</div>