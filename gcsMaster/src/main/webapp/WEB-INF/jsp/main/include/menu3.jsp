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
 <link rel="stylesheet" href="/css/gcs/commonMenu.css">
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"/>


<input type="checkbox" id="check">
<label for="check"> <i class="fas fa-bars" id="btn"></i> <i
	class="fas fa-times" id="cancel"></i>
</label>
<div class="sidebar">
	<header>AI GCS</header>
	<ul>
		<li><a href="/gcs/dashboard/gA030Main.do"><i
				class="fas fa-qrcode"></i>GCS</a></li>
		<li><a href="/gcs/dashboard/gA030OfflineMain.do" target="_blank"><i
				class="fas fa-qrcode"></i>Offline GCS</a></li>
		<li><a href="/gcs/dashboard/gA01Main2.do" target="_blank"><i
				class="fas fa-link"></i>Swarm Drone</a></li>
		<li><a href="/gcs/TD0001/TodayWork900.do"><i
				class="fas fa-calendar-week"></i>Today Work</a></li>
		<li><a href="/gcs/TD0001/TodayWork905.do" target="_blank"><i
				class="far fa-question-circle"></i>Work Chat</a></li>
		<li><a href="/gcs/TD0001/TodayWork100.do"><i
				class="fas fa-sliders-h"></i>RPA Robot</a></li>
		<li><a href="/gcs/TD0001/AiWork200.do"><i
				class="fas fa-sliders-h"></i>AI Wrok</a></li>
		<li><a href="#"><i class="far fa-envelope"></i>Contact</a></li>
	</ul>
</div>
<%-- 
  <nav>
    <div class="sidebar-top">
      <span class="shrink-btn">
        <i class='bx bx-chevron-left'></i>
      </span>
      <img src="/images/logo.png" class="logo" alt="">
      <h3 class="hide">GCS</h3>
    </div>

    <div class="search">
      <i class='bx bx-search'></i>
      <input type="text" class="hide" placeholder="Quick Search ...">
    </div>

    <div class="sidebar-links">
      <ul>
        <div class="active-tab"></div>
        <li class="tooltip-element" data-tooltip="0">
          <a href="/gcs/dashboard/gA030Main.do" class="active" data-active="0">
            <div class="icon">
              <i class='bx bx-tachometer'></i>
              <i class='bx bxs-tachometer'></i>
            </div>
            <span class="link hide">Dashboard</span>
          </a>
        </li> 
        <div class="tooltip">
          <span class="show">Dashboard</span>
          <span>Projects</span>
          <span>Messages</span>
          <span>Analytics</span>
        </div>
      </ul>
      <h4 class="hide">Today Work</h4>

      <ul>
        <li class="tooltip-element" data-tooltip="0">
          <a href="/gcs/TD0001/TodayWork900.do" data-active="4">
            <div class="icon">
              <i class='bx bx-notepad'></i>
              <i class='bx bxs-notepad'></i>
            </div>
            <span class="link hide">Today Work</span>
          </a>
        </li> 
      </ul>
      
      <h4 class="hide">Monitor</h4> 
      <ul>
        <li class="tooltip-element" data-tooltip="0">
          <a href="/gcs/TD0001/TodayWork100.do" data-active="4">
            <div class="icon">
              <i class='bx bx-notepad'></i>
              <i class='bx bxs-notepad'></i>
            </div>
            <span class="link hide">RPA</span>
          </a>
        </li> 
      </ul>
            
      <h4 class="hide">AI Model</h4>
      <ul> 
        <li class="tooltip-element" data-tooltip="1">
          <a href="/gcs/TD0001/TodayWork101.do" data-active="5">
            <div class="icon">
              <i class='bx bx-help-circle'></i>
              <i class='bx bxs-help-circle'></i>
            </div>
            <span class="link hide">AI Model</span>
          </a>
        </li>
         
      </ul>
      

    </div>

    <div class="sidebar-footer">
      <a href="#" class="account tooltip-element" data-tooltip="0">
        <i class='bx bx-user'></i>
      </a>
      <div class="admin-user tooltip-element" data-tooltip="1">
        <div class="admin-profile hide">
          <img src="/images/logo.png" alt="">
          <div class="admin-info">
            <h3>RaonsLab</h3>
            <h5>Admin</h5>
          </div>
        </div>
        <a href="/gcs/login/actionLogout.do" class="log-out">
          <i class='bx bx-log-out'></i>
        </a>
      </div>
      <div class="tooltip">
        <span class="show">John Doe</span>
        <span>Logout</span>
      </div>
    </div>
  </nav>
  --%>