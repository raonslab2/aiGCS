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

    
    <link href="/assets/vendor/fontawesome/css/fontawesome.min.css" rel="stylesheet">
    <link href="/assets/vendor/fontawesome/css/solid.min.css" rel="stylesheet">
    <link href="/assets/vendor/fontawesome/css/brands.min.css" rel="stylesheet">
    <link href="/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="/assets/css/master.css" rel="stylesheet">
    <link href="/assets/vendor/flagiconcss/css/flag-icon.min.css" rel="stylesheet">
</head>

<script type="text/javascript">
	 


</script>

<body>
    <div class="wrapper">
        <!-- left menu -->
        <c:import url="/EmpPageLink.do?link=main/include/menu3" /> 
        <div id="body" class="active">
            <!-- navbar navigation component -->
            <c:import url="/EmpPageLink.do?link=main/include/menu_sub1" />    
            <!-- end of navbar navigation -->          
            <div class="content">
                <div class="container">
                     <div class="page-title" style="margin-top:69px;">
						<!-- 검색 form 시작 -->
		 
						<!-- 검색 form 종료 --> 
                    </div>
                    <div class="row">
                        <div class="col-md-12 col-lg-12">
                            <div class="card">

                                <div class="card-body">    
					                <form id="insertForm" name="insertForm" method="post">
                                    <div class="table-responsive">
                                        <table class="table">
                                            <thead>
                                                <tr>
                                                    <th>ID</th>
                                                    <th>Device Name</th>
                                                    <th>Device Alias</th>
                                                    <th>Device type</th>
                                                    <th>Agency</th>
                                                    <th>registrant name</th>
                                                    <th>Memo</th>
                                                </tr>
                                            </thead>
											<tbody id="resultList" >
                                                <tr>
                                                    <td>
                                                      <input type="text" id="aiPk" name="aiPk" readonly minlength="4"  size="10" value="${aiPk}" ></td>
                                                    <td>
                                                      <input type="text" id="aiDeviceName" name="aiDeviceName" required m   size="10" value="${list.aiDeviceName}">
                                                    </td>
                                                    <td> 
                                                       <select name="aiDeviceType" id="aiDeviceType">
													     <option value="">--Please choose Device Type--</option>
													     <option value="QUAD">QUAD</option>
													     <option value="VTOL">VTOL</option> 
													   </select>
                                                    </td>
                                                    <td>
                                                      <input type="text" id="aiAgency" name="aiAgency" required   size="10" value="${list.aiAgency}">
                                                    </td>
                                                    <td>
                                                      <input type="text" id="aiRegisterId" name="aiRegisterId" required   size="10" value="${list.aiRegisterId}">
                                                    </td>
                                                    <td>
                                                      <input type="text" id="aiMemo" name="aiMemo" required   size="10" value="${list.aiMemo}">
                                                    </td>
                                                </tr>
											  
										    </tbody>  
                                        </table> 
                                    </div>
	                                <div class="card-header" style="text-aligh:right;">
	                                  <span id="dataInsert" class="dataInsert">Registration<span>▷</span></span> 
	                                </div> 
	                               </form>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                </div>
            </div>
        </div>
    </div>
    <script src="/assets/vendor/jquery/jquery.min.js"></script>
    <script src="/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="/assets/vendor/chartsjs/Chart.min.js"></script>
    <script src="/assets/js/dashboard-charts.js"></script>
    <script src="/assets/js/script.js"></script>


	<script> 
		;(function() {

			//${list.dlPk}
			$(function() {
				var aiPk = "${aiPk}";  
				if(aiPk !=""){
					initList(aiPk);					
				}
			});
			
			var initList = function(aiPk) {
 
				$.ajax({
					url : '/gcs/dashboard/gA034MainWriteData.do'
					, type : 'post' 
					, data : { "aiPk" : aiPk }
				}).done(function(res) {
					$('#resultList').children().remove();
					 
					    //
					var tmArr = [ 'QUAD', 'VTOL' ]; 
					var tmpath ="   <select name=\"aiDeviceType\" id=\"aiDeviceType\">\r\n";
					tmpath  += "	 <option value=\"\">--Please choose Device Type--</option>\r\n"
					    
						$.ajax({
							url : '/gcs/ga00main/ga00mainDeviceTypeList.do'
							, type : 'post' 
							, async : false 
						}).done(function(tmres) { 
							tmres.list.forEach(function(row, index) { 
								if(res.list.aiDeviceType == row.codeName){
									selectPath = "selected";
								}else{
									selectPath = "";
								}
								tmpath  += "<option value=\""+row.codeName+"\" "+selectPath+">"+row.codeName+"</option>\r\n" 
								//mbCode = row.mbCode;	
							});
						}).fail(function() {
							alert("실패");
						});
		 
					tmpath  += "   </select>";	 
					
					var data = "<tr>\r\n"
						+ "	<td>\r\n"
						+ "	  <input type=\"text\" id=\"aiPk\" name=\"aiPk\" readonly minlength=\"4\"  size=\"10\" value=\""+res.list.aiPk+"\" ></td>\r\n"
						+ "	<td>\r\n"
						+ "	  <input type=\"text\" id=\"aiDeviceName\" name=\"aiDeviceName\" required m   size=\"10\" value=\""+res.list.aiDeviceName+"\">\r\n"
						+ "	</td>\r\n"
						+ "	<td>\r\n"
						+ "	  <input type=\"text\" id=\"aiDeviceAlias\" name=\"aiDeviceAlias\" required m   size=\"10\" value=\""+res.list.aiDeviceAlias+"\">\r\n"
						+ "	</td>\r\n"
						+ "<td> \r\n"
						+ tmpath
						+ "</td>"						
						+ "	<td>\r\n"
						+ "	  <input type=\"text\" id=\"aiAgency\" name=\"aiAgency\" required   size=\"10\" value=\""+res.list.aiAgency+"\">\r\n"
						+ "	</td>\r\n"
						+ "	<td>\r\n"
						+ "	  <input type=\"text\" id=\"aiRegisterId\" name=\"aiRegisterId\" required   size=\"10\" value=\""+res.list.aiRegisterId+"\">\r\n"
						+ "	</td>\r\n"
						+ "	<td>\r\n"
						+ "	  <input type=\"text\" id=\"aiMemo\" name=\"aiMemo\" required   size=\"10\" value=\""+res.list.aiMemo+"\">\r\n"
						+ "	</td>\r\n"
						+ "</tr>";
					$('#resultList').append(data);
				}).fail(function() {
					alert("실패");
				});
			};
			
 
			

			$('.dataInsert').click(function() {
				// function
				var formSer = $('#insertForm').serialize();

				$.ajax({
					url : '/gcs/dashboard/gA034MainWriteInsert.do',
					type : 'post',
					data : formSer,
					async : false
				}).done(function(res) {
					console.log(res.list);
					alert("Success");
					$("#aiPk").val(res.list.aiPk);
				}).fail(function() {
					alert("실패");
				});
			});

		})();
	</script>
</body>
</html>