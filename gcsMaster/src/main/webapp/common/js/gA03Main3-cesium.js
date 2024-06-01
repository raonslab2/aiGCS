(function () {
	//pc 위치 정보
    //노트북 위치정보 
    //var tmLat = 127.74729458;
   // var tmLng = 37.21009468;

    var tmLat = paranTmLat;
    var tmLng = paranTmLng; 
 

    const POV_OFFSET = 5
    const INIT_OFFSET = 50
    const INIT_SPEED = 3 

    //위치정보 시작점
    const DEFAULT_LAT = tmLng ;    
    const DEFAULT_LNG = tmLat;

   
    var $mapdataIndicatorLoading = $('.mapdata-indicator__loading')
    var $mapdataIndicatorInfo = $('.mapdata-indicator__info')
    var $mapdataContextInfo = $('.mapdata-context-info')
    var $mapdataContextInfoContent = $('.mapdata-context-info .content')

    var $homeAlert = $('.home-alert')
    var $pointAlert = $('.point-alert')
    var $povAlert = $('.pov-alert')

    var $form = $('.mission-form')
    var $formSubmit = $('.mission-form-submit')
    var submitDisabled = true

    var mapdata_selected_ids = []

    var dragging_point_home;
    var dragging_point_ground;
    var dragging_point;

    // Create viewer
     Cesium.Ion.defaultAccessToken = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJqdGkiOiI1OTk5YjE3ZC1iNDk3LTRiNTItOTVhNy04ZTJhNDk4M2MzYzMiLCJpZCI6NzIzMjksImlhdCI6MTYzNTk0Mjg1Mn0.YdISux9sGatQpsMXnVUlxziv-q9XCXpfZ7h9Gxqdaes';
    var viewer = cesium_create_viewer('mapContainer')
    

    // Create handler
    var handler = new Cesium.ScreenSpaceEventHandler(viewer.scene.canvas);
     
    // Init dom mod mission 
    var path_mis_mission = init_path_mis_mission(MISSION_ALLOW_EDIT, MISSION_HAS_NAME)

    // Init cesium mod mission
    var cesium_path_mission = init_cesium_path_mission(viewer, path_mis_mission, INIT_OFFSET, INIT_SPEED, POV_OFFSET)

   
    // Init cesium mod mapdata
    var cesium_mod_mapdata = init_cesium_mod_mapdata(viewer)
    
    
   

    // Create an initial camera view // 42.882734153837475, 74.61370853253275  ,  36.17313215857816, 128.46418628949945
    //키르기즈스탄
    var initialPosition = new Cesium.Cartesian3.fromDegrees(DEFAULT_LAT, DEFAULT_LNG, 700.0);
 
    // Set the initial view
    viewer.scene.camera.setView(initialPosition);
    



    // Select entity
    handler.setInputAction(function (movement) {
        var pickedObject = viewer.scene.pick(movement.position);

        $mapdataContextInfo.hide()
        cesium_mod_mapdata.setUnselected(mapdata_selected_ids)
        if (Cesium.defined(pickedObject)) {
            var picketObjectName = pickedObject.id.name + ""

            if (picketObjectName.startsWith("mapdata_")) {
                mapdata_selected_ids = []

                // Get picket items
                var picketObjects = viewer.scene.drillPick(movement.position);

                // Collect display data
                var displayItems = picketObjects.map(function (x) {
                    return x.id.description.getValue()
                })

                // Generate markup and populate mapdata_selected_ids
                var info = ""
                displayItems.forEach(function (item) {
                    var fillColor = item.fillColor
                    var display = item.display
                    var id = item.id

                    mapdata_selected_ids.push(id)

                    var details = display.sections.map(function (section) {
                        return "" +
                            "<div class='item'>" +
                            "<div class='title'>" + section.title + "</div>" +
                            "<div class='info'>" + section.text + "</div>" +
                            "</div>"
                    }).join("")

                    info +=
                        "<div data-mapdata-id='" + id + "'>" +
                        "<div class='top'>" +
                        "<div class='color' style='background-color: " + fillColor + "'> " + "</div>" +
                        "<div class='title'>" + (display.detailedCategory || display.title) + "</div>" +
                        "</div>" + details + "</div>"
                })
                $mapdataContextInfoContent.scrollTop(0)
                $mapdataContextInfoContent.html(info)
                $mapdataContextInfo.show()

                // Mark selected
                cesium_mod_mapdata.setSelected(mapdata_selected_ids)
            } else if (picketObjectName === "home") {
                cesium_path_mission.map_setCurrentIndex("home")
            } else {
                var point_index = picketObjectName.replace(/\D/g, "");

                cesium_path_mission.map_setCurrentIndex(point_index)
            }
        } else {
            if (cesium_path_mission.map_getAddPOVMode() === false) {
                cesium_path_mission.map_setCurrentIndex(null)
            }
        }
    }, Cesium.ScreenSpaceEventType.LEFT_CLICK)

    // Add handler to add/remove entity
    handler.setInputAction(function (movement) {
        if (MISSION_ALLOW_EDIT) {
            var pickedObject = viewer.scene.pick(movement.position);
       
            if (Cesium.defined(pickedObject)) {
                // REMOVE
                var picketObjectName = pickedObject.id.name + ""

                if (picketObjectName !== "home") {
                    if (picketObjectName.includes("pov")) {
                        var pov_index = picketObjectName.replace(/\D/g, "");

                        cesium_path_mission.map_removePOVPoint(pov_index)
                        cesium_path_mission.map_setCurrentIndex(null)
                    } else {
                        var point_index = picketObjectName.replace(/\D/g, "");

                        cesium_path_mission.map_removePoint(point_index)
                        cesium_path_mission.map_setCurrentIndex(null)
                    }
                } else {
                    cesium_path_mission.map_removeHomePoint()

                    $pointAlert.hide()
                    $homeAlert.show()
                    $('.mission-form').toggleClass('closed', true)
                    $formSubmit.prop("disabled", true)
                    submitDisabled = true
                }
            } else {
                // ADD
                var cartesian = utils_getCartesianFromMovement(movement.position) 

                if (cartesian) { 
                    var {lon, lat, alt} = utils_getLonLatAltFromCartesian(cartesian)

                    if (cesium_path_mission.map_getAddPOVMode() === true) {
                        cesium_path_mission.map_addPOVPoint(lon, lat, alt)
                    } else if (!cesium_path_mission.map_hasHomePoint()) { 
                    	// home 
                        cesium_path_mission.map_addHomePoint(lon, lat, alt)
                        
                        /*
                        $('.mission-form').toggleClass('closed', false)
                        $pointAlert.show()
                        $homeAlert.hide()
                        $formSubmit.prop("disabled", false)
                        submitDisabled = false
                        */
                    } else {
                        cesium_path_mission.map_increasePoint(lon, lat, alt)
                    }
                }
            }
        }
    }, Cesium.ScreenSpaceEventType.LEFT_DOUBLE_CLICK)

    // Drag start
    handler.setInputAction(function (movement) {
        if (MISSION_ALLOW_EDIT) {
            var pickedObject = viewer.scene.pick(movement.position);

            if (Cesium.defined(pickedObject)) {
                var picketObjectName = pickedObject.id.name + ""

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
        }
    }, Cesium.ScreenSpaceEventType.LEFT_DOWN);

    // Drag end
    handler.setInputAction(function (movement) {
        if (MISSION_ALLOW_EDIT) {
            if (Cesium.defined(dragging_point_home)) {
                dragging_point_home = undefined;

                cesium_path_mission.map_getHomePointAddress(true)

                viewer.scene.screenSpaceCameraController.enableRotate = true;
            }

            if (Cesium.defined(dragging_point_ground)) {
                dragging_point_ground = undefined;

                viewer.scene.screenSpaceCameraController.enableRotate = true;
            }

            if (Cesium.defined(dragging_point)) {
                dragging_point = undefined;

                viewer.scene.screenSpaceCameraController.enableRotate = true;
            }
        }
    }, Cesium.ScreenSpaceEventType.LEFT_UP);

    // Drag move
    handler.setInputAction(function (movement) {
        if (MISSION_ALLOW_EDIT) {
            if (Cesium.defined(dragging_point_home)) {
            	
                var cartesian = utils_getCartesianFromMovement(movement.endPosition)

                if (cartesian) { 
                    var {lon, lat} = utils_getLonLatAltFromCartesian(cartesian)

                    cesium_path_mission.map_setHomePointPosition(lon, lat)
                }
            }

            if (Cesium.defined(dragging_point_ground)) {
                var picketObjectName = dragging_point_ground.id.name + ""

                var cartesian = utils_getCartesianFromMovement(movement.endPosition)

                if (cartesian) {
                    var {lon, lat} = utils_getLonLatAltFromCartesian(cartesian) 

                    if (picketObjectName.includes("pov")) { 
                        cesium_path_mission.map_setPOVGroundPointPositions(picketObjectName, lon, lat, true)
                    } else { 
                        cesium_path_mission.map_setGroundPointPositions(picketObjectName, lon, lat, true)
                    }
                }
            }

            if (Cesium.defined(dragging_point)) {
                var picketObjectName = dragging_point.id.name + ""

                var offsetY = movement.startPosition.y - movement.endPosition.y
                var offset

                if (picketObjectName.includes("pov")) {
                    offset = cesium_path_mission.map_getPOVPointOffset(picketObjectName)
                } else {
                    offset = cesium_path_mission.map_getPointOffset(picketObjectName)
                }

                offset += offset < 100
                    ? offset < 50
                        ? offsetY / 3
                        : offsetY / 2
                    : offsetY
                     

                if (picketObjectName.includes("pov")) { 
                    cesium_path_mission.map_setPOVPointOffset(picketObjectName, offset, true)
                } else { 
                	//고도 변경
                    cesium_path_mission.map_setPointOffset(picketObjectName, offset, true)
                }
            }
        }
    }, Cesium.ScreenSpaceEventType.MOUSE_MOVE);

    // Load map data
    viewer.camera.moveEnd.addEventListener(function () {
        if (MISSION_ALLOW_EDIT) {
            if (mapdata_isAllUnchecked() == false) {
                mapdata_getData()
            } else {
                $mapdataIndicatorInfo.hide()
            }
        }
    });



    function mapdata_restoreVisibility() {
        var isAirspaceChecked = $('.mapdata-selector .item.checked[data-item="Airspace"]').length > 0
        var isGroundHazardsChecked = $('.mapdata-selector .item.checked[data-item="Ground Hazards"]').length > 0

        cesium_mod_mapdata.toggleAirspaceVisibility(isAirspaceChecked)
        cesium_mod_mapdata.toggleGroundHazardVisibility(isGroundHazardsChecked)
    }

    function mapdata_saveToLocalStorage() {
        var isAirspaceChecked = $('.mapdata-selector .items .item.checked[data-item="Airspace"]').length > 0
        var isGroundHazardsChecked = $('.mapdata-selector .items .item.checked[data-item="Ground Hazards"]').length > 0

        localStorage.setItem('isAirspaceChecked', isAirspaceChecked + '');
        localStorage.setItem('isGroundHazardsChecked', isGroundHazardsChecked + '');
    }

    function mapdata_loadFromLocalStorage() {
        var isAirspaceCheckedValue = localStorage.getItem('isAirspaceChecked')
        var isGroundHazardsCheckedValue = localStorage.getItem('isGroundHazardsChecked')

        if (isAirspaceCheckedValue !== null) {
            $('.mapdata-selector .items .item[data-item="Airspace"]').toggleClass("checked", isAirspaceCheckedValue === 'true');
        }

        if (isGroundHazardsCheckedValue !== null) {
            $('.mapdata-selector .items .item[data-item="Ground Hazards"]').toggleClass("checked", isGroundHazardsCheckedValue === 'true');
        }
    }

    function mapdata_isAllUnchecked() {
        var allUnchecked = false

        var isAirspaceChecked = $('.mapdata-selector .item.checked[data-item="Airspace"]').length > 0
        var isGroundHazardsChecked = $('.mapdata-selector .item.checked[data-item="Ground Hazards"]').length > 0

        if (!isAirspaceChecked && !isGroundHazardsChecked) {
            allUnchecked = true
        }

        return allUnchecked
    }

    function mapdata_getData() {
        var height = viewer.camera.positionCartographic.height
        var viewRectRad = viewer.camera.computeViewRectangle()
        var vewRectDeg = {
            w: Cesium.Math.toDegrees(viewRectRad.west),
            s: Cesium.Math.toDegrees(viewRectRad.south),
            e: Cesium.Math.toDegrees(viewRectRad.east),
            n: Cesium.Math.toDegrees(viewRectRad.north),
        }

        $mapdataIndicatorLoading.show()
        $mapdataIndicatorInfo.hide()

        return $.getJSON('/api/v2/features/mapdata', vewRectDeg, function (response) {
            $mapdataIndicatorLoading.hide()

            var info = ""
            var infoItems = []
            if (response.errorType && response.errorType == "FEATURE_IS_NOT_ACTIVE") {
                info = "Altitude Angel feature is not payed <a href=\"/profile/#features\">check your subscriptions</a>"
                $(".mapdata-selector .item").toggleClass("checked", false).hide()
                $(".mapdata-selector .subscribe_info").show()
            } else if (response.errorReason || response.error) {
                info = "Zoom in to see: airspace, ground hazards"
            } else if (response.excludedData && response.excludedData.length > 0) {
                response.excludedData.forEach(function (data) {
                    if (data.detail.name === "Airspace") {
                        infoItems.push("airspace")
                    }

                    if (data.detail.name === "Ground Hazards") {
                        infoItems.push("ground hazards")
                    }
                })
                info = "Zoom in to see: " + infoItems.join(", ")
            }
            if (info) {
                $mapdataIndicatorInfo.html(info)
                $mapdataIndicatorInfo.show()
            }

            mapdata_toCesium(response)
        })
    }

    function mapdata_toCesium(data) {
        if (data.features) {
            var mapdata_to_remove_ids = cesium_mod_mapdata.setFeatures(data.features)
            mapdata_to_remove_ids.forEach(function (id) {
                $("div[data-mapdata-id='" + id + "']").remove()
            })

            if ($('.mapdata-context-info .content').children().length == 0) {
                $('.mapdata-context-info').hide()
            }
        }
    }
    
    //경로저장 이벤트
    $(document).on('click', '#waypointCreate', function (e) {
     

    	var addr =  $("input.mission-addr").val(); 
    	var missionName =  $("input.mission-name").val(); 
    
        var waypointParan1Cnt = $("input[name='waypointParan1']").length;
  
      
        var routeArray = [];
        var dataArray = [];
 
	    for(var i=0; i<waypointParan1Cnt; i++){          
		    dataArray = [];              

            dataArray.push({
	                         _num: i
	                        , _waypointParan1: $("input[name='waypointParan1']")[i].value
                            , _waypointParan2:  $("input[name='waypointParan2']")[i].value
                            , _waypointParan3:  $("input[name='waypointParan3']")[i].value
                            , _waypointParan4:  $("input[name='waypointParan4']")[i].value
                            , _waypointParan4:  $("input[name='waypointParan4']")[i].value
                            , _waypoinCommand:  $("select[name='waypoinCommand']")[i].value
                            , _waypoinframe:  $("select[name='waypoinframe']")[i].value
                         }); 
            routeArray.push(dataArray); 
	    }
   

    
    	var jsonObj2 = JSON.stringify(routeArray);
        //json 합치기
    	var mission = cesium_path_mission.js_createMission()
        mission.missionDetail = routeArray;
    	var jsonObj = JSON.stringify(mission)


    	var dlPk = $('#dlPk').val()
     
		$.post("/gcs/dashboard/gA03Main2Waypoint.do"
		        , {
			        data:jsonObj
                   ,addr:addr
                   ,dlPk:dlPk
                   ,missionNmae:missionName
                   ,jsonObj2:jsonObj2
                  }).done(function(res) { 
			alert("Registered successfully."); 
			opener.parent.location.reload();
			window.close();
		}).fail(function() {
			alert("실패");
		});
	 
    })

    $(document).on('submit', '.mission-form', function (e) {
        e.preventDefault()
    })

    $(document).on('click', '.mission-form-submit', function (e) {
        if (submitDisabled === false) {
            submitDisabled = true;

            if (!cesium_path_mission.map_hasHomePoint()) {
                $homeAlert.show()
                $pointAlert.hide()
                return
            } else {
                $homeAlert.hide()
                $pointAlert.show()
                $('.mission-form-submit').html('<div class="spinner-border text-white" />')
            }

            var mission = cesium_path_mission.js_createMission()

            var missionString = JSON.stringify(mission)

            $('.mission-json').val(missionString)

            cesium_path_mission.map_takeScreenshot().then(function (blob) {
                var formAction = $form.attr('action')
                var formData = new FormData($form[0]);

                var file = new File([blob], "mission-" + MISSION_ID + ".png")

                formData.append('thumbnail', file);

                $.ajax({
                    url: formAction,
                    data: formData,
                    type: 'POST',
                    async: false,
                    contentType: false,
                    processData: false,
                    success: function (response) {
                        location.href = MISSIONS_URL
                    },
                    error: function (error) {
                        submitDisabled = false
                        $('.mission-form-submit').html('Retry')
                    }
                })
            })
        }
    })

    $(document).on('click', '.mission-form .tag', function (e) {
        $('.mission-form').toggleClass('closed')
    })

    $(document).on('click', '.mission-form .pov-create', function (e) {
        $pointAlert.hide()
        $povAlert.show()
    })

    $(document).on('click', '.mission-form .pov-cancel', function (e) {
        $pointAlert.show()
        $povAlert.hide()
    })

    $(document).on('click', '.mapdata-context-info .tag', function (e) {
        $mapdataContextInfo.hide()
    })

    $(document).on('click', '.mapdata-selector .item', function (e) {
        var $target = $(e.target).closest('.mapdata-selector .item')
        var is_checked = $target.hasClass("checked")
        var was_all_unchecked = mapdata_isAllUnchecked()

        $target.toggleClass("checked", !is_checked)

        if (was_all_unchecked) {
            mapdata_getData().then(mapdata_restoreVisibility)
        } else {
            mapdata_restoreVisibility()
        }

        if (mapdata_isAllUnchecked) {
            $mapdataIndicatorInfo.html('')
            $mapdataIndicatorInfo.show()
        }

        mapdata_saveToLocalStorage()
    })
    //페이지 로딩
    $(document).ready(function () {
        mapdata_loadFromLocalStorage()

        var missionJSON = $('#waypoints-data').text()
        //var missionJSON22 = $('#waypoints-data22').text()
    
   
 
      
			if (missionJSON && missionJSON != "\"\"" && missionJSON != "{}") {
			    // var mission = cesium_path_mission.js_parseMission(missionJSON)  
			    var mission = cesium_path_mission.js_parseMission2(missionJSON);
			
			    var detail_waypoint = mission.detail_waypoint;
			    var home_position = mission.home_position;
			    var home_address = mission.home_address;
			    var actions = mission.actions;
			
			    // home setting
			    cesium_path_mission.map_addHomePoint(home_position.lon, home_position.lat, 0.0, home_address);
			    var tmIdex = 0;
			
			    actions.forEach(function (action, index) {
			        cesium_path_mission.map_increasePoint(
			            action.lon, action.lat, action.alt, action.offset,
			            action.speed, action.delay, action.heading, action.command, action.pov,
			            detail_waypoint && detail_waypoint[index] ? detail_waypoint[index][0] : null
			        );
			
			        if (actions.length == (index + 1) && detail_waypoint && detail_waypoint[actions.length]) {
			            $("input[name='waypointParan1']").eq(index + 1).val(detail_waypoint[actions.length][0]._waypointParan1);
			            $("input[name='waypointParan2']").eq(index + 1).val(detail_waypoint[actions.length][0]._waypointParan2);
			            $("input[name='waypointParan3']").eq(index + 1).val(detail_waypoint[actions.length][0]._waypointParan3);
			            $("input[name='waypointParan4']").eq(index + 1).val(detail_waypoint[actions.length][0]._waypointParan4);
			            $("select[name='waypoinCommand']").eq(index + 1).val(detail_waypoint[actions.length][0]._waypoinCommand).prop("selected", true);
			            $("select[name='waypoinframe']").eq(index + 1).val(detail_waypoint[actions.length][0]._waypoinframe).prop("selected", true);
			        }
			    });
			
			    // At this point home point must exist
			    $formSubmit.prop("disabled", false);
			    submitDisabled = false;
			} else {
			    /*
			    if (navigator.geolocation) {
			        navigator.geolocation.getCurrentPosition(function (position) {
			            var lon = position.coords.longitude;
			            var lat = position.coords.latitude;
			
			            setTimeout(function () {
			                viewer.camera.flyTo({
			                    destination: Cesium.Cartesian3.fromDegrees(lon, lat, 6000000),
			                    duration: 5.0,
			                });
			            }, 1200);
			        });
			    }
			    */
			    var home_position = DEFAULT_LAT;
			    var home_address = "test";
			
			    cesium_path_mission.map_addHomePoint(DEFAULT_LAT, DEFAULT_LNG, 0.0, home_address);
			
			    // At this point home point must exist
			    $formSubmit.prop("disabled", false);
			    submitDisabled = false;
			}

    })
})()


