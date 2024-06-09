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
<meta charset="utf-8">
<link rel="icon" href="/images/favicon.svg" type="image/svg+xml" />
<title>DID Blockchain 기반 군집드론 플랫폼</title> 
        <meta name="viewport"
            content="width=device-width, initial-scale=1, maximum-scale=1, minimum-scale=1, user-scalable=no">
        <c:import url="/EmpPageLink.do?link=main/include/src" /> 
        <script src="https://cesium.com/downloads/cesiumjs/releases/1.87.1/Build/Cesium/Cesium.js"></script>
        <link href="/cesium/js/Widgets/widgets.css" rel="stylesheet">
        <!-- Style our app. -->  
        <link href="/cesium/css/index.css" media="screen" rel="stylesheet"> 
	  <!--Style-->
	  <link rel="stylesheet" type="text/css" href="/cesium/css/Waypoint.css">
	  <link rel="stylesheet" type="text/css" href="/cesium/websocket/css/index01.css">
	  <script type="text/javascript" src="/cesium/js/pop-up.js"></script>
	  <script type="text/javascript" src="/cesium/websocket/layout01.js"></script>
	  <script type="text/javascript" src="/cesium/websocket/websocket01.js"></script>
      
    <!-- Syntax coloration -->
    <link rel="stylesheet" type="text/css" href="/flight/_examples_data/prism/prism.css" />
    <!-- This page style -->
    <link rel="stylesheet" type="text/css" href="/flight/_examples_data/style.css" />
    <!-- Flight Indicators library styles -->
    <link rel="stylesheet" type="text/css" href="/flight/css/flightindicators.css" />

<script type="text/javascript">
 
	

</script>
</head> 
<body >   

<div id="dialog" class="ui-dialog-titlebar ui-widget-header" title="Telemetry:DRONE-1001" style="padding:0px;text-align:center;background-color::black;display:none;">
  <img style="margin-top:5px;;" id="smenutop" class="smenutop" src="<c:url value='/images/fly.png' />" width="270"  /> 
</div> 
		 <!--Container for toolbar-->
		  <div id="waypointControls2">
		
   <!--Use Tables to organize toolbar-->
   <table align="center" >
     
      <td width="20px" height="40px"> 
          <p5 style="margin-left:20px;margin-right:20px;"><a style="color:yellow" href="<c:url value='/gcs/dashboard/projectMain1001.do'/>">
             <img src="<c:url value='/images/samsungdrone_logo.png' />"   height="30" /> 
          </a></p5>
  
      </td>
 
     <!--Toolbar Tools-->
     <td width="90px;text-align:center">
               
     </td> 
     <td width="90px;text-align:center"> 
              
     </td> 
     <td width="90px;text-align:center">  
     </td> 
     <td > 
     </td> 
    <!--Button to Download the Flight Plan-->
    <td>
  
    </td>
 
    <td style="text-align:center;width:35px"> 
       <img id="smenutop4" class="smenutop4" src="<c:url value='/images/dash1.png' />"   height="20" />
    </td>
    <td style="text-align:center;width:35px"> 
       <img id="smenutop2" class="smenutop2" src="<c:url value='/images/waypoint.png' />"   height="25" />
    </td>
    <td style="text-align:center;width:35px"> 
       <img id="smenutop3" class="smenutop3" src="<c:url value='/images/setting.png' />"   height="20" />
    </td>
    <td style="text-align:center;width:35px"> 
       <img id="smenutop9" class="smenutop9" src="<c:url value='/images/logout.png' />"   height="25" />
    </td>
    <td style="text-align:center;width:55px;font-weight:bold;"> 
      <p5 id="nowtime2" ></p5> 
    </td>
   </table>
		  </div>
	<!-- s :wrap -->
	<div id="wrap" style="background:white;">
 
 
		<!-- e :lnb_guide -->
			
	<div id="info"></div>
	<div id="map"></div>
	</div>
	<!-- e :wrap -->
	
