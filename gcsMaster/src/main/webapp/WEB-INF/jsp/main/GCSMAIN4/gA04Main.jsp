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
        
        <script src="/cesium3/Cesium/Cesium.js" type="text/javascript" ></script> 
        <link href="/cesium3/Cesium/Widgets/widgets.css" rel="stylesheet">
        
    <!--引入mars3d库lib-->
    <link href="/cesium3/mars3d/mars3d.css" rel="stylesheet" type="text/css" />
    <script src="/cesium3/mars3d/mars3d.js" type="text/javascript" ></script>  
        
        <!-- Style our app. -->  
        <link href="/cesium/css/index.css" media="screen" rel="stylesheet"> 
	  <!--Style-->
	  <link rel="stylesheet" type="text/css" href="/cesium/css/Waypoint.css">
	  
	  <script type="text/javascript" src="/cesium/js/pop-up.js"></script>
      

<style type="text/css">
#map{
	height: 100%;
	width: 100%; 
	position: absolute; z-index: 1;
}

#pngdiv {
	height: 50px;
	padding: 0px 60px;
	width: 100%; 
    background: linear-gradient(0deg,rgba(19, 27, 19, 0.8),rgba(19, 27, 19, 0.8)), url('Image URL');
    background-size: cover; 
    position: absolute; z-index: 2;
}

#pngleft {
    position: absolute;
    margin-top:3px;
    left: 3px;
    width: 50px;
	height: 40px;  
    background: linear-gradient(0deg,rgba(19, 27, 19, 0.9),rgba(19, 27, 19, 0.9)), url('Image URL');
    background-size: cover;
    color: white;
    text-align: center;
    z-index: 3;
}  

#pngleft2 {
    position: absolute;
    margin-top:45px;
    left: 3px;
    width: 50px;
	height: 70%;  
    background: linear-gradient(0deg,rgba(19, 27, 19, 0.9),rgba(19, 27, 19, 0.9)), url('Image URL');
    background-size: cover;
    color: white;
    text-align: center;
    z-index: 3;
}  
 
#pngbottom {
    position: absolute; 
    bottom: 0px; 
    left:80px;
    width: 400;
	height: 60px;  
    background: linear-gradient(0deg,rgba(19, 27, 19, 0.6),rgba(19, 27, 19, 0.6)), url('Image URL');
    background-size: cover;
    color: white;
    text-align: top;
    z-index: 3;
} 

#waypointControls{ 
z-index: 9999;
}
 

  p {
    padding: 10px;
    font-size: 12px; 
    text-align: left;
    color: white;
  }
  
  p2 {
    padding: 10px;
    font-size:12px; 
    text-align: center;
    color: white;
  }
  
  p31 {
    padding: 10px;
    margin-top:10px; 
    font-size:8px; 
    text-align: center;
    color: white;
  }
  
  p3 {
    padding: 10px; 
    font-size:18px; 
    text-align: center;
    color: white;
  }
  
  p4 {
    padding: 1px;
    width:50px;
    font-size:14px; 
    text-align: center;
    color: white;
  }
  
  p5 {
    padding: 1px; 
    font-size:14px;  
    color: #DDDCDC;
  }
  
p4 > .active > a,
p4 > .active > a:hover,
p4 > .active > a:focus {
  color: #FBF407;
  background-color: #080808;
}

#pngright2 { 
    position: absolute;
    margin-top:3px;
    right: 3px;
    width: 50px;
	height: 45px;  
    background: linear-gradient(0deg,rgba(19, 27, 19, 0.9),rgba(19, 27, 19, 0.9)), url('Image URL');
    background-size: cover;
    color: white;
    text-align: center;
    z-index: 3;
}  

#pngright {
    position: absolute;
    margin-top:55px;
    right: 5px;
    width: 240px;
	height: 800px;   
    background-size: cover;
    color: white;
    text-align: center;
    z-index: 3;  
} 
 
.droneinfo {
width:100%; 
height:800px; 
 overflow-y: auto; 
}
.droneinfo > div {display:table;width:100%;margin-bottom:3px;padding:2px;border:1px solid #d3d3d3;} 
p {display:table-cell;height:inherit;vertical-align:middle;} 

.dronelist {
  background: linear-gradient(0deg,rgba(19, 27, 19, 0.8),rgba(19, 27, 19, 0.8)), url('Image URL');
}

  .btnPath {
 
      border: 2px solid #959393;
      color: white;
      padding: 7px 10px;
      text-align: center;
      display: inline-block;
      font-size: 14px;
      margin: 5px 5px;
      cursor: pointer;
  }
  
  #trailer {
    position: absolute;
    bottom: 20px;
    left: 120;
    width: 320px;
    height: 180px;
  }
 
