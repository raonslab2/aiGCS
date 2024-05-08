<%--
  Class Name : gA02Main.jsp
  Description : GCS
  Modification Information
 
      수정일         수정자                   수정내용
    -------    --------    ---------------------------
     2021.11.01   SCJ       GCS 생성
 
    author   : SCJ
    since    : 2021.11.01
--%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page import="egovframework.com.cmm.LoginVO" %>
 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Today Work</title>
  <link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css' rel='stylesheet'> 
  <!-- Common Css -->
  <link href="/css/gcs/TodayWorkCommon.css" rel="stylesheet"> 
  <link href="/css/gcs/TodayWork100.css" rel="stylesheet">
  <!-- Common Js -->
  <script type="text/javascript" src="/js/gcs/TodayCommon.js"></script>
 <!-- 부트스트랩 CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <!-- Chart.js -->
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <!-- jQuery -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <!-- Custom CSS -->
    <style>
        /* 메뉴 스타일 */
        .menu-container {
            margin-bottom: 20px;
        }
        .menu-container .menu-item {
            display: inline-block;
            margin-right: 10px;
            padding: 8px 16px;
            background-color: #007bff;
            color: #fff;
            border-radius: 5px;
            cursor: pointer;
        }
        .menu-container .menu-item:hover {
            background-color: #0056b3;
        }
        /* 탭 컨텐츠 숨김 */
        .tab-content {
            display: none;
        }
    </style>
</head>

<body>

  
  <!-- left menu List -->
  <c:import url="/EmpPageLink.do?link=main/include/menu3" /> 
  
 
  <main>
  <!-- top menu -->
  <div class="menu-container">
    <div class="menu-item" data-tab="dailyChartTab">전체</div>
    <div class="menu-item" data-tab="dailyChartTab">일일 RPA 처리량(상세)</div>
    <div class="menu-item" data-tab="weeklyChartTab">주간 RPA 처리량(상세)</div>
    <div class="menu-item" data-tab="monthlyChartTab">월간 RPA 처리량(상세)</div>
    <div class="menu-item" data-tab="yearlyChartTab">년간 RPA 처리량(상세)</div>
  </div>
    <div class="container">
        <div class="row">
            <div class="col-md-6">
                <h2>일일 RPA 처리량</h2>
                <canvas id="dailyChart"></canvas>
            </div>
            <div class="col-md-6">
                <h2>주간 RPA 처리량</h2>
                <canvas id="weeklyChart"></canvas>
            </div>
        </div>
        <div class="row">
            <div class="col-md-6">
                <h2>월간 RPA 처리량</h2>
                <canvas id="monthlyChart"></canvas>
            </div>
            <div class="col-md-6">
                <h2>연간 RPA 처리량</h2>
                <canvas id="yearlyChart"></canvas>
            </div>
        </div>
    </div>

    <p class="copyright">
      &copy; 2020 - <span>RaonsLab</span> All Rights Reserved.
    </p>
  </main>
  
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script type="text/javascript" src="/js/gcs/TodayWork100.js"></script>
  
</body>

</html>