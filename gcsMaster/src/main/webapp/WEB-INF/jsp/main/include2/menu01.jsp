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

<%
    String url = request.getRequestURI() ;
%>

<ul id="nav">
 
	<li><a href="<c:url value='/empo/EMAU00H01/EMAU00H0101.do'/>" <% if (url.indexOf("EMAU00H0101") > -1) {%> class="active" <%}%>">신청과제 정보</a></li>
	<li><a href="<c:url value='/empo/EMAU00H01/EMAU00H0102.do'/>" <% if (url.indexOf("EMAU00H0102") > -1) {%> class="active" <%}%>">참여기관</a></li>
	<li><a href="<c:url value='/empo/EMAU00H01/EMAU00H0104.do'/>" <% if (url.indexOf("EMAU00H0104") > -1) {%> class="active" <%}%>">참여인력</a></li>
	<li><a href="<c:url value='/empo/EMAU00H01/EMAU00H0105.do'/>" <% if (url.indexOf("EMAU00H0105") > -1) {%> class="active" <%}%>">연구개발 및 사업화 계획</a></li>
	<li class="fr"><a href="<c:url value='/empo/EMAU00H01/EMAU00H0107.do'/>" <% if (url.indexOf("EMAU00H0107") > -1) {%> class="active" <%}%>">기관정보 관리</a></li>
</ul> 
<!-- e :menu_guide -->