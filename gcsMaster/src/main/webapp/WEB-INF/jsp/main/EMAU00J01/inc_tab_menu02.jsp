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


<ul>
	<li class="tab_depth01"><strong>사업성</strong></li>
	<li class="tab_depth02">
		<ul>
			<li><a href="<c:url value='/empo/EMAU00J01/EMAU00J0108.do'/>" <% if (url.indexOf("EMAU00J0108") > -1 || url.indexOf("EMAU00J0109") > -1) {%> class="active" <%}%>">목표시장 잠재력</a></li>
			<li><a href="<c:url value='/empo/EMAU00J01/EMAU00J0110.do'/>" <% if (url.indexOf("EMAU00J0110") > -1 || url.indexOf("EMAU00J0111") > -1 || url.indexOf("EMAU00J0112") > -1) {%> class="active" <%}%>">사업화 실현가능성</a></li>
		</ul>
	</li>
	<li class="tab_depth03">
		<ul>
			<li><a href="<c:url value='/empo/EMAU00J01/EMAU00J0108.do'/>" <% if (url.indexOf("EMAU00J0108") > -1) {%> class="active" <%}%>">목표시장 혁신성</a></li>
			<li><a href="<c:url value='/empo/EMAU00J01/EMAU00J0109.do'/>" <% if (url.indexOf("EMAU00J0109") > -1) {%> class="active" <%}%>">목표시장 규모 및 성장성</a></li>
		</ul>
		<ul>
			<li><a href="<c:url value='/empo/EMAU00J01/EMAU00J0110.do'/>" <% if (url.indexOf("EMAU00J0110") > -1) {%> class="active" <%}%>">사업화 역량</a></li>
			<li><a href="<c:url value='/empo/EMAU00J01/EMAU00J0111.do'/>" <% if (url.indexOf("EMAU00J0111") > -1) {%> class="active" <%}%>">시장진입 가능성</a></li>
			<li><a href="<c:url value='/empo/EMAU00J01/EMAU00J0112.do'/>" <% if (url.indexOf("EMAU00J0112") > -1) {%> class="active" <%}%>">사업화 투자계획 적정성</a></li>
		</ul>
	</li>
</ul>