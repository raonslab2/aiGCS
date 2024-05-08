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
	<li class="tab_depth01"><strong>기술성</strong></li>
	<li class="tab_depth02">
		<ul>
			<li><a href="<c:url value='/empo/EMAU00J01/EMAU00J0102.do'/>" <% if (url.indexOf("EMAU00J0102") > -1 || url.indexOf("EMAU00J0103") > -1) {%> class="active" <%}%>">목표기술 잠재력</a></li>
			<li><a href="<c:url value='/empo/EMAU00J01/EMAU00J0104.do'/>" <% if (url.indexOf("EMAU00J0104") > -1 || url.indexOf("EMAU00J0105") > -1 || url.indexOf("EMAU00J0106") > -1 || url.indexOf("EMAU00J0107") > -1 ) {%> class="active" <%}%>">목표기술 실현가능성</a></li>
		</ul>
	</li>
	<li class="tab_depth03">
		<ul>
			<li><a href="<c:url value='/empo/EMAU00J01/EMAU00J0102.do'/>" <% if (url.indexOf("EMAU00J0102") > -1) {%> class="active" <%}%>">창의 도전성</a></li>
			<li><a href="<c:url value='/empo/EMAU00J01/EMAU00J0103.do'/>" <% if (url.indexOf("EMAU00J0103") > -1) {%> class="active" <%}%>">기술 파급력</a></li>
		</ul>
		<ul>
			<li><a href="<c:url value='/empo/EMAU00J01/EMAU00J0105.do'/>" <% if (url.indexOf("EMAU00J0105") > -1) {%> class="active" <%}%>">기술개발 역량</a></li>
			<li><a href="<c:url value='/empo/EMAU00J01/EMAU00J0106.do'/>" <% if (url.indexOf("EMAU00J0106") > -1) {%> class="active" <%}%>">계획의 구체성 및 적정성</a></li>
			<li><a href="<c:url value='/empo/EMAU00J01/EMAU00J0107.do'/>" <% if (url.indexOf("EMAU00J0107") > -1) {%> class="active" <%}%>">기술보호 적정성</a></li>
		</ul>
	</li>
</ul>