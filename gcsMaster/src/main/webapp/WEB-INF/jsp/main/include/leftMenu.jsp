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
 
  <nav>
    <div class="sidebar-top">
      <span class="shrink-btn">
        <i class='bx bx-chevron-left'></i>
      </span>
      <img src="/img/logo.png" class="logo" alt="">
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
        <li class="tooltip-element" data-tooltip="1"> 
          <a href="/gcs/dashboard/gcsMain2.do" target="_blank" data-active="1">
            <div class="icon">
              <i class='bx bx-folder'></i>
              <i class='bx bxs-folder'></i>
            </div>
            <span class="link hide">GCS_3.1</span>
          </a>
        </li>
        <li class="tooltip-element" data-tooltip="1"> 
          <a href="/gcs/dashboard/gcsMain2.do" target="_blank" data-active="2">
            <div class="icon">
              <i class='bx bx-folder'></i>
              <i class='bx bxs-folder'></i>
            </div>
            <span class="link hide">OffList GCS</span>
          </a>
        </li>        
        <li class="tooltip-element" data-tooltip="1"> 
          <a href="/gcs/dashboard/gA01Main2.do" target="_blank" data-active="3">
            <div class="icon">
              <i class='bx bx-folder'></i>
              <i class='bx bxs-folder'></i>
            </div>
            <span class="link hide">Swarm List</span>
          </a>
        </li>
        <li class="tooltip-element" data-tooltip="2">
          <a href="/gcs/dashboard/projectMain1001.do" data-active="4">
            <div class="icon">
              <i class='bx bx-message-square-detail'></i>
              <i class='bx bxs-message-square-detail'></i>
            </div>
            <span class="link hide">Drone Mission</span>
          </a>
        </li>
        <li class="tooltip-element" data-tooltip="3">
          <a href="/gcs/dashboard/gA034Main.do" data-active="5">
            <div class="icon">
              <i class='bx bx-bar-chart-square'></i>
              <i class='bx bxs-bar-chart-square'></i>
            </div>
            <span class="link hide">Drone Aircraft</span>
          </a>
        </li>
        <li class="tooltip-element" data-tooltip="4">
          <a href="/gcs/dashboard/gA035Main.do" data-active="6">
            <div class="icon">
              <i class='bx bx-bar-chart-square'></i>
              <i class='bx bxs-bar-chart-square'></i>
            </div>
            <span class="link hide">User List</span>
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
          <a href="/gcs/TD0001/TodayWork901.do" data-active="4">
            <div class="icon">
              <i class='bx bx-notepad'></i>
              <i class='bx bxs-notepad'></i>
            </div>
            <span class="link hide">My Work List</span>
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
        <li class="tooltip-element" data-tooltip="1">
          <a href="/gcs/TD0001/TodayWork101.do" data-active="5">
            <div class="icon">
              <i class='bx bx-help-circle'></i>
              <i class='bx bxs-help-circle'></i>
            </div>
            <span class="link hide">Label 1</span>
          </a>
        </li>
        <li class="tooltip-element" data-tooltip="2">
          <a href="/gcs/TD0001/TodayWork102.do" data-active="6">
            <div class="icon">
              <i class='bx bx-cog'></i>
              <i class='bx bxs-cog'></i>
            </div>
            <span class="link hide">Label 2</span>
          </a>
        </li>
        <div class="tooltip">
          <span class="show">Tasks</span>
          <span>Help</span>
          <span>Settings</span>
        </div>
      </ul>
    </div>

    <div class="sidebar-footer">
      <a href="#" class="account tooltip-element" data-tooltip="0">
        <i class='bx bx-user'></i>
      </a>
      <div class="admin-user tooltip-element" data-tooltip="1">
        <div class="admin-profile hide">
          <img src="/img/face-1.png" alt="">
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