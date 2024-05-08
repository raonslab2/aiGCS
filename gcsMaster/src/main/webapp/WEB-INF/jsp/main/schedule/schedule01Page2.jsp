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
    <!-- 전체 레이아웃 -->
    <link href="<c:url value='/'/>css/main-layout.css" rel="stylesheet" type="text/css" >
    
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
		  margin-top: 10px;
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
		  outline: 1px solid #000000;
		  position: absolute;
		  top: 0px;
		  width: 1200px;
		  height: 500px;
		  background-color: #ffffff;
		}
		.mainmiddle-right{
		  position: absolute;
		  top: 0px;
		  left: 1210px;
		  width: 200px; 
		}
		.mainmiddle-right-1{
		  outline: 1px solid #9F9F9F;
		  width: 100%;
		  height: 500px;
		  background-color: #ffffff;
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
    
<script type="text/javascript"> 
	//alert("HEAD ALERT 경고창");
	//window.onload = function(){ 
		//alert("window.onload ALERT 경고창"); 
	//	}
	
	$(document).ready(function(){ 
		//alert("$(document).ready ALERT 경고창"); 
 
		  var callback = "getBlockDidDocVcCreateResult";
		  
		  //vc challenge call
		  var tmVal = "";
		  var params = jQuery("loginForm").serialize(); 
	 
	      var str = $("#loginForm").serialize();
	     
	      $.ajax({
	          url: "<c:url value='/empo/schedule/eMAU00B02Main001.do'/>",
	          type: "POST",
	          data: str,
	          async : false,
	          success: function(data){
	        	  //alert("data:"+data);
	        	  //alert("result:"+ data.result);  
	        	  //alert("option:"+ data.option);  
	          },
	          error: function(){
	              alert("blockVcChallenge error");
	          }
	      });  
		 
		});
		
 
</script>

</head>

<body class="easyui-layout">
<!-- 전체 레이어 시작 -->
<form name="loginForm" id="loginForm" method="post">
			<input type="hidden" name="test" id="test" value="testvalue" />
			<input type="hidden" name="vcIssueMsq" id="vcIssueMsq" value="vcIssueMsqvalue" />
</form>
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
		
		    <div class="mainmiddle-left"> 
		       <table style="width:100%;border: solid 1px #aaa999;">
				  <tr>
				    <th style="border: solid 1px #aaa999;;height:50px">
				      [사업부전체]
				      
				    </th>
				    <th style="border: solid 1px #aaa999;" colspan="4">1월</th> 
				    <th style="border: solid 1px #aaa999;" colspan="4">2월</th> 
				    <th style="border: solid 1px #aaa999;" colspan="4">3월</th> 
				    <th style="border: solid 1px #aaa999;" colspan="4">4월</th> 
				    <th style="border: solid 1px #aaa999;" colspan="4">5월</th> 
				    <th style="border: solid 1px #aaa999;" colspan="4">6월</th> 
				    <th style="border: solid 1px #aaa999;" colspan="4">7월</th> 
				    <th style="border: solid 1px #aaa999;" colspan="4">8월</th> 
				    <th style="border: solid 1px #aaa999;" colspan="4">9월</th> 
				    <th style="border: solid 1px #aaa999;" colspan="4">10월</th> 
				    <th style="border: solid 1px #aaa999;" colspan="4">11월</th> 
				    <th style="border: solid 1px #aaa999;" colspan="4">12월</th> 
				  </tr>
					<c:forEach var="i" begin="0" end="5">
				       <tr>
					    <td style="width:150px;border: solid 1px #aaa999;height:100px;text-align:right;">
					      [진행중]
					      <br>
					      2021년도
					      <br>
					      중소기업
					      <br>
					      기술혁신개발사업
					      <br>
					      (수출지향형)1차
					    </th>
					    <td style="border: solid 1px #aaa999;" >1</td> 
					    <td style="border: solid 1px #aaa999;" >2</td> 
					    <td style="border: solid 1px #aaa999;" >3</td> 
					    <td style="border: solid 1px #aaa999;" >4</td> 
					    <td style="border: solid 1px #aaa999;" >1</td> 
					    <td style="border: solid 1px #aaa999;" >2</td> 
					    <td style="border: solid 1px #aaa999;" >3</td> 
					    <td style="border: solid 1px #aaa999;" >4</td> 
					    <td style="border: solid 1px #aaa999;" >1</td> 
					    <td style="border: solid 1px #aaa999;" >2</td> 
					    <td style="border: solid 1px #aaa999;" >3</td> 
					    <td style="border: solid 1px #aaa999;" >4</td> 
					    <td style="border: solid 1px #aaa999;" >1</td> 
					    <td style="border: solid 1px #aaa999;" >2</td> 
					    <td style="border: solid 1px #aaa999;" >3</td> 
					    <td style="border: solid 1px #aaa999;" >4</td> 
					    <td style="border: solid 1px #aaa999;" >1</td> 
					    <td style="border: solid 1px #aaa999;" >2</td> 
					    <td style="border: solid 1px #aaa999;" >3</td> 
					    <td style="border: solid 1px #aaa999;" >4</td> 
					    <td style="border: solid 1px #aaa999;" >1</td> 
					    <td style="border: solid 1px #aaa999;" >2</td> 
					    <td style="border: solid 1px #aaa999;" >3</td> 
					    <td style="border: solid 1px #aaa999;" >4</td> 
					    <td style="border: solid 1px #aaa999;" >1</td> 
					    <td style="border: solid 1px #aaa999;" >2</td> 
					    <td style="border: solid 1px #aaa999;" >3</td> 
					    <td style="border: solid 1px #aaa999;" >4</td> 
					    <td style="border: solid 1px #aaa999;" >1</td> 
					    <td style="border: solid 1px #aaa999;" >2</td> 
					    <td style="border: solid 1px #aaa999;" >3</td> 
					    <td style="border: solid 1px #aaa999;" >4</td> 
					    <td style="border: solid 1px #aaa999;" >1</td> 
					    <td style="border: solid 1px #aaa999;" >2</td> 
					    <td style="border: solid 1px #aaa999;" >3</td> 
					    <td style="border: solid 1px #aaa999;" >4</td> 
					    <td style="border: solid 1px #aaa999;" >1</td> 
					    <td style="border: solid 1px #aaa999;" >2</td> 
					    <td style="border: solid 1px #aaa999;" >3</td> 
					    <td style="border: solid 1px #aaa999;" >4</td> 
					    <td style="border: solid 1px #aaa999;" >1</td> 
					    <td style="border: solid 1px #aaa999;" >2</td> 
					    <td style="border: solid 1px #aaa999;" >3</td> 
					    <td style="border: solid 1px #aaa999;" >4</td> 
					    <td style="border: solid 1px #aaa999;" >1</td> 
					    <td style="border: solid 1px #aaa999;" >2</td> 
					    <td style="border: solid 1px #aaa999;" >3</td> 
					    <td style="border: solid 1px #aaa999;" >4</td> 
					  </tr>
					</c:forEach> 
		       </table>	
		    </div>
		
		    <div class="mainmiddle-right">
		
		      <div class="mainmiddle-right-1">
		       <table style="width:100%;border: solid 1px #aaa999;">
				  <tr>
				    <th style="border: solid 1px #aaa999;height:50px">
				           선택보기 
				    </th> 
				  </tr>
				  <tr>
				  	<td style="border: solid 1px #aaa999;height:45px;text-align:left;" >사업공고</td> 
				  </tr>
				  <tr>
				  	<td style="border: solid 1px #aaa999;height:45px;text-align:left;" >과제접수</td> 
				  </tr>
				  <tr>
				  	<td style="border: solid 1px #aaa999;height:45px;text-align:left;" >사전점검</td> 
				  </tr>
				  <tr>
				  	<td style="border: solid 1px #aaa999;height:45px;text-align:left;" >사전평가</td> 
				  </tr>
				  <tr>
				  	<td style="border: solid 1px #aaa999;height:45px;text-align:left;" >- 결과통보</td> 
				  </tr>
				  <tr>
				  	<td style="border: solid 1px #aaa999;height:45px;text-align:left;" >대면평가</td> 
				  </tr>
				  <tr>
				  	<td style="border: solid 1px #aaa999;height:45px;text-align:left;" >- 결과통보</td> 
				  </tr>
				  <tr>
				  	<td style="border: solid 1px #aaa999;height:45px;text-align:left;" >협약</td> 
				  </tr>
				  <tr>
				  	<td style="border: solid 1px #aaa999;height:45px;text-align:left;" >- 사업비지급</td> 
				  </tr>
				  
			  </table>
		      </div> 
		
		    </div>
		
		  </div>
		 
		
		</div>
	</div>
	<div data-options="region:'east',split:true,collapsed:true,title:'East'" style="width:100px;padding:10px;">우측</div>
	<div data-options="region:'south',border:false" style="height:20px;background:#000000;padding:10px;">하단메뉴</div>
</body>
</html>