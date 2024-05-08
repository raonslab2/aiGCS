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
        <link href="<c:url value="/cesium/css/index.css" />" media="screen" rel="stylesheet"> 
	  <!--Style-->
	  <link rel="stylesheet" type="text/css" href="<c:url value="/cesium/css/Waypoint.css"/>">
	  <link rel="stylesheet" type="text/css" href="<c:url value="/cesium/websocket/css/index01.css"/>">
	  <script type="text/javascript" src="<c:url value="/cesium/js/pop-up.js"/>"></script>
	  <script type="text/javascript" src="<c:url value="/cesium/websocket/layout01.js"/>"></script>
	  <script type="text/javascript" src="<c:url value="/cesium/websocket/websocket01.js"/>"></script>
	  
	  <!-- left slider -->
	  <link rel="stylesheet" type="text/css" href="<c:url value="/js/wi/leftslider/css/jPushMenu.css"/>" />
 
 
      
    <!-- Syntax coloration -->
    <link rel="stylesheet" type="text/css" href="<c:url value="/flight/_examples_data/prism/prism.css"/>" />
    <!-- This page style -->
    <link rel="stylesheet" type="text/css" href="<c:url value="/flight/_examples_data/style.css"/>" />
    <!-- Flight Indicators library styles -->
    <link rel="stylesheet" type="text/css" href="<c:url value="/flight/css/flightindicators.css"/>" />
    
    <!-- slider -->
    <link rel=stylesheet href="<c:url value="/js/wi/slider/slider.css"/>"/>

 
    <style>
      .context-menu-style {
        background: #373b4f;
      }
      .context-menu-style .scm-item:hover {
        background: #24283c;
      }
      
    </style>
    
	<script type="text/javascript">
 
	</script>
</head> 
<body style="overflow-x: hidden;overflow-y: hidden">

<div id="dia_rs" style="display:none;color: #00ff00;"><span style="color: #00ff00;">Go to Here??!!</span></div>

<nav class="cbp-spmenu cbp-spmenu-vertical cbp-spmenu-left toggle-menu menu-left" style="margin-top:48px;">
<h3 >Drone Path</h3>
 
<div id="resultList"></div>
</nav> 
<script src="<c:url value="/js/wi/leftslider/js/jPushMenu.js"/>"></script>
<script>
jQuery(document).ready(function($) {
$('.toggle-menu').jPushMenu();
});
</script>



<div id="waypoints-data" class="waypoints-data" style="display:none"><c:out value="${waypoints}"/></div>
<input id="leftslide" name="leftslide" type="hidden" value="0"  >
<input id="drone_select" name="drone_select" type="hidden" value=""  >
<input id="path_1001" name="path_1001" type="hidden" value=""  >
<input id="path_1002" name="path_1002" type="hidden" value=""  >
<input id="path_1003" name="path_1003" type="hidden" value=""  >
<input id="path_1004" name="path_1004" type="hidden" value=""  >
<input id="path_1005" name="path_1005" type="hidden" value=""  >

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

<input id="menu11" name="menu11" type="hidden" value="0"  >
<input id="menu12" name="menu12" type="hidden" value="0"  > 
<input id="menu21" name="menu21" type="hidden" value="0"  >
<input id="menu22" name="menu22" type="hidden" value="0"  > 
<input id="menu31" name="menu31" type="hidden" value="0"  >
<input id="menu32" name="menu32" type="hidden" value="0"  > 
<input id="menu41" name="menu41" type="hidden" value="0"  >
<input id="menu42" name="menu42" type="hidden" value="0"  > 
<input id="menu51" name="menu51" type="hidden" value="0"  >
<input id="menu52" name="menu52" type="hidden" value="0"  > 

<input id="menu13" name="menu13" type="hidden" value="1.0"  >

