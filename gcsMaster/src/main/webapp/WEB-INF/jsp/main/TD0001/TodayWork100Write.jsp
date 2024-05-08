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
<title>Today Work [ Write ]</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, minimum-scale=1, user-scalable=no">
<c:import url="/EmpPageLink.do?link=main/include/src" />


<link href="/assets/vendor/fontawesome/css/fontawesome.min.css"
	rel="stylesheet">
<link href="/assets/vendor/fontawesome/css/solid.min.css"
	rel="stylesheet">
<link href="/assets/vendor/fontawesome/css/brands.min.css"
	rel="stylesheet">
<link href="/assets/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link href="/assets/css/master.css" rel="stylesheet">
<link href="/assets/vendor/flagiconcss/css/flag-icon.min.css"
	rel="stylesheet">

<link href="/css/gcs/TodayWork100Write.css" rel="stylesheet">

</head>



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
					<div class="page-title" style="margin-top: 30px;">
						<!-- 검색 form 시작 -->

						<!-- 검색 form 종료 -->
					</div>
					<div class="row">
						<!--  -->
						<header>
						<h1 class="today-work">오늘 할 일</h1>
						</header>
						<section id="task-form">
						<form id="insertForm">
							<div class="form-group">
								<label for="today-work">Today Work</label> <input type="text"
									id="tdSubject" name="tdSubject" placeholder="오늘 할 일을 입력하세요...">
							</div>
							<div class="form-group">
								<label for="classification">Classification</label> <input
									type="text" id="classification" name="classification">
							</div>
							<div class="form-group">
								<label for="assignee">담당자 지정</label>
								<div class="date-range">
									<select id="assignee" name="assignee">
										<option value="">주 담당자</option>
										<option value="user1">유저 1</option>
										<option value="user2">유저 2</option>
										<option value="user3">유저 3</option>
										<!-- 필요한 만큼 옵션을 추가하세요 -->
									</select> <select id="watchers" name="watchers">
										<option value="">부 담당자</option>
										<option value="user1">유저 1</option>
										<option value="user2">유저 2</option>
										<option value="user3">유저 3</option>
										<!-- 필요한 만큼 옵션을 추가하세요 -->
									</select> <select id="watchers" name="watchers">
										<option value="">부 담당자</option>
										<option value="user1">유저 1</option>
										<option value="user2">유저 2</option>
										<option value="user3">유저 3</option>
										<!-- 필요한 만큼 옵션을 추가하세요 -->
									</select>
								</div>



							</div>

							<div class="form-group">
								<label for="start-date">Desired Date Range</label>
								<div class="date-range">
									<input type="datetime-local" id="start-date" name="start-date"
										placeholder="시작일자"> <span>~</span> <input
										type="datetime-local" id="end-date" name="end-date"
										placeholder="종료일자">
								</div>
							</div>
							<div class="form-group">
								<label for="detail">Detail</label>
								<textarea id="detail" name="detail" rows="4"
									placeholder="상세 내용을 입력하세요..."></textarea>
							</div>
							<div class="form-group" id="assignee-group">
								<!-- 담당자 드롭다운은 여기에 추가될 것입니다 -->
							</div>
							<div class="form-group">
								<label for="profile-picture">Choose a Profile Picture</label> <input
									type="file" id="profile-picture" name="profile-picture">
							</div>
							<button type="submit" class="btn-save" id="dataInsert">저장</button>
							<button type="button" class="btn-list" id="btn-list">목록</button>
						</form>
						</section>
						<!--  -->
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

	<script type="text/javascript" src="/js/gcs/TodayWork100Write.js"></script>

</body>
</html>