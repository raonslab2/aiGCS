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
	  
	  <!-- left slider -->
	  <link rel="stylesheet" type="text/css" href="/js/wi/leftslider/css/jPushMenu.css" />
 
 
      
    <!-- Syntax coloration -->
    <link rel="stylesheet" type="text/css" href="/flight/_examples_data/prism/prism.css" />
    <!-- This page style -->
    <link rel="stylesheet" type="text/css" href="/flight/_examples_data/style.css" />
    <!-- Flight Indicators library styles -->
    <link rel="stylesheet" type="text/css" href="/flight/css/flightindicators.css" />
    
    <!-- slider -->
    <link rel=stylesheet href="/js/wi/slider/slider.css"/>

 
    <style>
      .context-menu-style {
        background: #373b4f;
      }
      .context-menu-style .scm-item:hover {
        background: #24283c;
      }
    </style>
</head> 
<body style="overflow-x: hidden;overflow-y: hidden">

    

<nav class="cbp-spmenu cbp-spmenu-vertical cbp-spmenu-left" style="margin-top:48px;">
<h3>Menu</h3>
<a href="#">Home</a>
<a href="#">About us</a>
<a href="#">Vision & Mission</a>
<a href="#">Services</a>
<a href="#">About our Product</a>
<a href="#">Contact us</a>
</nav> 
<script src="/js/wi/leftslider/js/jPushMenu.js"></script>
<script>
jQuery(document).ready(function($) {
$('.toggle-menu').jPushMenu();
});
</script>



<div id="waypoints-data" class="waypoints-data" style="display:none"><c:out value="${waypoints}"/></div>

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
<input id="menu11" name="menu11" type="hidden" value="0.07"  >
<input id="menu12" name="menu12" type="hidden" value="3.1"  >
<input id="menu13" name="menu13" type="hidden" value="1.0"  >
<input id="menu14" name="menu14" type="hidden" value=""  >

<input id="menu91" name="menu91" type="hidden" value=""  >
<input id="menu92" name="menu92" type="hidden" value=""  >
<input id="menu93" name="menu93" type="hidden" value=""  >

<%--
<form onsubmit="return false;">
<input type="text"  name="message" id="sendmessage" value="test message"/><input type="button" value="Send Web Socket Data"
       onclick="send(this.form.message.value)" onKeypress="javascript:if(event.keyCode==13) {send(this.form.message.value)}"/>
