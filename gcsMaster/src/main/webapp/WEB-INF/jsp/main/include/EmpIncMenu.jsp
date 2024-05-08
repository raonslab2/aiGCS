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

<link href="<c:url value='/'/>css/common.css" rel="stylesheet" type="text/css" >



<!-- //행정안전부 로고 및 타이틀 끝 -->
<div class="header_login">
    <div>
      <ul style="height:70px">
      <a href="<c:url value='/empo/dashboard/eMAU00A01Main.do'/>" >Dashboard</a>
      </ul>
      <ul style="height:70px">
      <a href="<c:url value='/empo/schedule/eMAU00B01Main.do'/>" >Schedule</a>
      </ul>
      <ul style="height:70px">
      <a href="<c:url value='/empo/resources/eMAU00C01Main.do'/>" >가용자원</a>
      </ul>
      <ul style="height:70px">
       <a href="<c:url value='/empo/process/eMAU00D01Main.do'/>" >프로세스</a>
      </ul>
      <ul style="height:70px">
      <a href="<c:url value='/empo/business/eMAU00E01Main.do'/>" >사업관리</a>
      </ul>
      <ul style="height:70px">
      <a href="<c:url value='/empo/auth/eMAU00F01Main.do'/>" >권한관리</a>
       </ul>
      <ul style="height:70px">
      <a href="<c:url value='/empo/rpa/eMAU00G01Main.do'/>" >RPA자료</a>
      </ul>
      <ul style="height:70px">
      <a href="<c:url value='/empo/tplink/eMAU00H01Main.do'/>" >T_LINK</a>
      </ul>
    </div>
 
</div>