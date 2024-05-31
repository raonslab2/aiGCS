    /*
     * Bronxville Drone Flight Tool
     * Uses Cesium to simply adding and removing Waypoints from, and exporting a custom Flight Plan based on QGC WPL 110.
     *
     * The output format is not currently the same as Ardupilot's .waypoint files, but modifying getFlightPlan() easily could make it.
     *
     * Written by Charlie Vorbach 
     * MIT License
     * 
     * Bewarned, this is an uncommented, nightmare-workaround kludge. Proceed at your own risk.
     *  -----Strike that------ This is now extensively commented. While it may still contain a few 'quirks' it shouldn't be too hard to follow.
     */

    //Parameters
    const MAX_PARAM = 4;
    const RAD_TO_DEG = 180 / Math.PI;

    const MIN_HEIGHT = 25;
    const BASE_HEIGHT = 1;
    const DEFAULT_RADIUS = 2;
    // 42.88478323563591, 74.62042829019228
    // 37.501547598891065, 127.07718116347425
   // const DEFAULT_LAT = 127.07718116347425  ;    
   // const DEFAULT_LNG = 37.501547598891065;
    //키르기즈스탄
    // const DEFAULT_LAT = 74.62042829019228;    
    // const DEFAULT_LNG = 42.88478323563591;
    //부론 , 
    const DEFAULT_LAT = 127.75115186132;    
    const DEFAULT_LNG = 37.20821628335832;
 
   
    const COOR_PRECIS = 6;
    const OTHER_PRECIS = 1;
    
    $('#btnPath').click(function(){
    	if($('#btnPath').is(":checked") == false){
    		clearWaypointControls();
    	}
     });

    Cesium.Ion.defaultAccessToken = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJqdGkiOiI1OTk5YjE3ZC1iNDk3LTRiNTItOTVhNy04ZTJhNDk4M2MzYzMiLCJpZCI6NzIzMjksImlhdCI6MTYzNTk0Mjg1Mn0.YdISux9sGatQpsMXnVUlxziv-q9XCXpfZ7h9Gxqdaes";
 
 
	const viewer = new Cesium.Viewer("cesiumContainer", {
	  infoBox: false,
	  selectionIndicator: false,
	  shadows: true,
	  shouldAnimate: true,
	  //terrainProvider: Cesium.createWorldTerrain()
	});
    
    
    viewer.scene.globe.depthTestAgainstTerrain = true;
    viewer.animation.container.style.visibility = 'hidden';
   
    var scene = viewer.scene;
    var numberOfWaypoints = 0;

 
	// 3D Tiles 데이터셋을 로드합니다.
	const tileset = new Cesium.Cesium3DTileset({
	    url: '/home/mrdev/offlinemap/tileset.json' // JSON 파일 경로
	});
	 
	// 뷰어에 3D Tiles 데이터셋을 추가합니다.
	viewer.scene.primitives.add(tileset);
	
	// 3D Tiles의 루트 위치로 카메라를 이동시킵니다.
	viewer.zoomTo(tileset);
		
	tileset.readyPromise.then(function(tileset) {
	    // 타일셋의 루트 변환 행렬을 조정합니다.
	    //var heightOffset = 145.0; // 높이 조정값 (미터 단위)
	    var heightOffset = 71; // 높이 조정값 (미터 단위)
	    var boundingSphere = tileset.boundingSphere;
	    var cartographic = Cesium.Cartographic.fromCartesian(boundingSphere.center);
	    var surface = Cesium.Cartesian3.fromRadians(cartographic.longitude, cartographic.latitude, 0.0);
	    var offset = Cesium.Cartesian3.fromRadians(cartographic.longitude, cartographic.latitude, heightOffset);
	    var translation = Cesium.Cartesian3.subtract(offset, surface, new Cesium.Cartesian3());
	    var newModelMatrix = Cesium.Matrix4.fromTranslation(translation);
	
	    // 기존의 변환 매트릭스와 새로운 매트릭스를 결합합니다.
	    Cesium.Matrix4.multiply(tileset.modelMatrix, newModelMatrix, tileset.modelMatrix);
	});

  
 /*
	const tileset = viewer.scene.primitives.add(
	  new Cesium.Cesium3DTileset({
	    url: Cesium.IonResource.fromAssetId(1579212),
	  })
	);
	
 
	 
	(async () => {
	  try {
	    await tileset.readyPromise;
	    await viewer.zoomTo(tileset);
	
	    // Apply the default style if it exists
	    const extras = tileset.asset.extras;
	    if (
	      Cesium.defined(extras) &&
	      Cesium.defined(extras.ion) &&
	      Cesium.defined(extras.ion.defaultStyle)
	    ) {
	      tileset.style = new Cesium.Cesium3DTileStyle(extras.ion.defaultStyle);
	    }
	  } catch (error) {
	    console.log(error);
	  }
	})();
*/
	
 
 
    /*
    var detailedMaps = new Cesium.WebMapServiceImageryProvider({
        url : 'http://localhost:8080/geoserver/wms',
        parameters: { 
            format:'image/png', 
            transparent:'true',
            tiled: true,
            enablePickFeatures: true
        }, 
        layers : 'florida:FL_planet_osm_roads',  // comma separated listing
        maximumLevel : 20
    });    
    viewer.imageryLayers.addImageryProvider(detailedMaps);
    viewer.imageryLayers._layers[2].show = false;
*/
    
    //////////////////////////////////////////////////////////////////////////
    // Configuring the Scene
    //////////////////////////////////////////////////////////////////////////

    // Enable lighting based on sun/moon positions
    //viewer.scene.globe.enableLighting = true;

    // Create an initial camera view // 42.882734153837475, 74.61370853253275  ,  36.17313215857816, 128.46418628949945
    //키르기즈스탄
    var initialPosition = new Cesium.Cartesian3.fromDegrees(DEFAULT_LAT, DEFAULT_LNG, 700.0);
    //경운대학교
    //var initialPosition = new Cesium.Cartesian3.fromDegrees(128.46418628949945, 36.17313215857816, 800.0);
    var initialOrientation = new Cesium.HeadingPitchRoll.fromDegrees(0.0, -10.0, 0.0);
    var homeCameraView = {
        destination : initialPosition,
        orientation : {
            heading : initialOrientation.heading,
            pitch : initialOrientation.pitch,
            roll : initialOrientation.roll
        }
    };
    // Set the initial view
    viewer.scene.camera.setView(homeCameraView);
    
    //드론 생성 
    var airPathArray = []; 
    var groundPathArray = [];
    var timeNow = new Cesium.JulianDate.now();

		//var tm_model = "/images/CesiumDrone2.glb";
		//var tm_scale = 0.1; 
		//var tm_minsize = 250; 
		//if(tm_dronealias2=='VTOL'){
		 //tm_model = "/images/Cesium_Air_vtol.glb";
		 //tm_scale = 0.06; 
		 //tm_minsize = 250; 
		//} 
    
       	   	   //uri: '/images/CesiumDrone2.glb', 
           //scale: 0.3,
           //minimumPixelSize: 120,
           //maximumScale: 1000,
 
 
        // 시작점 GPS 좌표 설정
  
 


    // 폴리라인 생성
    var ply_lm_10001 = viewer.entities.add({
        polyline : {
            //positions : [startPosition, startPosition],
            width : 3,
            material : Cesium.Color.RED
        }
    });

    var ply2_lm_10001 = viewer.entities.add({
        polyline : {
            //positions : [startPosition, startPosition],
            width : 3,
            material : Cesium.Color.GREEN
        }
    });

    var ply_lm_10002 = viewer.entities.add({
        polyline : {
            //positions : [startPosition, startPosition],
            width : 3,
            material : Cesium.Color.RED
        }
    });

    var ply2_lm_10002 = viewer.entities.add({
        polyline : {
            //positions : [startPosition, startPosition],
            width : 3,
            material : Cesium.Color.GREEN
        }
    });

    var ply_lm_10003 = viewer.entities.add({
        polyline : {
            //positions : [startPosition, startPosition],
            width : 3,
            material : Cesium.Color.RED
        }
    });

    var ply2_lm_10003 = viewer.entities.add({
        polyline : {
            //positions : [startPosition, startPosition],
            width : 3,
            material : Cesium.Color.GREEN
        }
    });

    var ply_lm_10004 = viewer.entities.add({
        polyline : {
            //positions : [startPosition, startPosition],
            width : 3,
            material : Cesium.Color.RED
        }
    });

    var ply2_lm_10004 = viewer.entities.add({
        polyline : {
            //positions : [startPosition, startPosition],
            width : 3,
            material : Cesium.Color.GREEN
        }
    });

    var ply_lm_10005 = viewer.entities.add({
        polyline : {
            //positions : [startPosition, startPosition],
            width : 3,
            material : Cesium.Color.RED
        }
    });

    var ply2_lm_10005 = viewer.entities.add({
        polyline : {
            //positions : [startPosition, startPosition],
            width : 3,
            material : Cesium.Color.GREEN
        }
    });

    const lm_10001 = viewer.entities.add({ 
        // Attach the 3D model instead of the green point. 
        model : {

   	   	   //uri: '/images/Cesium_Air_vtol.glb', 
           //uri: '/images/Cesium_Air_vtol2.glb', 
           uri: '/images/Cesium_Air_vtol3.glb', 
           scale: 1.3,
           minimumPixelSize: 120,
           maximumScale: 1000,
   	     }, 
        label: {
	        text: new Cesium.CallbackProperty(updateSpeedLabel1, false),
	        font: "18px sans-serif",
            showBackground: true,
	        fillColor: Cesium.Color.SKYBLUE,
	        outlineColor: Cesium.Color.BLACK,
	        outlineWidth: 2,
	        style: Cesium.LabelStyle.FILL_AND_OUTLINE,
            verticalOrigin: Cesium.VerticalOrigin.LEFT_UP, 
            horizontalOrigin: Cesium.HorizontalOrigin.TOP,
            eyeOffset: new Cesium.Cartesian3(0, 7.2, 0),
				pixelOffsetScaleByDistance: new Cesium.NearFarScalar(
					1.5e2,
					5.0,
					1.5e7,
					0.5
				),
        }
      });



 

    const lm_10002 = viewer.entities.add({ 
        // Attach the 3D model instead of the green point.
        model : {
   	   	   //uri: '/images/Cesium_Air_vtol.glb', 
           uri: '/images/Cesium_Air_vtol3.glb', 
           scale: 1.3,
           minimumPixelSize: 120,
           maximumScale: 1000,
   	     }, 
        label: {
	        text: new Cesium.CallbackProperty(updateSpeedLabel2, false),
	        font: "18px sans-serif",
            showBackground: true,
	        fillColor: Cesium.Color.SKYBLUE,
	        outlineColor: Cesium.Color.BLACK,
	        outlineWidth: 2,
	        style: Cesium.LabelStyle.FILL_AND_OUTLINE,
            verticalOrigin: Cesium.VerticalOrigin.LEFT_UP, 
            horizontalOrigin: Cesium.HorizontalOrigin.TOP,
            eyeOffset: new Cesium.Cartesian3(0, 7.2, 0),
				pixelOffsetScaleByDistance: new Cesium.NearFarScalar(
					1.5e2,
					5.0,
					1.5e7,
					0.5
				),
        }
      });
    const lm_10003 = viewer.entities.add({ 
        // Attach the 3D model instead of the green point. 
    model : {
   	   	   //uri: '/images/Cesium_Air_vtol.glb', 
           uri: '/images/Cesium_Air_vtol3.glb', 
           scale: 1.3,
           minimumPixelSize: 120,
           maximumScale: 1000,
	     }, 
        label: {
	        text: new Cesium.CallbackProperty(updateSpeedLabel3, false),
	        font: "18px sans-serif",
            showBackground: true,
	        fillColor: Cesium.Color.SKYBLUE,
	        outlineColor: Cesium.Color.BLACK,
	        outlineWidth: 2,
	        style: Cesium.LabelStyle.FILL_AND_OUTLINE,
            verticalOrigin: Cesium.VerticalOrigin.LEFT_UP, 
            horizontalOrigin: Cesium.HorizontalOrigin.TOP,
            eyeOffset: new Cesium.Cartesian3(0, 7.2, 0),
				pixelOffsetScaleByDistance: new Cesium.NearFarScalar(
					1.5e2,
					5.0,
					1.5e7,
					0.5
				),
        }
      });
    const lm_10004 = viewer.entities.add({ 
        // Attach the 3D model instead of the green point.
 
	    model : {
   	   	   //uri: '/images/CesiumDrone.glb',
           uri: '/images/Cesium_Air_vtol3.glb', 
           scale: 1.3,
           minimumPixelSize: 120,
           maximumScale: 1000,
	      }, 
        label: {
	        text: new Cesium.CallbackProperty(updateSpeedLabel4, false),
	        font: "18px sans-serif",
            showBackground: true,
	        fillColor: Cesium.Color.SKYBLUE,
	        outlineColor: Cesium.Color.BLACK,
	        outlineWidth: 2,
	        style: Cesium.LabelStyle.FILL_AND_OUTLINE,
            verticalOrigin: Cesium.VerticalOrigin.LEFT_UP, 
            horizontalOrigin: Cesium.HorizontalOrigin.TOP,
            eyeOffset: new Cesium.Cartesian3(0, 7.2, 0),
				pixelOffsetScaleByDistance: new Cesium.NearFarScalar(
					1.5e2,
					5.0,
					1.5e7,
					0.5
				),
        }
      });

    const lm_10005 = viewer.entities.add({ 
        // Attach the 3D model instead of the green point.
 
	    model : {
   	   	   //uri: '/images/CesiumDrone.glb',
           uri: '/images/Cesium_Air_vtol3.glb', 
           scale: 1.3,
           minimumPixelSize: 120,
           maximumScale: 1000,
	      }, 
        label: {
	        text: new Cesium.CallbackProperty(updateSpeedLabel5, false),
	        font: "18px sans-serif",
            showBackground: true,
	        fillColor: Cesium.Color.SKYBLUE,
	        outlineColor: Cesium.Color.BLACK,
	        outlineWidth: 2,
	        style: Cesium.LabelStyle.FILL_AND_OUTLINE,
            verticalOrigin: Cesium.VerticalOrigin.LEFT_UP, 
            horizontalOrigin: Cesium.HorizontalOrigin.TOP,
            eyeOffset: new Cesium.Cartesian3(0, 7.2, 0),
				pixelOffsetScaleByDistance: new Cesium.NearFarScalar(
					1.5e2,
					5.0,
					1.5e7,
					0.5
				),
        }
      });


	function updateSpeedLabel1(time, result) {
	 // velocityVectorProperty.getValue(time, velocityVector);
	 // const metersPerSecond = Cesium.Cartesian3.magnitude(velocityVector);
	 // const kmPerHour = Math.round(metersPerSecond * 3.6);
	  //droneName+"\n34.134234,126.14566\n6m/s\n110m",
	  //const droneName = $("#topdevie option:selected").val();
	  const droneName = "lm_10001";

	    tmpData = droneName;
	    if (lm_10001.position) {
	        //console.log(airplaneEntity22.position.getValue(viewer.clock.currentTime).x);
			 
			var cartographic = Cesium.Cartographic.fromCartesian(lm_10001.position.getValue(viewer.clock.currentTime));
			var Tmporientation = Cesium.Cartographic.fromCartesian(lm_10001.orientation.getValue(viewer.clock.currentTime));
	      
			//console.log("headingPitchRoll",airplaneEntity22);
			$("#d_roll").text(Math.round(Tmporientation.latitude * 100)/100);
			$("#d_pitch").text(Math.round(Tmporientation.longitude * 100)/100);
			$("#d_yaw").text(Math.round(Tmporientation.height * 100)/100);
			//console.log(
			//    'lon ' + Cesium.Math.toDegrees(cartographic.longitude) + ', ' +
			 //   'lat ' + Cesium.Math.toDegrees(cartographic.latitude) + ', ' +
			//    'alt ' + cartographic.height);
			var tmHeight = cartographic.height.toString().split(".")
	 
			   tmpData += "\n"+Cesium.Math.toDegrees(cartographic.latitude).toString().substring(0,10)+" , ";
			   tmpData +=  Cesium.Math.toDegrees(cartographic.longitude).toString().substring(0,11)+"";
			   tmpData +=  "\n Height:"+tmHeight[0]+"";
	    }

	  return tmpData;
	}
	
	function updateSpeedLabel2(time, result) {
	 // velocityVectorProperty.getValue(time, velocityVector);
	 // const metersPerSecond = Cesium.Cartesian3.magnitude(velocityVector);
	 // const kmPerHour = Math.round(metersPerSecond * 3.6);
	  //droneName+"\n34.134234,126.14566\n6m/s\n110m",
	  //const droneName = $("#topdevie option:selected").val();
	  const droneName = "lm_10002";

	    tmpData = droneName;
	    if (lm_10002.position) {
	        //console.log(airplaneEntity22.position.getValue(viewer.clock.currentTime).x);
			 
			var cartographic = Cesium.Cartographic.fromCartesian(lm_10002.position.getValue(viewer.clock.currentTime));
			var Tmporientation = Cesium.Cartographic.fromCartesian(lm_10002.orientation.getValue(viewer.clock.currentTime));
	      
			//console.log("headingPitchRoll",airplaneEntity22);
			$("#d_roll").text(Math.round(Tmporientation.latitude * 100)/100);
			$("#d_pitch").text(Math.round(Tmporientation.longitude * 100)/100);
			$("#d_yaw").text(Math.round(Tmporientation.height * 100)/100);
			//console.log(
			//    'lon ' + Cesium.Math.toDegrees(cartographic.longitude) + ', ' +
			 //   'lat ' + Cesium.Math.toDegrees(cartographic.latitude) + ', ' +
			//    'alt ' + cartographic.height);
			var tmHeight = cartographic.height.toString().split(".")
	 
			   tmpData += "\n"+Cesium.Math.toDegrees(cartographic.latitude).toString().substring(0,10)+" , ";
			   tmpData +=  Cesium.Math.toDegrees(cartographic.longitude).toString().substring(0,11)+"";
			   tmpData +=  "\n Height:"+tmHeight[0]+"";
	    }

	  return tmpData;
	}
	
	function updateSpeedLabel3(time, result) {
	 // velocityVectorProperty.getValue(time, velocityVector);
	 // const metersPerSecond = Cesium.Cartesian3.magnitude(velocityVector);
	 // const kmPerHour = Math.round(metersPerSecond * 3.6);
	  //droneName+"\n34.134234,126.14566\n6m/s\n110m",
	  //const droneName = $("#topdevie option:selected").val();
	  const droneName = "lm_10003";

	    tmpData = droneName;
	    if (lm_10003.position) {
	        //console.log(airplaneEntity22.position.getValue(viewer.clock.currentTime).x);
			 
			var cartographic = Cesium.Cartographic.fromCartesian(lm_10003.position.getValue(viewer.clock.currentTime));
			var Tmporientation = Cesium.Cartographic.fromCartesian(lm_10003.orientation.getValue(viewer.clock.currentTime));
	      
			//console.log("headingPitchRoll",airplaneEntity22);
			$("#d_roll").text(Math.round(Tmporientation.latitude * 100)/100);
			$("#d_pitch").text(Math.round(Tmporientation.longitude * 100)/100);
			$("#d_yaw").text(Math.round(Tmporientation.height * 100)/100);
			//console.log(
			//    'lon ' + Cesium.Math.toDegrees(cartographic.longitude) + ', ' +
			 //   'lat ' + Cesium.Math.toDegrees(cartographic.latitude) + ', ' +
			//    'alt ' + cartographic.height);
			var tmHeight = cartographic.height.toString().split(".")
	 
			   tmpData += "\n"+Cesium.Math.toDegrees(cartographic.latitude).toString().substring(0,10)+" , ";
			   tmpData +=  Cesium.Math.toDegrees(cartographic.longitude).toString().substring(0,11)+"";
			   tmpData +=  "\n Height:"+tmHeight[0]+"";
	    }

	  return tmpData;
	}
	
	function updateSpeedLabel4(time, result) {
	 // velocityVectorProperty.getValue(time, velocityVector);
	 // const metersPerSecond = Cesium.Cartesian3.magnitude(velocityVector);
	 // const kmPerHour = Math.round(metersPerSecond * 3.6);
	  //droneName+"\n34.134234,126.14566\n6m/s\n110m",
	  //const droneName = $("#topdevie option:selected").val();
	  const droneName = "lm_10004";

	    tmpData = droneName;
	    if (lm_10004.position) {
	        //console.log(airplaneEntity22.position.getValue(viewer.clock.currentTime).x);
			 
			var cartographic = Cesium.Cartographic.fromCartesian(lm_10004.position.getValue(viewer.clock.currentTime));
			var Tmporientation = Cesium.Cartographic.fromCartesian(lm_10004.orientation.getValue(viewer.clock.currentTime));
	      
			//console.log("headingPitchRoll",airplaneEntity22);
			$("#d_roll").text(Math.round(Tmporientation.latitude * 100)/100);
			$("#d_pitch").text(Math.round(Tmporientation.longitude * 100)/100);
			$("#d_yaw").text(Math.round(Tmporientation.height * 100)/100);
			//console.log(
			//    'lon ' + Cesium.Math.toDegrees(cartographic.longitude) + ', ' +
			 //   'lat ' + Cesium.Math.toDegrees(cartographic.latitude) + ', ' +
			//    'alt ' + cartographic.height);
			var tmHeight = cartographic.height.toString().split(".")
	 
			   tmpData += "\n"+Cesium.Math.toDegrees(cartographic.latitude).toString().substring(0,10)+" , ";
			   tmpData +=  Cesium.Math.toDegrees(cartographic.longitude).toString().substring(0,11)+"";
			   tmpData +=  "\n Height:"+tmHeight[0]+"";
	    }

	  return tmpData;
	}
     
	function updateSpeedLabel5(time, result) {
	 // velocityVectorProperty.getValue(time, velocityVector);
	 // const metersPerSecond = Cesium.Cartesian3.magnitude(velocityVector);
	 // const kmPerHour = Math.round(metersPerSecond * 3.6);
	  //droneName+"\n34.134234,126.14566\n6m/s\n110m",
	  //const droneName = $("#topdevie option:selected").val();
	  const droneName = "lm_10005";

	    tmpData = droneName;
	    if (lm_10005.position) {
	        //console.log(airplaneEntity22.position.getValue(viewer.clock.currentTime).x);
			 
			var cartographic = Cesium.Cartographic.fromCartesian(lm_10005.position.getValue(viewer.clock.currentTime));
			var Tmporientation = Cesium.Cartographic.fromCartesian(lm_10005.orientation.getValue(viewer.clock.currentTime));
	      
			//console.log("headingPitchRoll",airplaneEntity22);
			$("#d_roll").text(Math.round(Tmporientation.latitude * 100)/100);
			$("#d_pitch").text(Math.round(Tmporientation.longitude * 100)/100);
			$("#d_yaw").text(Math.round(Tmporientation.height * 100)/100);
			//console.log(
			//    'lon ' + Cesium.Math.toDegrees(cartographic.longitude) + ', ' +
			 //   'lat ' + Cesium.Math.toDegrees(cartographic.latitude) + ', ' +
			//    'alt ' + cartographic.height);
			var tmHeight = cartographic.height.toString().split(".")
	 
			   tmpData += "\n"+Cesium.Math.toDegrees(cartographic.latitude).toString().substring(0,10)+" , ";
			   tmpData +=  Cesium.Math.toDegrees(cartographic.longitude).toString().substring(0,11)+"";
			   tmpData +=  "\n Height:"+tmHeight[0]+"";
	    }

	  return tmpData;
	}


	var handler = new Cesium.ScreenSpaceEventHandler(scene.canvas);
 
    
	handler.setInputAction(function(movement) {
		//$("#rightmenu").hide();
		//alert("dd");
		var dataSource = new Cesium.CustomDataSource('exampleDataSource');
		const tmWaypoint = $("#menu1").val();
		if(tmWaypoint==1){		
			viewer.dataSources.removeAll();
			var ray = viewer.camera.getPickRay(movement.position);
			var cartesian = viewer.scene.globe.pick(ray, viewer.scene);
            
			var {lon, lat, alt} = utils_getLonLatAltFromCartesian(cartesian)
			if (cartesian) {
                //goto set
                $("#menu91").val(lon);
                $("#menu92").val(lat);
                $("#menu93").val($("#lm_10001_st_atitude").text()); //
				viewer.dataSources.add(dataSource).then(function(datasource) {
				  datasource.entities.add(new Cesium.Entity({
				      name: 'exampleEntity', 
				      position : Cesium.Cartesian3.fromDegrees(lon,lat),
				      billboard : {
				            image : '/images/here.svg'
				        }
				     }));
		         }); 

                //action
                fn_droneAction(this,'goto')
			}
		}
		
	}, Cesium.ScreenSpaceEventType.RIGHT_UP);
	
	
    
	handler.setInputAction(function(movement) {
		//$("#rightmenu").hide();
		//alert("dd");
		var dataSource = new Cesium.CustomDataSource('exampleDataSource');
		const tmWaypoint = $("#menu1").val();
		if(tmWaypoint==1){		
			viewer.dataSources.removeAll();
			var ray = viewer.camera.getPickRay(movement.position);
			var cartesian = viewer.scene.globe.pick(ray, viewer.scene);
            
			var {lon, lat, alt} = utils_getLonLatAltFromCartesian(cartesian)
	 
		}
		
	}, Cesium.ScreenSpaceEventType.LEFT_CLICK);
	
	function utils_getLonLatAltFromCartesian(cartesian) {
	    var cartographic = Cesium.Ellipsoid.WGS84.cartesianToCartographic(cartesian);
	    var lon = Cesium.Math.toDegrees(cartographic.longitude)
	    var lat = Cesium.Math.toDegrees(cartographic.latitude)
	    var alt = cartographic.height
	
	    return {lon, lat, alt}
	}
	
 
	
	function drawDronePath(
		  tmEntity
		, currentLongitude
		, currentLatitude
		, currentAltitude
		, headingDirection
		, distance
		) {
	 
        
        var dronePathEntity = eval(tmEntity);
 
	
	    // 변화량 계산을 위해 경위도를 라디안으로 변환합니다.
	    var currentLongitudeRad = Cesium.Math.toRadians(currentLongitude);
	    var currentLatitudeRad = Cesium.Math.toRadians(currentLatitude);
	
	    // 드론의 이동 방향으로 100m 앞까지의 좌표를 계산합니다.
	    var earthRadius = 6371000; // 지구 반지름 (미터)
	    var distance = distance; // 100m
	    var angularDistance = distance / earthRadius;
	    var destinationLatitudeRad = Math.asin(Math.sin(currentLatitudeRad) * Math.cos(angularDistance) +
	        Math.cos(currentLatitudeRad) * Math.sin(angularDistance) * Math.cos(headingDirection));
	    var destinationLongitudeRad = currentLongitudeRad + Math.atan2(Math.sin(headingDirection) * Math.sin(angularDistance) * Math.cos(currentLatitudeRad),
	        Math.cos(angularDistance) - Math.sin(currentLatitudeRad) * Math.sin(destinationLatitudeRad));
	
        // 계산된 목적지 좌표를 경위도로 변환합니다.
        var destinationLongitude = Cesium.Math.toDegrees(destinationLongitudeRad);
        var destinationLatitude = Cesium.Math.toDegrees(destinationLatitudeRad);
 
        // 현재 위치와 목적지를 이어주는 폴리라인을 업데이트합니다.
        dronePathEntity.polyline.positions = Cesium.Cartesian3.fromDegreesArrayHeights([currentLongitude, currentLatitude, currentAltitude,
                                                                                        destinationLongitude, destinationLatitude, currentAltitude]);
	}
	
    // 드론의 이동 경로를 저장하는 배열
    var dronePath_lm_10001 = []; 
    var dronePath_lm_10002 = []; 
    var dronePath_lm_10003 = []; 
    var dronePath_lm_10004 = []; 
    var dronePath_lm_10005 = []; 
	
	// 드론의 이동 경로를 그리고 업데이트하는 함수
	function drawAndUpdateDronePath(TmPolylineEntity,TmdronePath,currentPosition,Tmdistance) {
		dronePath = eval(TmdronePath);
		polylineEntity = eval(TmPolylineEntity);
	    // 이전 위치가 없으면 현재 위치를 경로에 추가하고 리턴
	    if (dronePath.length === 0) {
	        dronePath.push(currentPosition);
	        return;
	    }
	
	    // 이전 위치
	    var previousPosition = dronePath[dronePath.length - 1];
	
	    // 이전 위치와 현재 위치 사이의 거리 계산
	    var distance = Cesium.Cartesian3.distance(previousPosition, currentPosition);
	
	    // 이전 위치와 현재 위치 사이의 거리가 0보다 크면 폴리 라인을 그림
	    if (distance > 0) {
	        // 경로에 현재 위치 추가
	        dronePath.push(currentPosition);
	
	        // 전체 폴리 라인의 길이 계산
	        var totalDistance = calculateTotalDistance();
	
	        // 전체 폴리 라인의 길이가 100m를 초과하면 오래된 경로부터 제거
	        while (totalDistance > Tmdistance) {
	            dronePath.shift();
	            totalDistance = calculateTotalDistance();
	        }
	
	        // 폴리 라인 엔티티가 이미 존재하는 경우 위치를 업데이트하고, 없으면 새로 추가
	        if (polylineEntity) {
	            polylineEntity.polyline.positions = dronePath;
	        } else {
	            polylineEntity = viewer.entities.add({
	                polyline: {
	                    positions: dronePath,
	                    width: 3,
	                    material: Cesium.Color.GREEN
	                }
	            });
	        }
	    }
	}
	
	// 폴리 라인의 전체 길이를 계산하는 함수
	function calculateTotalDistance() {
	    var totalDistance = 0;
	    for (var i = 1; i < dronePath.length; i++) {
	        totalDistance += Cesium.Cartesian3.distance(dronePath[i - 1], dronePath[i]);
	    }
	    return totalDistance;
	}
     
    function droneState (x,y,z,vDrone,sendTime) {
      if(typeof count == "undefined" || count == "" || count == null){
    	  var count = 0; 
        }
      
       
    	if(typeof x == "undefined" || x == "" || x == null){
        	
        }else{
	        z=parseFloat(z)+2;
            if(z<2)z=2;
		    var position = Cesium.Cartesian3.fromDegrees( y, x, z);
	        let tmHead;
		    var heading;  
		    var pitch;
		    var roll;


           // L.marker([x, y], {icon: samPleIcon}).addTo(map);
				var tArea = $("#dronelog")[0]; 
				var tAreaLine = tArea.value.substr(0, tArea.selectionStart).split("\n").length;
				if(tAreaLine>1000){
					$("#dronelog").val('');
				}
				
				var today = new Date();   
				
				var hours = ('0' + today.getHours()).slice(-2); 
				var minutes = ('0' + today.getMinutes()).slice(-2);
				var seconds = ('0' + today.getSeconds()).slice(-2); 
				var milisecond = ('0' + today.getMilliseconds()).slice(-2); 
			 
				
				var timeString = hours + ':' + minutes  + ':' + seconds +':'+milisecond;
				if(typeof sendTime == "undefined" || sendTime == "" || sendTime == null){
					console.log("");
				}else{ 
					timeString = timeString + " (S):"+sendTime;
				}
				
				
				
            if(vDrone=='lm_10001'){
	            //drone101.setLatLng([x, y]).update(); 
		         $("#dronelog").val(timeString+": [D=>]"+vDrone+" "+x+"/"+y+"\n"+$("#dronelog").val());
             }else if(vDrone=='lm_10002'){
	            //drone102.setLatLng([x, y]).update();  
		         $("#dronelog").val(timeString+": [D=>]"+vDrone+" "+x+"/"+y+"\n"+$("#dronelog").val());
             }else if(vDrone=='lm_10003'){
	            //drone103.setLatLng([x, y]).update(); 
		         $("#dronelog").val(timeString+": [D=>]"+vDrone+" "+x+"/"+y+"\n"+$("#dronelog").val());
             }else if(vDrone=='lm_10004'){
	            //drone104.setLatLng([x, y]).update();  
		         $("#dronelog").val(timeString+": [D=>]"+vDrone+" "+x+"/"+y+"\n"+$("#dronelog").val());
             }else if(vDrone=='lm_10005'){
	            //drone105.setLatLng([x, y]).update(); 
		         $("#dronelog").val(timeString+": [D=>]"+vDrone+" "+x+"/"+y+"\n"+$("#dronelog").val());
             }





			let drone = eval(vDrone); 
			
            if(vDrone=='lm_10001'){
                 //roll = parseFloat($('#menu11').val());	 
	             //pitch = parseFloat($('#menu12').val());
                 roll = parseFloat(0);	 
	             pitch = parseFloat(0);
	             tmHead = parseInt($('#menu14').val());
		         heading = Cesium.Math.toRadians(tmHead+90);  
             }else if(vDrone=='lm_10002'){
                 //roll = parseFloat($('#menu21').val());	 
	             //pitch = parseFloat($('#menu22').val());
                 roll = parseFloat(0);	 
	             pitch = parseFloat(0);
	             tmHead = parseInt($('#menu24').val());
		         heading = Cesium.Math.toRadians(tmHead+90);  	
			 }else if(vDrone=='lm_10003'){
                 //roll = parseFloat($('#menu31').val());	 
	             //pitch = parseFloat($('#menu32').val());
                 roll = parseFloat(0);	 
	             pitch = parseFloat(0);
	             tmHead = parseInt($('#menu34').val());
		         heading = Cesium.Math.toRadians(tmHead+90);  	
			 }else if(vDrone=='lm_10004'){
                 //roll = parseFloat($('#menu41').val());	 
	             //pitch = parseFloat($('#menu42').val());
                 roll = parseFloat(0);	 
	             pitch = parseFloat(0);
	             tmHead = parseInt($('#menu44').val());
		         heading = Cesium.Math.toRadians(tmHead+90);  	
			 }else if(vDrone=='lm_10005'){
                 //roll = parseFloat($('#menu51').val());	 
	             //pitch = parseFloat($('#menu52').val());
                 roll = parseFloat(0);	 
	             pitch = parseFloat(0);
	             tmHead = parseInt($('#menu54').val());
		         heading = Cesium.Math.toRadians(tmHead+90);  	
			 } 
		    //console.log('drone heading: ',heading); 
		    //console.log('drone pitch: ',pitch); 
		    //console.log('drone roll: ',roll);  

		    var result=Number(heading);
		
		    if(isNaN(result)==true){
		        heading = 90
		    }
            //gps polyline change
/*
			drawDronePath(
					  "ply_"+vDrone
					, y
					, x
					, z
					, Cesium.Math.toRadians(tmHead)
					, 200
					);
					*/
            //gps polyline history		
            var currentPosition = Cesium.Cartesian3.fromDegrees(y, x, z); // 임의의 위도, 경도 
             drawAndUpdateDronePath("ply2_"+vDrone,"dronePath_"+vDrone,currentPosition,500)

		    var hpr = new Cesium.HeadingPitchRoll(heading, pitch, roll);
		    var orientation = Cesium.Transforms.headingPitchRollQuaternion(position, hpr);
			
            const tm_drone_type = $("#"+vDrone+"_alias2").text();	 
            
            //console.log('tm_drone_type : ',tm_drone_type); 
            drone.position = position;	
			drone.orientation = orientation;
		    
            if(tm_drone_type=='VTOL'){
			  //drone.model.uri ="/images/Cesium_Air_vtol3.glb";
			  drone.model.uri ="/images/drone_vtol.glb";		
			  drone.model.scale =0.5;	
			  drone.model.minimumPixelSize =120;	
			  drone.model.maximumScale =1000;	
			}else{
			  //drone.model.uri ="/images/CesiumDrone2.glb";	
			  drone.model.uri ="/images/drone_quad.glb";	
			  drone.model.scale =0.05;	
			  drone.model.minimumPixelSize =120;	
			  drone.model.maximumScale =1000;	
			}
    
        }
 
      //viewer.trackedEntity = drone; 
      //console.log('vDrone : ', x);
    }
    
	 function waypointFly (waypointsJson) {  
		    
		    let flightData = JSON.parse(waypointsJson); 
		    const osmBuildings = viewer.scene.primitives.add(Cesium.createOsmBuildings());

		    const timeStepInSeconds = 100;
		    const totalSeconds = timeStepInSeconds * (flightData.actions.length - 1); 
		    const start = Cesium.JulianDate.fromIso8601(flightData.creationTime);
		    const stop = Cesium.JulianDate.addSeconds(start, totalSeconds, new Cesium.JulianDate());
		    viewer.clock.startTime = start.clone();
		    viewer.clock.stopTime = stop.clone();
		    viewer.clock.currentTime = start.clone();
		    viewer.timeline.zoomTo(start, stop);
		    // Speed up the playback speed 50x.
		    viewer.clock.multiplier = 5;
		    // Start playing the scene.
		    viewer.clock.shouldAnimate = true;

		    // The SampledPositionedProperty stores the position and timestamp for each sample along the radar sample series.
		    const positionProperty = new Cesium.SampledPositionProperty();
		    


		    for (let i = 0; i < flightData.actions.length; i++) { 
		      const dataPoint = flightData.actions[i]; 

		      // Declare the time for this individual sample and store it in a new JulianDate instance.
		      const time = Cesium.JulianDate.addSeconds(start, i * timeStepInSeconds, new Cesium.JulianDate());
		      const position = Cesium.Cartesian3.fromDegrees(dataPoint.coordinate[1], dataPoint.coordinate[0], dataPoint.elevation);
		      // Store the position along with its timestamp.
		      // Here we add the positions all upfront, but these can be added at run-time as samples are received from a server.
		      positionProperty.addSample(time, position);

		      viewer.entities.add({
		        description: 'Location: (${dataPoint.coordinate[1]}, ${dataPoint.coordinate[0]}, ${dataPoint.elevation})',
		        position: position,
		        point: { pixelSize: 10, color: Cesium.Color.ORANGE }
		      }); 
		    };

			 // STEP 6 CODE (airplane entity)
		    async function loadModel() {
		      // Load the glTF model from Cesium ion.
		      //const airplaneUri = await Cesium.IonResource.fromAssetId(848167); 
		      const airplaneEntity = viewer.entities.add({
		        availability: new Cesium.TimeIntervalCollection([ new Cesium.TimeInterval({ start: start, stop: stop }) ]),
		        position: positionProperty,
		        // Attach the 3D model instead of the green point. 
			    model : {
			    	 //uri: '/images/drone1.glb',
			    	 uri: '/images/drone_quad.glb',
			         minimumPixelSize : 110,
			         maximumScale : 20000
			      },
		        // Automatically compute the orientation from the position.
		        orientation: new Cesium.VelocityOrientationProperty(positionProperty),    
		        path: new Cesium.PathGraphics({ width: 3 })
		      });
		      
		      viewer.trackedEntity = airplaneEntity; 
		    } 
		    loadModel();  
	 }
	 
    let waypointsJson = $('#waypoints-data').text() 

	 if(waypointsJson!=""){  
		 waypointFly(waypointsJson);  
	 }


