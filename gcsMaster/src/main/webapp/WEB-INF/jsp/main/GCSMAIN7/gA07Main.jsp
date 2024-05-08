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
<title>DID Blockchain 기반 군집드론 플랫폼</title> 
        <meta name="viewport"
            content="width=device-width, initial-scale=1, maximum-scale=1, minimum-scale=1, user-scalable=no">
        <c:import url="/EmpPageLink.do?link=main/include/src" />
        <script src="https://cesiumjs.org/releases/1.87.1/Build/Cesium/Cesium.js"></script> 
        <link href="https://cesiumjs.org/releases/1.87.1/Build/Cesium/Widgets/widgets.css" rel="stylesheet">
        <!-- Style our app. -->  
        <link href="/cesium/css/index.css" media="screen" rel="stylesheet">
  
	  <!--Style-->
	  <link rel="stylesheet" type="text/css" href="/cesium/css/Waypoint.css">
 

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
    margin-top:55px;
    left: 5px;
    width: 50px;
	height: 100%;  
    background: linear-gradient(0deg,rgba(19, 27, 19, 0.6),rgba(19, 27, 19, 0.6)), url('Image URL');
    background-size: cover;
    color: white;
    text-align: center;
    z-index: 3;
}  

#pngright {
    position: absolute;
    margin-top:52px;
    right: 0px;
    width: 240px;
	height: 100%;  
    background: linear-gradient(0deg,rgba(19, 27, 19, 0.6),rgba(19, 27, 19, 0.6)), url('Image URL');
    background-size: cover;
    color: white;
    text-align: center;
    z-index: 3;
}  

