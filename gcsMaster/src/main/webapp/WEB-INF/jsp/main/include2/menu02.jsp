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
	<li><a href="<c:url value='/empo/EMAU00J01/EMAU00J0101.do'/>"  <% if (url.indexOf("EMAU00J0101") > -1) {%> class="active" <%}%>">예비평가 결과분석</a></li>
	<li><a href="#">참여기관 분석정보</a></li>
	<li><a href="#">참여인력 분석정보</a></li>
	<li><a href="#">개발기술 분석정보</a></li>
	<li><a href="#">기술사업화 분석정보</a></li>
	<li><a href="#">R&amp;D성과 분석정보</a></li>
	<li class="fr"><a href="<c:url value='/empo/EMAU00J01/EMAU00J0102.do'/>"  <% if (url.indexOf("EMAU00J0101") == -1) {%> class="active" <%}%>">심층평가</a></li>
</ul>