//드론 시뮬레이션
function dronePathSetting (waypointsJson,droneName) {  
	
	    var tmWayPoint = waypointsJson.dlWaypoint;

		const flightData = JSON.parse(tmWayPoint);
 
		
		const timeStepInSeconds = 100;
		const totalSeconds = timeStepInSeconds * (flightData.actions.length - 1);
		const start = Cesium.JulianDate.fromIso8601(flightData.creationTime);
		const stop = Cesium.JulianDate.addSeconds(start, totalSeconds, new Cesium.JulianDate());
		viewer.clock.startTime = start.clone();
		viewer.clock.stopTime = stop.clone();
		viewer.clock.currentTime = start.clone();
		viewer.timeline.zoomTo(start, stop);
		// Speed up the playback speed 50x.
		viewer.clock.multiplier = 5;
		// Start playing the scene.
		viewer.clock.shouldAnimate = true;
		
 
		
		// The SampledPositionedProperty stores the position and timestamp for each sample along the radar sample series.
		const positionProperty = new Cesium.SampledPositionProperty(); 
		
		positions = [];
		for (let i = 0; i < flightData.actions.length; i++) {
			const dataPoint = flightData.actions[i];
		
			// Declare the time for this individual sample and store it in a new JulianDate instance.
			const time = Cesium.JulianDate.addSeconds(start, i * timeStepInSeconds, new Cesium.JulianDate());
			const position = Cesium.Cartesian3.fromDegrees(dataPoint.coordinate[1], dataPoint.coordinate[0], dataPoint.coordinate[2]);
		     positions.push(Cesium.Cartesian3.fromDegrees(dataPoint.coordinate[1]+0.00002, dataPoint.coordinate[0]+0.00002, dataPoint.coordinate[2]+2));
		
			// Store the position along with its timestamp.
			// Here we add the positions all upfront, but these can be added at run-time as samples are received from a server.
			positionProperty.addSample(time, position); 
		 
		};
		
		const tm_droneName = $("#topdevie option:selected").val();
		const tm_dronealias2 = $("#"+tm_droneName+"_alias2").text();
		
		 
		 
		//const lm_fly = "/images/Cesium_Air_vtol.glb";	
		//const tm_scale = 0.08;	
		//var tm_model = "/images/CesiumDrone2.glb";
		//var tm_model = "/images/CesiumDrone.glb"; 
		var tm_model = "/images/drone_quad.glb"; 
		var tm_scale = 0.1;
		var tm_minsize = 130; 
		if(tm_dronealias2=='VTOL'){
		 //tm_model = "/images/Cesium_Air_vtol.glb";
		 tm_model = "/images/drone_vtol.glb";
		 tm_scale = 0.06; 
		 tm_minsize = 130; 
		} 
 
  
 		  airplaneEntity22 = viewer.entities.add({
			availability: new Cesium.TimeIntervalCollection([new Cesium.TimeInterval({ start: start, stop: stop })]),
			position: positionProperty,
			// Attach the 3D model instead of the green point.
	        model : {
	   	   	   // uri: '/images/Cesium_Air.glb',
               // uri: '/images/CesiumDrone2.glb',
 			   uri: tm_model,
	           scale: tm_scale,
	           minimumPixelSize: tm_minsize,
	           maximumScale: 1000000,
	   	
	   	     }, 
			// Automatically compute the orientation from the position.
			orientation: new Cesium.VelocityOrientationProperty(positionProperty),
			outlineWidth: 4, 
			label: {
				//text: droneName+"\n34.134234,126.14566\n6m/s\n110m",
				text: new Cesium.CallbackProperty(updateSpeedLabel, false),
				font: "18px sans-serif", 
				showBackground: true,
				horizontalOrigin: Cesium.HorizontalOrigin.TOP,
				eyeOffset: new Cesium.Cartesian3(0, 7.2, 0),
				pixelOffsetScaleByDistance: new Cesium.NearFarScalar(
					1.5e2,
					5.0,
					1.5e7,
					0.5
				),
			},  
	
		});
 
 
		
		 viewer.entities.add({
		  polylineVolume: {
		    positions:positions,
		    shape: starPositions(3, 3.0, 2.0),
		    outline: true, 
		    outlineWidth: 1,
		    material: Cesium.Color.fromRandom({ alpha: 0.2 }),
		  },
		});
	
		viewer.trackedEntity = airplaneEntity22;
		

}

