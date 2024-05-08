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
    <script src="/cesiumoffline/Build/CesiumUnminified/Cesium.js"></script>
    <style>
      @import url(/cesiumoffline/Build/CesiumUnminified/Widgets/widgets.css);
      html,
      body,
      #cesiumContainer {
        width: 100%;
        height: 100%;
        margin: 0;
        padding: 0;
        overflow: hidden;
      }
    </style>
</head> 
<body >   
    <div id="cesiumContainer"></div>
    <script>
    const viewer = new Cesium.Viewer("cesiumContainer");

 // Create the tileset, and set its model matrix to move it
 // to a certain position on the globe
 const tileset = viewer.scene.primitives.add(
   new Cesium.Cesium3DTileset({
     url: "http://localhost:8003/sample/1.1/MetadataGranularities/tileset.json",
     debugShowBoundingVolume: true,
   })
 );
 tileset.modelMatrix = Cesium.Transforms.eastNorthUpToFixedFrame(
   Cesium.Cartesian3.fromDegrees(-75.152325, 39.94704, 0.0)
 );
 

    </script>
</body>
</html>
