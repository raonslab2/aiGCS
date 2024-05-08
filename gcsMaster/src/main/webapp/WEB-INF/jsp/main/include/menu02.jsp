<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
    String url = request.getRequestURI() ;
%>

<ul id="nav">
	<li><a href="EMAU00J0101.jsp"  <% if (url.indexOf("EMAU00J0101") > -1) {%> class="active" <%}%>">예비평가 결과분석</a></li>
	<li><a href="#">참여기관 분석정보</a></li>
	<li><a href="#">참여인력 분석정보</a></li>
	<li><a href="#">개발기술 분석정보</a></li>
	<li><a href="#">기술사업화 분석정보</a></li>
	<li><a href="#">R&amp;D성과 분석정보</a></li>
	<li class="fr"><a href="EMAU00J0102.jsp"  <% if (url.indexOf("EMAU00J0101") == -1) {%> class="active" <%}%>">심층평가</a></li>
</ul>