function updateSpeedLabel(time, result) {
 // velocityVectorProperty.getValue(time, velocityVector);
 // const metersPerSecond = Cesium.Cartesian3.magnitude(velocityVector);
 // const kmPerHour = Math.round(metersPerSecond * 3.6);
  //droneName+"\n34.134234,126.14566\n6m/s\n110m",
  const droneName = $("#topdevie option:selected").val();
  //const date = julianIntToDate(2456931).toString()
 // const date2 = timestamp2(Cesium.JulianDate.toDate(time))   ;
    tmpData = droneName;
    if (airplaneEntity22.position) {
        //console.log(airplaneEntity22.position.getValue(viewer.clock.currentTime).x);
		 
		var cartographic = Cesium.Cartographic.fromCartesian(airplaneEntity22.position.getValue(viewer.clock.currentTime));
		var Tmporientation = Cesium.Cartographic.fromCartesian(airplaneEntity22.orientation.getValue(viewer.clock.currentTime));
      
		//console.log("headingPitchRoll",airplaneEntity22);
		$("#d_roll").text(Math.round(Tmporientation.latitude * 100)/100);
		$("#d_pitch").text(Math.round(Tmporientation.longitude * 100)/100);
		$("#d_yaw").text(Math.round(Tmporientation.height * 100)/100);
		//console.log(
		//    'lon ' + Cesium.Math.toDegrees(cartographic.longitude) + ', ' +
		 //   'lat ' + Cesium.Math.toDegrees(cartographic.latitude) + ', ' +
		//    'alt ' + cartographic.height);
		var tmHeight = cartographic.height.toString().split(".")
 
		   tmpData += "\n"+Cesium.Math.toDegrees(cartographic.latitude).toString().substring(0,10)+" , ";
		   tmpData +=  Cesium.Math.toDegrees(cartographic.longitude).toString().substring(0,11)+"";
		   tmpData +=  "\n Height:"+tmHeight[0]+"";
    }

 
 
  return tmpData;
}

