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
<script src="https://cesium.com/downloads/cesiumjs/releases/1.102/Build/Cesium/Cesium.js"></script>
  <link href="https://cesium.com/downloads/cesiumjs/releases/1.102/Build/Cesium/Widgets/widgets.css" rel="stylesheet">
  

 
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

    
  
<div id="waypoints-data" class="waypoints-data" style="display:none"><c:out value="${waypoints}"/></div>
 

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
      <p5 style="margin-left:20px;margin-right:20px;"><a style="color:white" href="<c:url value='/gcs/dashboard/projectMain1001.do'/>">PLAN</a></p5> 
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
  
		
		      <!-- A container for the Cesium Viewer to live in. --> 
		        <div id="cesiumContainer"  ></div>
				<div id="loadingOverlay"><h1>Loading...</h1></div> 
			    <div id="toolbar"> 
			    </div>

				
				 <script src="/cesium/js/cesium-scripts5.js"></script>  
	 
		         
		</div> 
	 


	</div>
	<!-- e :wrap -->
	 

  
<script type="text/javascript" src="/js/wi/slider/sliders.js"></script>
</body>
</html>