.ui-dialog-titlebar {
  background-color: #000;
  background-image: none;
  color: #959393;
}

.ui-dialog .ui-dialog-content {
    border: 0;
    padding: .5em 1em;
    background: #000;
    border-color: blue;
    
    zoom: 1;
}

table.timecard {
	margin: auto;
	padding : 0;
	width: 100%;
	border-collapse: collapse;
	border: 1px solid #fff; /*for older IE*/
	border-style: hidden;
}

table.timecard caption {
	background-color: #f79646;
	color: #fff;
	font-size: x-large;
	font-weight: bold;
	letter-spacing: .1em;
}

table.timecard thead th {
	padding: 3px;
	background-color: #353535;
	font-size: 12px;
}

table.timecard thead th#thDay {
	width: 40%;	
}

table.timecard thead th#thRegular, table.timecard thead th#thOvertime, table.timecard thead th#thTotal {
	width: 20%;
}

table.timecard th{
	padding: 0px;
	height: 14px;
	border-width: 1px;
	border-style: solid;
	border-color: #3D3C3C #ccc;
}

table.timecard td {
	padding: 0px;
	height: 20px;
	border-width: 1px;
	border-style: solid;
	border-color: #3D3C3C #ccc;
}

table.timecard td {
	text-align: center;
}

table.timecard tbody th {
	text-align: center;
	font-weight: normal;
}

table.timecard tfoot {
	font-weight: bold;
	font-size: large;
	background-color: #687886;
	color: #fff;
}

table.timecard tr.even {
	background-color: #fde9d9;
}
</style>

<script type="text/javascript">
 

	$(document).ready(function(){ 
		//log
		   $( "#dialog2" ).dialog({
			   dialogClass: "no-close",
			      autoOpen: false,
	                position: {
	                    my: "left+200 bottom",
	                    at: "left bottom-10",
	                    of: window
	                },
			      width: 600, 
			      height: 120,
			      show: {
			        effect: "blind",
			        duration: 1000
			      },
			      hide: {
			        effect: "explode",
			        duration: 1000
			      } 
			    });
		
		   $( "#dialog2" ).dialog( "open" );
		
		var smenutop = 0;
		 $('.smenutop').click(function(e){  
			 if(smenutop == 0){
				 $("#smenutop").attr('src',"/images/menu-top2.png");
				 smenutop = 1;
				 $('#menu0').val('1');
			 }else{
				 $("#smenutop").attr('src',"/images/menu-top.png"); 
				 smenutop = 0;
				 $('#menu0').val('0');
			 }
		   
		 });
		 
		 
		   $( "#dialog" ).dialog({
			   dialogClass: "no-close",
			      autoOpen: false,
			      position: {my: "left+35 top+25", at: "left+35 top+55", of: document}, // 좌측 탑 정렬시
			      width: 285, 
			      height: 460,
			      show: {
			        effect: "blind",
			        duration: 1000
			      },
			      hide: {
			        effect: "explode",
			        duration: 1000
			      },
			      open: function(event, ui) { 
					   $(".ui-dialog-titlebar-close", $(this).parent()).hide(); 
					   }
			    });
		   
		   $('#regSS').css('overflow', 'hidden');
		  
		   
 
		 var smenutop2 = 0;
		 $('.smenutop2').click(function(e){   
			 if(smenutop2 == 0){
				 $("#smenutop2").attr('src',"/images/waypoint2.png");
				 smenutop2 = 1;
				 $('#menu02').val('1');
				 // 다이알로그 보이기
				 $( "#dialog" ).dialog( "open" );
				 
			 }else{
				 $("#smenutop2").attr('src',"/images/waypoint.png"); 
				 smenutop2 = 0;
				 $('#menu02').val('0');
				// 다이알로그 감추기
				$('#dialog').dialog('close')
			 }
		   
		 });
		 
		 var smenutop4 = 0;
		 $('.smenutop4').click(function(e){   
			 if(smenutop4 == 0){
				 $("#smenutop4").attr('src',"/images/dash2.png");
				 smenutop4 = 1;
				 $('#menu04').val('1');
				 // 다이알로그 보이기
				// $( "#dialog" ).dialog( "open" );
				 openWin('/gcs/dashboard/gA01Main2.do',950,570);
				 
			 }else{
				 $("#smenutop4").attr('src',"/images/dash1.png"); 
				 smenutop4 = 0;
				 $('#menu04').val('0');
				 closeWin();
				// 다이알로그 감추기
				//$('#dialog').dialog('close')
			 }
		   
		 });
		 
		 var smenutop5 = 0;
		 $('.smenutop5').click(function(e){   
			 if(smenutop5 == 0){
				 $("#smenutop5").attr('src',"/images/dash2.png");
				 smenutop5 = 1;
				 $('#smenutop5').val('1');
				 // 다이알로그 보이기
				// $( "#dialog" ).dialog( "open" );
				 openWin('/gcs/dashboard/gA01Main3.do',600,500);
				 
			 }else{
				 $("#smenutop5").attr('src',"/images/dash1.png"); 
				 smenutop5 = 0;
				 $('#smenutop5').val('0');
				 closeWin();
				// 다이알로그 감추기
				//$('#dialog').dialog('close')
			 }
		   
		 });
		 
		 var currentdate = new Date(); 
		    var datetime = "Mission of " + currentdate.getDate() + "/"
		                + (currentdate.getMonth()+1)  + "/" 
		                + currentdate.getFullYear() + " @ "   
		                ; 
   		    var datetime2 = " " + currentdate.getHours() + ":"  
               + currentdate.getMinutes() + ":" 
               + currentdate.getSeconds(); 
		   $('#nowtime').text(datetime);
		   
		   $('#nowtime2').text(datetime2);
		 
		 
		 var smenu1 = 0;
		 $('.smenu1').click(function(e){  
			 if(smenu1 == 0){
				 $("#smenu1").attr('src',"/images/on.png");
				 smenu1 = 1;
				 $('#menu1').val('1');
			 }else{
				 $("#smenu1").attr('src',"/images/off.png"); 
				 smenu1 = 0;
				 $('#menu1').val('0');
			 }
		   
		 });
		 
		 //
		 //$( "#dialog" ).dialog();
		});
