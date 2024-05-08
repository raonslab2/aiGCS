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
 
<style type="text/css">

   
  .swrap{
     color:white;
  }
  
  .selectMenu{
    clear:both;
    padding:5px;
  }
   
	.selectMenu li {float:left; list-style:none; margin:1px;width:70px;padding:5px;text-align:center;border:1px solid #d3d3d3;margin-left:5px;}
	
	.selectMenu li a {display:block; width:150px; height:40px; background:#c00; color:#fff; border1px solid blue; font-size:12px; font-family:"돋움";
	       text-align:center; padding-top:10px; text-decoration:none;}
	.selectMenu li a span {display:block;}
	.selectMenu li a:hover {background:#099; text-decoration:none;}

  .dashboard{
    clear:both;
    padding:10px;
  }
 
   .dashboard{
    clear:both; 
  }
  
  .selectMenu2{
    clear:both; 
    padding:5px
  }
   
	.selectMenu2 li {float:left; list-style:none; margin:1px;width:120px;padding:5px;text-align:center;border:1px solid #d3d3d3;margin-left:5px;}
	
	.selectMenu2 li a {display:block; width:150px; height:40px; background:#c00; color:#fff; border1px solid blue; font-size:12px; font-family:"돋움";
	       text-align:center; padding-top:10px; text-decoration:none;}
	.selectMenu2 li a span {display:block;}
	.selectMenu2 li a:hover {background:#099; text-decoration:none;}

	div.comicGreen { 
	  border: 1px solid #4F7849;
	  background-color: #EEEEEE;
	  width: 100%;
	  text-align: center;
	  border-collapse: collapse;
	}
	.divTable.comicGreen .divTableCell, .divTable.comicGreen .divTableHead {
	  border: 1px solid #4F7849;
	  padding: 5px 0px; 
	}
	.divTable.comicGreen .divTableBody .divTableCell {
	  font-size: 12px;
	  font-weight: bold;
	  color: #4F7849;
	}
	.divTable.comicGreen .divTableRow:nth-child(even) {
	  background: #CEE0CC;
	}
	.comicGreen .tableFootStyle {
	  font-size: 21px;
	  font-weight: bold;
	  color: #FFFFFF;
	  background: #4F7849;
	  background: -moz-linear-gradient(top, #7b9a76 0%, #60855b 66%, #4F7849 100%);
	  background: -webkit-linear-gradient(top, #7b9a76 0%, #60855b 66%, #4F7849 100%);
	  background: linear-gradient(to bottom, #7b9a76 0%, #60855b 66%, #4F7849 100%);
	  border-top: 1px solid #444444;
	}
	.comicGreen .tableFootStyle {
	  font-size: 21px;
	}
	/* DivTable.com */
	.divTable{ display: table; }
	.divTableRow { display: table-row; }
	.divTableHeading { display: table-header-group;}
	.divTableCell, .divTableHead { display: table-cell;}
	.divTableHeading { display: table-header-group;}
	.divTableFoot { display: table-footer-group;}
	.divTableBody { display: table-row-group;}
</style>
<script type="text/javascript">
 

	$(document).ready(function(){  
		
	    updateContainer();
	    $(window).resize(function() {
	        updateContainer();
	    });
		
		$(window).on('resize', function(){
			
		}); 
	});
	
	function updateContainer() {
	    var $containerHeight = $(window).height();
	    $(".dashboard").css({"height": $containerHeight-170});
	}
</script>

</head> 
<body  > 
  <div id="swrap" class="swrap">
     <div id="title" style="padding: 10px;">
         <img id="titlesub" class="titlesub" src="<c:url value='/images/dash1.png' />"   height="15" /> SWARM DRONE CONTROL
     </div>
     
     <div id="selectMenu" class="selectMenu">
        <ul>
           <li style="border:0px solid #d3d3d3;width:100px">
              DRONE ACT
           </li>
           <li>
              ALL
           </li>
           <li>
              READY
           </li>
           <li>
              ACTIVE
           </li>
           <li>
              CLEAR
           </li> 
        </ul>
     </div>
     
     <div id="dashboard" class="dashboard" style=";overflow-y:scroll;">
		<div class="divTable comicGreen" >
			<div class="divTableBody" >  
				<div class="divTableRow">
					<div class="divTableCell">
					   Ready
					   <br>
					   25.00V(100%)
					   <br>
					   3D Fix(10)
					   <br>
					   0.03m
					 </div>
					<div class="divTableCell">
					   Ready
					   <br>
					   25.00V(100%)
					   <br>
					   3D Fix(10)
					   <br>
					   0.03m
					 </div>
					 <div class="divTableCell">
					   Ready
					   <br>
					   25.00V(100%)
					   <br>
					   3D Fix(10)
					   <br>
					   0.03m
					 </div>
					 <div class="divTableCell">
					   Ready
					   <br>
					   25.00V(100%)
					   <br>
					   3D Fix(10)
					   <br>
					   0.03m
					 </div>
					 <div class="divTableCell">
					   Ready
					   <br>
					   25.00V(100%)
					   <br>
					   3D Fix(10)
					   <br>
					   0.03m
					 </div>
					 <div class="divTableCell">
					   Ready
					   <br>
					   25.00V(100%)
					   <br>
					   3D Fix(10)
					   <br>
					   0.03m
					 </div>
					 <div class="divTableCell">
					   Ready
					   <br>
					   25.00V(100%)
					   <br>
					   3D Fix(10)
					   <br>
					   0.03m
					 </div>
					  <div class="divTableCell">
					   Ready
					   <br>
					   25.00V(100%)
					   <br>
					   3D Fix(10)
					   <br>
					   0.03m
					 </div> 
					 <div class="divTableCell">
					   Ready
					   <br>
					   25.00V(100%)
					   <br>
					   3D Fix(10)
					   <br>
					   0.03m
					 </div> 
					 <div class="divTableCell">
					   Ready
					   <br>
					   25.00V(100%)
					   <br>
					   3D Fix(10)
					   <br>
					   0.03m
					 </div> 
				</div>
				<div class="divTableRow">
					<div class="divTableCell">
					   Ready
					   <br>
					   25.00V(100%)
					   <br>
					   3D Fix(10)
					   <br>
					   0.03m
					 </div>
					<div class="divTableCell">
					   Ready
					   <br>
					   25.00V(100%)
					   <br>
					   3D Fix(10)
					   <br>
					   0.03m
					 </div>
					 <div class="divTableCell">
					   Ready
					   <br>
					   25.00V(100%)
					   <br>
					   3D Fix(10)
					   <br>
					   0.03m
					 </div>
					 <div class="divTableCell">
					   Ready
					   <br>
					   25.00V(100%)
					   <br>
					   3D Fix(10)
					   <br>
					   0.03m
					 </div>
					 <div class="divTableCell">
					   Ready
					   <br>
					   25.00V(100%)
					   <br>
					   3D Fix(10)
					   <br>
					   0.03m
					 </div>
					 <div class="divTableCell">
					   Ready
					   <br>
					   25.00V(100%)
					   <br>
					   3D Fix(10)
					   <br>
					   0.03m
					 </div>
					 <div class="divTableCell">
					   Ready
					   <br>
					   25.00V(100%)
					   <br>
					   3D Fix(10)
					   <br>
					   0.03m
					 </div>
					  <div class="divTableCell">
					   Ready
					   <br>
					   25.00V(100%)
					   <br>
					   3D Fix(10)
					   <br>
					   0.03m
					 </div> 
					 <div class="divTableCell">
					   Ready
					   <br>
					   25.00V(100%)
					   <br>
					   3D Fix(10)
					   <br>
					   0.03m
					 </div> 
					 <div class="divTableCell">
					   Ready
					   <br>
					   25.00V(100%)
					   <br>
					   3D Fix(10)
					   <br>
					   0.03m
					 </div> 
				</div>
				<div class="divTableRow">
					<div class="divTableCell">
					   Ready
					   <br>
					   25.00V(100%)
					   <br>
					   3D Fix(10)
					   <br>
					   0.03m
					 </div>
					<div class="divTableCell">
					   Ready
					   <br>
					   25.00V(100%)
					   <br>
					   3D Fix(10)
					   <br>
					   0.03m
					 </div>
					 <div class="divTableCell">
					   Ready
					   <br>
					   25.00V(100%)
					   <br>
					   3D Fix(10)
					   <br>
					   0.03m
					 </div>
					 <div class="divTableCell">
					   Ready
					   <br>
					   25.00V(100%)
					   <br>
					   3D Fix(10)
					   <br>
					   0.03m
					 </div>
					 <div class="divTableCell">
					   Ready
					   <br>
					   25.00V(100%)
					   <br>
					   3D Fix(10)
					   <br>
					   0.03m
					 </div>
					 <div class="divTableCell">
					   Ready
					   <br>
					   25.00V(100%)
					   <br>
					   3D Fix(10)
					   <br>
					   0.03m
					 </div>
					 <div class="divTableCell">
					   Ready
					   <br>
					   25.00V(100%)
					   <br>
					   3D Fix(10)
					   <br>
					   0.03m
					 </div>
					  <div class="divTableCell">
					   Ready
					   <br>
					   25.00V(100%)
					   <br>
					   3D Fix(10)
					   <br>
					   0.03m
					 </div> 
					 <div class="divTableCell">
					   Ready
					   <br>
					   25.00V(100%)
					   <br>
					   3D Fix(10)
					   <br>
					   0.03m
					 </div> 
					 <div class="divTableCell">
					   Ready
					   <br>
					   25.00V(100%)
					   <br>
					   3D Fix(10)
					   <br>
					   0.03m
					 </div> 
				</div>
				<div class="divTableRow">
					<div class="divTableCell">
					   Ready
					   <br>
					   25.00V(100%)
					   <br>
					   3D Fix(10)
					   <br>
					   0.03m
					 </div>
					<div class="divTableCell">
					   Ready
					   <br>
					   25.00V(100%)
					   <br>
					   3D Fix(10)
					   <br>
					   0.03m
					 </div>
					 <div class="divTableCell">
					   Ready
					   <br>
					   25.00V(100%)
					   <br>
					   3D Fix(10)
					   <br>
					   0.03m
					 </div>
					 <div class="divTableCell">
					   Ready
					   <br>
					   25.00V(100%)
					   <br>
					   3D Fix(10)
					   <br>
					   0.03m
					 </div>
					 <div class="divTableCell">
					   Ready
					   <br>
					   25.00V(100%)
					   <br>
					   3D Fix(10)
					   <br>
					   0.03m
					 </div>
					 <div class="divTableCell">
					   Ready
					   <br>
					   25.00V(100%)
					   <br>
					   3D Fix(10)
					   <br>
					   0.03m
					 </div>
					 <div class="divTableCell">
					   Ready
					   <br>
					   25.00V(100%)
					   <br>
					   3D Fix(10)
					   <br>
					   0.03m
					 </div>
					  <div class="divTableCell">
					   Ready
					   <br>
					   25.00V(100%)
					   <br>
					   3D Fix(10)
					   <br>
					   0.03m
					 </div> 
					 <div class="divTableCell">
					   Ready
					   <br>
					   25.00V(100%)
					   <br>
					   3D Fix(10)
					   <br>
					   0.03m
					 </div> 
					 <div class="divTableCell">
					   Ready
					   <br>
					   25.00V(100%)
					   <br>
					   3D Fix(10)
					   <br>
					   0.03m
					 </div> 
				</div>
				<div class="divTableRow">
					<div class="divTableCell">
					   Ready
					   <br>
					   25.00V(100%)
					   <br>
					   3D Fix(10)
					   <br>
					   0.03m
					 </div>
					<div class="divTableCell">
					   Ready
					   <br>
					   25.00V(100%)
					   <br>
					   3D Fix(10)
					   <br>
					   0.03m
					 </div>
					 <div class="divTableCell">
					   Ready
					   <br>
					   25.00V(100%)
					   <br>
					   3D Fix(10)
					   <br>
					   0.03m
					 </div>
					 <div class="divTableCell">
					   Ready
					   <br>
					   25.00V(100%)
					   <br>
					   3D Fix(10)
					   <br>
					   0.03m
					 </div>
					 <div class="divTableCell">
					   Ready
					   <br>
					   25.00V(100%)
					   <br>
					   3D Fix(10)
					   <br>
					   0.03m
					 </div>
					 <div class="divTableCell">
					   Ready
					   <br>
					   25.00V(100%)
					   <br>
					   3D Fix(10)
					   <br>
					   0.03m
					 </div>
					 <div class="divTableCell">
					   Ready
					   <br>
					   25.00V(100%)
					   <br>
					   3D Fix(10)
					   <br>
					   0.03m
					 </div>
					  <div class="divTableCell">
					   Ready
					   <br>
					   25.00V(100%)
					   <br>
					   3D Fix(10)
					   <br>
					   0.03m
					 </div> 
					 <div class="divTableCell">
					   Ready
					   <br>
					   25.00V(100%)
					   <br>
					   3D Fix(10)
					   <br>
					   0.03m
					 </div> 
					 <div class="divTableCell">
					   Ready
					   <br>
					   25.00V(100%)
					   <br>
					   3D Fix(10)
					   <br>
					   0.03m
					 </div> 
				</div>
				<div class="divTableRow">
					<div class="divTableCell">
					   Ready
					   <br>
					   25.00V(100%)
					   <br>
					   3D Fix(10)
					   <br>
					   0.03m
					 </div>
					<div class="divTableCell">
					   Ready
					   <br>
					   25.00V(100%)
					   <br>
					   3D Fix(10)
					   <br>
					   0.03m
					 </div>
					 <div class="divTableCell">
					   Ready
					   <br>
					   25.00V(100%)
					   <br>
					   3D Fix(10)
					   <br>
					   0.03m
					 </div>
					 <div class="divTableCell">
					   Ready
					   <br>
					   25.00V(100%)
					   <br>
					   3D Fix(10)
					   <br>
					   0.03m
					 </div>
					 <div class="divTableCell">
					   Ready
					   <br>
					   25.00V(100%)
					   <br>
					   3D Fix(10)
					   <br>
					   0.03m
					 </div>
					 <div class="divTableCell">
					   Ready
					   <br>
					   25.00V(100%)
					   <br>
					   3D Fix(10)
					   <br>
					   0.03m
					 </div>
					 <div class="divTableCell">
					   Ready
					   <br>
					   25.00V(100%)
					   <br>
					   3D Fix(10)
					   <br>
					   0.03m
					 </div>
					  <div class="divTableCell">
					   Ready
					   <br>
					   25.00V(100%)
					   <br>
					   3D Fix(10)
					   <br>
					   0.03m
					 </div> 
					 <div class="divTableCell">
					   Ready
					   <br>
					   25.00V(100%)
					   <br>
					   3D Fix(10)
					   <br>
					   0.03m
					 </div> 
					 <div class="divTableCell">
					   Ready
					   <br>
					   25.00V(100%)
					   <br>
					   3D Fix(10)
					   <br>
					   0.03m
					 </div> 
				</div>
				<div class="divTableRow">
					<div class="divTableCell">
					   Ready
					   <br>
					   25.00V(100%)
					   <br>
					   3D Fix(10)
					   <br>
					   0.03m
					 </div>
					<div class="divTableCell">
					   Ready
					   <br>
					   25.00V(100%)
					   <br>
					   3D Fix(10)
					   <br>
					   0.03m
					 </div>
					 <div class="divTableCell">
					   Ready
					   <br>
					   25.00V(100%)
					   <br>
					   3D Fix(10)
					   <br>
					   0.03m
					 </div>
					 <div class="divTableCell">
					   Ready
					   <br>
					   25.00V(100%)
					   <br>
					   3D Fix(10)
					   <br>
					   0.03m
					 </div>
					 <div class="divTableCell">
					   Ready
					   <br>
					   25.00V(100%)
					   <br>
					   3D Fix(10)
					   <br>
					   0.03m
					 </div>
					 <div class="divTableCell">
					   Ready
					   <br>
					   25.00V(100%)
					   <br>
					   3D Fix(10)
					   <br>
					   0.03m
					 </div>
					 <div class="divTableCell">
					   Ready
					   <br>
					   25.00V(100%)
					   <br>
					   3D Fix(10)
					   <br>
					   0.03m
					 </div>
					  <div class="divTableCell">
					   Ready
					   <br>
					   25.00V(100%)
					   <br>
					   3D Fix(10)
					   <br>
					   0.03m
					 </div> 
					 <div class="divTableCell">
					   Ready
					   <br>
					   25.00V(100%)
					   <br>
					   3D Fix(10)
					   <br>
					   0.03m
					 </div> 
					 <div class="divTableCell">
					   Ready
					   <br>
					   25.00V(100%)
					   <br>
					   3D Fix(10)
					   <br>
					   0.03m
					 </div> 
				</div>
				<div class="divTableRow">
					<div class="divTableCell">
					   Ready
					   <br>
					   25.00V(100%)
					   <br>
					   3D Fix(10)
					   <br>
					   0.03m
					 </div>
					<div class="divTableCell">
					   Ready
					   <br>
					   25.00V(100%)
					   <br>
					   3D Fix(10)
					   <br>
					   0.03m
					 </div>
					 <div class="divTableCell">
					   Ready
					   <br>
					   25.00V(100%)
					   <br>
					   3D Fix(10)
					   <br>
					   0.03m
					 </div>
					 <div class="divTableCell">
					   Ready
					   <br>
					   25.00V(100%)
					   <br>
					   3D Fix(10)
					   <br>
					   0.03m
					 </div>
					 <div class="divTableCell">
					   Ready
					   <br>
					   25.00V(100%)
					   <br>
					   3D Fix(10)
					   <br>
					   0.03m
					 </div>
					 <div class="divTableCell">
					   Ready
					   <br>
					   25.00V(100%)
					   <br>
					   3D Fix(10)
					   <br>
					   0.03m
					 </div>
					 <div class="divTableCell">
					   Ready
					   <br>
					   25.00V(100%)
					   <br>
					   3D Fix(10)
					   <br>
					   0.03m
					 </div>
					  <div class="divTableCell">
					   Ready
					   <br>
					   25.00V(100%)
					   <br>
					   3D Fix(10)
					   <br>
					   0.03m
					 </div> 
					 <div class="divTableCell">
					   Ready
					   <br>
					   25.00V(100%)
					   <br>
					   3D Fix(10)
					   <br>
					   0.03m
					 </div> 
					 <div class="divTableCell">
					   Ready
					   <br>
					   25.00V(100%)
					   <br>
					   3D Fix(10)
					   <br>
					   0.03m
					 </div> 
				</div>
				<div class="divTableRow">
					<div class="divTableCell">
					   Ready
					   <br>
					   25.00V(100%)
					   <br>
					   3D Fix(10)
					   <br>
					   0.03m
					 </div>
					<div class="divTableCell">
					   Ready
					   <br>
					   25.00V(100%)
					   <br>
					   3D Fix(10)
					   <br>
					   0.03m
					 </div>
					 <div class="divTableCell">
					   Ready
					   <br>
					   25.00V(100%)
					   <br>
					   3D Fix(10)
					   <br>
					   0.03m
					 </div>
					 <div class="divTableCell">
					   Ready
					   <br>
					   25.00V(100%)
					   <br>
					   3D Fix(10)
					   <br>
					   0.03m
					 </div>
					 <div class="divTableCell">
					   Ready
					   <br>
					   25.00V(100%)
					   <br>
					   3D Fix(10)
					   <br>
					   0.03m
					 </div>
					 <div class="divTableCell">
					   Ready
					   <br>
					   25.00V(100%)
					   <br>
					   3D Fix(10)
					   <br>
					   0.03m
					 </div>
					 <div class="divTableCell">
					   Ready
					   <br>
					   25.00V(100%)
					   <br>
					   3D Fix(10)
					   <br>
					   0.03m
					 </div>
					  <div class="divTableCell">
					   Ready
					   <br>
					   25.00V(100%)
					   <br>
					   3D Fix(10)
					   <br>
					   0.03m
					 </div> 
					 <div class="divTableCell">
					   Ready
					   <br>
					   25.00V(100%)
					   <br>
					   3D Fix(10)
					   <br>
					   0.03m
					 </div> 
					 <div class="divTableCell">
					   Ready
					   <br>
					   25.00V(100%)
					   <br>
					   3D Fix(10)
					   <br>
					   0.03m
					 </div> 
				</div>
				<div class="divTableRow">
					<div class="divTableCell">
					   Ready
					   <br>
					   25.00V(100%)
					   <br>
					   3D Fix(10)
					   <br>
					   0.03m
					 </div>
					<div class="divTableCell">
					   Ready
					   <br>
					   25.00V(100%)
					   <br>
					   3D Fix(10)
					   <br>
					   0.03m
					 </div>
					 <div class="divTableCell">
					   Ready
					   <br>
					   25.00V(100%)
					   <br>
					   3D Fix(10)
					   <br>
					   0.03m
					 </div>
					 <div class="divTableCell">
					   Ready
					   <br>
					   25.00V(100%)
					   <br>
					   3D Fix(10)
					   <br>
					   0.03m
					 </div>
					 <div class="divTableCell">
					   Ready
					   <br>
					   25.00V(100%)
					   <br>
					   3D Fix(10)
					   <br>
					   0.03m
					 </div>
					 <div class="divTableCell">
					   Ready
					   <br>
					   25.00V(100%)
					   <br>
					   3D Fix(10)
					   <br>
					   0.03m
					 </div>
					 <div class="divTableCell">
					   Ready
					   <br>
					   25.00V(100%)
					   <br>
					   3D Fix(10)
					   <br>
					   0.03m
					 </div>
					  <div class="divTableCell">
					   Ready
					   <br>
					   25.00V(100%)
					   <br>
					   3D Fix(10)
					   <br>
					   0.03m
					 </div> 
					 <div class="divTableCell">
					   Ready
					   <br>
					   25.00V(100%)
					   <br>
					   3D Fix(10)
					   <br>
					   0.03m
					 </div> 
					 <div class="divTableCell">
					   Ready
					   <br>
					   25.00V(100%)
					   <br>
					   3D Fix(10)
					   <br>
					   0.03m
					 </div> 
				</div>
				<div class="divTableRow">
					<div class="divTableCell">
					   Ready
					   <br>
					   25.00V(100%)
					   <br>
					   3D Fix(10)
					   <br>
					   0.03m
					 </div>
					<div class="divTableCell">
					   Ready
					   <br>
					   25.00V(100%)
					   <br>
					   3D Fix(10)
					   <br>
					   0.03m
					 </div>
					 <div class="divTableCell">
					   Ready
					   <br>
					   25.00V(100%)
					   <br>
					   3D Fix(10)
					   <br>
					   0.03m
					 </div>
					 <div class="divTableCell">
					   Ready
					   <br>
					   25.00V(100%)
					   <br>
					   3D Fix(10)
					   <br>
					   0.03m
					 </div>
					 <div class="divTableCell">
					   Ready
					   <br>
					   25.00V(100%)
					   <br>
					   3D Fix(10)
					   <br>
					   0.03m
					 </div>
					 <div class="divTableCell">
					   Ready
					   <br>
					   25.00V(100%)
					   <br>
					   3D Fix(10)
					   <br>
					   0.03m
					 </div>
					 <div class="divTableCell">
					   Ready
					   <br>
					   25.00V(100%)
					   <br>
					   3D Fix(10)
					   <br>
					   0.03m
					 </div>
					  <div class="divTableCell">
					   Ready
					   <br>
					   25.00V(100%)
					   <br>
					   3D Fix(10)
					   <br>
					   0.03m
					 </div> 
					 <div class="divTableCell">
					   Ready
					   <br>
					   25.00V(100%)
					   <br>
					   3D Fix(10)
					   <br>
					   0.03m
					 </div> 
					 <div class="divTableCell">
					   Ready
					   <br>
					   25.00V(100%)
					   <br>
					   3D Fix(10)
					   <br>
					   0.03m
					 </div> 
				</div>
				
			</div> 
		</div>
	</div>
     
     <div id="selectMenu2" class="selectMenu2">
        <ul>
          <li>ARM</li>
          <li>DISARM</li>
          <li>TAKE OFF</li>
          <li>LAND</li>
          <li>RTL</li>
        </ul>
 
     </div>
     <div id="selectMenu3" class="selectMenu2" style="clear:both">
        <ul>
          <li>FC REBOOT</li>
          <li>LED REBOOT</li>
          <li>OS TURN/OFF</li>
        </ul> 
     </div>
     
  </div> 

</body>
</html>
