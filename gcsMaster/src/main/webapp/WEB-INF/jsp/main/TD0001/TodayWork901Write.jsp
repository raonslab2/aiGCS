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
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Today Work</title>
<link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css'
	rel='stylesheet'>
<!-- Common Css -->
<link href="/css/gcs/TodayWorkCommon.css" rel="stylesheet">
<link href="/css/gcs/TodayWork901Write.css" rel="stylesheet">

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
<!-- Common Js -->
<script type="text/javascript" src="/js/gcs/TodayCommon.js"></script>

<!-- Chart.js -->
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<!-- jQuery -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- CKEditor CDN -->
<script src="https://cdn.ckeditor.com/4.16.2/standard/ckeditor.js"></script>
   <style>
        /* 에디터 스타일 */
        .ckeditor {
            max-width: 100%;
            width: 100%;
            height: auto; /* 에디터의 높이를 자동으로 조절합니다. */
            font-size: 16px; /* 기본 폰트 크기 설정 */
        }
    </style>
</head>

<body>


	<!-- left menu List -->
	<c:import url="/EmpPageLink.do?link=main/include/menu3" />


	<main> <!-- top menu --> <c:import
		url="/EmpPageLink.do?link=main/include/menutopTodayWork" />


	<div class="container">
		<!-- container ST -->
		 <%-- 
         <div class="topTitle"> 
         Frequently used menu : 
		   <button class="btnLike" data-page="1">Going to work</button> 
		   <button class="btnLike" data-page="2">leaving work</button>
		   <button class="btnLike" data-page="3">Work request</button>
		</div>  
		--%> 
        <form id="searchForm" method="post" enctype="multipart/form-data">  
        <input type="hidden" id="twPk" name="twPk" value="${twPk}"> 
           <div class="form-row">  
              <div class="input-data">
				<select id="twStatus" name="twStatus">
				  <%-- 
				  <option value="Request">Request</option>
				  <option value="completed">completed</option>
				  <option value="inprogress">inprogress</option>
				  <option value="onhold">onhold</option>
				  <option value="cancelled">cancelled</option>
				  --%>
				</select>
				
                 <div class="underline"></div>
                 <label for="">진행 구분</label>
              </div>
              <div class="input-data"> 
                 <input type="text" required id="twCategory1" name="twCategory1" >
                 <div class="underline"></div>
                 <label for="">분류</label>
              </div>
              <%-- 
              <div class="input-data">
                 <input type="text" required id="twCategory2" name="twCategory2">
                 <div class="underline"></div>
                 <label for="">분류2</label>
              </div> 
              --%>
              <div class="input-data">
				<input type="date" id="twRequestDate" name="twRequestDate">
                 <div class="underline"></div>
                 <label for="">작성일자</label>
              </div>
              <div class="input-data">
				<select id="twRequester" name="twRequester">
				  <option value="손창주">손창주</option>
				  <option value="세진">세진</option>
				  <option value="은별">은별</option>
				  <option value="샤미">샤미</option>
				  <option value="민영">민영</option>
				  <option value="민병안">민병안</option>
				</select>
                 <div class="underline"></div>
                 <label for="">작성자</label>
              </div>
           </div>
           <div class="form-row">
              <div class="input-data">
				<select id="twWorker" name="twWorker">
				  <%-- 
				  <option value="손창주">손창주</option>
				  <option value="세진">세진</option>
				  <option value="은별">은별</option>
				  <option value="샤미">샤미</option>
				  <option value="민영">민영</option>
				  <option value="민병안">민병안</option>
				  <option value="ALL">ALL</option>
				  --%>
				</select>
                 <div class="underline"></div>
                 <label for="">담당자</label>
              </div>
              <div class="input-data">
				<select id="twWorker2" name="twWorker2">
				  <%-- 
				  <option value="손창주">손창주</option>
				  <option value="세진">세진</option>
				  <option value="은별">은별</option>
				  <option value="샤미">샤미</option>
				  <option value="민영">민영</option>
				  <option value="민병안">민병안</option>
				  <option value="ALL">ALL</option>
				  --%>
				</select>
                 <div class="underline"></div>
                 <label for="">협업자</label>
              </div>
              
              <div class="input-data">
				<input type="date" id="twStartDateExp" name="twStartDateExp">
                 <div class="underline"></div>
                 <label for="">시작일</label>
              </div>
              <div class="input-data">
				<input type="date" id="twEndDateExp" name="twEndDateExp">
                 <div class="underline"></div>
                 <label for="">종료일</label>
              </div>
           </div>
           <div class="form-row">
              <div class="input-data">
                 <input type="text" required id="twSubject" name="twSubject">
                 <div class="underline"></div>
                 <label for="">제목</label>
              </div> 
           </div>
            <div class="form-row">
              <div class="input-data">
                  <textarea name="twContent" id="twContent" class="ckeditor"  required></textarea>
              </div>
				<div class="input-data">
				    <div class="form-row">
				        <div>
				            <input type="file" class="form-control-file border" name="upfile" multiple="multiple">
				            <span class="file" id="file1"></span>
				        </div>
				    </div>
				    <div class="form-row">
				        <div>
				            <input type="file" class="form-control-file border" name="upfile" multiple="multiple">
				            <span class="file" id="file2"></span>
				        </div>
				    </div>
				    <div class="form-row">
				        <div>
				            <input type="file" class="form-control-file border" name="upfile" multiple="multiple">
				            <span class="file" id="file3"></span>
				        </div>
				    </div>
				    <div class="form-row submit-btn">
				        <div>
				            <div class="submit-image" id="submitBtn">저 장</div> 
				        </div>
				    </div>
				</div>
           </div> 
        </form>


		<!-- container ED -->
	</div>

	</main>
	<footer>
	<p class="copyright">
		&copy; 2020 - <span>RaonsLab</span> All Rights Reserved.
	</p>
	</footer>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
	<script type="text/javascript" src="/js/gcs/TodayWork901Write.js"></script>

</body>
    <script>
    CKEDITOR.editorConfig = function( config ) {
    	config.autoGrow_onStartup = true; // 내용이 길어질 경우 자동으로 스크롤 생성
        config.height = '300px'; // 원래 높이의 2/3로 설정
    };

    </script>
</html>