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
	  
	    <link href="/assets/vendor/fontawesome/css/fontawesome.min.css" rel="stylesheet">
	    <link href="/assets/vendor/fontawesome/css/solid.min.css" rel="stylesheet">
	    <link href="/assets/vendor/fontawesome/css/brands.min.css" rel="stylesheet">
	    <link href="/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	    <link href="/assets/css/master.css" rel="stylesheet">
	    <link href="/assets/vendor/flagiconcss/css/flag-icon.min.css" rel="stylesheet">
		  
	  
	  <script type="text/javascript" src="/cesium/js/pop-up.js"></script> 
	   
	  <script type="text/javascript" src="/cesium/js/pop-up.js"></script>
	  <script type="text/javascript" src="/cesium/websocket/layout01.js"></script> 
	  
	  
	  
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
 	<script type="text/javascript" src="/cesium4/cesium_path_mission.js"></script>
  	<script type="text/javascript" src="/cesium4/cesium-mod-mapdata.js"></script>
	<script type="text/javascript" src="/cesium4/path_mission.js"></script>
 
    
	  <script src="/js/modernizr.js?v=1.4.22"></script>
	  <!-- Compiled CSS -->
      <link rel="stylesheet" href="/css/site.css?v=1.4.22">
    
</head> 
<body style="overflow-x: hidden;overflow-y: hidden">  
<div id="waypoints-data" class="waypoints-data" style="display:none"><c:out value="${waypoints}"/></div> 
<div id="dialog" class="ui-dialog-titlebar ui-widget-header" title="Telemetry:DRONE-1001" style="padding:0px;text-align:center;background-color::black;display:none;">
  <img style="margin-top:5px;;" id="smenutop" class="smenutop" src="<c:url value='/images/fly.png' />" width="270"  /> 
</div>  
		  
			<!-- s :wrap -->
			<div id="wrap">
		
				<!-- s :right_guide -->
				<div class="right_guide3"> 
		 
				      <!-- A container for the Cesium Viewer to live in. --> 
				        <div id="cesiumContainer"  ></div>
						<div id="loadingOverlay"><h1>Loading...</h1></div>
						<div id="toolbar"></div>
					 
						<script type="text/javascript" src="/cesium/js/cesium-scripts3.js"></script>
						 
				        <!-- Our app code. --> 
				        <script src="/cesium/lib/jscolor/jscolor.js"></script>   
				</div> 
				
		 
				<div id="waypoint_info"  > 
				   <form action="#" >
				   <input type="hidden" id="dlPk" class="dlPk" name="dlPk" value="${dlPk}" />
		           <%-- <a href="javascript:void(0);" style="font-size:18px;" id="addMore" title="Add More Person">Add</a>
		           --%>
				   <div style="height:880px;border: 0px solid gold; overflow: auto; overflow-x:hidden ">
					   <table id="tb2" style="border: 0px solid gold">
					     <tr>
					      <th><span style="color:#A4A4A4">Name</span></th>
					      <th colspan="2">  
					         <input style="border:none;border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px;"
					          id="mission-name" size="35" class="mission-name" name="mission-name" type="text" value="<c:out value="${dlName}"/>"  >
					      </th> 
					     </tr>
					   </table>
					   <table id="tb" style="border: 0px solid gold">
					     <tbody> 
					     <tr>
					      <th>ADDR   </th>
					      <th colspan="3">  
					         <input style="border:none;border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px;"
					          id="mission-addr" size="35" class="mission-addr" name="mission-addr" type="text" value=" "  readonly>
					      </th> 
					     </tr>
					     <tr>
					      <td style="padding: 3px;">
					        <div style="margin-right: 3px;">
					            <div style="padding-right: 3px;">
					                <input id="waypointNum" type="text" style="width:70%;" value="H" name="waypointNum[]" readonly>
					            </div>
					        </div>
					      </td>
					      <td width="340">
					         <input id="mission-lat" size="6" class="mission-lat" name="waypointlat[]" type="text" value=" "  readonly>
					         <input id="mission-lon" size="6" class="mission-lon" name="waypointlon[]" type="text" value=" "  readonly>
					         <input id="mission-alt" size="3" class="mission-alt" name="waypointalt[]" type="text" value=" "  readonly>
					      </td>
					      <td>
								<select name="waypointop[]">
								    <option value="16">WAYPOINT</option>
								    <option value="22">TAKE_OFF</option>
								    <option value="84">VTOL_TAKE_OFF</option>
								    <option value="21">LAND</option>
								    <option value="85">VTOL_LAND</option>
								</select>
					      </td>
					      <td><!-- <a href='javascript:void(0);'  class='remove'><img src="<c:url value='/images/del3.png' />" width="30"  /> </a> -->
					      </td>
					     </tr> 
					     <tbody>
					   </table> 
				   </div>
		
				  
					<div style="position: absolute; text-align: center; bottom: 10px;width:100%;">
					    <button id="waypointCreate" class="btn" style="border-radius: 5px;padding: 15px 22px;background-color: #ffa500;" type="button">WayPoint Create</button>
					</div>
					
		 
				   </form>
				</div>
				
				
			  
			</div>
			<!-- e :wrap -->
	 
	
	<script>
;(function() {
	
    $('#addMore').on('click', function() {
        var data = $("#tb tr:eq(1)").clone(true).appendTo("#tb");
        data.find("input").val('');
	});
	$(document).on('click', '.remove', function() {
	   var trIndex = $(this).closest("tr").index(); 
	      if(trIndex>1) {
	      // $(this).closest("tr").remove();
	       $('tbody tr').eq(trIndex+1).remove();
	     } else {
	       alert("Sorry!! Can't remove first row!");
	     }
	});
	

 
})();
</script>
</body>
</html>
