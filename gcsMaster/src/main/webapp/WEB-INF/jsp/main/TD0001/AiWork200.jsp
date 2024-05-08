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
<%@ page import="egovframework.com.cmm.LoginVO"%>

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
<script
	src="https://cesium.com/downloads/cesiumjs/releases/1.87.1/Build/Cesium/Cesium.js"></script>
<link href="/cesium/js/Widgets/widgets.css" rel="stylesheet">
<link href="/css/gcs/AiWork200.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>

	<!-- Left Menu List -->
	<c:import url="/EmpPageLink.do?link=main/include/menu3" />

	<main> <!-- Top Menu --> <c:import
		url="/EmpPageLink.do?link=main/include/menutopAiWork" />
	<div class="container">
		<div class="tools">
			<!-- 도구 툴 영역 -->
			<h3  >TOOL</h3>
			<button class="toolButton" id="rectangleTool">
				<img src="/images/tool/btn-box.svg" alt="사각 영역">
			</button>
			<button class="toolButton" id="polylineTool">
				<img src="/images/tool/btn-polyline.svg" alt="폴리라인">
			</button>
			<button class="toolButton" id="polygonTool">
				<img src="/images/tool/btn-polygon.svg" alt="폴리곤">
			</button>
 
		</div>
		<div class="image-area">
			<!-- 이미지 로딩 영역 -->
			<h3>이미지</h3>
			<img src="" alt="이미지" class="image" id="mainImage">
		</div>
		<div class="data-list">
			<!-- 데이터 목록 리스트 -->
			<h3>데이터 목록</h3>
			<ul id="dataList">
				<!-- 항목은 jQuery로 동적으로 생성합니다. -->
			</ul>
		</div>
	</div>


	</main>


	<!-- footer -->
	<c:import url="/EmpPageLink.do?link=main/include/gcsFooter" />

	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="<c:url value='/js/gcs/AiWork200.js'/>" /></script>
</body>
</html>
