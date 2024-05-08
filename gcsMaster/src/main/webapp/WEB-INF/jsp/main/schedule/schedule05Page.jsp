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

<%@ page import="java.util.Calendar"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.DecimalFormat"%>
<%@ page import="java.text.SimpleDateFormat"%>

<%

	// 스케줄 표시하는 주의 시작일자
	String strStartDate = request.getParameter("startDate");

	SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");	
	Calendar calendar = Calendar.getInstance();
	String strToday = sf.format(calendar.getTime());
	
	// 현재시간
	int intHour = calendar.get(Calendar.HOUR_OF_DAY);

	// 현재 주의 시작일자
	int intNowWeek = calendar.get(Calendar.DAY_OF_WEEK); 		
	calendar.add(Calendar.DATE , (intNowWeek-1)*(-1));
	String strCurrentDate = sf.format(calendar.getTime());

	// 시작일자가 없으면 스케줄 표시하는 주의 시작일자 구하기
	if (strStartDate == null || "null".equals(strStartDate)) {	
		strStartDate = strCurrentDate;
	};

	// 연도 및 월 값 구하기
	Date date = sf.parse(strStartDate);
	String yy = strStartDate.substring(0,4);
	String engMM = date.toString().substring(4,7);	
	
	// 이전주의 시작일
	calendar.setTime(date);
	calendar.add(Calendar.DATE , -7);
	String strPrevDate = sf.format(calendar.getTime());

	// 다음주의 시작일
	calendar.setTime(date);
	calendar.add(Calendar.DATE , 7);
	String strNextDate = sf.format(calendar.getTime());
	
%>
 
<meta charset="utf-8">
	<meta name="description" content="">
	<meta name="viewport" content="width=device-width, initial-scale=1.0" charset="utf-8">
	 
	<link rel="icon" href="/webix/grid/common/favicon/icon-16.png" sizes="16x16" />
	<link rel="icon" href="/webix/grid/common/favicon/icon-32.png" sizes="32x32" />
	<link rel="icon" href="/webix/grid/common/favicon/icon-48.png" sizes="48x48" />
	<link rel="icon" href="/webix/grid/common/favicon/icon-96.png" sizes="96x96" />
	<link rel="icon" href="/webix/grid/common/favicon/icon-144.png" sizes="144x144" />
	<!-- end meta block -->
	<script type="text/javascript" src="/webix/grid/codebase/grid.js?v=7.2.2"></script>
	<link rel="stylesheet" href="/webix/grid/codebase/grid.css?v=7.2.2">
	
	<link rel="stylesheet" href="/webix/grid/common/index.css?v=7.2.2">
	<!-- custom sample head -->
	<script src="/webix/grid/common/data.js?v=7.2.2"></script>
	
<title>TIPA 스케쥴기반 평가관리시스템</title>
<c:import url="/EmpPageLink.do?link=main/include/src2" />
 

</head>

<body onload="init();">
	<!-- s :wrap -->
	<div id="wrap">
		<!-- s :lnb_guide -->
		<div class="lnb_guide">
			<c:import url="/EmpPageLink.do?link=main/include/menu" /> 
		</div>
		<!-- e :lnb_guide -->
			
		<!-- s :right_guide -->
		<div class="right_guide">

			<!-- 화면 상단 시작 -->
			<div class="top_guide">

				<!-- 1차 메뉴명 -->
				<h3>Schedule</h3>
                 <c:import url="/EmpPageLink.do?link=main/include/top" />  
			</div>
			<!-- 화면 상단 종료 -->
			
			<!-- s :contents_guide -->
			<div class="contents_guide"> 
				<header class="dhx_sample-header">
					<div class="dhx_sample-header__main">
						<nav class="dhx_sample-header__breadcrumbs">
							<ul class="dhx_sample-header-breadcrumbs">
								<li class="dhx_sample-header-breadcrumbs__item"> 
								</li>
							</ul>
						</nav>
						<h1 class="dhx_sample-header__title">
							<div class="dhx_sample-header__content">
								Initialization with config.data
							</div>
						</h1>
					</div>
			</header>
				<section   style="height: 80%;width:100%">
					<div style="height: 100%; width: 100%;" id="grid"></div>
				</section>
				<script>
					const grid = new dhx.Grid("grid", {
						columns: [
							{ width: 150, id: "country", header: [{ text: "사업년도" }] },
							{ width: 150, id: "population", header: [{ text: "사업명" }] },
							{ width: 150, id: "yearlyChange", header: [{ text: "내역사업명" }] },
							{ width: 150, id: "netChange", header: [{ text: "내내역사업명" }] },
							{ width: 150, id: "destiny", header: [{ text: "Density (P/Km²)" }] },
							{ width: 150, id: "area", header: [{ text: "Land Area (Km²)" }] },
							{ width: 150, id: "migrants", header: [{ text: "Migrants (net)" }] },
							{ width: 150, id: "fert", header: [{ text: "Fert. Rate" }] },
							{ width: 150, id: "age", header: [{ text: "Med. Age" }] },
							{ width: 150, id: "urban", header: [{ text: "Urban Pop" }] }
						],
						data: dataset
					});
				</script>
			</div>
			<!-- e :contents_guide -->
		</div>
		<!-- e :right_guide -->
	</div>
	<!-- e :wrap -->
</body>
</html>
