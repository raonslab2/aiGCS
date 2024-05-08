<%--
  Class Name : dashboardPage.jsp
  Description : dashboard
  Modification Information
 
      수정일         수정자                   수정내용
    -------    --------    ---------------------------
     2021.07.07   MBA       데시보드 생성
 
    author   : 평가계획관리시스템 MBA
    since    : 2021.07.07
--%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta charset="utf-8">
<title>TIPA 스케쥴기반 평가관리시스템</title>
<%@ page import="java.util.Calendar"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>
 
<c:import url="/EmpPageLink.do?link=main/include/src" />

<script type="text/javascript">
	$(document).ready(function(res) {
		 
	}
</script>

</head>

<body>
	<!-- s :wrap -->
	<div id="wrap">
		<!-- s :lnb_guide -->
		<div class="lnb_guide">
			<c:import url="/EmpPageLink.do?link=main/include/menu" />
		</div>
		<!-- e :lnb_guide -->

		<!-- s :right_guide -->
		<div class="right_guide2">  
			  <div id="map" style="width:100%; height: 100vh;"></div>
			  <script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBIbcv1LdlzdY_UsxFCrS8iWNraHc1rffY&callback=initMap&region=kr"></script>
			  <script> 
			    function initMap() {
			      var seoul = { lat: 42.87980374873266 ,lng: 74.59067194084379 };
			      var map = new google.maps.Map(
			        document.getElementById('map'), {
			          zoom: 12,
			          center: seoul
			        });
			      
			    }
			  </script>
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