</script>

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
		       <ul style="margin-top:10px;"><img class="smenu1" src="<c:url value='/images/off.png' />" id="smenu1" width="20" /></ul> 
               <ul style="margin-top:10px;"><img src="<c:url value='/images/wave.png' />"   width="20" /></ul>
               <ul style="margin-top:10px;"><img src="<c:url value='/images/play.png' />"   width="20" /></ul>
               <ul style="margin-top:10px;"><img src="<c:url value='/images/icon12.png' />"   width="20" /></ul>
               <ul style="margin-top:10px;"><img src="<c:url value='/images/icon13.png' />"   width="20" /></ul>
               <ul style="margin-top:10px;"><img src="<c:url value='/images/icon14.png' />"   width="20" /></ul> 
               <ul style="margin-top:10px;"><img src="<c:url value='/images/icon15.png' />"   width="20" /></ul> 
               <ul style="margin-top:10px;"><img src="<c:url value='/images/icon16.png' />"   width="20" /></ul> 
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
										<th id="thDay" colspan="3" >Telemetry: DRU-101</th> 
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
					                    <td><p3 style="color: #FFEB46;">10</p3>  </td> 
					                    <td><p3>25.00</p3></td>
					                </tr>
					                <tr align="center"> 
					                    <th><p31 style="color: #a0a0a0;">Bat.Level (%)</p31> </th> 
					                    <th><p31 style="color: #a0a0a0;">Speed (m/s)</p31> </th>
					                    <th><p31 style="color: #a0a0a0;">Atitude (m)</p31> </th> 
					                </tr>
					                <tr align="center">
					                    <td><p3>25.00</p3></td>
					                    <td><p3>100</p3> </td> 
					                    <td><p3>0.00</p3></td>
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
										<th id="thDay" colspan="3" >Telemetry: DRU-102</th> 
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
					                    <td><p3 style="color: #EBFA01;">10</p3>  </td> 
					                    <td><p3>25.00</p3></td>
					                </tr>
					                <tr align="center"> 
					                    <th><p31 style="color: #a0a0a0;">Bat.Level (%)</p31> </th> 
					                    <th><p31 style="color: #a0a0a0;">Speed (m/s)</p31> </th>
					                    <th><p31 style="color: #a0a0a0;">Atitude (m)</p31> </th> 
					                </tr>
					                <tr align="center">
					                    <td><p3>25.00</p3></td>
					                    <td><p3>100</p3> </td> 
					                    <td><p3>0.00</p3></td>
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
										<th id="thDay" colspan="3" >Telemetry: DRU-103</th> 
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
					                    <td><p3 style="color: #EBFA01;">10</p3>  </td> 
					                    <td><p3>25.00</p3></td>
					                </tr>
					                <tr align="center"> 
					                    <th><p31 style="color: #a0a0a0;">Bat.Level (%)</p31> </th> 
					                    <th><p31 style="color: #a0a0a0;">Speed (m/s)</p31> </th>
					                    <th><p31 style="color: #a0a0a0;">Atitude (m)</p31> </th> 
					                </tr>
					                <tr align="center">
					                    <td><p3>25.00</p3></td>
					                    <td><p3>100</p3> </td> 
					                    <td><p3>0.00</p3></td>
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
										<th id="thDay" colspan="3" >Telemetry: DRU-104</th> 
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
					                    <td><p3 style="color: #EBFA01;">10</p3>  </td> 
					                    <td><p3>25.00</p3></td>
					                </tr>
					                <tr align="center"> 
					                    <th><p31 style="color: #a0a0a0;">Bat.Level (%)</p31> </th> 
					                    <th><p31 style="color: #a0a0a0;">Speed (m/s)</p31> </th>
					                    <th><p31 style="color: #a0a0a0;">Atitude (m)</p31> </th> 
					                </tr>
					                <tr align="center">
					                    <td><p3>25.00</p3></td>
					                    <td><p3>100</p3> </td> 
					                    <td><p3>0.00</p3></td>
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
										<th id="thDay" colspan="3" >Telemetry: DRU-105</th> 
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
					                    <td><p3 style="color: #EBFA01;">10</p3>  </td> 
					                    <td><p3>25.00</p3></td>
					                </tr>
					                <tr align="center"> 
					                    <th><p31 style="color: #a0a0a0;">Bat.Level (%)</p31> </th> 
					                    <th><p31 style="color: #a0a0a0;">Speed (m/s)</p31> </th>
					                    <th><p31 style="color: #a0a0a0;">Atitude (m)</p31> </th> 
					                </tr>
					                <tr align="center">
					                    <td><p3>25.00</p3></td>
					                    <td><p3>100</p3> </td> 
					                    <td><p3>0.00</p3></td>
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
										<th id="thDay" colspan="3" >Telemetry: DRU-106</th> 
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
					                    <td><p3 style="color: #EBFA01;">10</p3>  </td> 
					                    <td><p3>25.00</p3></td>
					                </tr>
					                <tr align="center"> 
					                    <th><p31 style="color: #a0a0a0;">Bat.Level (%)</p31> </th> 
					                    <th><p31 style="color: #a0a0a0;">Speed (m/s)</p31> </th>
					                    <th><p31 style="color: #a0a0a0;">Atitude (m)</p31> </th> 
					                </tr>
					                <tr align="center">
					                    <td><p3>25.00</p3></td>
					                    <td><p3>100</p3> </td> 
					                    <td><p3>0.00</p3></td>
					                </tr> 
					            </tbody>
					        </table>
					</div>   
				 </div>
 
		     </div>  
		
		      <!-- A container for the Cesium Viewer to live in. --> 
		        <!--  
		        <div id="cesiumContainer"  ></div>
		        -->
		        <div id="mars3dContainer" class="mars3d-container"></div> 
				<div id="loadingOverlay"><h1>Loading...</h1></div>
				<div id="toolbar"></div>
			 

				
				 <script src="/cesium/js/cesium-scripts4.js"></script> 
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
		    10:57:07 PM Cannot download features from "error" on "Local Geographic Server". Geoserver has returned an error.
		    <br>
		    10:57:07 PM Cannot download features from "error" on "Local Geographic Server". Geoserver has returned an error.
		    <br>
		    10:57:07 PM Cannot download features from "error" on "Local Geographic Server". Geoserver has returned an error.
		    <br>
		    10:57:07 PM Cannot download features from "error" on "Local Geographic Server". Geoserver has returned an error.
		    <br>
		    10:57:07 PM Cannot download features from "error" on "Local Geographic Server". Geoserver has returned an error.
		    <br>
		    10:57:07 PM Cannot download features from "error" on "Local Geographic Server". Geoserver has returned an error.
		    <br>
		    10:57:07 PM Cannot download features from "error" on "Local Geographic Server". Geoserver has returned an error.
		    <br>
		    10:57:07 PM Cannot download features from "error" on "Local Geographic Server". Geoserver has returned an error.
		    <br>
		    10:57:07 PM Cannot download features from "error" on "Local Geographic Server". Geoserver has returned an error.
		    <br>
		    10:57:07 PM Cannot download features from "error" on "Local Geographic Server". Geoserver has returned an error.
		    <br>
		    10:57:07 PM Cannot download features from "error" on "Local Geographic Server". Geoserver has returned an error.
		    <br>
		</div>
	</div>
	<!-- e :wrap -->
	<script>
;(function() { 
 
})();
</script>
</body>
</html>