function timestamp2(str){ 
    str.setHours(str.getHours() + 9);
    return str.toISOString().replace('T', ' ').substring(0, 19);
}

$('.smenutop4').click(function(e) {
  viewer.trackedEntity = airplaneEntity22;

});

$('.smenutop44').click(function(e) {
  viewer.trackedEntity = undefined;
  viewer.zoomTo(
    viewer.entities,
    new Cesium.HeadingPitchRange(
      Cesium.Math.toRadians(-90),
      Cesium.Math.toRadians(-15),
      750
    )
  );

});

$('.smenutop444').click(function(e) {
  viewer.trackedEntity = undefined;
  viewer.zoomTo(
    viewer.entities,
    new Cesium.HeadingPitchRange(0, Cesium.Math.toRadians(-90))
  );

});


 

 //드론 FC 업로드
 function dronePathWaypoint (waypointsJson,pk, dlWaypointDetail) {
 
	 
	    //drone waypoint  
        var droneName = $("#topdevie option:selected").val();
     

        if(droneName=='no'){
             alert("Selected No Device");
             return false;
        }
        selectdrone(pk,droneName);  
 
        var tmWayPoint = waypointsJson.dlWaypoint;
  
       //화면에 경로 지정
		const flightData = JSON.parse(tmWayPoint);
	  
		positions = [];
		initialPosition = "";
		for (let i = 0; i < flightData.actions.length; i++) {
			const dataPoint = flightData.actions[i];
	        if(i==0){
		       //firstHomePosition.push(Cesium.Cartesian3.fromDegrees(dataPoint.coordinate[1], dataPoint.coordinate[0], dataPoint.elevation));
               initialPosition = new Cesium.Cartesian3.fromDegrees(dataPoint.coordinate[1], dataPoint.coordinate[0], dataPoint.coordinate[2]); 
	        }
			positions.push(Cesium.Cartesian3.fromDegrees(dataPoint.coordinate[1], dataPoint.coordinate[0], dataPoint.elevation));
 
		 
		};
		
		  viewer.entities.add({
		  polylineVolume: {
		    positions:positions,
		    shape: starPositions(3, 3.0, 2.0),
		    outline: true, 
		    outlineWidth: 1,
		    material: Cesium.Color.fromRandom({ alpha: 0.2 }),
		  },
		});
 
}


 //드론 MC 업로드
 function dronePathWaypoint2 (waypointsJson,pk, dlWaypointDetail) {
 
	 
	    //drone waypoint  
        var droneName = $("#topdevie option:selected").val();
     

        if(droneName=='no'){
             alert("Selected No Device");
             return false;
        }
        selectdrone2(pk,droneName);  
        
        var tmWayPoint = waypointsJson.dlWaypoint;
        //기준좌표
        //alert(waypointsJson.dlHomeX);
        //alert(waypointsJson.dlHomeY);
        //기준좌표에 대한 상대좌표 처리

 
  
       //화면에 경로 지정
		const flightData = JSON.parse(tmWayPoint);
	  
		positions = [];
		initialPosition = "";
		for (let i = 0; i < flightData.actions.length; i++) {
			const dataPoint = flightData.actions[i];
	        if(i==0){
		       //firstHomePosition.push(Cesium.Cartesian3.fromDegrees(dataPoint.coordinate[1], dataPoint.coordinate[0], dataPoint.elevation));
               initialPosition = new Cesium.Cartesian3.fromDegrees(dataPoint.coordinate[1], dataPoint.coordinate[0], dataPoint.coordinate[2]); 
	        }
			positions.push(Cesium.Cartesian3.fromDegrees(dataPoint.coordinate[1], dataPoint.coordinate[0], dataPoint.coordinate[2]));
 
		 
		};
		
		  viewer.entities.add({
		  polylineVolume: {
		    positions:positions,
		    shape: starPositions(3, 3.0, 2.0),
		    outline: true, 
		    outlineWidth: 1,
		    material: Cesium.Color.fromRandom({ alpha: 0.2 }),
		  },
		});
 
}



