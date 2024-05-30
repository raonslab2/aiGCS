<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page import="egovframework.com.cmm.LoginVO" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <title>Map Application</title>
    <link rel="stylesheet" href="/css/map/leaflet.css">
    <link rel="stylesheet" href="/css/map/styles.css">
    <script src="https://npmcdn.com/leaflet@1.3.4/dist/leaflet.js"></script>
    <script src="https://npmcdn.com/leaflet.path.drag/src/Path.Drag.js"></script>
    <script src="https://unpkg.com/@turf/turf"></script>
    <script src="/js/map/Leaflet.Editable.js"></script>
    <script src="/js/map/controls.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
    <div class="topnav">
        <a href="javascript:void(0)" class="menu-icon" onclick="toggleNav()">&#9776;</a>
        <a href="#">홈</a>
        <a href="#"></a>
        <a href="/gcs/dashboard/gA03Main9.do?tmLat=37.2953232&tmLng=127.0374223">비행계획(2D)</a>
        <a href="/gcs/dashboard/gA03Main.do" target="_blank" >비행계획(3D)</a>
        <a href="#">업로드</a>
        <a href="/gcs/dashboard/gcsMain2.do" target="_blank" >관제시스템</a>
        <a href="/gcs/dashboard/gA01Main2.do" target="_blank" >군집드론</a>
        <a href="#">보고서</a>
        <div class="topnav-right">
            <a href="#">공유</a>
            <a href="#"><i class="fa fa-user"></i></a>
            <a href="#"><i class="fa fa-cog"></i></a>
        </div>
    </div>

    <div id="mySidebar" class="sidebar" ondragstart="return false;" ondrop="return false;">
        <a href="javascript:void(0)" class="closebtn" onclick="toggleNav()"> </a>
        <div class="control-container">
            <div class="section">
                <div class="header">
                    <div class="title">
                        <input type="text" value="드론 비행계획" class="title-input">
                    </div>
                    <div class="actions">
                        <button class="add-button">+</button>
                    </div>
                </div>
                <div class="stats">
                    <div ><span id="statsTime">33:19</span>분</div>
                    <div><span id="statsArea">12</span>에이커</div>
                    <div><span id="statsImgCnt">605</span>이미지</div>
                    <div><span id="statsBat">3</span>배터리</div>
                </div> 
                <div class="option">
                    <label>총 거리(M)</label> 
                    <div class="flight-altitude">
                        <span id="distanceDisplay"></span> 
                    </div>
                </div>
                <div class="option">
                    <label>좌표</label>
                    <div class="flight-altitude">
                        <span><c:out value="${tmLat}"/> / <c:out value="${tmLng}"/></span> 
                    </div>
                </div>
                <div class="option">
                    <label>면적</label>
                    <div class="flight-altitude">
                        <div id="areaAarea">에이커: 0 </div>
                    </div>
                </div>
       
                <div class="option">
                    <label>비행 경로</label>
                    <div class="flight-altitude">
                       <button id="rectangleButton">폴리곤 추가</button>
                       <button id="resetButton">RESET</button>
 
                    </div>
                </div>
				<div class="option">
				    <label for="gridSizeSlider">그리드 크기</label> 
				    <input type="range" id="gridSizeSlider" min="1" max="10" value="2" step="0.01">
				    <span id="gridSizeValue">2.0</span>(m)
				</div>

                <div class="option">
                    <label>고급 3D</label>
                    <label class="toggle-switch">
                        <input type="checkbox" checked>
                        <span></span>
                    </label>
                </div>
                <div class="option">
                    <label>라이브 맵 HD</label>
                    <label class="toggle-switch">
                        <input type="checkbox">
                        <span></span>
                    </label>
                </div> 
                <div class="option">
                    <label>RTK SetUp</label>
                    <span>●</span>
                </div>
                <%-- 
                <div class="option">
                    <label>Data On Demand</label>
                    <button class="request-button">요청</button>
                </div>
                --%>
            </div>
                <%-- 
            <div class="section">
                <label for="mapSelect">맵</label>
                <select id="mapSelect">
                    <option>업로드된 맵 없음</option>
                </select>
            </div>

            <div class="section">
                <div class="section-header">
                    <span>레이어</span>
                    <button class="add-button">추가</button>
                </div>
                <ul class="layer-list">
                    <li>오버레이 <span class="count">0</span></li>
                    <li>위치 <span class="count">0</span></li>
                </ul>
            </div>
            <div class="section">
                <span>맵 분석</span>
            </div> 
          --%>
          
            <div class="section">
                
       
                
                <select id="droneSelect">
                    <option value="dji">DJI</option>
                    <option value="ardupilot">ArduPilot</option>
                </select>
                <button id="exportButton">업로드</button>
                <div id="rectangleList" class="rectangle-list"></div>

            </div>
        </div>
    </div>

    <div id="main">
        <button class="openbtn" onclick="toggleNav()">&#9776; 설정</button>
        <div id="map" style="width: 100%; height: 100vh;"></div>
        <div class="toggle-btn" onclick="toggleNav()">❮</div>
    </div>

    <!-- JavaScript 변수 설정 -->
    <script>
        var tmLat = ${tmLat};
        var tmLng = ${tmLng};

        function toggleNav() {
            var sidebar = document.getElementById("mySidebar");
            var toggleBtn = document.querySelector(".toggle-btn");
            if (sidebar.style.display === "block") {
                sidebar.style.display = "none";
                toggleBtn.innerHTML = "❮";
            } else {
                sidebar.style.display = "block";
                toggleBtn.innerHTML = "❯";
            }
        }
    </script>

    <!-- 외부 JavaScript 파일 포함 -->
    <script src="/js/map/mapInit.js"></script>
</body>
</html>
