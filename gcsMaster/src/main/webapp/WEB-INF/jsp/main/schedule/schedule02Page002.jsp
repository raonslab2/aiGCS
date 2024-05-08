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
	
	<!-- kendo -->
	<link href="<c:url value='/'/>css/examples-offline.css" rel="stylesheet" type="text/css" > 
    <link href="<c:url value='/'/>css/styles/kendo.common.min.css" rel="stylesheet">
    <link href="<c:url value='/'/>css/styles/kendo.rtl.min.css" rel="stylesheet">
    <link href="<c:url value='/'/>css/styles/kendo.default.min.css" rel="stylesheet">
    <link href="<c:url value='/'/>css/styles/kendo.default.mobile.min.css" rel="stylesheet">
	<script src="/js/jszip.min.js"></script>
    <script src="/js/kendo.all.min.js"></script>
    <script src="/js/console.js"></script>
    
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
		
		<!--달력-->
	    #team-schedule {
	        background: url('/images/scheduler/team-schedule.png') transparent no-repeat;
	        height: 115px;
	        position: relative;
	    }
	
	    #people {
	        background: url('/images/scheduler/scheduler-people.png') no-repeat;
	        width: 345px;
	        height: 115px;
	        position: absolute;
	        right: 0;
	    }
	
	    #alex {
	        position: absolute;
	        left: 4px;
	        top: 81px;
	    }
	
	    #bob {
	        position: absolute;
	        left: 119px;
	        top: 81px;
	    }
	
	    #charlie {
	        position: absolute;
	        left: 234px;
	        top: 81px;
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
		
	$(function() {
	    $("#scheduler").kendoScheduler({
	    	
	        date: new Date(),
	        startTime: new Date("2013/6/13 07:00 AM"),
	        height: 600,
	        views: [
	        	"year"
	            ,{ type: "month", selected: true }
	            ,"week"
	            ,"month" 
	   
	        ],
	        timezone: "Etc/UTC",
	        dataSource: {
	            batch: true,
	            transport: {
	                read: {
	                    url: "https://demos.telerik.com/kendo-ui/service/tasks",
	                    dataType: "jsonp"
	                },
	                update: {
	                    url: "https://demos.telerik.com/kendo-ui/service/tasks/update",
	                    dataType: "jsonp"
	                },
	                create: {
	                    url: "https://demos.telerik.com/kendo-ui/service/tasks/create",
	                    dataType: "jsonp"
	                },
	                destroy: {
	                    url: "https://demos.telerik.com/kendo-ui/service/tasks/destroy",
	                    dataType: "jsonp"
	                },
	                parameterMap: function(options, operation) {
	                    if (operation !== "read" && options.models) {
	                        return {models: kendo.stringify(options.models)};
	                    }
	                }
	            },
	            schema: {
	                model: {
	                    id: "taskId",
	                    fields: {
	                        taskId: { from: "TaskID", type: "number" },
	                        title: { from: "Title", defaultValue: "No title", validation: { required: true } },
	                        start: { type: "date", from: "Start" },
	                        end: { type: "date", from: "End" },
	                        startTimezone: { from: "StartTimezone" },
	                        endTimezone: { from: "EndTimezone" },
	                        description: { from: "Description" },
	                        recurrenceId: { from: "RecurrenceID" },
	                        recurrenceRule: { from: "RecurrenceRule" },
	                        recurrenceException: { from: "RecurrenceException" },
	                        ownerId: { from: "OwnerID", defaultValue: 1 },
	                        isAllDay: { type: "boolean", from: "IsAllDay" }
	                    }
	                }
	            },
	            filter: {
	                logic: "or",
	                filters: [
	                    { field: "ownerId", operator: "eq", value: 1 },
	                    { field: "ownerId", operator: "eq", value: 2 }
	                ]
	            }
	        },
	        resources: [
	            {
	                field: "ownerId",
	                title: "Owner",
	                dataSource: [
	                    { text: "Alex", value: 1, color: "#f8a398" },
	                    { text: "Bob", value: 2, color: "#51a0ed" },
	                    { text: "Charlie", value: 3, color: "#56ca85" }
	                ]
	            }
	        ]
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
			   <div id="scheduler"></div>
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