function starPositions(arms, rOuter, rInner) {
  const angle = Math.PI / arms;
  const pos = [];
  for (let i = 0; i < 2 * arms; i++) {
    const r = i % 2 === 0 ? rOuter : rInner;
    const p = new Cesium.Cartesian2(
      Math.cos(i * angle) * r,
      Math.sin(i * angle) * r
    );
    pos.push(p);
  }
  return pos;
}
 

 

     //bottomLog
	 $('.logopenclose').click(function(e){  
		 if($("#bottomLog").css("display")=="none"){  
	 	 	$("#bottomLog").show();
         }
         else{
	 	 	$("#bottomLog").hide();
         } 		 
	 });
	 

  
    
    //시연용
	 $('.smenu8').click(function(e){   
		 waypointFly (waypointsJson); 
	 });

		function setVal(tmStr) {
	 
		 $("#menu999").val("lm_1000"+tmStr).prop("selected", true);
		 $("#topdevie").val("lm_1000"+tmStr).prop("selected", true); 
		 $("#drone_select").val("lm_1000"+tmStr); 
	
	     for(var i=0;i<10;i++){
	        if(i==(tmStr-1)){
	          $("#a1000"+(i+1)).css("border","3px solid #FFD700"); 
	          $("#droneState_"+(i)).css("border","3px solid #FFD700"); 
	        }else{
	          $("#a1000"+(i+1)).css("border","3px solid #006400"); 
	          $("#droneState_"+(i)).css("border","3px solid #006400");  
	        }
	     }  
	
		 let drone = eval("lm_1000"+tmStr); 
		 viewer.trackedEntity = drone;  
		}

 
	 
	 $('#a10001').click(function(e){
	     setVal(1);
	 });
	 
	 $('#a10002').click(function(e){
	     setVal(2); 
	 });
	 
	 $('#a10003').click(function(e){
	     setVal(3);
	 });
	 
	 $('#a10004').click(function(e){
	     setVal(4); 
	 });

	 $('#a10005').click(function(e){
	     setVal(5);  
	 });
	 
     



