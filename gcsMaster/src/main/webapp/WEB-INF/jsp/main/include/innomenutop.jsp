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

			<div class="location-content">
				<div class="location-area">
					<span class="location">주소록관리</span>
				</div>
				<span class="logo-area">
					<img src="/inno/assets/images/logo.png" alt="지우회계법인">
				</span>
				<div class="menu-area">
					<div class="lang-box">
						<div id="lang_now">
							<img src="/inno/assets/images/flags/4x3/kr.svg">
						</div>
						<select class="language">
							<option value="kr">KOR</option>
							<option value="us">ENG</option>
							<option value="jp">JPN</option>
							<option value="fr">FRN</option>
							<option value="ru">RUS</option>
							<option value="uz">UZB</option>
						</select>
					</div>
					<div class="user-box">
						<img src="/inno/assets/images/temp_photo.png" alt="" class="photo">
						<div class="info">
							<span class="tit">관리자</span>
							<strong>김상민</strong>
						</div>
					</div>
					<div class="link-box">
						
						<a href="#" class="icon-out"></a>
						<a href="#" class="icon-charge"></a>
					</div>
				</div>
			</div>