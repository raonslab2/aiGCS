<%-- not delete - this page : projectMain1002.jsp --%>
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
    <title>Drone Flight Plan</title>
    <link rel="stylesheet" href="/css/map/leaflet.css">
    <link rel="stylesheet" href="/css/map/styles.css">
    <link rel="stylesheet" href="/css/map/leaflet-path-transform.css">

    <script src="/js/map/jquery-3.7.1.min.js"></script>
    <script src="/js/map/leaflet/dist/html2canvas.min.js"></script>
    <script src="/js/map/leaflet/dist/leaflet.js"></script>
    <script src="/js/map/leaflet/dist/Path.Drag.js"></script>
    <script src="/js/map/leaflet/dist/turf.min.js"></script>
 

    <script src="/js/map/projectMain1002.js"></script>
    <script src="/js/map/Leaflet.Editable.js"></script>
    <script src="/js/map/controls.js"></script>
    <script src="/js/map/polygonService.js"></script>
    <script src="/js/map/leaflet-path-transform.js"></script>
    <link rel="stylesheet" href="/mnt/data/styles.css">
 
    <link rel="stylesheet" href="/css/map/fontawesome-free-6.5.2-web/css/all.min.css">
    
 
   <!-- Google Maps JavaScript API -->
    <script async defer
        src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCAd_7gJ7UDeN_gKMAomqj2_wLovzFkBuc&libraries=places">
    </script>
</head>
<body page-data="menu-project">
<form id="dataUpdate">
    <input type="hidden" id="dlPk" name="dlPk" value="${dlPk}">
    <input type="hidden" id="strWayPoint" name="strWayPoint" value="${strWayPoint}">
</form>

 <!-- 주소 검색 필드 추가 -->
<div class="search-container">
    <input type="text" id="addressInput" placeholder="이름, 우편번호 또는 좌표로 검색">
    <button id="searchButton">검색</button>
</div>


<!-- head menu -->
    <c:import url="/EmpPageLink.do?link=main/include/projectMainHead" />

<!-- 기존 좌측 메뉴 -->
<div id="mySidebar" class="sidebar" ondragstart="return false;" ondrop="return false;" style="display: none;">
    <a href="javascript:void(0)" class="closebtn" onclick="toggleNav()"></a>
    <div class="control-container">
        <div class="section">
            <div class="header">
                <div class="title">
                    <input type="text" id="projectName" style="width:100%;" value="Drone WayPoint" class="title-input form-control">
                </div>
                <div class="actions">
                    <button class="add-button btn">+</button>
                </div>
            </div>
            <div class="stats">
                <div><span id="statsTime">33:19</span>분</div>
                <div><span id="statsArea">0</span>헥타르</div>
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
                <label>중심좌표</label>
                <div class="flight-altitude">
                    <span id="tmLat"></span> / <span id="tmLng"></span>
                </div>
            </div>
            <div class="option">
                <label>비행 경로</label>
                <div class="flight-altitude">
                    <button id="rectangleButton" class="btn">폴리곤</button>
                    <button id="resetButton" class="btn btn-reset">초기화</button>
                </div>
            </div>
            <div class="option">
                <label for="gridSizeSlider">간격</label>
                <div class="flight-altitude">
                    <input type="range" id="gridSizeSlider" class="form-control" min="1" max="10" step="1" value="2">
                    <span id="gridSizeValue">2.0</span>(m)
                </div>
            </div>
            <div class="option">
                <label for="gridSizeSlider">고도</label>
                <div class="flight-altitude">
                    <input type="range" id="droneAlt" class="form-control" min="10" max="150" step="1" value="20">
                    <span id="droneAltValue">20</span>(m)
                </div>
            </div>
            <div class="option">
                <label for="gridSizeSlider">속도</label>
                <div class="flight-altitude">
                    <input type="range" id="droneSpeed" class="form-control" min="2" max="8" step="1" value="2">
                    <span id="droneSpeedValue">2</span>(m/s)
                </div>
            </div>
            <div class="option">
                <label>카메라</label>
                <label class="toggle-switch">
                    <input id="checkCamera" type="checkbox">
                    <span></span>
                </label>
            </div>
            <div class="option">
                <label>고급 3D</label>
                <label class="toggle-switch">
                    <input id="checkMulti" type="checkbox">
                    <span></span>
                </label>
            </div>
            <div class="option">
                <label>RTK SetUp</label>
                <span>●</span>
            </div>
            <div class="section">
                <label for="droneSelect">드론 선택</label>
                <select id="droneSelect" class="form-control">
                    <option value="dji">DJI</option>
                    <option value="ardupilot">ArduPilot</option>
                </select>
                <button id="exportButton" class="btn">업로드</button>
                <button id="importButton" class="btn" style="display: none;">다시그리기</button>
                <div id="rectangleList" class="rectangle-list"></div>
            </div>
        </div>
    </div>