<input id="menu14" name="menu14" type="hidden" value="0"  >
<input id="menu24" name="menu24" type="hidden" value="0"  >
<input id="menu34" name="menu34" type="hidden" value="0"  >
<input id="menu44" name="menu44" type="hidden" value="0"  >
<input id="menu54" name="menu54" type="hidden" value="0"  >

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
     
		      <td width="1px" height="40px">
		       <!--Title
		          <img id="smenutop" class="smenutop" src="<c:url value='/images/list_icon.png' />"   height="100" /> 
		          -->
		      </td>
     <td>
     <!--  
    <p5 id="nowtime"></p5> 
    --> 
        <img id="smenutop" class="smenutop" src="<c:url value='/images/list_icon.jpg' />"   height="40" /> 
        <img id="topMenu0" class="topMenu0" src="<c:url value='/images/top_config.jpg' />"   height="40" /> 
		<select id="topdevie" name="topdevie" style="margin-left:5px;background-color:black;color: #FFF8DC;text-align:center">
		  <option  value="no">No device</option>
		  <option value="lm_10001">DRONE1</option>
		  <option value="lm_10002">DRONE2</option>
		  <option value="lm_10003">DRONE3</option>
		  <option value="lm_10004">DRONE4</option>
		  <option value="lm_10005">DRONE5</option>
		</select>  
		 
		<input id="topMenu2" type="text" value="DISARMED" readonly style="background-color:black;color: #FFF8DC;text-align:center" size="7" />
        <img id="smenutop2" class="smenutop2  toggle-menu menu-left" style="margin-left:10px;"   src="<c:url value='/images/top_data.png' />"   height="35" />
        <img id="smenutop21" class="smenutop21  toggle-menu menu-left" style="margin-left:10px;"   src="<c:url value='/images/pathdown.jpg' />"   height="35" />

        <img id="topMenu3" class="topMenu3" src="<c:url value='/images/top_time.jpg' />"   height="35" /> 
         <p5 id="nowtime2" ></p5> 
        <img id="topMenu4" style="margin-left:1px;" class="topMenu4" src="<c:url value='/images/top_control.jpg' />"   height="45" />
        <img id="topMenu5" style="margin-left:1px;" class="topMenu4" src="<c:url value='/images/top_signal.png' />"   height="45" />
         <span style="color:white">14</span> 
     </td>
     <!--Toolbar Tools-->
     <td width="500px;text-align:center"> 
        <p5 id="menu1001" style="color: #5FDC46;font-size:13px"></p5>   
     </td> 
  
    <!--Button to Download the Flight Plan-->
    <td>
        <p5 id="smenutop91" class="smenutop91" style="color: #5FDC46;font-size:13px"><a href="#">Tile01</a></p5> 
    </td>
     <td>
        <p5 id="smenutop92" class="smenutop92" style="color: #5FDC46;font-size:13px"><a href="#">Tile02</a></p5> 
    </td>
    <td style="text-align:center;width:35px"> 
       <img id="smenutop4" class="smenutop4" src="<c:url value='/images/dash1.png' />"   height="20" />
    </td>
    <td style="text-align:center;width:35px"> 
       <img id="smenutop44" class="smenutop44"  src="<c:url value='/images/waypoint.png' />"   height="25" />
    </td>
    <td style="text-align:center;width:35px"> 
       <img id="smenutop444" class="smenutop444" src="<c:url value='/images/setting.png' />"   height="20" />
    </td>
    <td style="text-align:center;width:35px"> 
       <img id="smenutop9" class="smenutop9" src="<c:url value='/images/logout.png' />"   height="25" />
    </td>
 
   </table>
 </div>
	<!-- s :wrap -->
	<div id="wrap" class="default-theme">
 

		<!-- s :right_guide -->
		<div class="right_guide3" > 
		     
		     <div id="pngleft2"> 
               <ul style="margin-top:10px;"><img src="<c:url value='/images/wave.png' />"   width="20" /></ul>
               <ul style="margin-top:10px;"><img src="<c:url value='/images/play.png' />"   width="20" /></ul>
               <ul style="margin-top:10px;"><img src="<c:url value='/images/icon12.png' />"   width="20" /></ul>
               <ul style="margin-top:10px;"><img src="<c:url value='/images/icon13.png' />"   width="20" /></ul>
               <ul style="margin-top:10px;"><img src="<c:url value='/images/icon14.png' />"   width="20" /></ul> 
               <ul style="margin-top:10px;"><img src="<c:url value='/images/icon15.png' />"   width="20" /></ul> 
               <ul style="margin-top:10px;"><img class="smenu8" id="smenu8" src="<c:url value='/images/icon16.png' />"   width="20" /></ul> 
		     </div>
		     
		     <div id="checkDrone1"  style=" background-color: #f5d682;border: 3px solid #006400;">  
		        
		       <table border="0"   style="margin-top:-12px" cellspacing="0"> 
		         <tr>
		           <td><img style="margin-top:15px;" class="d_1_1" id="d_1_1" src="<c:url value='/images/drone.png' />"  style="width:70px" /></td>
		           <td><img class="d_1_2" id="d_1_2" src="<c:url value='/images/antenna_signal.png' />"  style="height:37px;" /></td>
		           <td><img class="d_1_3" id="d_1_3" src="<c:url value='/images/top_signal2.jpg' />"  style="height:35px;" /></td>
		           <td><img class="d_1_4" id="d_1_4" src="<c:url value='/images/top_signal3.jpg' />"  style="height:35px;" /></td>
		         </tr>
		       </table> 
		     </div>
		      
		     <div id="checkDrone2"  style=" background-color: #f5d682;border: 3px solid #006400;">  
		       <table border="0" style="margin-top:-12px"  cellspacing="0">
		         <tr>
		           <td><img style="margin-top:15px;" class="d_2_1" id="d_2_1" src="<c:url value='/images/drone.png' />"  style="width:70px" /></td>
		           <td><img class="d_2_2" id="d_2_2" src="<c:url value='/images/antenna_signal.png' />"  style="height:37px;" /></td>
		           <td><img class="d_2_3" id="d_2_3" src="<c:url value='/images/top_signal2.jpg' />"  style="height:35px;" /></td>
		           <td><img class="d_2_4" id="d_2_4" src="<c:url value='/images/top_signal3.jpg' />"  style="height:35px;" /></td>
		         </tr>
		       </table> 
		     </div>
		     
		     <div id="checkDrone3" style=" background-color: #f5d682;border: 3px solid #006400;">  
		       <table border="0" style="margin-top:-12px"  cellspacing="0">
		         <tr>
		           <td><img style="margin-top:15px;" class="d_3_1" id="d_3_1" src="<c:url value='/images/drone.png' />"  style="width:70px" /></td>
		           <td><img class="d_3_2" id="d_3_2" src="<c:url value='/images/antenna_signal.png' />"  style="height:37px;" /></td>
		           <td><img class="d_3_3" id="d_3_3" src="<c:url value='/images/top_signal2.jpg' />"  style="height:35px;" /></td>
		           <td><img class="d_3_4" id="d_3_4" src="<c:url value='/images/top_signal3.jpg' />"  style="height:35px;" /></td>
		         </tr>
		       </table> 
		     </div>
		     
		     <div id="checkDrone4" style=" background-color: #f5d682;border: 3px solid #006400;">  
		       <table border="0" style="margin-top:-12px"  cellspacing="0">
		         <tr>
		           <td><img style="margin-top:15px;" class="d_4_1" id="d_4_1" src="<c:url value='/images/drone.png' />"  style="width:70px" /></td>
		           <td><img class="d_4_2" id="d_4_2" src="<c:url value='/images/antenna_signal.png' />"  style="height:37px;" /></td>
		           <td><img class="d_4_3" id="d_4_3" src="<c:url value='/images/top_signal2.jpg' />"  style="height:35px;" /></td>
		           <td><img class="d_4_4" id="d_4_4" src="<c:url value='/images/top_signal3.jpg' />"  style="height:35px;" /></td>
		         </tr>
		       </table> 
		     </div>
		     
		     <div id="checkDrone5" style=" background-color: #f5d682;border: 3px solid #006400;">  
		       <table border="0" style="margin-top:-12px"  cellspacing="0">
		         <tr>
		           <td><img style="margin-top:15px;" class="d_5_1" id="d_5_1" src="<c:url value='/images/drone.png' />"  style="width:70px" /></td>
		           <td><img class="d_5_2" id="d_5_2" src="<c:url value='/images/antenna_signal.png' />"  style="height:37px;" /></td>
		           <td><img class="d_5_3" id="d_5_3" src="<c:url value='/images/top_signal2.jpg' />"  style="height:35px;" /></td>
		           <td><img class="d_5_4" id="d_5_4" src="<c:url value='/images/top_signal3.jpg' />"  style="height:35px;" /></td>
		         </tr>
		       </table> 
		     </div>
		     
			<!-- bottom log --> 
		     <div id="checkDroneDetail" >  
		       <table width="100%"   style="color: white; padding:1px;margin-top:5px;" > 
				  <colgroup>
				    <col width="25%" /> 
				    <col width="25%" /> 
				    <col width="25%" />  
				    <col width="25%" /> 
				  </colgroup>
				 <thead>
				    <tr>
				      <td style="text-align: center;color:#C8C5C3;" colspan="2"><p5>DRONE INFO</p5></td>  
				     <td style="text-align: right;color:#C8C5C3;" colspan="2"><p5><a style="color:white" class="logopenclose2" href="<c:url value='#'/>">close</a></p5></td>
				    </tr>
				    <tr>
				      <td colspan="2"  style="text-align: center;"><span id="attitude"></span></td>  
				      <td colspan="2"  style="text-align: center;"><span id="variometer"></span></td> 
				    </tr>
				    <tr>
				      <td ><p5 style="color:#C8C5C3;">
				        Roll <br>
				        Pitch <br>
				        Yaw <br>
				      </p5></td>  
				      <td ><p5 style="color:#C8C5C3;">
				        <span id="d_roll">0.00</span><br>
				        <span id="d_pitch">0.00</span><br>
				        <span id="d_yaw">0.00</span><br>
				      </p5></td>  
				      <td><p5 style="color:#C8C5C3;">
				        Roll <br>
				        Pitch <br>
				        Head <br>
				      </p5></td>   
				      <td><p5 style="color:#C8C5C3;">
				        0.00 <br>
				        0.00<br>
				        0.00 <br>
				      </p5></td>   
				    </tr>
				    <tr> 
				      <td colspan="2"  style="text-align: center;"><span id="airspeed"></span></td>   
				      <td colspan="2"  style="text-align: center;"><span id="altimeter"></span></td>  
				    </tr>
				    <tr> 
				      <td colspan="2">
				         <p5 style="color:#C8C5C3;">
				          Battery <br>
				          <input id="droneBatteryInfo" type="text" value="96%" readonly style="outline-style: solid;outline-color: #2C2725;background-color:#2C2725;color: #FFF8DC;text-align:center" size="3" />
				         </p5>   
  
				      </td>  
				      <td colspan="2">
				         <p5 style="color:#C8C5C3;">
				          Altitude <br>
				          <input id="droneAltitudeInfo" type="text" value="620.5 m" readonly style="background-color:#2C2725;color: #FFF8DC;text-align:center" size="3" />
				         </p5>
				      </td>  
				    </tr> 
				    <tr>  
				    <tr> 
				      <td colspan="4">
				         <p5 style="color:#C8C5C3;">
				           <input type="text" class="slider1" id="slider1" name=slider1 text="Height M" color="#ffc8c7" min=16 max=150>
				         </p5>
				      </td>   
				    </tr>
				    <tr> 
				      <td colspan="4">
				         <p5 style="color:#C8C5C3;margin-top:-30px;">
				            <input  type="text" class="slider1" id="slider2" name=slider2 text="Ground m/s" color="#ffc8c7" min=3 max=15>
				         </p5>
				      </td>   
				    </tr>  
				  </thead> 
		       </table>
		
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
					<div class="dronelist" id="a10001">
					    <table border="0" width="100%"  cellspacing="0" class="timecard">
								<colgroup>
									<col width = "33%">
									<col width = "33%">
									<col  >
								</colgroup> 
								<thead>
									<tr>
										<th id="thDay" colspan="3" ><p3 id="lm_10001_alias"></p3> / <p3 id="lm_10001_alias2"></p3></th> 
									</tr>
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
					<div class="dronelist" id="a10002">
					    <table border="0" width="100%"  cellspacing="0" class="timecard">
								<colgroup>
									<col width = "33%">
									<col width = "33%">
									<col  >
								</colgroup>
								<thead>
									<tr>
										<th id="thDay" colspan="3" ><p3 id="lm_10002_alias"></p3> / <p3 id="lm_10002_alias2"></p3></th> 
									</tr>
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
					                    <td><p3 id="lm_10002_st_state" style="color: #5FDC46;font-size:13px">READY</p3></td>
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
					<div class="dronelist" id="a10003" >
					    <table border="0" width="100%"  cellspacing="0" class="timecard">
								<colgroup>
									<col width = "33%">
									<col width = "33%">
									<col  >
								</colgroup>
								<thead>
									<tr>
										<th id="thDay" colspan="3" ><p3 id="lm_10003_alias"></p3> / <p3 id="lm_10003_alias2"></p3></th> 
									</tr>
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
					                    <td><p3 id="lm_10003_st_state" style="color: #5FDC46;font-size:13px">READY</p3></td>
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
					<div class="dronelist" id="a10004">
					    <table border="0" width="100%"  cellspacing="0" class="timecard">
								<colgroup>
									<col width = "33%">
									<col width = "33%">
									<col  >
								</colgroup>
								<thead>
									<tr>
										<th id="thDay" colspan="3" ><p3 id="lm_10004_alias"></p3> / <p3 id="lm_10004_alias2"></p3></th> 
									</tr>
									<tr>
										<th id="thDay" colspan="3" ><p3 style="" id="lm_10004_dl_name">STATE</p3></th> 
									</tr>
								</thead>
					            <tbody>
					                <tr align="center">
					                    <th><p31 style="color: #a0a0a0;">Status</p31></th>
					                    <th><p31 style="color: #a0a0a0;">Satelite Num</p31></th> 
					                    <th><p31 style="color: #a0a0a0;">Bat Voltage (V)</p31></th> 
					                </tr>
					                <tr align="center">
					                    <td><p3 id="lm_10004_st_state" style="color: #5FDC46;font-size:13px">READY</p3></td>
					                    <td><p3 style="color: #FFEB46;" id="lm_10004_st_satelite_num">0</p3>  </td> 
					                    <td><p3 id="lm_10004_st_bat_voltage">0</p3></td>
					                </tr>
					                <tr align="center"> 
					                    <th><p31 style="color: #a0a0a0;">Bat.Level (%)</p31> </th> 
					                    <th><p31 style="color: #a0a0a0;">Speed (m/s)</p31> </th>
					                    <th><p31 style="color: #a0a0a0;">Atitude (m)</p31> </th> 
					                </tr>
					                <tr align="center">
					                    <td><p3 id="lm_10004_st_bat_level">0</p3></td>
					                    <td><p3 id="lm_10004_st_speed">0</p3> </td> 
					                    <td><p3 id="lm_10004_st_atitude">0</p3></td>
					                </tr> 
					            </tbody>
					        </table>
					</div>   
					<div class="dronelist" id="a10005" >
					    <table border="0" width="100%"  cellspacing="0" class="timecard">
								<colgroup>
									<col width = "33%">
									<col width = "33%">
									<col  >
								</colgroup>
								<thead>
									<tr>
										<th id="thDay" colspan="3" ><p3 id="lm_10005_alias"></p3> / <p3 id="lm_10005_alias2"></p3></th> 
									</tr>
									<tr>
										<th id="thDay" colspan="3" ><p3 style="" id="lm_10005_dl_name">STATE</p3></th> 
									</tr>
								</thead>
					            <tbody>
					                <tr align="center">
					                    <th><p31 style="color: #a0a0a0;">Status</p31></th>
					                    <th><p31 style="color: #a0a0a0;">Satelite Num</p31></th> 
					                    <th><p31 style="color: #a0a0a0;">Bat Voltage (V)</p31></th> 
					                </tr>
					                <tr align="center">
					                    <td><p3 id="lm_10005_st_state" style="color: #5FDC46;font-size:13px">READY</p3></td>
					                    <td><p3 style="color: #FFEB46;" id="lm_10005_st_satelite_num">0</p3>  </td> 
					                    <td><p3 id="lm_10005_st_bat_voltage">0</p3></td>
					                </tr>
					                <tr align="center"> 
					                    <th><p31 style="color: #a0a0a0;">Bat.Level (%)</p31> </th> 
					                    <th><p31 style="color: #a0a0a0;">Speed (m/s)</p31> </th>
					                    <th><p31 style="color: #a0a0a0;">Atitude (m)</p31> </th> 
					                </tr>
					                <tr align="center">
					                    <td><p3 id="lm_10005_st_bat_level">0</p3></td>
					                    <td><p3 id="lm_10005_st_speed">0</p3> </td> 
					                    <td><p3 id="lm_10005_st_atitude">0</p3></td>
					                </tr> 
					            </tbody>
					        </table>
					</div>     
       
				 </div>
 
		     </div>  
		     
			<!-- bottom log --> 
		     <div id="bottomLog" >  
		       <table width="100%"   style="color: white; padding:5px;margin-top:5px;" > 
				  <colgroup>
				    <col width="100px" /> 
				    <col/> 
				    <col width="100px"   />
				  </colgroup>
				 <thead>
				    <tr>
				      <td style="text-align: center;"><p5>LOG List</p5></td> 
				      <td> </td> 
				     <td style="text-align: right;"><p5><a style="color:white" class="logopenclose" href="<c:url value='#'/>">close</a></p5></td>
				    </tr>
				    <tr>
				      <td colspan="3"><p5 style="color:white;">03-05-2023 10.:10:02 MISSION : MAV DATA M-12001 Start Mission</p5></td>  
				    </tr>
				    <tr>
				      <td colspan="3"><p5 style="color:white;">03-05-2023 10.:10:21 <span style="color:red">WARMING : MAV DATA M-12001 Data Loding Erro</span></p5></td>  
				    </tr>
				    <tr>
				      <td colspan="3"><p5 style="color:white;">03-05-2023 10.:11:02 <span style="color:yellow">MISSION : MAV DATA M-12001 take off</p5></td>  
				    </tr>
				    <tr>
				      <td colspan="3"><p5 style="color:white;">03-05-2023 10.:12:02 <span style="color:yellow">MISSION : MAV DATA M-12001 drone read</p5></td>  
				    </tr>
				    <tr>
				      <td colspan="3"><p5 style="color:white;">03-05-2023 10.:12:02 <span style="color:white;">MISSION : MAV DATA M-12001 drone read</p5></td>  
				    </tr>
				  </thead> 
		       </table>
		
		     </div>
		     
			<!-- bottom menu --> 
		     <div id="bottomMenuList" >  
		       <table width="100%" heiht="30px" style="color: white; padding:5px;margin-top:5px;" > 
				  <colgroup>
				    <col width="100px" style="background: #9B3822; " />
				    <col/> 
				    <col width="100px"  />
				    <col width="100px"   />
				    <col width="100px"   />
				    <col width="100px"   />
				    <col width="100px"   />
				    <col width="100px"   />
				    <col width="100px"   />
				  </colgroup>
				 <thead>
				    <tr>
				      <td class="logopenclose" style="text-align: center;"><p5><a style="color:white" href="<c:url value='#'/>">LOG</a></p5></td>
				      <td> </td>
				      
				     <td style="text-align:center;"> <p5><a style="color:white" href="<c:url value='/gcs/dashboard/gA01Main.do'/>">GCS RELOAD</a></p5></td> 
				     <td style="text-align:center;"><p5><a style="color:white" id="smenu1" class="smenu1" href="<c:url value='#'/>">Control</a></p5></td>
				     <td style="text-align:center;"><p5><a style="color:white" id="smenutop6" class="smenutop6" href="<c:url value='#'/>">All Data</a></p5></td>
				     <td style="text-align:center;"><p5><a style="color:white" id="smenutop5" class="smenutop5" href="<c:url value='#'/>">Camera</a></p5></td>
				     <td style="text-align:center;"><p5>ABS-B</p5></td> 
				     <td style="text-align:center;"><p5><a style="color:white" id="smenutop7" class="smenutop7" href="<c:url value='#'/>">PLAN</a></p5></td>
				     <td style="text-align:center;"><p5><a style="color:white" id="smenutop8" class="smenutop8" href="<c:url value='#'/>">SWARM</a></p5></td>
	 
				    </tr>
				  </thead> 
		       </table>
		
		     </div>
				
		      <!-- A container for the Cesium Viewer to live in. --> 
		        <div id="cesiumContainer"  ></div>
				<div id="loadingOverlay"><h1>Loading...</h1></div> 
			    <div id="toolbar">
			      <div id="interpolationMenu"></div>
			    </div>

				
				 <script src="<c:url value='/cesium/js/cesium-scripts1.js'/>"/></script> 
		        <!-- Our app code. --> 
		        <script src="<c:url value='/cesium/lib/jscolor/jscolor.js'/>"/></script>
		
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
	  
 
			<div id="dialog2" class="ui-dialog-titlebar ui-widget-header ui-style" title="Drone Control" style="font-size:12px;padding:0px;text-align:center;background: linear-gradient(0deg,rgba(19, 27, 19, 0.8),rgba(19, 27, 19, 0.8)), url('Image URL');display:none;">
			  <table width="100%"  height="70">
			    <caption></caption>
			    <colgroup><col style="width:120px;text-align:center"><col><col><col><col></colgroup>
			    
			    <tbody>
			      <tr>
			         <td rowspan="2">
							<select name="menu999" id="menu999">
							  <option value="lm_10001">DRONE1</option>
							  <option value="lm_10002">DRONE2</option>
							  <option value="lm_10003">DRONE3</option>
							  <option value="lm_10004">DRONE4</option>
							  <option value="lm_10005">DRONE5</option>
							</select>
			         </td>
			         <td>
			            <p3><button type="button" onclick="javascript:fn_droneAction(this,'arm'); return false;" class="btn_style03 btn_green btnMoveReg">Arm</button></p3>
			         </td>
			         <td>
			            <p3><button style='margin-left:2px;' type="button" onclick="javascript:fn_droneAction(this,'takeoff'); return false;" class="btn_style03 btn_green btnMoveReg">TakeOff</button></p3>
			         </td>
			         <td>
			            <p3><p3 ><button style='margin-left:2px;' type="button" onclick="javascript:fn_droneAction(this,'goto'); return false;" class="btn_style03 btn_green btnMoveReg">Go To</button></p3></p3>
			         </td>
			         <td>
			            <p3><p3 ><button style='margin-left:2px;' type="button" onclick="javascript:fn_droneAction(this,'land'); return false;" class="btn_style03 btn_green btnMoveReg">Land</button></p3></p3>
			         </td>
			      </tr>		
			      <tr>
                     <td>
                        <p3><button type="button" onclick="javascript:fn_droneAction(this,'auto'); return false;" class="btn_style03 btn_green btnMoveReg">auto</button></p3>
                     </td> 
                     <td>
                       <p3><button style='margin-left:2px;' type="button" onclick="javascript:fn_droneAction(this,'rtl'); return false;" class="btn_style03 btn_green btnMoveReg">RTL</button></p3>
                     </td>
                     <td>
                        <p3><button style='margin-left:2px;' type="button" onclick="javascript:fn_droneAction(this,'hold'); return false;" class="btn_style03 btn_green btnMoveReg">HOLD</button></p3>
                      </td>
			         <td> 
			            <p3><button style='margin-left:2px;' type="button" onclick="javascript:fn_droneAction(this,'disarm'); return false;" class="btn_style03 btn_red btnMoveReg">DisArm</button></p3> 
			         </td>
			      </tr>	    
			    </tbody>
			  </table>
			  
		 
              </ul>
			</div>
	  
	</div>
	<!-- e :wrap -->
	

	

	<script>
