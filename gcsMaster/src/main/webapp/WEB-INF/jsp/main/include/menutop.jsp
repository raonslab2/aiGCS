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

  <div class="menu-container">
    <div class="menu-item selected" data-tab="dailyChartTab">
          <a href="/gcs/dashboard/gcsMain2.do" target="_blank" data-active="1">
            <span class="link hide">GCS_3.1</span>
          </a>
    </div>
    <div class="menu-item" data-tab="dailyChartTab">
          <a href="/gcs/dashboard/gA030OfflineMain.do" target="_blank" data-active="2">
            <span class="link hide">OffLine GCS</span>
          </a>
    </div>
    <div class="menu-item" data-tab="weeklyChartTab">
          <a href="/gcs/dashboard/gA01Main2.do" target="_blank" data-active="3">
            <span class="link hide">Swarm List</span>
          </a>
    </div>
    <div class="menu-item  " data-tab="monthlyChartTab">
          <a href="/gcs/dashboard/gA03Main.do" data-active="4">
            <span class="link hide">Drone Mission</span>
          </a>
    </div>
    <div class="menu-item" data-tab="yearlyChartTab">
          <a href="/gcs/dashboard/gA034Main.do" data-active="5">
            <span class="link hide">Drone Aircraft</span>
          </a>
    </div>
    <div class="menu-item" data-tab="yearlyChartTab">
          <a href="/gcs/dashboard/gA035Main.do" data-active="6">
            <span class="link hide">User List</span>
          </a>
    </div>
    <div class="menu-logout" id="menu-logout">
       <span><a href="/gcs/login/actionLogout.do">logout</a></span>
    </div>
  </div>
  
 