</div>
 

<div id="main">
    <button class="openbtn" onclick="toggleNav()">&#9776; 설정</button>
    <div id="map" style="width: 100%; height: 100vh;"></div> 
    <div class="toggle-btn" id="toggle-btn" onclick="toggleBothNavs()">❮</div>
</div>

<!-- 팝업과 투명 레이어를 위한 HTML 추가 -->
<div id="overlay" class="popup-overlay" style="display: none;">
    <div class="popup-content">
        <h3>프로젝트 만들기</h3>
        <div class="popup-pj-tit"><label for="projectNameInput">프로젝트 이름</label></div>
        <div class="popup-pj-sub">
            <input type="text" id="projectNameInput" placeholder="프로젝트 이름">
        </div>
        <div class="popup-pj-sub">
            <select id="coordinateSystem">
                <option value="Korea 2000 / Unified CS">Korea 2000 / Unified CS</option>
                <!-- 다른 옵션 추가 -->
            </select>
        </div>
        <div class="popup-pj-sub">
            <div>프로젝트 설정은 나중에도 변경 가능합니다.</div>
            <div><button id="continueButton" class="continue-button">계속</button></div>
        </div>
    </div>
</div>

<div id="newMenuSidebar" class="sidebar" style="display: none;">
    <h2>새로운 비행 계획</h2>
    <div class="menu-section">
        <button id="standardMappingButton2D" data-page="1" class="menu-button">
            <i class="fas fa-map fa-2x"></i>
            <div>
                <div>지도 맵</div>
                <div class="subtitle">2D/3D 매핑 지도 만들기</div>
            </div>
        </button> 
        <hr>
        <button id="facadeFlightButton" data-page="3" class="menu-button">
            <i class="fas fa-building fa-2x"></i>
            <div>
                <div>파사드(원형)</div>
                <div class="subtitle">3D 원형 만들기</div>
            </div>
        </button>
        <button id="facadeFlightButton2" data-page="4" class="menu-button">
            <i class="fas fa-building fa-2x"></i>
            <div>
                <div>파사드(단선형)</div>
                <div class="subtitle">3D 단면 비행 만들기</div>
            </div>
        </button>
        <button id="facadeFlightButton3" data-page="5" class="menu-button">
            <i class="fas fa-building fa-2x"></i>
            <div>
                <div>파사드(단선형)</div>
                <div class="subtitle">Offline 비행 만들기</div>
            </div>
        </button>
        <hr>
        <button id="corridorMappingButton" data-page="2" class="menu-button">
            <i class="fas fa-road fa-2x"></i>
            <div>
                <div>회랑</div>
                <div class="subtitle">3차원 회랑 지도 만들기</div>
            </div>
        </button>
        <hr>
        <button id="panoramaButton" class="menu-button">
            <i class="fas fa-camera fa-2x"></i>
            <div>
                <div>파노라마</div>
                <div class="subtitle">구형 사진 생성</div>
            </div>
        </button>
        <button id="videoCaptureButton" class="menu-button">
            <i class="fas fa-video fa-2x"></i>
            <div>
                <div>동영상</div>
                <div class="subtitle">고화질 동영상 캡처</div>
            </div>
        </button>
        <button id="photoReportButton" class="menu-button">
            <i class="fas fa-file-alt fa-2x"></i>
            <div>
                <div>포토 리포트</div>
                <div class="subtitle">고품질 사진 캡처</div>
            </div>
        </button>
    </div>
</div>