</form>
--%>

  
<!--Container for toolbar-->
 <div id="waypointControls">

   <!--Use Tables to organize toolbar-->
   <table align="center"  >
     
		      <td width="20px" height="40px">
		       <!--Title
		          <img id="smenutop" class="smenutop" src="<c:url value='/images/logo.png' />"   height="25" /> 
		          -->
		      </td>
     <td>
     <!--  
    <p5 id="nowtime"></p5> 
    -->
      <p5 style="margin-right:20px;"><a style="color:yellow" href="<c:url value='/gcs/dashboard/gA01Main.do'/>">FLIGHT</a></p5>
      <span style="color:white">|</span>
      <p5 style="margin-left:20px;margin-right:20px;"><a style="color:white" href="<c:url value='/gcs/dashboard/gA03Main.do'/>">PLAN</a></p5> 
      <span style="color:white">|</span>
      <p5 style="margin-left:20px;margin-right:20px;"><a style="color:white" id="smenutop6" class="smenutop6" href="<c:url value='#'/>">DATA</a></p5>  
      <span style="color:white">|</span>
      <p5 id="smenutop5" class="smenutop5" style="margin-left:20px;margin-right:20px;"><a style="color:white" id="smenutop6" class="smenutop6" href="<c:url value='#'/>">VIDEO</a></p5>  
     
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
      <a id="download" download="FlightPlan.waypoints" disabled="false" href="">

       </a>
    </td>
 
    <td style="text-align:center;width:35px"> 
       <img id="smenutop4" class="smenutop4" src="<c:url value='/images/dash1.png' />"   height="20" />
    </td>
    <td style="text-align:center;width:35px"> 
       <img  id="smenutop2" class="smenutop2 toggle-menu menu-left" src="<c:url value='/images/waypoint.png' />"   height="25" />
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
	<div id="wrap" class="default-theme">
 

		<!-- s :right_guide -->
		<div class="right_guide3" > 
		     
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
		       <table border="0" width="100px"  cellspacing="0">
		         <tr>
		           <td width="50px"><img class="smenu0" id="smenu0" src="<c:url value='/images/11.png' />"  style="height:35px" /></td>
		           <td width="50px"><img class="smenu0" id="smenu0" src="<c:url value='/images/12.png' />"  style="height:35px;" /></td>
		         </tr>
		       </table>
 
		       
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
										<th id="thDay" colspan="3" ><p3 style="" id="lm_10001_dl_name">STATE</p3></th> 
									</tr>
								</thead>
					            <tbody>
					                <tr align="center">
					                    <th><p31 style="color: #a0a0a0;">Status</p31></th>
					                    <th><p31 style="color: #a0a0a0;">Satelite Num</p31></th> 
					                    <th><p31 style="color: #a0a0a0;">Bat Voltage (V)</p31></th> 
					                </tr>
					                <tr align="center">
					                    <td><p3 id="lm_10001_st_state" style="color: #5FDC46;font-size:13px"></p3></td>
					                    <td><p3 style="color: #FFEB46;" id="lm_10001_st_satelite_num">0</p3>  </td> 
					                    <td><p3 id="lm_10001_st_bat_voltage">0</p3></td>
					                </tr>
					                <tr align="center"> 
					                    <th><p31 style="color: #a0a0a0;">Bat.Level (%)</p31> </th> 
					                    <th><p31 style="color: #a0a0a0;">Speed (m/s)</p31> </th>
					                    <th><p31 style="color: #a0a0a0;">Atitude (m)</p31> </th> 
					                </tr>
					                <tr align="center">
					                    <td><p3 id="lm_10001_st_bat_level">0</p3></td>
					                    <td><p3 id="lm_10001_st_speed">0</p3> </td> 
					                    <td><p3 id="lm_10001_st_atitude">0</p3></td>
					                </tr> 
					            </tbody>
					        </table>
					</div>   
					<div class="dronelist">
					    <table border="0" width="100%"  cellspacing="0" class="timecard">
								<colgroup>
									<col width = "33%">
									<col width = "33%">
									<col  >
								</colgroup>
								<thead>
									<tr>
										<th id="thDay" colspan="3" ><p3 style="" id="lm_10002_dl_name">STATE</p3></th> 
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
					                    <td><p3 style="color: #FFEB46;" id="lm_10002_st_satelite_num">0</p3>  </td> 
					                    <td><p3 id="lm_10002_st_bat_voltage">0</p3></td>
					                </tr>
					                <tr align="center"> 
					                    <th><p31 style="color: #a0a0a0;">Bat.Level (%)</p31> </th> 
					                    <th><p31 style="color: #a0a0a0;">Speed (m/s)</p31> </th>
					                    <th><p31 style="color: #a0a0a0;">Atitude (m)</p31> </th> 
					                </tr>
					                <tr align="center">
					                    <td><p3 id="lm_10002_st_bat_level">0</p3></td>
					                    <td><p3 id="lm_10002_st_speed">0</p3> </td> 
					                    <td><p3 id="lm_10002_st_atitude">0</p3></td>
					                </tr> 
					            </tbody>
					        </table>
					</div>   
					<div class="dronelist">
					    <table border="0" width="100%"  cellspacing="0" class="timecard">
								<colgroup>
									<col width = "33%">
									<col width = "33%">
									<col  >
								</colgroup>
								<thead>
									<tr>
										<th id="thDay" colspan="3" ><p3 style="" id="lm_10003_dl_name">STATE</p3></th> 
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
					                    <td><p3 style="color: #FFEB46;" id="lm_10003_st_satelite_num">0</p3>  </td> 
					                    <td><p3 id="lm_10003_st_bat_voltage">0</p3></td>
					                </tr>
					                <tr align="center"> 
					                    <th><p31 style="color: #a0a0a0;">Bat.Level (%)</p31> </th> 
					                    <th><p31 style="color: #a0a0a0;">Speed (m/s)</p31> </th>
					                    <th><p31 style="color: #a0a0a0;">Atitude (m)</p31> </th> 
					                </tr>
					                <tr align="center">
					                    <td><p3 id="lm_10003_st_bat_level">0</p3></td>
					                    <td><p3 id="lm_10003_st_speed">0</p3> </td> 
					                    <td><p3 id="lm_10003_st_atitude">0</p3></td>
					                </tr> 
					            </tbody>
					        </table>
					</div>   
					<div class="dronelist">
					    <table border="0" width="100%"  cellspacing="0" class="timecard">
								<colgroup>
									<col width = "33%"> 
									<col  >
								</colgroup>
								<thead>
									<tr>
										<th  colspan="2" ><p3 style="" >ACTION</p3></th> 
									</tr>
								</thead>
					            <tbody>
					                <tr align="center" height="50px">
					                    <td ><p3><button type="button" onclick="javascript:fn_droneAction(this,'arm'); return false;" class="btn_style03 btn_green btnMoveReg">Arm</button></p3></td>
					                    <td><p3><button style='margin-left:2px;' type="button" onclick="javascript:fn_droneAction(this,'disarm'); return false;" class="btn_style03 btn_red btnMoveReg">DisArm</button></p3> </td> 
					                    
					                </tr> 
					                <tr align="center" height="50px">
					                    <td><p3  ><button style='margin-left:2px;' type="button" onclick="javascript:fn_droneAction(this,'takeoff'); return false;" class="btn_style03 btn_blue btnMoveReg">TakeOff</button></p3></td>
					                    <td><p3 ><button style='margin-left:2px;' type="button" onclick="javascript:fn_droneAction(this,'land'); return false;" class="btn_style03 btn_blue btnMoveReg">Land</button></p3></td> 
					                </tr> 
					                <tr align="center" height="50px">
					                    <td><p3  ><button type="button" onclick="javascript:fn_droneAction(this,'auto'); return false;" class="btn_style03 btn_green btnMoveReg">auto</button></p3></td> 
					                    <td><p3  ><button style='margin-left:2px;' type="button" onclick="javascript:fn_droneAction(this,'rtl'); return false;" class="btn_style03 btn_red btnMoveReg">RTL</button></p3></td> 
					                    
					                </tr>
					                <tr align="center" height="45px">  
					                    <td colspan="2"><p3 >AUTO MODE</p3></td>
					                </tr> 
					            </tbody>
					        </table>
					</div>  
		 
						
						<div class="dronelist">
						   <span id="attitude"></span>
						</div>
					  
				 </div>
 
		     </div>  
		
		      <!-- A container for the Cesium Viewer to live in. --> 
		        <div id="cesiumContainer"  ></div>
				<div id="loadingOverlay"><h1>Loading...</h1></div> 
			    <div id="toolbar">
			      <div id="interpolationMenu"></div>
			    </div>

				
				 <script src="/cesium/js/cesium-scripts11.js"></script> 
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
	  
 
			<div id="dialog2" class="ui-dialog-titlebar ui-widget-header" title="Drone" style="font-size:16px;padding:0px;text-align:center;background: linear-gradient(0deg,rgba(19, 27, 19, 0.8),rgba(19, 27, 19, 0.8)), url('Image URL');display:none;">
				<table width="100%">
				  <tr>
				     <td><input type="text" class="slider1" id="slider1" name=slider1 text="Height M" color="#ffc8c7" min=10 max=150>
				     </td>
				  </tr>
				  <tr>
				     <td><input type="text" class="slider1" id="slider2" name=slider2 text="Ground m/s" color="#ffc8c7" min=3 max=15>
				     </td>
				  </tr>
				</table> 
			</div>
	 
		 
		


	</div>
	<!-- e :wrap -->
	

	<script>