;(function() { 
	
	$(function() { 
		initList2();
	});
	
	var initList2 = function() { 
		
		$.ajax({
			url : '/gcs/dashboard/gA01Mainlist.do',
			type : 'post',
			data :{page:'1'},
		}).done(function(res) { 
			$('#resultList').children().remove();
			//$('.pagination').children().remove();
			//$('.subTr').remove();
			if(res.totalCnt == '0'){
				var data =  "자료가 존재하지 않습니다." ;
				$('#resultList').append(data);
				//$('.pagination').append(paginationView(res.paginationInfo));
				
				//$('.' + res.paginationInfo.currentPageNo ).addClass("active");
				//$('.pagination > li').css('cursor', 'pointer');
			}else{
				res.list.forEach(function(row, index) {
					console.log(row)
					$('#resultList').append(projectListView(row));
					//mbCode = row.mbCode;	
				});
				//$('.pagination').children().remove();
				//$('.pagination').append(paginationView(res.paginationInfo));
				//$('.' + res.paginationInfo.currentPageNo ).addClass("active");
				//$('.pagination > li').css('cursor', 'pointer');
			}
		}).fail(function() {
			alert("실패");
		});
	};
	
	var projectListView = function(row) { 
		var data = "<a class=\"dronepath\" id=\"dronepath\" href=\"#\" onclick=\"javascript:fn_dronePathAction(this,"+row.dlPk+"); return false;\">"+row.dlName+"</a>";
		
			
			return $(data);
	} 
 
})();
</script>

