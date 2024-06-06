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
<title>군집드론</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, minimum-scale=1, user-scalable=no">
<c:import url="/EmpPageLink.do?link=main/include/src" />
<!-- Style our app. -->
<link href="/cesium/css/index.css" media="screen" rel="stylesheet">
<script type="text/javascript" src="/cesium/websocket/websocket02.js"></script>

<style type="text/css">
.swrap {
	color: white;
}

.selectMenu {
	clear: both;
	padding: 5px;
}

.selectMenu li {
	float: left;
	list-style: none;
	margin: 1px;
	width: 70px;
	padding: 5px;
	text-align: center;
	border: 1px solid #d3d3d3;
	margin-left: 5px;
}

.selectMenu li a {
	display: block;
	width: 150px;
	height: 40px;
	background: #c00;
	color: #fff;
	border: 1px solid blue;
	font-size: 12px;
	font-family: "돋움";
	text-align: center;
	padding-top: 10px;
	text-decoration: none;
}

.selectMenu li a span {
	display: block;
}

.selectMenu li a:hover {
	background: #099;
	text-decoration: none;
}

.dashboard {
	clear: both;
	padding: 10px;
}

.selectMenu2 {
	clear: both;
	padding: 5px;
	position: fixed;
	bottom: 0;
	width: 100%;
	background: white;
	box-shadow: 0 -2px 5px rgba(0, 0, 0, 0.1);
	z-index: 1000;
}

.selectMenu2 ul {
	margin: 0;
	padding: 0;
	display: flex;
	justify-content: center;
	list-style: none; /* 추가: ul 기본 스타일 제거 */
}

.selectMenu2 li {
	list-style: none;
	margin: 5px;
	padding: 5px;
	text-align: center;
	border: 1px solid #d3d3d3;
}

.selectMenu2 li p {
	margin: 0;
	padding: 10px;
	background: #c00;
	color: #fff;
	border: 1px solid blue;
	font-size: 12px;
	font-family: "돋움";
	text-align: center;
	text-decoration: none;
	cursor: pointer;
}

.selectMenu2 li p:hover {
	background: #099;
	text-decoration: none;
}

#customers {
	font-family: Arial, Helvetica, sans-serif;
	border-collapse: collapse;
	width: 100%;
}

#customers td, #customers th {
	border: 1px solid #ddd;
	padding: 8px;
}

#customers tr:nth-child(even) {
	background-color: #f2f2f2;
}

#customers tr:hover {
	background-color: #ddd;
}

#customers th {
	padding-top: 12px;
	padding-bottom: 12px;
	text-align: left;
	background-color: #181818;
	color: white;
}

#customers td {
	padding-top: 11px;
	padding-bottom: 11px;
	text-align: left;
	background-color: #2A990C;
	color: white;
}
</style>
<script type="text/javascript">
	$(document).ready(function() {
	    updateContainer();
	    $(window).resize(function() {
	        updateContainer();
	    });
	});

	function updateContainer() {
	    var $containerHeight = $(window).height();
	    $(".dashboard").css({"height": $containerHeight - 170});
	}
</script>

