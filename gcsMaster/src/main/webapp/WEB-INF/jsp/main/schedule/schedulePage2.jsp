<%--
  Class Name : EgovMainView.jsp 
  Description : 메인화면
  Modification Information
 
      수정일         수정자                   수정내용
    -------    --------    ---------------------------
     2011.08.31   JJY       경량환경 버전 생성
 
    author   : 실행환경개발팀 JJY
    since    : 2011.08.31 
--%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="UTF-8">
	<title>Full Layout - jQuery EasyUI Demo</title> 
	<link href="<c:url value='/'/>css/themes/easyui.css" rel="stylesheet" type="text/css" >
	<link href="<c:url value='/'/>css/icon.css" rel="stylesheet" type="text/css" >
	<link href="<c:url value='/'/>css/layout.css" rel="stylesheet" type="text/css" >
	<script type="text/javascript" src="<c:url value='/js/jquery.min.js' />"></script>
	<script type="text/javascript" src="<c:url value='/js/jquery.easyui.min.js' />"></script>
	
    <style>
		*{
		  margin: 0px;
		  padding: 0px;
		}
		.maincontainer{
		  width: 100%;
		  margin: 0 auto;
		}
		.maincontainer div{
		  text-align: center;
		  display: table;
		}
		.maincontainer div span{
		  display: table-cell;
		  vertical-align: middle;
		}
		.maintop{
		  margin-top: 20px;
		  outline: 1px solid #ffffff;
		  width: 100%; 
		  display: table;
		  background-color: #ffffff;
		}
		.maintop-month{
		  margin-top: 5px;
		  outline: 1px solid #9F9F9F;
		  width: 100px; 
		  background-color: #00D8FF;
		  float:left; 
		}	
		.maintop-login{
		  margin-top: 5px;
		  outline: 1px solid #9F9F9F;
		  width: 100px;
		  height: 50px;	 
		  background-color: #00D8FF;
		  float:right; 
		}		
		.mainmiddle{
		  margin-top: 20px;
		  width: 1000px;
		  height: 500px;
		  position: relative;
		}
		.mainmiddle-left{
		  outline: 1px solid #9F9F9F;
		  position: absolute;
		  top: 0px;
		  width: 600px;
		  height: 500px;
		  background-color: #00D8FF;
		}
		.mainmiddle-right{
		  position: absolute;
		  top: 0px;
		  left: 620px;
		  width: 100%;
		  height: 500px;
		}
		.mainmiddle-right-1{
		  outline: 1px solid #9F9F9F;
		  width: 100%;
		  height: 150px;
		  background-color: #FF00DD;
		}
		.mainbottom{
		  margin-top: 20px;
		  margin-bottom: 20px;
		  outline: 1px solid #9F9F9F;
		  width: 100%;
		  height: 100px;
		  background-color: #5D5D5D;
		  color: #fff;
		}
    </style>
</head>

<body class="easyui-layout">
	<div data-options="region:'north',border:false" style="height:30px;padding:10px">
		<c:import url="/EmpPageLink.do?link=main/include/EmpIncHeader" />
	</div>
	<div data-options="region:'west',split:true,title:'MENU'" style="width:150px;padding:10px;">
	  <c:import url="/EmpPageLink.do?link=main/include/EmpIncMenu" />
	</div>
	<div data-options="region:'center',title:'Schedule'">
		<div class="maincontainer">
		  <!-- TOP -->
		  <div class="maintop">
		    <div class="maintop-month">
		       <table style="width:500px;">
				  <tr>
				    <td>May. 2021</td>
				    <td><<0>></td>
				    <td><a href="<c:url value='/empo/schedule/eMAU00B01Main.do'/>">year</a></td>
				    <td><a href="<c:url value='/empo/schedule/eMAU00B02Main.do'/>">month</a></td>
				    <td><a href="<c:url value='/empo/schedule/eMAU00B03Main.do'/>">week</a></td>
				  </tr>
		       </table>	    
		    </div>
		    <div class="maintop-login">
		            홍길동 님
		      <br>정보화지원실 책임        
		            
		    </div>
		  </div>
		
		  <!-- MIDDLE -->
		  <div class="mainmiddle">
		
		    <div class="mainmiddle-left"> <span>LEFT (600 x 500) <br/> #00D8FF;</span> </div>
		
		    <div class="mainmiddle-right">
		
		      <div class="mainmiddle-right-1"> <span>RIGHT1 (380 x 150) <br/> #FF00DD;</span> </div> 
		
		    </div>
		
		  </div>
		
		  <div class="mainbottom"> <span>BOTTOM (1000 x 100) <br/> #5D5D5D;</span> </div>
		
		</div>
	</div>
	<div data-options="region:'east',split:true,collapsed:true,title:'East'" style="width:100px;padding:10px;">우측</div>
	<div data-options="region:'south',border:false" style="height:20px;background:#000000;padding:10px;">하단메뉴</div>
</body>
</html>