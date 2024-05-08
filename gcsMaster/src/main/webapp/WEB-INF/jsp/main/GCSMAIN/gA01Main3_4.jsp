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
<!DOCTYPE html>
<html>
  <head>
        <meta name="viewport"
            content="width=device-width, initial-scale=1, maximum-scale=1, minimum-scale=1, user-scalable=no">
        <c:import url="/EmpPageLink.do?link=main/include/src" /> 
    <style type="text/css">
    html, body {margin: 0; height: 100%; overflow: hidden}
	.video-wrap {position:relative; padding-bottom:56.25%; padding-top:30px; height:0; overflow:hidden;}
	.video-wrap iframe,
	.video-wrap object,
	.video-wrap embed {position:absolute; top:0; left:0; width:100%; height:100%;}
	</style>
  </head>
  <body>  
  <!-- HTML -->
<div class="video-wrap">  
    <iframe id="video" width="100%" height="315" 
    src="http://34.64.36.32:5080/WebRTCAppEE/play.html?id=test4" 
    frameborder="0" allow="encrypted-media; gyroscope; picture-in-picture" allowfullscreen
    scrolling="no" style="overflow-y:hidden"
    ></iframe> 
</div> 
  </body>
</html>