</head>
<body>

	<!-- left menu List -->
	<!--
  <c:import url="/EmpPageLink.do?link=main/include/menu3" /> 
    -->
	<c:import url="/EmpPageLink.do?link=main/include/droneHeadMenu" />

	<form id="searchForm" name="searchForm" method="post">
		<input type="hidden" id="dlPk" name="dlPk" value="" />
	</form>
	<div id="swrap" class="swrap" style="margin-top: 70px;">
		<div id="title" style="padding: 10px;">
			<img id="titlesub" class="titlesub" src="<c:url value='/images/dash1.png' />" height="15" /> SWARM DRONE CONTROL
		</div>

		<div id="selectMenu" class="selectMenu">
			<ul>
				<li style="border: 0px solid #d3d3d3; width: 100px">DRONE ACT</li>
				<li><span id="check_all" onClick="check_check_checkbox();">ALL</span></li>
				<li><span id="check_all" onClick="check_check_uncheckbox();">CLEAR</span></li>
				<li>READY</li>
				<li>ACTIVE</li>
			</ul>
		</div>

		<div id="dashboard" class="dashboard" style="overflow-y: scroll;">
			<table id="customers">
				<colgroup>
					<col width="70px">
					<col width="120px">
					<col width="120px">
					<col width="120px">
					<col width="120px">
					<col width="120px">
					<col width="150px">
					<col width="210px">
					<col>
					<col width="100px">
					<col width="100px">
					<col width="100px">
				</colgroup>
				<thead>
					<tr>
						<th>ACTIVE</th>
						<th>NAME</th>
						<th>LAST CMD</th>
						<th>START TIME</th>
						<th>IS ARM</th>
						<th>ART READY</th>
						<th>PATH</th>
						<th>MODE</th>
						<th>STATUS</th>
						<th>ALT</th>
						<th>BATTERY</th>
						<th>GPS FIX</th>
					</tr>
				</thead>
				<tbody id="resultList">

				</tbody>

			</table>
		</div>

		<div id="selectMenu2" class="selectMenu2">
			<ul>

			</ul>
		</div>

		<div id="selectMenu3" class="selectMenu2" style="clear: both">
			<ul>
				<li><p onClick="fn_droneAction('arm');">ARM</p></li>
				<li><p onClick="fn_droneAction('takeoff');">TAKE OFF</p></li>
				<li><p onClick="fn_droneAction('auto');">Swarm Dance</p></li>
				<li><p onClick="fn_droneAction('land');">LAND</p></li>
				<li><p onClick="fn_droneAction('rtl');">RTL</p></li>
				<li><p onClick="fn_droneAction('disarm');">DISARM</p></li>
				<li><p onClick="fn_droneAction('reboot');">FC REBOOT</p></li>
				<li><p onClick="fn_droneAction('');">LED REBOOT</p></li>
				<li><p onClick="fn_droneAction('');">OS TURN/OFF</p></li>
			</ul>
		</div>

	</div>
	<script>
	;(function() { 
		
		$(function() { 
			initList();
		});
		
		var initList = function() {
			
			var formSer = $('#searchForm').serialize();
			$.ajax({
				url : '/gcs/dashboard/gA01Main2List.do'
				, type : 'post'
				, data : formSer
			}).done(function(res) { 
				$('#resultList').children().remove(); 
				$('.subTr').remove();
				if(res.totalCnt == '0'){
					var data = "<tr class='subTr'><td colspan='12' style='height:100px;'>자료가 존재하지 않습니다.</td></tr>";
					$('#resultList').append(data); 
				}else{
					res.list.forEach(function(row, index) {
						console.log(row)
						$('#resultList').append(projectListView(row, res.pathlist));
					});
				}
			}).fail(function() {
				alert("실패");
			});
		};
		
		var projectListView = function(row, pathList) {
			var tmPath = "<select name='cars' id='cars' style='width:200px;'>";
			var selectPath = "";
			pathList.forEach(function(row2, index) {
				if(row2.dlPk == row.dlPath){
					selectPath = "selected";
				}else{
					selectPath = "";
				}
				tmPath += "<option value=" + row2.dlPk + " " + selectPath + ">" + row2.dlName + "</option>";
			});
			tmPath += "</select>";
			   
			var tm_atitude = row.dlName + "_atitude";
			var tm_state = row.dlName + "_state";
			var tm_mode = row.dlName + "_mode";
			var tm_voltage = row.dlName + "_voltage";
			var tm_voltage2 = row.dlName + "_voltage2";
			var tm_arm = row.dlName + "_arm";
			var tm_arm_color = row.dlName + "_arm_color"; 
			var tm_satelite_num = row.dlName + "_satelite_num"; 
			var data = "<tr>" + 
				"<td style='width:100px; text-align:center;'><input name='dronelist' id='" + row.dlName + "' type='checkbox'></td>" + 
				"<td>" + row.dlName + "</td>" + 
				"<td>TriggerR</td>" + 
				"<td>Null time</td>" + 
				"<td id='" + tm_arm_color + "'><span id='" + tm_arm + "'></span></td>" + 
				"<td>YES " + row.dlPath + "</td>" + 
				"<td>" + tmPath + "</td>" + 
				"<td id='" + tm_arm_color + "'>" +
				"<span id='" + tm_state + "'></span>" +
				"<span id='" + tm_mode + "'></span>" +
				"</td>" + 
				"<td>Standby</td>" + 
				"<td style='color:yellow;'><span id='" + tm_atitude + "'></span></td>" + 
				"<td><span id='" + tm_voltage2 + "'></span> <span id='" + tm_voltage + "'></span></td>" + 
				"<td><span id='" + tm_satelite_num + "'></span></td>" + 
				"</tr>";
				
			return $(data);
		};
		
	})();
	</script>
</body>
</html>