;(function() { 
 
})();
</script>

<!-- Syntax color -->
<script src="/flight/_examples_data/prism/prism.js"></script>

 

<!-- Importing the FlightIndicators library -->
<script src="/flight/js/jquery.flightindicators.js"></script>
<!-- Let start our scripts -->
<script type="text/javascript">
// First static example
var first_attitude = $.flightIndicator('#first_attitude', 'attitude', {size:350, roll:8, pitch:3, showBox : true});
// Dynamic examples
var attitude = $.flightIndicator('#attitude', 'attitude', {roll:50, pitch:-20, size:200, showBox : true});
var heading = $.flightIndicator('#heading', 'heading', {heading:150, showBox:true});
var variometer = $.flightIndicator('#variometer', 'variometer', {vario:-5, showBox:true});
var airspeed = $.flightIndicator('#airspeed', 'airspeed', {showBox: false});
var altimeter = $.flightIndicator('#altimeter', 'altimeter');
var turn_coordinator = $.flightIndicator('#turn_coordinator', 'turn_coordinator', {turn:0});

// Update at 20Hz
var increment = 0;
setInterval(function() { 
    // Airspeed update
    airspeed.setAirSpeed(80+80*Math.sin(increment/10));

    // Attitude update
    //attitude.setRoll(30*Math.sin(increment/10));
    //attitude.setPitch(50*Math.sin(increment/20));
    attitude.setRoll($('#menu11').val());
    attitude.setPitch($('#menu12').val());

    // Altimeter update
    //altimeter.setAltitude(10*increment);
    altimeter.setAltitude(0);
    altimeter.setPressure(1000+3*Math.sin(increment/50));
    increment++;
    
    // TC update - note that the TC appears opposite the angle of the attitude indicator, as it mirrors the actual wing up/down position
    turn_coordinator.setTurn((30*Math.sin(increment/10))*-1);

    // Heading update
    heading.setHeading(increment);
    
    // Vario update
    variometer.setVario(2*Math.sin(increment/10));
}, 50);
</script>

  
<script type="text/javascript" src="/js/wi/slider/sliders.js"></script>
</body>
</html>
