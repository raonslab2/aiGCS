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
<c:import url="/EmpPageLink.do?link=main/include/src" /> 
<script type="text/javascript">
	$(document).ready(function() {

 
	});

 
</script>
</head>

<body>
	<!-- s :wrap -->
	<div id="wrap">
		<!-- 1차 메뉴 시작 -->
		<div class="lnb_guide">
		    <c:import url="/EmpPageLink.do?link=main/include/menu" /> 
		</div>
		<!-- 1차 메뉴 종료 -->
			
		<!-- s :right_guide -->
		<div class="right_guide">

			<!-- 화면 상단 시작 -->
			<div class="top_guide">

				<!-- 1차 메뉴명 -->
				<h3>Dashboard</h3>
                <c:import url="/EmpPageLink.do?link=main/include/top" />  
			</div>
			<!-- 화면 상단 종료 -->
			
			<!-- s :contents_guide -->
			<div class="contents_guide">
				<div class="submenu_guide" style="float:left;">
					<ul>
						<!-- 2차메뉴명 -->
						<li>May, 2021 < O > </li>
						<li><a href="<c:url value='/'/>empo/dashboard/eMAU00A01Main.do">YEAR</a></li>
						<li><a href="<c:url value='/'/>empo/dashboard/eMAU00A02Main.do" class="active">MONTH</a></li>
						<li><a href="<c:url value='/'/>empo/dashboard/eMAU00A03Main.do">WEEK</a></li>
					</ul>					
				</div>
				<div class="submenu_guide" style="float:right;">
					<ul> 
						<li>May, 2021 < O > </li>
						<li>1 지난일정</li>
						<li>2 현재달진행중</li>
						<li>예정</li>
						<li>공고일</li>
					</ul>					
				</div>

			</div>
			<!-- e :contents_guide -->
		</div>
		<!-- e :right_guide -->
	</div>
	<!-- e :wrap -->
	
<script>
 
	
</script>
</body>
</html>