#pngbottom {
    position: absolute; 
    bottom: 0px; 
    right:245px;
    width: 80%;
	height: 120px;  
    background: linear-gradient(0deg,rgba(19, 27, 19, 0.6),rgba(19, 27, 19, 0.6)), url('Image URL');
    background-size: cover;
    color: white;
    text-align: center;
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
    width:250px;
    font-size:8px; 
    text-align: center;
    color: white;
  }
  
  p3 {
    padding: 10px;
    width:200px;
    font-size:24px; 
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
  
p4 > .active > a,
p4 > .active > a:hover,
p4 > .active > a:focus {
  color: #FBF407;
  background-color: #080808;
}
  
.droneinfo > div {display:table;width:220px;height:160px;margin-bottom:10px;padding:10px;border:1px solid #d3d3d3;} 
p {display:table-cell;width:200px;height:inherit;vertical-align:middle;} 

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
  
</style>

<script type="text/javascript">
	$(document).ready(function(){ 
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
		});
</script>

</head> 
<body style="overflow-x: hidden;overflow-y: hidden"> 
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
		 <!--Container for toolbar-->
		  <div id="waypointControls">
		
		    <!--Use Tables to organize toolbar-->
		    <table align="center">
		      
		      <!--Title-->
		      <td width="100px">
		        <span id="title"> 
		          <a href="<c:url value='/gcs/dashboard/gA01Main.do'/>" ><img src="<c:url value='/images/logo.png' />"   height="40" /></a> 
		        </span>
		      </td>
		      <td>
			    <label class="btnPath"> 
			         <a <% if (url.indexOf("gA01Main") > -1) { %> class="active" <% } %>  href="<c:url value='/gcs/dashboard/gA01Main.do'/>" ><p4>DATA</p4></a>
			     </label>
			    <label class="btnPath">
			        <a <% if (url.indexOf("gA02Main") > -1) { %> class="active" <% } %> href="<c:url value='/gcs/dashboard/gA02Main.do'/>" ><p4>PLAN</p4></a>
			     </label>
			     
			     <label class="btnPath">
			       <a <% if (url.indexOf("gA03Main") > -1) { %> class="active" <% } %> href="<c:url value='/gcs/dashboard/gA03Main.do'/>" ><p4>SETUP</p4></a>
			     </label>
			     
			     <label class="btnPath">
			        <a <% if (url.indexOf("gA04Main") > -1) { %> class="active" <% } %> href="<c:url value='/gcs/dashboard/gA04Main.do'/>" ><p4>CONFIG</p4></a>
			     </label>
			     
			     <label class="btnPath">
			        <a <% if (url.indexOf("gA05Main") > -1) { %> class="active" <% } %> href="<c:url value='/gcs/dashboard/gA05Main.do'/>" ><p4>BIG DATA</p4></a>
			     </label>
			     
			     <label class="btnPath">
			        <a <% if (url.indexOf("gA06Main") > -1) { %> class="active" <% } %> href="<c:url value='/gcs/dashboard/gA06Main.do'/>" ><p4>MANAGE</p4></a>
			     </label>
			     
			     <label class="btnPath">
			        <a <% if (url.indexOf("gA07Main") > -1) { %> class="active" <% } %> href="<c:url value='/gcs/dashboard/gA07Main.do'/>" ><p4>DATA-1</p4></a>
			     </label>
			     
			     <label class="btnPath">
			        <a <% if (url.indexOf("gA08Main") > -1) { %> class="active" <% } %> href="<c:url value='/gcs/dashboard/gA08Main.do'/>" ><p4>DATA-2</p4></a>
			     </label>
			     
		      </td>
		      <!--Toolbar Tools-->
		      <td>
		        <form style="display: none;">
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
		             <td>Waypoint:  <input type="number" min="1" max="1"  id="WaypointNumber2" onchange="moveWaypoint2()">    </td>
		             <td>Command:   <input type="text" size="9"           id="Command2"        onchange="updateWaypoints2()"> </td>
		             <td>Latitude:  <input type="text" size="9"           id="Latitude2"       onchange="updateWaypoints2()"> </td>
		             <td>Longitude: <input type="text" size="9"           id="Longitude2"      onchange="updateWaypoints2()"> </td>
		             <td>Altitude:  <input type="text" size="9"           id="Altitude2"       onchange="updateWaypoints2()"> </td>
		             <td>Raduis:    <input type="text" size="9"           id="Radius2"         onchange="updateWaypoints2()"> </td>
		            </tr>
		            
		
		         </table>
		       </form>
		      </td>
		
		      <!--Button to Export the Flight Plan-->
		      <td>
		        <button style="display: none;" onClick="exportList()">Export Flight Plan</button>
		      </td>
		
		     <!--Button to Download the Flight Plan-->
		     <td>
		       <a id="download" download="FlightPlan.waypoints" disabled="false" href="">
		
		        </a>
		     </td>
		
		    </table>
		  </div>
	<!-- s :wrap -->
	<div id="wrap">
 

		<!-- s :right_guide -->
		<div class="right_guide3"> 
		     <div id="pngdiv">   
		     </div>  
		     
		     <div id="pngleft">
		       <ul style="margin-top:10px;"><img class="smenu1" src="<c:url value='/images/off.png' />" id="smenu1" width="30" /></ul> 
               <ul style="margin-top:10px;"><img src="<c:url value='/images/wave.png' />"   width="30" /></ul>
               <ul style="margin-top:10px;"><img src="<c:url value='/images/play.png' />"   width="30" /></ul>
               <ul style="margin-top:10px;"><img src="<c:url value='/images/play.png' />"   width="30" /></ul>
               <ul style="margin-top:10px;"><img src="<c:url value='/images/play.png' />"   width="30" /></ul>
               <ul style="margin-top:10px;"><img src="<c:url value='/images/play.png' />"   width="30" /></ul>

		     </div>
		     
		     <div id="pngright">
		       <p2>DRONE LIST</p2>
		       
 
 
				<div class="droneinfo" style="overflow-y: scroll;;width:240px; height:800px;">
					<div class="example1">
					    <table border="0"
					            width="240" 
					            cellspacing="5">
					            <tbody>
					                <tr align="center">
					                    <th><p31 style="color: #a0a0a0;">Status</p31></th>
					                    <th><p31 style="color: #a0a0a0;">Satelite Num</p31></th> 
					                </tr>
					                <tr align="center">
					                    <td><p3 style="color: #82F9B7;">READY</p3></td>
					                    <td><p3 style="color: #FFEB46;">10</p3>  </td> 
					                </tr>
					                <tr align="center">
					                    <th><p31 style="color: #a0a0a0;">Bat Voltage (V)</p31> </th>
					                    <th><p31 style="color: #a0a0a0;">Bat.Level (%)</p31> </th> 
					                </tr>
					                <tr align="center">
					                    <td><p3>25.00</p3></td>
					                    <td><p3>100</p3> </td> 
					                </tr>
					                <tr align="center">
					                    <th><p31 style="color: #a0a0a0;">Speed (m/s)</p31> </th>
					                    <th><p31 style="color: #a0a0a0;">Atitude (m)</p31> </th> 
					                </tr>
					                <tr align="center">
					                    <td><p3>0.00</p3></td>
					                    <td><p3>0.00</p3> </td> 
					                </tr>
					            </tbody>
					        </table>
					</div> 
					<div class="example1">
					    <table border="0"
					            width="240" 
					            cellspacing="5">
					            <tbody>
					                <tr align="center">
					                    <th><p31 style="color: #a0a0a0;">Status</p31></th>
					                    <th><p31 style="color: #a0a0a0;">Satelite Num</p31></th> 
					                </tr>
					                <tr align="center">
					                    <td><p3 style="color: #82F9B7;">READY</p3></td>
					                    <td><p3 style="color: #FFEB46;">10</p3>  </td> 
					                </tr>
					                <tr align="center">
					                    <th><p31 style="color: #a0a0a0;">Bat Voltage (V)</p31> </th>
					                    <th><p31 style="color: #a0a0a0;">Bat.Level (%)</p31> </th> 
					                </tr>
					                <tr align="center">
					                    <td><p3>25.00</p3></td>
					                    <td><p3>100</p3> </td> 
					                </tr>
					                <tr align="center">
					                    <th><p31 style="color: #a0a0a0;">Speed (m/s)</p31> </th>
					                    <th><p31 style="color: #a0a0a0;">Atitude (m)</p31> </th> 
					                </tr>
					                <tr align="center">
					                    <td><p3>0.00</p3></td>
					                    <td><p3>0.00</p3> </td> 
					                </tr>
					            </tbody>
					        </table>
					</div> 
					<div class="example1">
					    <table border="0"
					            width="240" 
					            cellspacing="5">
					            <tbody>
					                <tr align="center">
					                    <th><p31 style="color: #a0a0a0;">Status</p31></th>
					                    <th><p31 style="color: #a0a0a0;">Satelite Num</p31></th> 
					                </tr>
					                <tr align="center">
					                    <td><p3 style="color: #82F9B7;">READY</p3></td>
					                    <td><p3 style="color: #FFEB46;">10</p3>  </td> 
					                </tr>
					                <tr align="center">
					                    <th><p31 style="color: #a0a0a0;">Bat Voltage (V)</p31> </th>
					                    <th><p31 style="color: #a0a0a0;">Bat.Level (%)</p31> </th> 
					                </tr>
					                <tr align="center">
					                    <td><p3>25.00</p3></td>
					                    <td><p3>100</p3> </td> 
					                </tr>
					                <tr align="center">
					                    <th><p31 style="color: #a0a0a0;">Speed (m/s)</p31> </th>
					                    <th><p31 style="color: #a0a0a0;">Atitude (m)</p31> </th> 
					                </tr>
					                <tr align="center">
					                    <td><p3>0.00</p3></td>
					                    <td><p3>0.00</p3> </td> 
					                </tr>
					            </tbody>
					        </table>
					</div> 
					<div class="example1">
					    <table border="0"
					            width="240" 
					            cellspacing="5">
					            <tbody>
					                <tr align="center">
					                    <th><p31 style="color: #a0a0a0;">Status</p31></th>
					                    <th><p31 style="color: #a0a0a0;">Satelite Num</p31></th> 
					                </tr>
					                <tr align="center">
					                    <td><p3 style="color: #82F9B7;">READY</p3></td>
					                    <td><p3 style="color: #FFEB46;">10</p3>  </td> 
					                </tr>
					                <tr align="center">
					                    <th><p31 style="color: #a0a0a0;">Bat Voltage (V)</p31> </th>
					                    <th><p31 style="color: #a0a0a0;">Bat.Level (%)</p31> </th> 
					                </tr>
					                <tr align="center">
					                    <td><p3>25.00</p3></td>
					                    <td><p3>100</p3> </td> 
					                </tr>
					                <tr align="center">
					                    <th><p31 style="color: #a0a0a0;">Speed (m/s)</p31> </th>
					                    <th><p31 style="color: #a0a0a0;">Atitude (m)</p31> </th> 
					                </tr>
					                <tr align="center">
					                    <td><p3>0.00</p3></td>
					                    <td><p3>0.00</p3> </td> 
					                </tr>
					            </tbody>
					        </table>
					</div> 
					<div class="example1">
					    <table border="0"
					            width="240" 
					            cellspacing="5">
					            <tbody>
					                <tr align="center">
					                    <th><p31 style="color: #a0a0a0;">Status</p31></th>
					                    <th><p31 style="color: #a0a0a0;">Satelite Num</p31></th> 
					                </tr>
					                <tr align="center">
					                    <td><p3 style="color: #82F9B7;">READY</p3></td>
					                    <td><p3 style="color: #FFEB46;">10</p3>  </td> 
					                </tr>
					                <tr align="center">
					                    <th><p31 style="color: #a0a0a0;">Bat Voltage (V)</p31> </th>
					                    <th><p31 style="color: #a0a0a0;">Bat.Level (%)</p31> </th> 
					                </tr>
					                <tr align="center">
					                    <td><p3>25.00</p3></td>
					                    <td><p3>100</p3> </td> 
					                </tr>
					                <tr align="center">
					                    <th><p31 style="color: #a0a0a0;">Speed (m/s)</p31> </th>
					                    <th><p31 style="color: #a0a0a0;">Atitude (m)</p31> </th> 
					                </tr>
					                <tr align="center">
					                    <td><p3>0.00</p3></td>
					                    <td><p3>0.00</p3> </td> 
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
			 

				
				 <script src="/cesium/js/cesium-scripts7.js"></script> 
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
		        
		        <div id="pngbottom">dd</div>
		</div>
		<!-- e :right_guide -->
		

  
	</div>
	<!-- e :wrap -->
	<script>
;(function() { 
 
})();
</script>
</body>
</html>