<!-- Syntax color -->
<script src="/flight/_examples_data/prism/prism.js"></script>

 

<!-- Importing the FlightIndicators library -->
<script src="/flight/js/jquery.flightindicators.js"></script>
<!-- Let start our scripts -->
<script type="text/javascript">
// First static example
var first_attitude = $.flightIndicator('#first_attitude', 'attitude', {size:100, roll:8, pitch:3, showBox : true});
// Dynamic examples
var attitude = $.flightIndicator('#attitude', 'attitude', {roll:50, pitch:-20, size:109, showBox : true});
var heading = $.flightIndicator('#heading', 'heading', {heading:150,  size:109,showBox:true}); 
var variometer = $.flightIndicator('#variometer', 'variometer', {vario:-5, size:109,showBox:true});
var airspeed = $.flightIndicator('#airspeed', 'airspeed', {size:109,showBox: true});
var altimeter = $.flightIndicator('#altimeter', 'altimeter',{size:109,showBox: true});
var turn_coordinator = $.flightIndicator('#turn_coordinator', 'turn_coordinator', {turn:0});

// Update at 20Hz
var increment = 0;
setInterval(function() { 
    // Airspeed update
    airspeed.setAirSpeed(80+80*Math.sin(increment/10));

    // Attitude update
    //attitude.setRoll(30*Math.sin(increment/10));
    //attitude.setPitch(50*Math.sin(increment/20));
    var heading = "0" 
    if($('#menu999').find(":selected").val() == 'lm_10001'){ 
        attitude.setRoll($('#menu11').val());
        attitude.setPitch($('#menu12').val());	
        //heading = $('#menu14').val()
    }else if($('#menu999').find(":selected").val() == 'lm_10002'){ 
        attitude.setRoll($('#menu21').val());
        attitude.setPitch($('#menu22').val());	
        //heading = $('#menu24').val()
    }else if($('#menu999').find(":selected").val() == 'lm_10003'){ 
        attitude.setRoll($('#menu31').val());
        attitude.setPitch($('#menu32').val());	
        //heading = $('#menu34').val()
    }else if($('#menu999').find(":selected").val() == 'lm_10004'){ 
        attitude.setRoll($('#menu41').val());
        attitude.setPitch($('#menu42').val());	
        //heading = $('#menu44').val()
    }else if($('#menu999').find(":selected").val() == 'lm_10005'){ 
        attitude.setRoll($('#menu51').val());
        attitude.setPitch($('#menu52').val());	
        //heading = $('#menu54').val()
    }


    // Altimeter update
    //altimeter.setAltitude(10*increment);
    altimeter.setAltitude(0);
    altimeter.setPressure(1000+3*Math.sin(increment/50));
    increment++;
    
    // TC update - note that the TC appears opposite the angle of the attitude indicator, as it mirrors the actual wing up/down position
    turn_coordinator.setTurn((30*Math.sin(increment/10))*-1);

    // Heading update 
    //heading.setHeading(increment);
    
    

    
    // Vario update
    variometer.setVario(2*Math.sin(increment/10));
}, 50);

