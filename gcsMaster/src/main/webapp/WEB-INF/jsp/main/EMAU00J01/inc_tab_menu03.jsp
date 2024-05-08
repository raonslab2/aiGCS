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
	<li class="tab_depth01"><strong>정책부합성</strong></li>
	<li class="tab_depth02">
		<ul>
			<li><a href="<c:url value='/empo/EMAU00J01/EMAU00J0113.do'/>" <% if (url.indexOf("EMAU00J0113") > -1) {%> class="active" <%}%>">고용친화도</a></li>
			<li><a href="<c:url value='/empo/EMAU00J01/EMAU00J0114.do'/>" <% if (url.indexOf("EMAU00J0114") > -1) {%> class="active" <%}%>">산업별 특화지표</a></li>
		</ul>
	</li>
</ul>