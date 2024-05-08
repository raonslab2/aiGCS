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
<title>GCS</title> 
        <meta name="viewport"
            content="width=device-width, initial-scale=1, maximum-scale=1, minimum-scale=1, user-scalable=no">
 <!-- Common js,css -->
<c:import url="/EmpPageLink.do?link=main/include/gcsCommon" />
        <script src="https://cesium.com/downloads/cesiumjs/releases/1.87.1/Build/Cesium/Cesium.js"></script>
        <link href="/cesium/js/Widgets/widgets.css" rel="stylesheet">
<link href="/css/gcs/AiWork200.css" rel="stylesheet">

</head> 
<body style="overflow-x: hidden;overflow-y: hidden">
 
 
    <!-- A container for the Cesium Viewer to live in. --> 
      <div id="cesiumContainer"  ></div>
 
 <script src="<c:url value='/js/gcs/AiWork200.js'/>"/></script>  
 <script src="<c:url value='/js/gcs/AiWork200_cesium.js'/>"/></script> 
</body>
</html>
