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
    color: white;
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
</style>
<div class="topnav" id="myTopnav">
    <a href="javascript:void(0)" class="menu-icon" onclick="toggleNav()">&#9776;</a>
    <a href="#"></a>
    <a href="/gcs/dashboard/gA03Main.do">프로젝트</a> 
    <a href="/gcs/dashboard/gcsMain2.do" target="_blank">실시간 관제시스템</a>
    <a href="/gcs/dashboard/gA030OfflineMain.do" target="_blank">오프라인 관제시스템</a>
    <a href="/gcs/dashboard/gA01Main2.do">군집드론</a>
    <a href="/gcs/dashboard/gA034Main.do">기체현황</a>
    <a href="#">보고서</a>
    <div class="topnav-right">
        <a href="/gcs/dashboard/gA035Main.do">사용자정보</a>
        <a href="/gcs/TD0001/TodayWork900.do" target="_blank">오늘 할 일</a>
        <a href="#" id="menu-logout">로그아웃</a>
    </div>
</div>
<script>
// jQuery를 사용하여 로그아웃 버튼에 클릭 이벤트 추가
$(document).ready(function() {
  $("#menu-logout").on("click", function() {
    // 클릭 시 실행할 동작을 정의합니다.
    // 예를 들어, 로그아웃 기능을 여기에 추가할 수 있습니다.
    $(location).attr('href', '/gcs/login/actionLogout.do');
  });
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