;(function() { 
	$(function() { 
		initList(); 
	});
	
	var initList = function() {
		$.ajax({
			url :"<c:url value='/gcs/dashboard/gA034MainList2.do'/>"
			, type : 'post'
		    , async : false 
		}).done(function(res) { 
			res.list.forEach(function(row, index) {
				console.log(row)
				//mbCode = row.mbCode; lm	a10001
				if(row.aiDevicename == 'lm_10001' && row.aiUse == 'N'){
				    $("#a10001").hide();
				}else if(row.aiDevicename == 'lm_10002' && row.aiUse == 'N'){
				    $("#a10002").hide();					
				}else if(row.aiDevicename == 'lm_10003' && row.aiUse == 'N'){
				    $("#a10003").hide();					
				}else if(row.aiDevicename == 'lm_10004' && row.aiUse == 'N'){
				    $("#a10004").hide();					
				}else if(row.aiDevicename == 'lm_10005' && row.aiUse == 'N'){
				    $("#a10005").hide();					
				}
				
			    $('#'+row.aiDevicename+'_alias').text(row.aiDevicealias); 
			    $('#'+row.aiDevicename+'_alias2').text(row.aiDevicetype); 
			});
			
		}).fail(function() {
			alert("실패");
		});
	};
	
})();


</script>

  
<script type="text/javascript" src="<c:url value='/js/wi/slider/sliders.js'/>"/></script>
</body>
</html>
