<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="egovframework.com.cmm.LoginVO" %>
<style>
.topnav {
    overflow: hidden;
    background-color: #333;
    position: fixed;
    top: 0;
    width: 100%;
    z-index: 10000;
}

.topnav a {
    float: left;
    display: block;
    color: #f2f2f2;
    text-align: center;
    padding: 14px 16px;
    text-decoration: none;
    font-size: 17px;
}

.topnav .menu-icon {
    font-size: 20px;
    cursor: pointer;
    padding-left: 10px;
    display: none; /* Initially hide the menu icon */
}

.topnav a:hover {
    background-color: #ddd;
    color: black;
}

.topnav a.active {
    background-color: #4CAF50;
    color: white; /* 하얀색으로 변경 */
}

.topnav-right {
    float: right;
}

@media screen and (max-width: 600px) {
    .topnav a:not(:first-child) {
        display: none; /* Hide all menu items except the first one */
    }
    .topnav a.menu-icon {
        float: right;
        display: block; /* Show the menu icon */
    }
    .topnav.responsive {
        position: relative;
    }
    .topnav.responsive .menu-icon {
        position: absolute;
        right: 0;
        top: 0;
    }
    .topnav.responsive a {
        float: none;
        display: block;
        text-align: left;
    }
    .topnav.responsive .topnav-right {
        float: none;
    }
}

/* 로딩 스피너 CSS 추가 */
.spinner {
    display: none;
    position: fixed;
    z-index: 9999;
    top: 50%;
    left: 50%;
    width: 50px;
    height: 50px;
    margin: -25px 0 0 -25px;
    border: 8px solid #f3f3f3;
    border-top: 8px solid #3498db;
    border-radius: 50%;
    animation: spin 1s linear infinite;
}

@keyframes spin {
    0% { transform: rotate(0deg); }
    100% { transform: rotate(360deg); }
}
</style>

<div class="topnav" id="myTopnav">
    <a href="javascript:void(0)" class="menu-icon" onclick="toggleNav()">&#9776;</a>
    <a href="/gcs/dashboard/projectMain1001.do" page-data="menu-project" id="menu-project">프로젝트</a> 
    <a href="/gcs/dashboard/projectMain2001.do" page-data="menu-map" id="menu-map">지도</a> 
    <a href="/gcs/dashboard/projectMain3001.do" page-data="menu-realtime" id="menu-realtime">실시간 관제시스템</a>
    <a href="/gcs/dashboard/projectMain4001.do" page-data="menu-offline" id="menu-offline">오프라인 관제시스템</a>
    <a href="/gcs/dashboard/projectMain5001.do" page-data="menu-drone" id="menu-drone">군집드론</a>
    <a href="/gcs/dashboard/projectMain6001.do" page-data="menu-status" id="menu-status">기체현황</a>
    <a href="/gcs/dashboard/projectMain7001.do" page-data="menu-report" id="menu-report">보고서</a>
    <div class="topnav-right">
        <a href="/gcs/dashboard/projectMain9001.do" page-data="menu-user" id="menu-user">사용자정보</a>
        <a href="/gcs/TD0001/TodayWork900.do" page-data="menu-today" target="_blank" id="menu-today">오늘 할 일</a>
        <a href="#" id="menu-logout">로그아웃</a>
    </div>
</div>

<!-- 로딩 스피너 추가 -->
<div class="spinner" id="spinner"></div>

<script>
// jQuery를 사용하여 로그아웃 버튼에 클릭 이벤트 추가
$(document).ready(function() {
  $("#menu-logout").on("click", function() {
    $(location).attr('href', '/gcs/login/actionLogout.do');
  });

  // 현재 페이지의 page-data 속성을 기반으로 active 클래스를 추가
  var pageData = $('body').attr('page-data');
 
  if (pageData) {
    $('.topnav a[page-data="' + pageData + '"]').addClass('active');
  }
});

// AJAX 요청이 시작될 때 스피너를 표시하고, 완료되거나 실패할 때 스피너를 숨깁니다.
$(document).ajaxStart(function() {
    $("#spinner").show();
}).ajaxStop(function() {
    $("#spinner").hide();
});

function toggleNav() {
    var x = document.getElementById("myTopnav");
    if (x.className === "topnav") {
        x.className += " responsive";
    } else {
        x.className = "topnav";
    }
}
</script>
