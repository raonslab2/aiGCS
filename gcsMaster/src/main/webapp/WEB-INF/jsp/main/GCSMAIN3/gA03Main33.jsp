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
<title>GCS Editor</title> 
    <meta name="viewport"
        content="width=device-width, initial-scale=1, maximum-scale=1, minimum-scale=1, user-scalable=no">
    <script src="https://cesium.com/downloads/cesiumjs/releases/1.87.1/Build/Cesium/Cesium.js"></script>
    <link href="/cesium/js/Widgets/widgets.css" rel="stylesheet">
     
	<script th:inline="javascript">
	var paranTmLat = [[${tmLat}]];
	var paranTmLng = [[${tmLng}]]; 
	</script>
	  
    <!-- cesium -->
	<script type="text/javascript">
           var MISSION_ID = "new";
           var MISSION_HAS_NAME = false;
           var MISSION_ALLOW_EDIT = false;
           var MISSIONS_URL = "/missions/";
    </script> 
 	<script type="text/javascript" src="/cesium4/cesium-helper.js"></script>  
 	<script type="text/javascript" src="/cesium4/gA03Main33_path_mission.js"></script>
  	<script type="text/javascript" src="/cesium4/cesium-mod-mapdata.js"></script>
	<script type="text/javascript" src="/cesium4/path_mission2.js"></script>
  
	<!-- LAYOUT v 1.3.0 -->
	<script type="text/javascript" src="/js/jquery-latest.js"></script>
	<script type="text/javascript" src="/js/jquery-ui-latest.js"></script>
	<script type="text/javascript" src="/js/jquery.layout-1.3.0.rc30.80.js"></script>
 
    
</head> 
<body style="overflow-x: hidden;overflow-y: hidden">  
<div id="waypoints-data" class="waypoints-data" style="display:none"><c:out value="${waypoints}"/></div>  
<div id="waypoints-data22" class="waypoints-data22" style="display:none"><c:out value="${waypointsDetail}"/></div>  
  

<div class="ui-layout-center" style="padding:0;overflow-x: hidden;overflow-y: hidden;" >

 
	<!-- s :right_guide -->
	<div class="right_guide3"> 

	      <!-- A container for the Cesium Viewer to live in. --> 
	        <div id="mapContainer"  ></div>
			<div id="loadingOverlay"><h1>Loading...</h1></div>
			<div id="toolbar"></div>
		 
			<script type="text/javascript" src="/common/js/gA03Main33-cesium.js"></script>
		 
	</div> 
	
	

 
</div>
 
<!-- 경로입력페이지 -->
<div style="background-color: #000000;display:hidden;">
	<div style="width:100%;overflow-x: hidden;">
    <input type="hidden" id="tmLat" class="tmLat" name="tmLat" value="${tmLat}" />
    <input type="hidden" id="tmLng" class="tmLng" name="tmLng" value="${tmLng}" />
	  <form action="#" >
	  <input type="hidden" id="dlPk" class="dlPk" name="dlPk" value="${dlPk}" />
	  <div style="clear:both;width:1024px;">

		  <div class="column" >
		    <table id="tb" class="ui inverted right aligned table">
		      <thead>
		        <th width="100px" class="center aligned">NUM</th>
		        <th width="" class="center aligned">COMMAND</th>
		        <th width="50px">param1</th>
		        <th width="50px">param2</th>
		        <th width="50px">param3</th>
		        <th width="50px">param4</th>
		        <th width="160px">Lat</th>
		        <th width="160px">Long</th>
		        <th width="30px">Alt</th>
		        <th width="30px">Frame</th> 
		        <th width="30px">Grad</th>
		        <th width="30px">Angle</th>
		        <th width="30px">Dist</th>
		        <th width="30px">AZ</th>
		      </thead>
		      <tbody>
		        <tr>
		          <td class="center aligned">
		            <input id="waypointNum" type="text" style="width:100%;" value="H" name="waypointNum[]" readonly>
		          </td>
		          <td>
						<select name="waypoinCommand" id="waypoinCommand">
						    <option value="16">WAYPOINT</option>
						    <option value="22">TAKE_OFF</option>
						    <option value="21">LAND</option> 
						    <option value="19">LOITER_TIME</option>
						    <option value="18">LOITER_TURNS</option>
						    <option value="17">LOITER_UNLIM</option>
						    <option value="31">LOITER_TO_ALT</option>
						    <option value="84">VTOL_TAKEOFF</option>
						    <option value="85">VTOL_LAND</option> 
						    <option value="3000">DO_VTOL_TRANSITION</option>						    
						    <option value="178">DO_CHANGE_SPEED</option>
						    <option value="189">DO_LAND_START</option>
						   
						</select>
		          </td> 
		          <td>
		             <input id="waypointParan1" type="text" style="width:100%;" value="" id="waypointParan1" name="waypointParan1" >
		          </td> 
		          <td>
		             <input id="waypointParan2" type="text" style="width:100%;" value="" id="waypointParan2" name="waypointParan2" >
		          </td>
		          <td>
		             <input id="waypointParan3" type="text" style="width:100%;" value="" id="waypointParan3" name="waypointParan3" >
		          </td>
		          <td>
		             <input id="waypointParan4" type="text" style="width:100%;" value="" id="waypointParan4" name="waypointParan4" >
		          </td>
		          <td class="center aligned"><input id="mission-lat"  class="mission-lat" name="waypointlat[]" type="text" value=" "  readonly></td> 
		          <td class="center aligned"><input id="mission-lon"  class="mission-lon" name="waypointlon[]" type="text" value=" "  readonly></td> 
		          <td class="center aligned"> <input id="mission-alt" class="mission-alt" name="waypointalt[]" type="text" value=" "  readonly></td> 
		          <td>
						<select name="waypoinframe" id="waypoinframe">
						    <option value="3">Relative</option>
						    <option value="0">Absolute</option>
						    <option value="10">Terriain</option> 
						</select>
		          </td>  
		          <td></td> 
		          <td></td> 
		          <td></td> 
		          <td></td> 
		        </tr> 
		        <tr> 
		         
		      </tbody>
		    </table>
		  </div>
	  </div> 
	  </form>
	</div>
</div>

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