<script>
  var poly;

  function initMap() {
	    var mapOptions = {
		        center: new google.maps.LatLng(37.2084464,127.748908),
		        mapTypeId: google.maps.MapTypeId.HYBRID,
		        zoom:18
		    };
	  
    var map = new google.maps.Map(document.getElementById('map'),
		    mapOptions);

    poly = new google.maps.Polygon({
      strokeColor: '#FF8C00',
      strokeOpacity: 1.0,
      strokeWeight: 3,
      editable: true,
      //geodesic: true,
      map: map
    });


    console.log(poly);
    
    windingPoly = new google.maps.Polyline({
	      strokeColor: '#FF0000',
	      strokeOpacity: 1.0,
	      strokeWeight: 3,
	      map: map,
	    });
    
    drawEdgesPoly();

    google.maps.event.addListener(poly.getPath(), 'insert_at',drawEdgesPoly, function(evt) {
      document.getElementById('info').innerHTML = "insert:" + poly.getPath().getAt(evt).toUrlValue(6);
    })
    google.maps.event.addListener(poly.getPath(), 'set_at',drawEdgesPoly, function(evt) {
      document.getElementById('info').innerHTML = "set:" + poly.getPath().getAt(evt).toUrlValue(6);
    })
    google.maps.event.addListener(map, 'click', function(e) {
      addLatLng(e);
    });

    google.maps.event.addListener(poly, 'drag', function(e) {

       alert("Hi");

    }); 

  }

	var drawEdgesPoly = function () {
	    // shape is the original, parent polygon
	    var shape = poly;
	    // set padding constant to 1 (i.e. 1m distance all around) 
	    padding = 50;

	    var vertices = shape.getPath();
	    var polybounds = new google.maps.LatLngBounds();
	    for (var i = 0; i < vertices.getLength(); i++) {
	        polybounds.extend(vertices.getAt(i));
	    }
	     
	    if(vertices.getLength()>2){
	    	findWindingPath(10, 15, polybounds);
	    }
	     
	};
	
	/**
	* first assume that every polyline is small and we can use plane geometry, not geodesic
	* so we can take length in degrees since it is proportional to length in meters.
	* let angle be 20-70 degrees for simplicity
	* angle - angle of a winding path to a horizontal line
	* windingsCount - count of winding lines
	* polybounds - LatLngBounds of a rectangle over a polyline
	*/
	var findWindingPath = function(angle, windingsCount, polybounds){
	    // first find all corners
	    var ne = polybounds.getNorthEast();
	    var sw = polybounds.getSouthWest();
	    var nw = new google.maps.LatLng({lat: ne.lat(), lng: sw.lng()}); 
	    var se = new google.maps.LatLng({lat: sw.lat(), lng: ne.lng()}); 
	    
	    // sizes
	    var width = ne.lng() - nw.lng(); // in degrees
	    var height = ne.lat() - se.lat(); // in degrees
	    
	    // angle in radians
	    var angleRadians = angle * Math.PI / 180;
 
	    console.log('nw=' + nw.lat() +',' + nw.lng() + ' w=' + width);
	    console.log('se=' + se.lat() +',' + se.lng() + ' h=' + height);
	    
	    var windingPath = [];
	    
	    // maximal down from the NW corner
	    var maxDown = (height + width * Math.tan(angleRadians)); // thats due to geometry
	    var distanceBetweenWindings = maxDown / windingsCount;
	    
	    // get vertical distance between winding lines, it depends on the angle
	    var downDelta = distanceBetweenWindings / Math.cos(angleRadians); // thats due to geometry
	    
	    var order = true;
	    
	    // move down from SW corner and add two intersection points
	    var si = 0;
	    for(var down = downDelta; down <= maxDown; down += downDelta) {
	        // if down is small, second intersection is at the top border of the rectangle, else - on the right border
	        if(down < width * Math.tan(angleRadians)) {
	            secondPoint = new google.maps.LatLng({lat: nw.lat(), lng: nw.lng() + down / Math.tan(angleRadians)});
	        } else {
	            secondPoint = new google.maps.LatLng({lat: nw.lat() - down + width * Math.tan(angleRadians), lng: se.lng()});
	        }
	        
	        // if down is less than height, first intersection is at the left border, else - on the bottom of it
	        if(down < height) {
	            firstPoint = new google.maps.LatLng({lat: nw.lat() - down, lng: nw.lng()});
	        } else {
	            firstPoint = new google.maps.LatLng({lat: sw.lat(), lng: sw.lng() + (down - height) / Math.tan(angleRadians) });
	        }
	        
	        
	        // find if a line intersects the user's polyline
	        var collisions = getLinePolylineCollisions(firstPoint, secondPoint, poly);
	         console.log('for down dd='+si+'::' + down, collisions)
	         si = si +1;
	        if(collisions !== false) {
	          // add two points to a winding path

	          // change its order to get to another winding line along the rectangle border
	          if(order) {
	            // drawing connecting segment
	            windingPath.push(collisions[1].lng() > collisions[0].lng() ? collisions[0] : collisions[1]);
	            // drawing long winding segment
	            windingPath.push(collisions[1].lng() > collisions[0].lng() ? collisions[1] : collisions[0]);
	          } else {
	            // add two points to a winding path

	            // drawing connecting segment
	            windingPath.push(collisions[1].lng() > collisions[0].lng() ? collisions[1] : collisions[0]);
	            // drawing long winding segment
	            windingPath.push(collisions[1].lng() > collisions[0].lng() ? collisions[0] : collisions[1]);
	          }

	          order = !order;
	        }
	    }
	    windingPoly.setPath(windingPath);
	}

	var getLinePolylineCollisions = function(firstPoint, secondPoint, shape) {
	  var collisions = [];
	  var collision;
	  var vertices = shape.getPath();
	  for (var i = 0; i < vertices.getLength(); i++) {
	    var one = vertices.getAt(i);
	    var two = vertices.getAt((i === (vertices.getLength() - 1)) ? 0 : i+1);
	    
	    collision = getLineLineCollision(firstPoint, secondPoint, one, two);
	    if(collision !== false) {
	       collisions.push(collision);
	    }
	   }
	   return collisions.length > 1 ? collisions : false;
	}

	// got from http://stackoverflow.com/questions/563198/how-do-you-detect-where-two-line-segments-intersect

	var getLineLineCollision = function(p0, p1, p2, p3) {
	    var s1, s2;
	    s1 = {x: p1.lat() - p0.lat(), y: p1.lng() - p0.lng()};
	    s2 = {x: p3.lat() - p2.lat(), y: p3.lng() - p2.lng()};

	    var s10_x = p1.lat() - p0.lat();
	    var s10_y = p1.lng() - p0.lng();
	    var s32_x = p3.lat() - p2.lat();
	    var s32_y = p3.lng() - p2.lng();

	    var denom = s10_x * s32_y - s32_x * s10_y;

	    if(denom == 0) {
	        return false;
	    }

	    var denom_positive = denom > 0;

	    var s02_x = p0.lat() - p2.lat();
	    var s02_y = p0.lng() - p2.lng();

	    var s_numer = s10_x * s02_y - s10_y * s02_x;

	    if((s_numer < 0) == denom_positive) {
	        return false;
	    }

	    var t_numer = s32_x * s02_y - s32_y * s02_x;

	    if((t_numer < 0) == denom_positive) {
	        return false;
	    }

	    if((s_numer > denom) == denom_positive || (t_numer > denom) == denom_positive) {
	        return false;
	    }

	    var t = t_numer / denom;

	    var intersection = new google.maps.LatLng({lat: p0.lat() + (t * s10_x), lng: p0.lng() + (t * s10_y)});
	    
	    return intersection;
	}
	
  function addLatLng(event) {
    pathLine = poly.getPath();
    pathLine.push(event.latLng);
    //ValueUnit = google.maps.geometry.spherical.computeArea(pathLine);

  }
</script>
    <script
      src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB41DRUbKWJHPxaFjMAwdrzWzbVKartNGg&callback=initMap&v=weekly"
      defer
    ></script>
</body>
</html>
