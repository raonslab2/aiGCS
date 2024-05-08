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
<script type="text/javascript">
	$(document).ready(function() {
		$('input[type="text"]').keydown(function() {
			  if (event.keyCode === 13) {
			    event.preventDefault();
			  };
			});
		$("#logOut").click(function() {
			if (confirm("로그아웃 하시겠습니까?")) {
				window.location.href = "/empo/login/actionLogout.do";
				//return false;
			}
			else {
				return false;
			}
		});
		
	});

	// 회원정보 수정 버튼
	function fnTopUserEdit() {
		fnPopupOpen("../popup/member_003.jsp", "");	// ../js/popup.js 참고
	}
	
	
	

</script> 
<ul>
	<!-- <li class="help"><a href="#">도움말</a></li>
	<li class="message"><a href="#">알림</a><span><b>+22</b></span></li>//li class에 class="message none" 추가하면 메세지 갯 수안보임 -->
	<li class="member_info"><strong>
    <%
       LoginVO loginVO = (LoginVO)session.getAttribute("LoginVO"); 
       if(loginVO == null){ 
    %>
       <a href="<c:url value='/empo/login/eMAU00001Main.do'/>">Login</a>
    <% }else { %>
      <c:set var="loginName" value="<%= loginVO.getName()%>"/>
       <c:out value="${loginName}"/> 님 
    <%--  <a href="<c:url value='/empo/login/actionLogout.do'/>">로그아웃</a> --%>
    <c:set var="grmName" value="<%= loginVO.getGrmName()%>"/>
		<span><c:out value="${grmName}"/></span>
    <% } %>
		</strong>
		 <a href="#LINK"><img src="../../images/top_icon03.png" alt="회원정보수정"/></a>
	<button type="button" class="btn_style01 sb_style btn_white logOut" id="logOut">로그아웃</button>
	</li>
</ul>

