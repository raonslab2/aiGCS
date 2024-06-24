(function () {
    // Constants
    const POV_OFFSET = 5;
    const INIT_OFFSET = 50;
    const INIT_SPEED = 3;
    const DEFAULT_LAT = paranTmLng;
    const DEFAULT_LNG = paranTmLat;
    
    // DOM Elements
    const $mapdataIndicatorLoading = $('.mapdata-indicator__loading');
    const $mapdataIndicatorInfo = $('.mapdata-indicator__info');
    const $mapdataContextInfo = $('.mapdata-context-info');
    const $mapdataContextInfoContent = $('.mapdata-context-info .content');
    const $homeAlert = $('.home-alert');
    const $pointAlert = $('.point-alert');
    const $povAlert = $('.pov-alert');
    const $form = $('.mission-form');
    const $formSubmit = $('.mission-form-submit');

    var submitDisabled = true;
    var mapdata_selected_ids = [];
    var dragging_point_home, dragging_point_ground, dragging_point;

    // Initialize Cesium Viewer
    Cesium.Ion.defaultAccessToken = 'your_access_token_here';
    var viewer = cesium_create_viewer('mapContainer');
    var handler = new Cesium.ScreenSpaceEventHandler(viewer.scene.canvas);

    // Initialize Missions
    var path_mis_mission = init_path_mis_mission(MISSION_ALLOW_EDIT, MISSION_HAS_NAME);
    var cesium_path_mission = init_cesium_path_mission(viewer, path_mis_mission, INIT_OFFSET, INIT_SPEED, POV_OFFSET);
    var cesium_mod_mapdata = init_cesium_mod_mapdata(viewer);

    // Initial Camera View
    setInitialCameraView(DEFAULT_LAT, DEFAULT_LNG, viewer);

    // Event Handlers
    setupEventHandlers();

    // Load Map Data
    viewer.camera.moveEnd.addEventListener(function () {
        if (MISSION_ALLOW_EDIT) {
            if (!mapdata_isAllUnchecked()) {
                mapdata_getData();
            } else {
                $mapdataIndicatorInfo.hide();
            }
        }
    });

    // Page Load
    $(document).ready(function () {
        mapdata_loadFromLocalStorage();
        loadMissionData();
	
	    // Attach click event handler to waypointCreate button
	    $('#waypointCreate').on('click', handleWaypointCreateClick);
    });

	// Function to handle waypointCreate click
	function handleWaypointCreateClick() {
	    var addr = $("input.mission-addr").val();
	    var missionName = $("input.mission-name").val();
	
	    var waypointParan1Cnt = $("input[name='waypointParan1']").length;
	
	    var routeArray = [];
	    var dataArray = [];
	
	    for (var i = 0; i < waypointParan1Cnt; i++) {
	        dataArray = [];
	
	        dataArray.push({
	            _num: i,
	            _waypointParan1: $("input[name='waypointParan1']")[i].value,
	            _waypointParan2: $("input[name='waypointParan2']")[i].value,
	            _waypointParan3: $("input[name='waypointParan3']")[i].value,
	            _waypointParan4: $("input[name='waypointParan4']")[i].value,
	            _waypointParan4: $("input[name='waypointParan4']")[i].value,
	            _waypoinCommand: $("select[name='waypoinCommand']")[i].value,
	            _waypoinframe: $("select[name='waypoinframe']")[i].value
	        });
	        routeArray.push(dataArray);
	    }
	
	    var jsonObj2 = JSON.stringify(routeArray);
	    //json 합치기
	    var mission = cesium_path_mission.js_createMission();
	    mission.missionDetail = routeArray;
	    var jsonObj = JSON.stringify(mission);
	
	    var dlPk = $('#dlPk').val();
	
	    $.post("/gcs/dashboard/gA03Main2Waypoint.do", {
	        data: jsonObj,
	        addr: addr,
	        dlPk: dlPk,
	        missionNmae: missionName,
	        jsonObj2: jsonObj2
	    }).done(function (res) {
	        //alert("저장처리되었습니다.");
	        var dlPk = res.dlPk;
	        // 현재 페이지의 URL 가져오기
	        var currentUrl = window.location.href;
	
	        // 페이지 리로드
	        window.location.href = currentUrl.split('?')[0] + "?dlPk=" + dlPk;
	    }).fail(function () {
	        alert("실패");
	    });
	}

    function setInitialCameraView(lat, lng, viewer) {
        var initialPosition = new Cesium.Cartesian3.fromDegrees(lat, lng, 700.0);
        viewer.scene.camera.setView(initialPosition);
    }

    function setupEventHandlers() {
        handler.setInputAction(handleLeftClick, Cesium.ScreenSpaceEventType.LEFT_CLICK);
        handler.setInputAction(handleDoubleClick, Cesium.ScreenSpaceEventType.LEFT_DOUBLE_CLICK);
        handler.setInputAction(handleLeftDown, Cesium.ScreenSpaceEventType.LEFT_DOWN);
        handler.setInputAction(handleLeftUp, Cesium.ScreenSpaceEventType.LEFT_UP);
        handler.setInputAction(handleMouseMove, Cesium.ScreenSpaceEventType.MOUSE_MOVE);
    }

    function handleLeftClick(movement) {
        var pickedObject = viewer.scene.pick(movement.position);
        $mapdataContextInfo.hide();
        cesium_mod_mapdata.setUnselected(mapdata_selected_ids);

        if (Cesium.defined(pickedObject)) {
            var picketObjectName = pickedObject.id.name + "";

            if (picketObjectName.startsWith("mapdata_")) {
                handleMapDataSelection(movement);
            } else {
                handleMissionSelection(picketObjectName);
            }
        } else {
            if (!cesium_path_mission.map_getAddPOVMode()) {
                cesium_path_mission.map_setCurrentIndex(null);
            }
        }
    }

    function handleDoubleClick(movement) {
        if (MISSION_ALLOW_EDIT) {
            var pickedObject = viewer.scene.pick(movement.position);
            if (Cesium.defined(pickedObject)) {
                handleRemovePoint(pickedObject);
            } else {
                handleAddPoint(movement);
            }
        }
    }

    function handleLeftDown(movement) {
        if (MISSION_ALLOW_EDIT) {
            var pickedObject = viewer.scene.pick(movement.position);
            if (Cesium.defined(pickedObject)) {
                handleDragStart(pickedObject);
            }
        }
    }

    function handleLeftUp(movement) {
        if (MISSION_ALLOW_EDIT) {
            handleDragEnd();
        }
    }

    function handleMouseMove(movement) {
        if (MISSION_ALLOW_EDIT) {
            handleDragMove(movement);
        }
    }

    function handleMapDataSelection(movement) {
        mapdata_selected_ids = [];
        var picketObjects = viewer.scene.drillPick(movement.position);
        var displayItems = picketObjects.map(x => x.id.description.getValue());

        var info = displayItems.map(item => {
            var fillColor = item.fillColor;
            var display = item.display;
            var id = item.id;
            mapdata_selected_ids.push(id);

            var details = display.sections.map(section => `
                <div class='item'>
                    <div class='title'>${section.title}</div>
                    <div class='info'>${section.text}</div>
                </div>
            `).join("");

            return `
                <div data-mapdata-id='${id}'>
                    <div class='top'>
                        <div class='color' style='background-color: ${fillColor}'> </div>
                        <div class='title'>${display.detailedCategory || display.title}</div>
                    </div>
                    ${details}
                </div>
            `;
        }).join("");

        $mapdataContextInfoContent.scrollTop(0).html(info);
        $mapdataContextInfo.show();
        cesium_mod_mapdata.setSelected(mapdata_selected_ids);
    }

    function handleMissionSelection(picketObjectName) {
        if (picketObjectName === "home") {
            cesium_path_mission.map_setCurrentIndex("home");
        } else {
            var point_index = picketObjectName.replace(/\D/g, "");
            cesium_path_mission.map_setCurrentIndex(point_index);
        }
    }

    function handleRemovePoint(pickedObject) {
        var picketObjectName = pickedObject.id.name + "";
        if (picketObjectName !== "home") {
            if (picketObjectName.includes("pov")) {
                var pov_index = picketObjectName.replace(/\D/g, "");
                cesium_path_mission.map_removePOVPoint(pov_index);
                cesium_path_mission.map_setCurrentIndex(null);
            } else {
                var point_index = picketObjectName.replace(/\D/g, "");
                cesium_path_mission.map_removePoint(point_index);
                cesium_path_mission.map_setCurrentIndex(null);
            }
        } else {
            cesium_path_mission.map_removeHomePoint();
            $pointAlert.hide();
            $homeAlert.show();
            $form.toggleClass('closed', true);
            $formSubmit.prop("disabled", true);
            submitDisabled = true;
        }
    }

    function handleAddPoint(movement) {
        var cartesian = utils_getCartesianFromMovement(movement.position);
        if (cartesian) {
            var { lon, lat, alt } = utils_getLonLatAltFromCartesian(cartesian);
            if (cesium_path_mission.map_getAddPOVMode() === true) {
                cesium_path_mission.map_addPOVPoint(lon, lat, alt);
            } else if (!cesium_path_mission.map_hasHomePoint()) {
                cesium_path_mission.map_addHomePoint(lon, lat, alt);
            } else {
                cesium_path_mission.map_increasePoint(lon, lat, alt);
            }
        }
    }

    function handleDragStart(pickedObject) {
        var picketObjectName = pickedObject.id.name + "";
        if (picketObjectName.includes("home") && cesium_path_mission.map_hasHomePoint()) {
            dragging_point_home = pickedObject;
            viewer.scene.screenSpaceCameraController.enableRotate = false;
        }
        if (picketObjectName.includes("ground") && cesium_path_mission.map_hasGroundPoint(picketObjectName)) {
            dragging_point_ground = pickedObject;
            viewer.scene.screenSpaceCameraController.enableRotate = false;
        }
        if (picketObjectName.includes("pov_ground") && cesium_path_mission.map_hasPOVGroundPoint(picketObjectName)) {
            dragging_point_ground = pickedObject;
            viewer.scene.screenSpaceCameraController.enableRotate = false;
        }
        if (picketObjectName.includes("pov")) {
            if (cesium_path_mission.map_hasPOVPoint(picketObjectName)) {
                dragging_point = pickedObject;
                viewer.scene.screenSpaceCameraController.enableRotate = false;
            }
        } else {
            if (cesium_path_mission.map_hasPoint(picketObjectName)) {
                dragging_point = pickedObject;
                viewer.scene.screenSpaceCameraController.enableRotate = false;
            }
        }
    }

    function handleDragEnd() {
        if (dragging_point_home) {
            dragging_point_home = undefined;
            cesium_path_mission.map_getHomePointAddress(true);
            viewer.scene.screenSpaceCameraController.enableRotate = true;
        }
        if (dragging_point_ground) {
            dragging_point_ground = undefined;
            viewer.scene.screenSpaceCameraController.enableRotate = true;
        }
        if (dragging_point) {
            dragging_point = undefined;
            viewer.scene.screenSpaceCameraController.enableRotate = true;
        }
    }

    function handleDragMove(movement) {
        if (dragging_point_home) {
            var cartesian = utils_getCartesianFromMovement(movement.endPosition);
            if (cartesian) {
                var { lon, lat } = utils_getLonLatAltFromCartesian(cartesian);
                cesium_path_mission.map_setHomePointPosition(lon, lat);
            }
        }
        if (dragging_point_ground) {
            var picketObjectName = dragging_point_ground.id.name + "";
            var cartesian = utils_getCartesianFromMovement(movement.endPosition);
            if (cartesian) {
                var { lon, lat } = utils_getLonLatAltFromCartesian(cartesian);
                if (picketObjectName.includes("pov")) {
                    cesium_path_mission.map_setPOVGroundPointPositions(picketObjectName, lon, lat, true);
                } else {
                    cesium_path_mission.map_setGroundPointPositions(picketObjectName, lon, lat, true);
                }
            }
        }
        if (dragging_point) {
            var picketObjectName = dragging_point.id.name + "";
            var offsetY = movement.startPosition.y - movement.endPosition.y;
            var offset = getOffsetForPoint(picketObjectName, offsetY);
            setPointOffset(picketObjectName, offset);
        }
    }

    function getOffsetForPoint(picketObjectName, offsetY) {
        var offset;
        if (picketObjectName.includes("pov")) {
            offset = cesium_path_mission.map_getPOVPointOffset(picketObjectName);
        } else {
            offset = cesium_path_mission.map_getPointOffset(picketObjectName);
        }
        offset += offset < 100 ? offset < 50 ? offsetY / 3 : offsetY / 2 : offsetY;
        return offset;
    }

    function setPointOffset(picketObjectName, offset) {
        if (picketObjectName.includes("pov")) {
            cesium_path_mission.map_setPOVPointOffset(picketObjectName, offset, true);
        } else {
            cesium_path_mission.map_setPointOffset(picketObjectName, offset, true);
        }
    }

    function loadMissionData() {
        var missionJSON = $('#waypoints-data').text();
        var dlPk = $('#dlPk').val();
        if (missionJSON && missionJSON != "\"\"" && missionJSON != "{}") {
            var mission = cesium_path_mission.js_parseMission2(missionJSON);
            setupMissionDetails(mission);
            enableFormSubmit();
        } else {
            handleNoMissionData(dlPk);
        }
    }

    function setupMissionDetails(mission) {
        var detail_waypoint = mission.detail_waypoint;
        var home_position = mission.home_position;
        var home_address = mission.home_address;
        var actions = mission.actions;

        cesium_path_mission.map_addHomePoint(home_position.lon, home_position.lat, 0.0, home_address);

        actions.forEach((action, index) => {
            cesium_path_mission.map_increasePoint(
                action.lon, action.lat, action.alt, action.offset,
                action.speed, action.delay, action.heading, action.command, action.pov,
                detail_waypoint && detail_waypoint[index] ? detail_waypoint[index][0] : null
            );

            if (actions.length == (index + 1) && detail_waypoint && detail_waypoint[actions.length]) {
                updateWaypointDetails(index + 1, detail_waypoint[actions.length][0]);
            }
        });
    }

    function updateWaypointDetails(index, waypointDetails) {
        $("input[name='waypointParan1']").eq(index).val(waypointDetails._waypointParan1);
        $("input[name='waypointParan2']").eq(index).val(waypointDetails._waypointParan2);
        $("input[name='waypointParan3']").eq(index).val(waypointDetails._waypointParan3);
        $("input[name='waypointParan4']").eq(index).val(waypointDetails._waypointParan4);
        $("select[name='waypoinCommand']").eq(index).val(waypointDetails._waypoinCommand).prop("selected", true);
        $("select[name='waypoinframe']").eq(index).val(waypointDetails._waypoinframe).prop("selected", true);
    }

    function enableFormSubmit() {
        $formSubmit.prop("disabled", false);
        submitDisabled = false;
    }

    function handleNoMissionData(dlPk) {
        var home_address = "test";
        cesium_path_mission.map_addHomePoint(DEFAULT_LAT, DEFAULT_LNG, 0.0, home_address);
        enableFormSubmit();
        if (!dlPk) {
            MISSION_ALLOW_EDIT = false;
            showCenterMarker();
        }
    }

	function showCenterMarker() {
	    const centerMarkerDiv = `
	        <div class="center-marker-container">
	            <div class="center-marker">
	                <div class="inner-marker">
	                    <div class="transparent-circle"></div>
	                </div>
	            </div>
	            <div class="marker-label" id="newProject">여기에서 프로젝트 만들기</div>
	        </div>
	    `;
	    $('body').append(centerMarkerDiv);
	    setupCenterMarkerEvents();
	}


    function setupCenterMarkerEvents() {
        $('#newProject').off('click').on('click', function () {
            var mission_name = $("#mission-name").val();
            $('#overlay').css('display', 'flex');
            $('#projectNameInput').val(mission_name);
        });

        $('#overlay').off('click').on('click', function (e) {
            // if ($(e.target).is('#overlay')) {
            //    $(this).hide();
            // }
        });

        $('.popup-content').off('click').on('click', function (e) {
            e.stopPropagation();
        });

        $('#searchButton').on('click', function (e) {
            e.preventDefault();
            const address = $('#addressInput').val();
            if (address) {
                geocodeAddress(address);
            } else {
                alert('주소를 입력하세요');
            }
        });

        $('#continueButton').off('click').on('click', function () {
            var projectName = $('#projectNameInput').val();
            var coordinateSystem = $('#coordinateSystem').val();

            var center = viewer.camera.positionCartographic;
            var homeX = Cesium.Math.toDegrees(center.longitude);
            var homeY = Cesium.Math.toDegrees(center.latitude);

            if (!projectName.length) {
                alert("프로젝트 이름을 입력하세요.");
                $('#projectNameInput').focus();
            } else {
                saveProjectName(projectName, coordinateSystem, homeX, homeY);
            }
        });
    }

    function geocodeAddress(address) {
        const geocoder = new google.maps.Geocoder();
        geocoder.geocode({ 'address': address }, function (results, status) {
            if (status === 'OK') {
                const latLng = results[0].geometry.location;
                viewer.camera.flyTo({
                    destination: Cesium.Cartesian3.fromDegrees(latLng.lng(), latLng.lat(), 1000),
                    duration: 2.0,
                    complete: function () {
                        const cesiumPathMission = get_cesium_path_mission();
                        if (cesiumPathMission.map_hasHomePoint()) {
                            cesiumPathMission.map_setHomePointPosition(latLng.lng(), latLng.lat());
                        } else {
                            cesiumPathMission.map_addHomePoint(latLng.lng(), latLng.lat(), 0, address);
                        }
                    }
                });

                viewer.entities.add({
                    position: Cesium.Cartesian3.fromDegrees(latLng.lng(), latLng.lat()),
                    point: { pixelSize: 10, color: Cesium.Color.RED }
                });
            } else {
                alert('주소를 찾을 수 없습니다: ' + status);
            }
        });
    }

    function saveProjectName(projectName, coordinateSystem, homeX, homeY) {
        $.ajax({
            url: '/gcs/dashboard/saveProjectName.do',
            type: 'POST',
            data: {
                projectName: projectName,
                codination: coordinateSystem,
                homeX: homeX,
                homeY: homeY,
                dlDiv: "2"
            },
            success: function (response) {
                var dlPk = response.result;
                var currentUrl = window.location.href;
                window.location.href = currentUrl.split('?')[0] + "?dlPk=" + dlPk;
            },
            error: function (error) {
                alert("프로젝트 이름 저장에 실패했습니다.");
            }
        });
    }

    // Define the mapdata_loadFromLocalStorage function
    function mapdata_loadFromLocalStorage() {
        var isAirspaceCheckedValue = localStorage.getItem('isAirspaceChecked');
        var isGroundHazardsCheckedValue = localStorage.getItem('isGroundHazardsChecked');

        if (isAirspaceCheckedValue !== null) {
            $('.mapdata-selector .items .item[data-item="Airspace"]').toggleClass("checked", isAirspaceCheckedValue === 'true');
        }

        if (isGroundHazardsCheckedValue !== null) {
            $('.mapdata-selector .items .item[data-item="Ground Hazards"]').toggleClass("checked", isGroundHazardsCheckedValue === 'true');
        }
    }

    // Define any other missing functions that are used in the script
    function mapdata_saveToLocalStorage() {
        var isAirspaceChecked = $('.mapdata-selector .items .item.checked[data-item="Airspace"]').length > 0;
        var isGroundHazardsChecked = $('.mapdata-selector .items .item.checked[data-item="Ground Hazards"]').length > 0;

        localStorage.setItem('isAirspaceChecked', isAirspaceChecked + '');
        localStorage.setItem('isGroundHazardsChecked', isGroundHazardsChecked + '');
    }

    function mapdata_isAllUnchecked() {
        var allUnchecked = false;

        var isAirspaceChecked = $('.mapdata-selector .item.checked[data-item="Airspace"]').length > 0;
        var isGroundHazardsChecked = $('.mapdata-selector .item.checked[data-item="Ground Hazards"]').length > 0;

        if (!isAirspaceChecked && !isGroundHazardsChecked) {
            allUnchecked = true;
        }

        return allUnchecked;
    }

    function mapdata_getData() {
        var height = viewer.camera.positionCartographic.height;
        var viewRectRad = viewer.camera.computeViewRectangle();
        var vewRectDeg = {
            w: Cesium.Math.toDegrees(viewRectRad.west),
            s: Cesium.Math.toDegrees(viewRectRad.south),
            e: Cesium.Math.toDegrees(viewRectRad.east),
            n: Cesium.Math.toDegrees(viewRectRad.north),
        };

        $mapdataIndicatorLoading.show();
        $mapdataIndicatorInfo.hide();

        return $.getJSON('/api/v2/features/mapdata', vewRectDeg, function (response) {
            $mapdataIndicatorLoading.hide();

            var info = "";
            var infoItems = [];
            if (response.errorType && response.errorType == "FEATURE_IS_NOT_ACTIVE") {
                info = "Altitude Angel feature is not payed <a href=\"/profile/#features\">check your subscriptions</a>";
                $(".mapdata-selector .item").toggleClass("checked", false).hide();
                $(".mapdata-selector .subscribe_info").show();
            } else if (response.errorReason || response.error) {
                info = "Zoom in to see: airspace, ground hazards";
            } else if (response.excludedData && response.excludedData.length > 0) {
                response.excludedData.forEach(function (data) {
                    if (data.detail.name === "Airspace") {
                        infoItems.push("airspace");
                    }

                    if (data.detail.name === "Ground Hazards") {
                        infoItems.push("ground hazards");
                    }
                });
                info = "Zoom in to see: " + infoItems.join(", ");
            }
            if (info) {
                $mapdataIndicatorInfo.html(info);
                $mapdataIndicatorInfo.show();
            }

            mapdata_toCesium(response);
        });
    }

    function mapdata_toCesium(data) {
        if (data.features) {
            var mapdata_to_remove_ids = cesium_mod_mapdata.setFeatures(data.features);
            mapdata_to_remove_ids.forEach(function (id) {
                $("div[data-mapdata-id='" + id + "']").remove();
            });

            if ($('.mapdata-context-info .content').children().length == 0) {
                $('.mapdata-context-info').hide();
            }
        }
    }
})();
