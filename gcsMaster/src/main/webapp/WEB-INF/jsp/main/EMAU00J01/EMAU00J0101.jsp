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
<title>과제평가</title>
<c:import url="/EmpPageLink.do?link=main/include2/src" /> 
</head>

<body>
	<!-- s :wrap -->
	<div id="wrap">
		<div class="menu_guide">
			<c:import url="/EmpPageLink.do?link=main/include2/menu02" /> 
		</div>
		<!-- e :menu_guide -->
		<div class="contents_guide">
			<div class="box_style01">
				<div>
					 <c:import url="/empo/EMAU00J01/IncSubject.do" /> 
				</div>
			</div>
			
			<h4>심사참고 정보</h4>
			
			<div class="review">
				<dl>
					<dt><strong>예비 평가 결과</strong></dt>
					<dd class="txt"><span>참여기관/인력 역량<br>
						기술개발 계획<br>
						기술사업화 계획</span>
					</dd>
					<dd class="ai_area">
						<div>인공지능분석 영역 100%*135px</div>
						<p>인공지능분석</p>
					</dd>
					<dd class="grade">
						<ul>
							<li><span>전체평점</span><strong class="fc_orange">85</strong>/100</li>
							<li class="fc_green"><span>백분율</span>상위 23%</li>
							<li class="fc_blue"><span>판정</span>추천</li>
						</ul>
					</dd>
				</dl>
			</div>
			
			<div class="review_detail">
				<dl class="detail_item">
					<dt>부문평가</dt>
					<dd>참여기관 역량</dd>
					<dd>참여인력 역량</dd>
					<dd>기술개발계획 적정성</dd>
					<dd>기술사업화 가능성</dd>
				</dl>
				<dl>
					<dt>평가결과</dt>
					<dd>우수</dd>
					<dd>보통</dd>
					<dd>우수</dd>
					<dd>매우 우수</dd>
				</dl>
				<dl class="data_area">
					<dt>주요 지표분석</dt>
					<dd>
						<div>주요지표 통계정보 영역 100%*190px</div>
					</dd>
				</dl>
			</div>
				
			
		</div>

		<!-- e :contents_guide -->
	</div>
	<!-- e :wrap -->
</body>
</html>
