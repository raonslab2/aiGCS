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

<%
    String url = request.getRequestURI() ;
	LoginVO user = (LoginVO) request.getSession().getAttribute("LoginVO");
	String grmName = (String) user.getGrmName();
	String mbAuth = (String) user.getMbAuth();
	System.out.println(mbAuth);
%>
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
	  
	  <!-- cesium -->
	 <script type="text/javascript">
           var MISSION_ID = "new";
           var MISSION_HAS_NAME = false;
           var MISSION_ALLOW_EDIT = true;
           var MISSIONS_URL = "/missions/";
      </script>
            
      <script type="text/javascript" src="/cesium4/jquery.min.js"></script>    
	  <script type="text/javascript" src="/cesium4/bootstrap.bundle.min.js"></script>
	  <script type="text/javascript" src="/cesium4/jquery.dataTables.js"></script>
	  <script type="text/javascript" src="/cesium4/dataTables.bootstrap4.js"></script>
	  <script type="text/javascript" src="/cesium4/Chart.min.js"></script>
      <script type="text/javascript" src="/cesium4/scripts.js"></script>
	  <script type="text/javascript" src="/cesium4/jquery-ui.min.js"></script>
		<script> 
		var geocoder
		
		function initMap() {
		    geocoder = new google.maps.Geocoder();
		}
		
		function gmap_getLocations(pos) { 
		    return new Promise(function (resolve, reject) {
		        if (geocoder) {
		            geocoder.geocode({'location': pos},
		                function (results, status) {
		                    if (results && results.length > 0) {
		                        var fullName = results[0].formatted_address
		                        var firstComponent = results[0].address_components[0].short_name
		
		                        resolve({fullName, firstComponent})
		                    }
		                });
		        }
		    })
		}
		
		function airmap_getWeather(pos) {
		    return $.ajax({
		        url: "https://api.airmap.com/advisory/v1/weather?latitude=" + pos.lat + "&longitude=" + pos.lng,
		        headers: {"X-API-Key": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJjcmVkZW50aWFsX2lkIjoiY3JlZGVudGlhbHxKd0xaSkpaUzllZGFweHVYUVpEbkV0a2JRYjZiIiwiYXBwbGljYXRpb25faWQiOiJhcHBsaWNhdGlvbnxLbGxxcUs3VER6a3k4bUhua2JNd3ZGcTRueEd6Iiwib3JnYW5pemF0aW9uX2lkIjoiZGV2ZWxvcGVyfFJablkzYnFjeUo5WEFrQ0JBeHFObXRNWXFuZDQiLCJpYXQiOjE1MTc1OTE2OTV9.c0zvqM4uKuES4NKFv8QrnDV4KAf5xbphoBlen_4ikhk"}
		    });
		}
		
		</script>

 	<script type="text/javascript" src="/cesium4/cesium-helper.js"></script>  
 	<script type="text/javascript" src="/cesium4/cesium-mod-mission.js"></script>
  	<script type="text/javascript" src="/cesium4/cesium-mod-mapdata.js"></script>
	<script type="text/javascript" src="/cesium4/dom-mod-mission.js"></script>
	
    <script type="text/javascript" src="/cesium/websocket/websocket01.js"></script> 
    
</head> 
<body style="overflow-x: hidden;overflow-y: hidden">  
<input id="menu0" name="menu0" type="hidden" value="0"  >
<input id="menu02" name="menu02" type="hidden" value="0"  >

<input id="menu1" name="menu1" type="hidden" value="0"  >
<input id="menu2" name="menu2" type="hidden" value="0"  >
<input id="menu3" name="menu3" type="hidden" value="0"  >
<input id="menu4" name="menu4" type="hidden" value="0"  >
<input id="menu5" name="menu5" type="hidden" value="0"  >
<input id="menu6" name="menu6" type="hidden" value="0"  >
<input id="menu7" name="menu7" type="hidden" value="0"  >
<input id="menu8" name="menu8" type="hidden" value="0"  >
<input id="menu9" name="menu9" type="hidden" value="0"  >
<input id="menu10" name="menu10" type="hidden" value="0"  >

<%--
<form onsubmit="return false;">
<input type="text"  name="message" id="sendmessage" value="test message"/><input type="button" value="Send Web Socket Data"
       onclick="send(this.form.message.value)" onKeypress="javascript:if(event.keyCode==13) {send(this.form.message.value)}"/>
</form>
--%>

<div id="dialog" class="ui-dialog-titlebar ui-widget-header" title="Telemetry:DRONE-1001" style="padding:0px;text-align:center;background-color::black;display:none;">
  <img style="margin-top:5px;;" id="smenutop" class="smenutop" src="<c:url value='/images/fly.png' />" width="270"  /> 
</div> 
		 <!--Container for toolbar-->
		  <div id="waypointControls">
		
		    <!--Use Tables to organize toolbar-->
		    <table align="center">
		      
		      <!--Title-->
		      <td width="60px">
		           <img id="smenutop" class="smenutop" src="<c:url value='/images/menu-top.png' />"   height="25" /> 
		      </td>
		      <td>
			    <p5 id="nowtime"></p5> 
			     
		      </td>
		      <!--Toolbar Tools-->
		      <td style="display:none;">
		        <form  >
		          <table>
		
		            <!--Toolbar Fields--> 
		            <tr>
		             <td>Waypoint:  <input type="number" min="1" max="1"  id="WaypointNumber" onchange="moveWaypoint()">    </td>
		             <td>Command:   <input type="text" size="9"           id="Command"        onchange="updateWaypoints()"> </td>
		             <td>Latitude:  <input type="text" size="9"           id="Latitude"       onchange="updateWaypoints()"> </td>
		             <td>Longitude: <input type="text" size="9"           id="Longitude"      onchange="updateWaypoints()"> </td>
		             <td>Altitude:  <input type="text" size="9"           id="Altitude"       onchange="updateWaypoints()"> </td>
		             <td>Raduis:    <input type="text" size="9"           id="Radius"         onchange="updateWaypoints()"> </td>
		            </tr>
		           
		            <tr>
		             <td>Waypoint:  <input type="number" min="1" max="1"  id="WaypointNumber2" >    </td>
		             <td>Command:   <input type="text" size="9"           id="Command2"     > </td>
		             <td>Latitude:  <input type="text" size="9"           id="Latitude2"      > </td>
		             <td>Longitude: <input type="text" size="9"           id="Longitude2"    > </td>
		             <td>Altitude:  <input type="text" size="9"           id="Altitude2"    > </td>
		             <td>Raduis:    <input type="text" size="9"           id="Radius2"    "> </td>
		            </tr>
		            
		
		         </table>
		       </form>
		      </td>
		
		      <!--Button to Export the Flight Plan-->
		      <td style="display:none;">
		        <button style="display: none;" onClick="exportList()">Export Flight Plan</button>
		      </td>
		
		     <!--Button to Download the Flight Plan-->
		     <td>
		       <a id="download" download="FlightPlan.waypoints" disabled="false" href="">
		
		        </a>
		     </td>
		     <td style="text-align:right;width:55px"> 
		       <img id="smenutop5" class="smenutop5" src="<c:url value='/images/battery.png' />"   height="25" />
		     </td>
		     <td style="text-align:center;width:55px"> 
		       <p5 id="nowtime2"></p5> 
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
		    </table>
		  </div>
	<!-- s :wrap -->
	<div id="wrap">
 

		<!-- s :right_guide -->
		<div class="right_guide3"> 
		     <div id="pngleft">
		       <ul style="margin-top:5px;"><img class="smenu0" id="smenu0" src="<c:url value='/images/route.png' />"  width="30" /></ul> 
		     </div>
		     
		     <div id="pngleft2">
		       <ul style="margin-top:10px;"><img class="smenu1" id="smenu1" src="<c:url value='/images/off.png' />" width="20" /></ul> 
               <ul style="margin-top:10px;"><img src="<c:url value='/images/wave.png' />"   width="20" /></ul>
               <ul style="margin-top:10px;"><img src="<c:url value='/images/play.png' />"   width="20" /></ul>
               <ul style="margin-top:10px;"><img src="<c:url value='/images/icon12.png' />"   width="20" /></ul>
               <ul style="margin-top:10px;"><img src="<c:url value='/images/icon13.png' />"   width="20" /></ul>
               <ul style="margin-top:10px;"><img src="<c:url value='/images/icon14.png' />"   width="20" /></ul> 
               <ul style="margin-top:10px;"><img src="<c:url value='/images/icon15.png' />"   width="20" /></ul> 
               <ul style="margin-top:10px;"><img class="smenu8" id="smenu8" src="<c:url value='/images/icon16.png' />"   width="20" /></ul> 
		     </div>
		     
		     <div id="pngright2">
		       <ul style="margin-top:5px;"><img class="smenu0" id="smenu0" src="<c:url value='/images/route.png' />"  width="30" /></ul> 
		     </div>
			     
		     <div id="pngright">  
				<div class="droneinfo"  >
					<div class="dronelist">
					    <table border="0" width="100%"  cellspacing="0" class="timecard">
								<colgroup>
									<col width = "33%">
									<col width = "33%">
									<col  >
								</colgroup>
								<thead>
									<tr>
										<th id="thDay" colspan="3"  ><p3 style="" id="lm_10001_dl_name"></p3></th> 
									</tr>
								</thead>
					            <tbody>
					                <tr align="center">
					                    <th><p31 style="color: #a0a0a0;">Status</p31></th>
					                    <th><p31 style="color: #a0a0a0;">Satelite Num</p31></th> 
					                    <th><p31 style="color: #a0a0a0;">Bat Voltage (V)</p31></th> 
					                </tr>
					                <tr align="center">
					                    <td><p3 style="color: #5FDC46;">READY</p3></td>
					                    <td><p3 style="color: #FFEB46;" id="lm_10001_st_satelite_num"></p3>  </td> 
					                    <td><p3 id="lm_10001_st_bat_voltage"></p3></td>
					                </tr>
					                <tr align="center"> 
					                    <th><p31 style="color: #a0a0a0;">Bat.Level (%)</p31> </th> 
					                    <th><p31 style="color: #a0a0a0;">Speed (m/s)</p31> </th>
					                    <th><p31 style="color: #a0a0a0;">Atitude (m)</p31> </th> 
					                </tr>
					                <tr align="center">
					                    <td><p3 id="lm_10001_st_bat_level"></p3></td>
					                    <td><p3 id="lm_10001_st_speed"></p3> </td> 
					                    <td><p3 id="lm_10001_st_atitude"></p3></td>
					                </tr> 
					            </tbody>
					        </table>
					</div>  
					<div class="dronelist">
					    <table border="0" width="100%"  cellspacing="5" class="timecard">
								<colgroup>
									<col width = "33%">
									<col width = "33%">
									<col  >
								</colgroup>
								<thead>
									<tr>
										<th id="thDay" colspan="3" ><p3 style="" id="lm_10002_dl_name"></p3></th> 
									</tr>
								</thead>
					            <tbody>
					                <tr align="center">
					                    <th><p31 style="color: #a0a0a0;">Status</p31></th>
					                    <th><p31 style="color: #a0a0a0;">Satelite Num</p31></th> 
					                    <th><p31 style="color: #a0a0a0;">Bat Voltage (V)</p31></th> 
					                </tr>
					                <tr align="center">
					                    <td><p3 style="color: #5FDC46;">READY</p3></td>
					                    <td><p3 style="color: #FFEB46;" id="lm_10002_st_satelite_num"></p3>  </td> 
					                    <td><p3 id="lm_10002_st_bat_voltage"></p3></td>
					                </tr>
					                <tr align="center"> 
					                    <th><p31 style="color: #a0a0a0;">Bat.Level (%)</p31> </th> 
					                    <th><p31 style="color: #a0a0a0;">Speed (m/s)</p31> </th>
					                    <th><p31 style="color: #a0a0a0;">Atitude (m)</p31> </th> 
					                </tr>
					                <tr align="center">
					                    <td><p3 id="lm_10002_st_bat_level"></p3></td>
					                    <td><p3 id="lm_10002_st_speed"></p3> </td> 
					                    <td><p3 id="lm_10002_st_atitude"></p3></td>
					                </tr> 
					            </tbody>
					        </table>
					</div>  
					<div class="dronelist">
					    <table border="0" width="100%"  cellspacing="5" class="timecard">
								<colgroup>
									<col width = "33%">
									<col width = "33%">
									<col  >
								</colgroup>
								<thead>
									<tr>
										<th id="thDay" colspan="3" ><p3 style="" id="lm_10003_dl_name"></p3></th> 
									</tr>
								</thead>
					            <tbody>
					                <tr align="center">
					                    <th><p31 style="color: #a0a0a0;">Status</p31></th>
					                    <th><p31 style="color: #a0a0a0;">Satelite Num</p31></th> 
					                    <th><p31 style="color: #a0a0a0;">Bat Voltage (V)</p31></th> 
					                </tr>
					                <tr align="center">
					                    <td><p3 style="color: #5FDC46;">READY</p3></td>
					                    <td><p3 style="color: #FFEB46;" id="lm_10003_st_satelite_num"></p3>  </td> 
					                    <td><p3 id="lm_10003_st_bat_voltage"></p3></td>
					                </tr>
					                <tr align="center"> 
					                    <th><p31 style="color: #a0a0a0;">Bat.Level (%)</p31> </th> 
					                    <th><p31 style="color: #a0a0a0;">Speed (m/s)</p31> </th>
					                    <th><p31 style="color: #a0a0a0;">Atitude (m)</p31> </th> 
					                </tr>
					                <tr align="center">
					                    <td><p3 id="lm_10003_st_bat_level"></p3></td>
					                    <td><p3 id="lm_10003_st_speed"></p3> </td> 
					                    <td><p3 id="lm_10003_st_atitude"></p3></td>
					                </tr> 
					            </tbody>
					        </table>
					</div>  
					<div class="dronelist">
					    <table border="0" width="100%"  cellspacing="5" class="timecard">
								<colgroup>
									<col width = "33%">
									<col width = "33%">
									<col  >
								</colgroup>
								<thead>
									<tr>
										<th id="thDay" colspan="3" ><p3 style="" id="lm_10004_dl_name"></p3></th> 
									</tr>
								</thead>
					            <tbody>
					                <tr align="center">
					                    <th><p31 style="color: #a0a0a0;">Status</p31></th>
					                    <th><p31 style="color: #a0a0a0;">Satelite Num</p31></th> 
					                    <th><p31 style="color: #a0a0a0;">Bat Voltage (V)</p31></th> 
					                </tr>
					                <tr align="center">
					                    <td><p3 style="color: #5FDC46;">READY</p3></td>
					                    <td><p3 style="color: #FFEB46;" id="lm_10004_st_satelite_num"></p3>  </td> 
					                    <td><p3 id="lm_10004_st_bat_voltage"></p3></td>
					                </tr>
					                <tr align="center"> 
					                    <th><p31 style="color: #a0a0a0;">Bat.Level (%)</p31> </th> 
					                    <th><p31 style="color: #a0a0a0;">Speed (m/s)</p31> </th>
					                    <th><p31 style="color: #a0a0a0;">Atitude (m)</p31> </th> 
					                </tr>
					                <tr align="center">
					                    <td><p3 id="lm_10004_st_bat_level"></p3></td>
					                    <td><p3 id="lm_10004_st_speed"></p3> </td> 
					                    <td><p3 id="lm_10004_st_atitude"></p3></td>
					                </tr> 
					            </tbody>
					        </table>
					</div>  
					  
				 </div>
 
		     </div>  
		
		      <!-- A container for the Cesium Viewer to live in. --> 
		        <div id="cesiumContainer"  ></div>
				<div id="loadingOverlay"><h1>Loading...</h1></div>
				<div id="toolbar"></div>
			 
				<script type="text/javascript" src="/cesium/js/cesium-scripts3.js"></script>
				 
		        <!-- Our app code. --> 
		        <script src="/cesium/lib/jscolor/jscolor.js"></script>
		
		        <!-- The Modal for Drawing Options -->
		        <div id="divModalDrawingOptions" class="modalOptions">
		            <!-- Modal content -->
		            <div class="modal-content">
		                <span class="modal-close" onclick="closeDrawingOptionsModal();">&times;</span>
		                <input id="modalDrawingOptionsId" type="hidden" value="" />
		                <h3 class="modal-title">Drawing Options</h3>
		                <div>Name: <br/>
		                    <input id="modalDrawingOptionsName" type="text" maxlength="100" size="60" />
		                </div><br />
		                <div>Color: <input id="modalDrawingOptionsColor" class="jscolor" value="00008b">
		                </div><br />
		                <div>Description: <br />
		                    <textarea id="modalDrawingOptionsDescription" cols="60" rows="4"></textarea>
		                </div>
		                <br /><br />
		                <button id="btnDrawingOptionsDraw" title="Draw the Shape" onclick="setDrawingOptions();">Draw</button> 
		                <button id="btnDrawingOptionsSave" title="Save the Information" style="display: none;" onclick="saveDrawingOptions();">Save</button> 
		                <button id="btnDrawingOptionsCancel" title="Cancel this window" onclick="cancelDrawingOptions();">Cancel</button> 
		            </div>
		        </div>
		         
		</div> 
		<!-- e :right_guide --> 
		
		<div id="pngbottom" style="whdth:500px">
		  <span id="topDiv" class="topDiv" style="color:white;whdth:500px"> </span>
		  <br>
		  <span id="topDiv2" class="topDiv" style="color:white;whdth:500p">  </span>
		</div>
		
		<div id="dialog2" class="ui-dialog-titlebar ui-widget-header" title="Log" style="font-size:12px;padding:0px;text-align:left;background-color:#861A1A;display:none;">
            
		    <!-- 
		     <textarea id="responseText" class="responseText" style="width:100%;height:100%;"></textarea>
		    -->
		</div>
	</div>
	<!-- e :wrap -->
	<script>
;(function() { 
 
})();
</script>
</body>
</html>
