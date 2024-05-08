<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

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