<script>
    var tmLat = "${tmLat}";
    var tmLng = "${tmLng}";
    var dlPk = "${dlPk}";
    var detailData = "${detailData}";
    var dlDiv = "${dlDiv}";
 

    if (!dlPk || dlPk.trim() === "") {
        tmLat = "37.20889279";
        tmLng = "127.75102006";
    }

    $(document).ready(function () {
        var now = new Date();
        var formattedDate = 'Route_' + now.toISOString().slice(0, 10).replace(/-/g, '') + now.toTimeString().slice(0, 5).replace(/:/g, '');
        
        if (detailData=="-1") {
        	//신규생성이라면
            $('#importButton').hide();
            $('#mySidebar').hide();
            $('#toggle-btn').hide();  // toggle-btn 요소 숨기기
            $('#newSidebar').hide(); // newSidebar 요소 보이기
        }else if(detailData=="0") {
        	//dlPk 프로젝트는 개설되어 있으나, 아직 경로를 만들지 않았다면
            $('#importButton').hide();
            $('#mySidebar').hide();
            if(dlDiv=="1"){
                $('#newMenuSidebar').hide();
                $('#mySidebar').show();
            }else{
                $('#newMenuSidebar').show();
                $('#mySidebar').hide();
            }

            $('#toggle-btn').hide();  // toggle-btn 요소 숨기기
            $('#newSidebar').hide(); // newSidebar 요소 보이기
        } else if(detailData=="2") {
        	//경로가 있다면
            $('#importButton').show();
            $('#mySidebar').show();
            $('#newMenuSidebar').hide();
            $('#toggle-btn').hide();  // toggle-btn 요소 보이기
            $('#toggle-btn').html('❮');
            formattedDate = "${dlName}"; 
            updateToggleBtnPosition();
        }

        $('#projectName').val(formattedDate);

        // tmLat와 tmLng를 문자열로 변환한 후 substring 호출
        $('#tmLat').text(String(tmLat).substring(0, 10));
        $('#tmLng').text(String(tmLng).substring(0, 10));
    });
 

    $('#overlay').on('click', function (e) {
        if (!$(e.target).closest('.popup-content').length) {
            e.stopPropagation();
        }
    });

    $('.popup-content').on('click', function (e) {
        e.stopPropagation();
    });

    $('#continueButton').on('click', function () {
        const projectName = $('#projectNameInput').val();
        const codination = $('#coordinateSystem').val(); // coordinateSystem 값 추가

        // 지도 중심 좌표값 가져오기
        const center = map.getCenter();
        const homeX = center.lat;
        const homeY = center.lng;

        if (projectName.length === 0) {
            alert("프로젝트 이름을 입력하세요.");
            $('#projectNameInput').focus();
        } else {
            // 서버로 프로젝트 이름 저장 요청
            $.ajax({
                url: '/gcs/dashboard/saveProjectName.do', // 서버의 적절한 엔드포인트 URL로 변경 필요
                type: 'POST',
                data: {
                    projectName: projectName,
                    codination: codination,
                    homeX: homeX,
                    homeY: homeY,
                },
                success: function (response) {
                    const dlPk = response.result;
                    window.location.href = `http://localhost:8081/gcs/dashboard/projectMain1002.do?dlPk=${dlPk}`;
                },
                error: function (error) {
                    alert("프로젝트 이름 저장에 실패했습니다.");
                }
            });
        }
    });

    function toggleBothNavs() {
        var sidebar = $('#mySidebar');
        var newSidebar = $('#newMenuSidebar');
        var toggleBtn = $('.toggle-btn');

        if (sidebar.css('left') === '0px') {
            sidebar.css('left', '-350px');
            newSidebar.css('left', '0');
            toggleBtn.html('❯');
            toggleBtn.css('left', '10px');
        } else {
            sidebar.css('left', '0');
            newSidebar.css('left', '-350px');
            toggleBtn.html('❮');
            toggleBtn.css('left', '360px'); // 350px + 10px
        }
    }

    function updateToggleBtnPosition() {
        var sidebarWidth = $('#mySidebar').width();
        $('.toggle-btn').css('left', sidebarWidth + 10 + 'px'); // 추가 조정
    }
</script>

</body>
</html>
