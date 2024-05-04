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
    const DEFAULT_LAT = 42.88630329;    
    const DEFAULT_LNG = 74.58857208;
 
   
    const COOR_PRECIS = 6;
    const OTHER_PRECIS = 1;
    
    $('#btnPath').click(function(){
    	if($('#btnPath').is(":checked") == false){
    		clearWaypointControls();
    	}
     });

   // Cesium.Ion.defaultAccessToken = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJqdGkiOiI3ZTExN2E0Zi0xMGRjLTQxYmEtODkxNy02NzU0NTQyNDEzMmMiLCJpZCI6NzQwOTEsImlhdCI6MTYzNzkyMjU0Nn0.3oaPj0-O1bYx5kelh18EN_8DUJhcQkiwTIJ5xKzP-P4";
    Cesium.Ion.defaultAccessToken = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJqdGkiOiI1OTk5YjE3ZC1iNDk3LTRiNTItOTVhNy04ZTJhNDk4M2MzYzMiLCJpZCI6NzIzMjksImlhdCI6MTYzNTk0Mjg1Mn0.YdISux9sGatQpsMXnVUlxziv-q9XCXpfZ7h9Gxqdaes";
    //Cesium.Ion.defaultAccessToken = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJqdGkiOiI1OTk5YjE3ZC1iNDk3LTRiNTItOTVhNy04ZTJhNDk4M2MzYzMiLCJpZCI6NzIzMjksImlhdCI6MTYzNTk0Mjg1Mn0.YdISux9sGatQpsMXnVUlxziv-q9XCXpfZ7h9Gxqdaes";

    //var viewer = new Cesium.Viewer('cesiumContainer');
    const viewer = new Cesium.Viewer('cesiumContainer', {
        //selectionIndicator: false,
    	//terrainProvider : Cesium.createWorldTerrain(),  
        sceneModePicker: false, 
        baseLayerPicker: false,
        selectionIndicator: false,
        shouldAnimate: true,
        geocoder: false,
        homeButton: false,
        navigationHelpButton: false,
		terrainProvider: new Cesium.CesiumTerrainProvider({
		  url: Cesium.IonResource.fromAssetId(1),
		}),
    });
    
    viewer.scene.globe.depthTestAgainstTerrain = true;
   
    var scene = viewer.scene;
    var numberOfWaypoints = 0;



    
    viewer.animation.container.style.visibility = 'hidden';
   // viewer.timeline.container.style.visibility = 'hidden';
    
    // Add Sentinel-2 imagery
    //viewer.imageryLayers.addImageryProvider(new Cesium.IonImageryProvider({ assetId: 3954 }));
/*
    var worldMap = new Cesium.WebMapServiceImageryProvider({
        url : 'http://localhost:8080/geoserver/wms',
        parameters: { 
            format:'image/png', 
            transparent:'true',
            tiled: true,
            enablePickFeatures: true
        }, 
        layers : 'florida:NE1_50M_SR_W',  // comma separated listing
        maximumLevel : 12
    });    
    viewer.imageryLayers.addImageryProvider(worldMap);
    viewer.imageryLayers._layers[1].show = false;
*/

    //3d test 
/*
	const imageryLayer2 = viewer.imageryLayers.addImageryProvider(
	  new Cesium.IonImageryProvider({ 
		assetId: 1428025 , 
		 }) 
	);
	*/  
	//혁신도시 1577403 
	//키르 1577006
	//혁식도시 1578610
	//혁신도시 1579212
 
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
     
    function droneState (x,y,z,vDrone) {
      if(typeof count == "undefined" || count == "" || count == null){
    	  var count = 0; 
        }
      
       
    	if(typeof x == "undefined" || x == "" || x == null){
        	
        }else{
	
		    var position = Cesium.Cartesian3.fromDegrees( y, x, z);
	        let tmHead;
		    var heading;  
		    var pitch;
		    var roll;
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

		    var hpr = new Cesium.HeadingPitchRoll(heading, pitch, roll);
		    var orientation = Cesium.Transforms.headingPitchRollQuaternion(position, hpr);
			
            const tm_drone_type = $("#"+vDrone+"_alias2").text();	 
            
            //console.log('tm_drone_type : ',tm_drone_type); 
            drone.position = position;	
			drone.orientation = orientation;
		    
            if(tm_drone_type=='VTOL'){
			  drone.model.uri ="/images/Cesium_Air_vtol3.glb";	
			  drone.model.scale =1.3;	
			  drone.model.minimumPixelSize =120;	
			  drone.model.maximumScale =1000;	
			}else{
			  drone.model.uri ="/images/CesiumDrone2.glb";	
			  drone.model.scale =0.5;	
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
			    	 uri: '/images/drone1.glb',
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



function dronePathSetting (waypointsJson,droneName) {  
		const flightData = JSON.parse(waypointsJson);
 
		
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
		var tm_model = "/images/CesiumDrone.glb"; 
		var tm_scale = 0.1;
		var tm_minsize = 130; 
		if(tm_dronealias2=='VTOL'){
		 tm_model = "/images/Cesium_Air_vtol.glb";
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


 


function dronePathWaypoint (waypointsJson,pk, dlWaypointDetail) {  
 

	
	    //drone waypoint  
        var droneName = $("#topdevie option:selected").val();
     

        if(droneName=='no'){
             alert("Selected No Device");
             return false;
        }
        selectdrone(pk,droneName); 
  
	
		const flightData = JSON.parse(waypointsJson);
  
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
	 
     



