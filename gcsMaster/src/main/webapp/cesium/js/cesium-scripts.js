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
     const DEFAULT_LAT = 74.62042829019228  ;    
     const DEFAULT_LNG = 42.88478323563591;
   
    const COOR_PRECIS = 6;
    const OTHER_PRECIS = 1;
    
    $('#btnPath').click(function(){
    	if($('#btnPath').is(":checked") == false){
    		clearWaypointControls();
    	}
     });

    //Globals
    Cesium.Ion.defaultAccessToken = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJqdGkiOiI5YzczNzU1ZC1hNWE5LTQ4ODctODgxMS05NGJiZWE4YTkyNDciLCJpZCI6NzQwOTEsImlhdCI6MTYzNzkyMjc3Nn0.C9Ml0aSaPEOIj8xcZt3FgRi91ZJB481Mmbadiizvo9s';
    //var viewer = new Cesium.Viewer('cesiumContainer');
    var viewer = new Cesium.Viewer('cesiumContainer', {
        //selectionIndicator: false,
    	//terrainProvider : Cesium.createWorldTerrain(),  
        sceneModePicker: false, 
        baseLayerPicker: false,
        selectionIndicator: false,
        shouldAnimate: true,
        geocoder: false,
        homeButton: false,
        navigationHelpButton: false,
    });
   
    var scene = viewer.scene;
    var numberOfWaypoints = 0;
    
    viewer.animation.container.style.visibility = 'hidden';
   // viewer.timeline.container.style.visibility = 'hidden';
    
    // Add Sentinel-2 imagery
    //viewer.imageryLayers.addImageryProvider(new Cesium.IonImageryProvider({ assetId: 3954 }));
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
    
    var lineDistance = function (viewer) {
    
        //Event Listeners
        var createWaypoint = new Cesium.ScreenSpaceEventHandler(scene.canvas);  //Create a waypoint where the canvas is double-clicked
        var removeWaypoint = new Cesium.ScreenSpaceEventHandler(scene.canvas);  //Remove a waypoint if it is right-clicked
        var selectWaypoint = new Cesium.ScreenSpaceEventHandler(scene.canvas);  //Load a waypoint in the tool bar if it is clicked
        var moveWaypoint   = new Cesium.ScreenSpaceEventHandler(scene.canvas);
     
 

        //Create a waypoint where the canvas is double-clicked
        createWaypoint.setInputAction(function (click) {
        	
        	//그리기 옵션  
        	if($('#menu1').val() != '1'){ 
        		return false;
        	}
        	 
         

            //Get the click's (x,y) position on the globe
            var cartesian = viewer.camera.pickEllipsoid(click.position, scene.globe.ellipsoid);
            
            //If it is a valid position
            if (cartesian) {

                //Transform it to Coordinates (Latitude, Longitude)
                var cartographic = Cesium.Cartographic.fromCartesian(cartesian);
                numberOfWaypoints++;    //increment the number of waypoints
                
                //Create Waypoint at that position (an Entity Collection)
                var waypoint = viewer.entities.add({
                    name : "Waypoint " + numberOfWaypoints,
                    type : "waypoint",
                    pointNumber: numberOfWaypoints,
                    latitude: (cartographic.latitude * RAD_TO_DEG),  //Convert Coordinate radians to degree
                    longitude: (cartographic.longitude * RAD_TO_DEG),
                    position : Cesium.Cartesian3.fromRadians(cartographic.longitude, cartographic.latitude, MIN_HEIGHT), 
                    /*
                    billboard : {
                        image : new Cesium.PinBuilder().fromText(numberOfWaypoints, Cesium.Color.RED, 48).toDataURL(),
                        color : Cesium.Color.YELLOW , 
                    },
                    */
                    point : {
                        pixelSize : 20,
                        color : Cesium.Color.CHOCOLATE ,
                        outlineColor : Cesium.Color.YELLOW,
                        outlineWidth : 2
                    },

                    label : {
                        text : 'P ' + numberOfWaypoints,
                        font : '14pt monospace',
                        style: Cesium.LabelStyle.FILL_AND_OUTLINE,
                        outlineWidth : 2,
                        verticalOrigin : Cesium.VerticalOrigin.BOTTOM,
                        pixelOffset : new Cesium.Cartesian2(0, -9)
                    },
                    ellipse: {
                        semiMinorAxis: 1.0,
                        semiMajorAxis: 1.0,
                        height: MIN_HEIGHT,
                        extrudedHeight: 0.0,
                        //rotation: Cesium.Math.toRadians(90.0),
                        outline: true,
                        outlineColor: Cesium.Color.YELLOW,
                        outlineWidth: 4,
                        //material: Cesium.Color.GREEN.withAlpha(0.5),
                      },
                }); 
                
                //Create Infobox for Waypoint
                waypoint.description = "Command: " + "<br> Latitude: " + waypoint.latitude.toFixed(6) + "<br> Longitude: " + 
                    waypoint.longitude.toFixed(6) + "<br> Altitude: " + "<br> Radius: "; 

                //Update Waypoint # in Tool Bar
                document.getElementById('WaypointNumber').setAttribute('max', String(numberOfWaypoints));
                document.getElementById('WaypointNumber').value = numberOfWaypoints;
                
                //Update Toolbar and Waypoint Path
                switchToolbar(waypoint);
                
                updatePolyline();
              
                viewer.selectedEntity = waypoint; //Select waypoint
                
                //base way point
                var gText = 'G ' + numberOfWaypoints;
                if(numberOfWaypoints==1){
                	gText = 'HOME';
                }
                
                //지상 포인트
                var waypoint2 = viewer.entities.add({
                    name : "Waypoint2 " + numberOfWaypoints,
                    type : "waypoint2",
                    pointNumber: numberOfWaypoints,
                    latitude: (cartographic.latitude * RAD_TO_DEG),  //Convert Coordinate radians to degree
                    longitude: (cartographic.longitude * RAD_TO_DEG),
                    position : Cesium.Cartesian3.fromRadians(cartographic.longitude, cartographic.latitude, BASE_HEIGHT), 
                    point : {
                        pixelSize : 20,
                        color : Cesium.Color.DARKGRAY,
                        outlineColor : Cesium.Color.DARKGOLDENROD ,
                        outlineWidth : 2,
                        material: Cesium.Color.GREEN.withAlpha(0.5),
                        
                    },   
                    label : {
                        text : gText,
                        font : '14pt monospace',
                        style: Cesium.LabelStyle.FILL_AND_OUTLINE,
                        outlineWidth : 2,
                        verticalOrigin : Cesium.VerticalOrigin.BOTTOM,
                        pixelOffset : new Cesium.Cartesian2(0, -9)
                    },
                });
                
                //Create Infobox for Waypoint
                waypoint2.description = "Command: " + "<br> Latitude: " + waypoint2.latitude.toFixed(6) + "<br> Longitude: " + 
                    waypoint2.longitude.toFixed(6) + "<br> Altitude: " + "<br> Radius: "; 
                
                //Update Waypoint # in Tool Bar
                document.getElementById('WaypointNumber2').setAttribute('max', String(numberOfWaypoints));
                document.getElementById('WaypointNumber2').value = numberOfWaypoints;

                //Update Toolbar and Waypoint Path
                switchToolbar2(waypoint2);  
            } 
            else {
                alert("Couldn't pick globe.");
            }
        }, Cesium.ScreenSpaceEventType.LEFT_DOUBLE_CLICK);
         

        //Remove a waypoint if it is right-clicked
        removeWaypoint.setInputAction(function(click) {
        	//그리기 옵션  
        	if($('#menu1').val() != '1'){ 
        		return false;
        	} 
            var pickedObject = pickEntity(click.position);  //Get (pick) whatever entity is at the click's position

            //If that entity is a defined as a waypoint
            if(pickedObject !== undefined  && pickedObject.type === "waypoint" && $('#menu1').val() == '1') { 
            
                //Change Waypoint numbers
                var count = pickedObject.pointNumber;
                loopWaypoints(function f(waypoint){
                    if(waypoint.pointNumber > pickedObject.pointNumber) {
                        changeNumber(waypoint, count);
                        count++;
                    }
                });
                
                //Remove Waypoint
                viewer.entities.remove(pickedObject);
                numberOfWaypoints--;

                //Update Waypoint # in Tool Bar
                document.getElementById('WaypointNumber').setAttribute('max', String(numberOfWaypoints));

                //Update Toolbar and Waypoint Path
                switchToolbar(getWaypointByNumber(pickedObject.pointNumber));
                updatePolyline();
            }

        }, Cesium.ScreenSpaceEventType.RIGHT_CLICK);


        //Load a waypoint in the tool bar if it is clicked
        selectWaypoint.setInputAction(function (click) {
     
        	
            var pickedObject = pickEntity(click.position);  //Get (pick) whatever entity is at the click's position 
            //If that entity is a defined as a waypoint
            if(pickedObject !== undefined  && pickedObject.type === "waypoint" && $('#menu1').val() == '1') { 
                //update the toolbar
                switchToolbar(pickedObject);
                clearWaypointControls2();
            }else if(pickedObject !== undefined  && pickedObject.type === "waypoint2" && $('#menu1').val() == '1'){
            	switchToolbar2(pickedObject);
            	clearWaypointControls();
            }
            else { 
                clearWaypointControls(); //Clear the toolbar if it is not a waypoint
            }

        }, Cesium.ScreenSpaceEventType.LEFT_CLICK);
        
        
        var targetY = 0.0;
        var selectedPlane;
        var pointMove = false;
        
     // Update plane on mouse move
        var moveHandler = new Cesium.ScreenSpaceEventHandler(
          viewer.scene.canvas
        );
        
        //Load a waypoint in the tool bar if it is clicked
        selectWaypoint.setInputAction(function (click) {
        	pointMove = true;
            var pickedObject = pickEntity(click.position);  //Get (pick) whatever entity is at the click's position
            //If that entity is a defined as a waypoint
            if(pickedObject !== undefined  && pickedObject.type === "waypoint" && $('#menu1').val() == '1') { 
            	selectedPlane = true;  
            	
            	scene.screenSpaceCameraController.enableInputs = false;
            	moveHandler.setInputAction(function (movement) {     
    	        		if (Cesium.defined(selectedPlane) && pointMove == true) {
    	        		    var deltaY = movement.startPosition.y - movement.endPosition.y; 
    	        		    targetY += deltaY;
    	        		    
    	        		    if(targetY>0){
    		        		    document.getElementById('Altitude').value =  targetY;
    		        		    updateWaypoints_move();
    	        		    } 
    	        		} 
            		}, Cesium.ScreenSpaceEventType.MOUSE_MOVE); 
            }else if(pickedObject !== undefined  && pickedObject.type === "waypoint2" && $('#menu1').val() == '1') {
            	/*
            	selectedPlane = true;  
            	scene.screenSpaceCameraController.enableInputs = false;
            	moveHandler.setInputAction(function (movement) {
            		
            		var cartesian = viewer.camera.pickEllipsoid(movement.endPosition, movement.ellipsoid);
            		if(cartesian && selectedPlane){
            			
            	  		   var cartographic = Cesium.Cartographic.fromCartesian(cartesian);
            	  		   var longitude    = Cesium.Math.toDegrees(cartographic.longitude).toFixed(8);
            	  		   var latitude     = Cesium.Math.toDegrees(cartographic.latitude).toFixed(8);
            	  		  document.getElementById("topDiv").innerHTML = "longitude:"+longitude+" / latitude:"+latitude;
            	  		  document.getElementById("topDiv2").innerHTML = cartographic;
        	  	          document.getElementById('Latitude').value = latitude;
          	  	          document.getElementById('Longitude').value = longitude;
            	  		  
            	  		  var waypoint = viewer.selectedEntity; 
            	  		  waypoint.position = Cesium.Cartesian3.fromDegrees(longitude, latitude,1);
            	  		
            		}
            		
    	        		 
            		}, Cesium.ScreenSpaceEventType.MOUSE_MOVE); 
            		*/
            } 
            else {  
            	scene.screenSpaceCameraController.enableInputs = true;
            }
        }, Cesium.ScreenSpaceEventType.LEFT_DOWN);
        
        
         
        selectWaypoint.setInputAction(function (click) {
    	  if (Cesium.defined(selectedPlane)) { 
    		    selectedPlane = undefined;
    		  }
    	  
    	  pointMove = false;

    		  scene.screenSpaceCameraController.enableInputs = true;
        }, Cesium.ScreenSpaceEventType.LEFT_UP);
        
        
        
         

         // Handles change event in toolbar fields (other than waypoint #)
         function updateWaypoints() {
            var waypoint = viewer.selectedEntity;   //get the selected waypoint

            //Update the waypoint
            setWaypoint(waypoint);

            //Update the Waypoint Line
            updatePolyline();
         }
         
         
         
         function updateWaypoints_move() {
             var waypoint = viewer.selectedEntity;   //get the selected waypoint
     

             //Update the waypoint
             setWaypoint(waypoint);

             //Update the Waypoint Line
             updatePolyline();
          }


         // Handles change event in waypoint # toolbar field. Changes waypoint's number.
         function moveWaypoint () {
            //get waypoint
            var waypoint = viewer.selectedEntity;

            //Check that waypoint is really selected
            if(waypoint !== undefined && waypoint.type === 'waypoint' && $('#menu1').val() == '1') {

                //Get info
                var moveTo = document.getElementById('WaypointNumber').value;
                var currentPos = waypoint.pointNumber;

                //Move waypoint
                if(moveTo !== currentPos)    {

                    if(0 < moveTo && moveTo <= numberOfWaypoints) { //Check that move is valid
                        shiftPoints(moveTo, currentPos);
                        changeNumber(waypoint, moveTo); //Move waypoint
                    }

                    else if (moveTo > numberOfWaypoints) {  //if over, set to max
                        moveTo = numberOfWaypoints;
                        shiftPoints(moveTo, currentPos);
                        changeNumber(waypoint, moveTo); //Move waypoint
                        document.getElementById('WaypointNumber').value = numberOfWaypoints;
                    }   
                    else {  //if under, set to min
                        moveTo = 1;
                        shiftPoints(moveTo, currentPos);
                        changeNumber(waypoint, moveTo); //Move waypoint
                        document.getElementById('WaypointNumber').value = 1;
                    }
                    updatePolyline();   //Change Waypoint line as well
                }
            }
        }


        //Handels click event on export button. Converts Flight Plan to .waypoints file.
        function exportList () {
            var flightPlan = getFlightPlan ();                              //Turn waypoints' data in to a string
            var dataFile = new Blob([flightPlan], {type: 'text/plain'});    //Turn string into file-like Blob
            var download = document.getElementById('download');

            if(download.href === window.location.href) {
                //link Blob to downloads
                download.href= window.URL.createObjectURL(dataFile);

                //Create button to click
                var button = document.createElement("BUTTON");
                button.appendChild(document.createTextNode("Download"));

                //Add button to document
                download.appendChild(button);
            } 
            else {
                window.URL.revokeObjectURL(download.firstChild.href);   //Destroy old URL to caulk memory leak
                download.href = window.URL.createObjectURL(dataFile);   //link new URL to file
            }

        }


        //Helper Functions


        //Breaks Waypoints into a Flight Plan string
        function getFlightPlan () {
            var flightPlan = "";
            var waypoints = getSortedPoints();

            waypoints.forEach(function f(point) {
                flightPlan += (point.number - 1) + ", "; //get index
                flightPlan += "0, 0, ";                  //skip these
                
                var command = point.command.split(" ");  //Get command and maxium number of parameters
                for(var i = 0; i < MAX_PARAM + 1; i++) {
                    if(i < command.length) {
                        flightPlan+= command[i] + ", ";
                    }
                    else {
                        flightPlan+= ", ";
                    }
                }

                //Get Coordinates
                flightPlan += point.longitude + ", " + point.latitude + ", " + point.height + ", ";
                //Get Radius
                flightPlan += point.radius + "\n";
            });

            return flightPlan;
        }


        /*
         * Changes toolbar to display a waypoint's data
         * @param {Entity} the waypoint to switch to
         */
         function switchToolbar(waypoint) {
            if(waypoint !== undefined){
                document.getElementById('WaypointNumber').value = waypoint.pointNumber;
                document.getElementById('Command').value = (waypoint.command !== undefined) ? waypoint.command : "";
                document.getElementById('Latitude').value = waypoint.latitude.toFixed(COOR_PRECIS);
                document.getElementById('Longitude').value = waypoint.longitude.toFixed(COOR_PRECIS);
                document.getElementById('Altitude').value = (waypoint.height !== undefined) ? waypoint.height.toFixed(OTHER_PRECIS) : "";
                document.getElementById('Radius').value = (waypoint.raduis !== undefined) ? waypoint.raduis.toFixed(OTHER_PRECIS) : "";
            }
            else {
                clearWaypointControls();
            }
         }
         
         
         /*
          * Changes toolbar to display a waypoint's data
          * @param {Entity} the waypoint to switch to
          */
          function switchToolbar2(waypoint) {
             if(waypoint !== undefined){
                 document.getElementById('WaypointNumber2').value = waypoint.pointNumber;
                 document.getElementById('Command2').value = (waypoint.command !== undefined) ? waypoint.command : "";
                 document.getElementById('Latitude2').value = waypoint.latitude.toFixed(COOR_PRECIS);
                 document.getElementById('Longitude2').value = waypoint.longitude.toFixed(COOR_PRECIS);
                 document.getElementById('Altitude2').value = (waypoint.height !== undefined) ? waypoint.height.toFixed(OTHER_PRECIS) : "";
                 document.getElementById('Radius2').value = (waypoint.raduis !== undefined) ? waypoint.raduis.toFixed(OTHER_PRECIS) : "";
             }
             else {
                 clearWaypointControls2();
             }
          }


        /**
         * Returns the top-most Entity at the provided window coordinates
         * or undefined if no Entity is at that location.
         *
         * @param {Cartesian2} windowPosition The window coordinates.
         * @returns {Entity} The picked Entity or undefined.
         */
         function pickEntity(windowPosition) {
            var picked = viewer.scene.pick(windowPosition);
            if (Cesium.defined(picked)) {
                var id = Cesium.defaultValue(picked.id, picked.primitive.id);
                if (id instanceof Cesium.Entity) {
                    return id;
                }
            }
            return undefined;
         }


         /**
         * Returns the waypoint with the given number
         *
         *@param number the number of the desired waypoint
         *@returns {entity} the waypoint
         */
         function getWaypointByNumber(number) {
            loopWaypoints(function f(waypoint) {
                if(waypoint.pointNumber === number) {
                    return waypoint;    
                }
            });
            return undefined;
         }
        

        /*
         * Copys array of Waypoint data, sorts it by waypoint number, and returns it
         * @return array sorted array of waypoints
         */
         function getSortedPoints() {
            var points = [];

            loopWaypoints(function f (waypoint){
                points.push({
                    number: waypoint.pointNumber,
                    command: (waypoint.command !== undefined) ? waypoint.command : "",
                    longitude: waypoint.longitude,
                    latitude: waypoint.latitude,
                    height: (waypoint.height !== undefined) ? waypoint.height : MIN_HEIGHT,
                    radius:(waypoint.radius !== undefined) ? waypoint.radius : DEFAULT_RADIUS
                });
            });

            points.sort(function f(pointOne, pointTwo) {
                return pointOne.number - pointTwo.number;
            });

            return points;
         }


         /*
          * Changes waypoint data to the values currently in the toolbar fields
          * @param {Entity} the waypoint to set
          */
         function setWaypoint(waypoint) {

            //Get value from the field and set the waypoint property to it 

            waypoint.command = document.getElementById('Command').value;

            var latitude = parseFloat(document.getElementById('Latitude').value);
            waypoint.latitude = (!isNaN(latitude)) ? latitude : DEFAULT_LAT;

            var longitude = parseFloat(document.getElementById('Longitude').value);
            waypoint.longitude = (!isNaN(longitude)) ? longitude : DEFAULT_LNG;

            var height = parseFloat(document.getElementById('Altitude').value);
            waypoint.height = (!isNaN(height) && height > 1) ? height : 1;

            var raduis = parseFloat(document.getElementById('Radius').value);
            waypoint.raduis = (!isNaN(raduis)) ? raduis : DEFAULT_RADIUS;

            //Update position
            waypoint.position = Cesium.Cartesian3.fromDegrees(waypoint.longitude, waypoint.latitude,waypoint.height);
            
            waypoint.ellipse.height = waypoint.height;

            //Update infobox
            waypoint.description = "Command: " + String(waypoint.command) + "<br> Latitude: " + waypoint.latitude.toFixed(COOR_PRECIS) + 
                "<br> Longitude: " + waypoint.longitude.toFixed(COOR_PRECIS)   + "<br> Altitude: " + waypoint.height.toFixed(OTHER_PRECIS) + 
                "<br> Radius: " + waypoint.raduis.toFixed(COOR_PRECIS);
         }


         /*
          * Updates the Waypoint Path. This should be called after any change to the waypoint's position.
          */
         function updatePolyline() {
            //Grab the line
            var line = viewer.entities.getById('line');
            
            //Destroy it
            if(line != undefined) {
                viewer.entities.remove(line);
            }

            //Get list of waypoint data sorted by number
            var waypoints = getSortedPoints();

            //fill coordinate array
            var coordinates = [];
            waypoints.forEach(function f(point, i){
                coordinates.push(point.longitude);
                coordinates.push(point.latitude);
                coordinates.push(point.height);
            });

            //Add new line with new coordinates
            line = viewer.entities.add({
                name:"Waypoint Line",
                id:"line",
                polyline : {
                    positions : Cesium.Cartesian3.fromDegreesArrayHeights(coordinates),
                    width : 3,
                    material : Cesium.Color.CHARTREUSE 
                }
            });     
         }


         //loops throug entities and performs functions on waypoints
         function loopWaypoints(f) {
            for(var i =0; i < viewer.entities.values.length; i++) {
                var entity = viewer.entities.values[i];
                if(entity.type === 'waypoint'){
                    f(entity);
                }
            }
         }

         //Clear the toolbar
         function clearWaypointControls () {
            document.getElementById('WaypointNumber').value = "";
            document.getElementById('Command').value = "";
            document.getElementById('Latitude').value = "";
            document.getElementById('Longitude').value = "";
            document.getElementById('Altitude').value = "";
            document.getElementById('Radius').value = "";
         }
         
         //Clear the toolbar
         function clearWaypointControls2 () {
            document.getElementById('WaypointNumber2').value = "";
            document.getElementById('Command2').value = "";
            document.getElementById('Latitude2').value = "";
            document.getElementById('Longitude2').value = "";
            document.getElementById('Altitude2').value = "";
            document.getElementById('Radius2').value = "";
         }


         /*
          * Shifts waypoints in range a to b one left or one right depending on a - b
          * @param start the start of the range
          * @param stop the end of the range
          */
         function shiftPoints (start, stop) {

            loopWaypoints (function f(waypoint) { //Go through waypoints

                //Check if we're shifting forewards or backwards
                if(start - stop > 0) {
                    if(waypoint.pointNumber > stop && waypoint.pointNumber <= start) {  //if between start and stop
                        changeNumber(waypoint, waypoint.pointNumber - 1);   //shift
                    }
                }
                else {
                    if(waypoint.pointNumber >= start && waypoint.pointNumber < stop) { //if between start and stop
                        changeNumber(waypoint, waypoint.pointNumber + 1);   //shift
                    }
                }
            });
        }

        //change a point's number
         function changeNumber(waypoint, newNumber) {
            waypoint.pointNumber = newNumber;
            waypoint.name = "Waypoint " + newNumber;
            waypoint.label.text = "P " + newNumber;
         }
    };
    lineDistance(viewer);

