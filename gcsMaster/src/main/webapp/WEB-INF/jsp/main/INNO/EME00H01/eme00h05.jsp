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
<title>INNO GROUP</title>  
        <meta name="viewport"
            content="width=device-width, initial-scale=1, maximum-scale=1, minimum-scale=1, user-scalable=no">
        <c:import url="/EmpPageLink.do?link=main/include/src" />  
	<meta charset="utf-8">	
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
	<meta name="viewport" content="width=device-width, initial-scale=1" />
	<link rel="stylesheet" type="text/css" href="/inno/assets/css/jquery-ui.min.css" />
	<link rel="stylesheet" type="text/css" href="/inno/assets/css/common.css" />
	<script src="/inno/assets/js/jquery-3.6.1.min.js"></script>
	<script src="/inno/assets/js/jquery-ui.min.js"></script>
	<script src="/inno/assets/js/slick.min.js"></script>
	<script src="/inno/assets/js/common.js"></script>
	<!--나경아 추가-->
	<style>
	.photo-upload-type {
		background: transparent !important
	}
	
	.photo-upload-type .pop-container {
		left: 78%
	}
	</style>
</head>

<body>
 
	<div id="wrap">
		<!-- lnb -->
		<div class="lnb-container">
		  <!-- left menu -->
          <c:import url="/EmpPageLink.do?link=main/include/innomenu5" />            
		</div>
		<!-- container -->
		<div class="container">
			<div class="location-content">
				<div class="location-area">
					<span class="location">CRM</span>
				</div>
				<span class="logo-area">
					<img src="/inno/assets/images/logo.png" alt="지우회계법인">
				</span>
				<div class="menu-area">
					<div class="user-box">
						<img src="/inno/assets/images/temp_photo.png" alt="" class="photo">
						<div class="info">
							<span class="tit">관리자</span>
							<strong>김상민</strong>
						</div>
					</div>
					<div class="link-box">
						<a href="#" class="icon-out"></a>
						<a href="#" class="icon-charge"></a>
					</div>
				</div>
			</div>
			<div class="view-content">
				<div class="map-info-area fixed-type">
					<div class="table-info-box wide-type">
						<div class="today-info-item min-height-480">
							<div class="top-search-cnt">
								<span class="tit">오늘의 업무</span>
								<div class="menu-wrap">
									<div class="day-select">
										<button type="button" class="left-btn"></button>
										<span class="day two-type">
											<input type="text" value="06.24 금" readonly class="com-calendar">
											<span class="ic">~</span>
											<input type="text" value="07.24 금" readonly class="com-calendar">
										</span>
										<button type="button" class="right-btn"></button>
									</div>
									<div class="keyword-input">
										<input type="text" placeholder="검색 키워드 입력">
										<button type="button" class="search-btn"></button>
									</div>
									<div class="com-radio-select w-90">
										<button type="button" class="open-btn">담당자</button>
										<ul class="check-list">
											<li>
												<input type="radio" name="menu-radio-1" id="menu-radio-1" checked>
												<label for="menu-radio-1">담당자</label>
											</li>
										</ul>
									</div>
									<div class="com-radio-select w-90">
										<button type="button" class="open-btn">교신여부</button>
										<ul class="check-list">
											<li>
												<input type="radio" name="menu-radio-2" id="menu-radio-2" checked>
												<label for="menu-radio-2">교신여부</label>
											</li>
										</ul>
									</div>
									<div class="com-radio-select">
										<button type="button" class="open-btn">10P</button>
										<ul class="check-list">
											<li>
												<input type="radio" name="menu-radio-3" id="menu-radio-3" checked>
												<label for="menu-radio-3">10P</label>
											</li>
										</ul>
									</div>
									<div class="txt-info">
										<span class="txt">전체 :</span>
										<span class="num">10</span>
									</div>
								</div>
							</div>
							<div class="table-scroll max-height-350">
								<table>
									<colgroup>
										<col style='width:45px;'>
										<col style='width:170px;'>
										<col style='width:460px;'>
										<col style='width:100px;'>
										<col style='width:100px;'>
										<col style='width:80px;'>
										<col style='width:40px;'>
									</colgroup>
									<thead>
										<tr>
											<th class="center">번호</th>
											<th>회사명/교신자 </th>
											<th class="center">작업내용</th>
											<th>담당자</th>
											<th>교신수단/여부</th>
											<th>교신일시</th>
											<th>횟수</th>
										</tr>
									</thead>
									<tbody>
										<tr class="on">
											<td class="center">760</td>
											<td>차양호 경영지도사 사무소<br>김미연 (부사장)</td>
											<td>
												<div class="dot-text">
													<p class="text">회사 홈페이지, 대표전화, 대표팩스, 대표이사 이메일, 대표이사 핸드폰, 건물사무소 전화번호, 건물사무소 담당자, 입주일, 자본금, 직원수,회사 홈페이지, 대표전화, 대표팩스, 대표이사 이메일, 대표이사 핸드폰, 건물사무소 전화번호, 건물사무소 담당자, 입주일, 자본금, 직원수,회사 홈페이지, 대표전화, 대표팩스, 대표이사 이메일, 대표이사 핸드폰, 건물사무소 전화번호, 건물사무소 담당자, 입주일, 자본금, 직원수,회사 홈페이지, 대표전화, 대표팩스, 대표이사 이메일, 대표이사 핸드폰, 건물사무소 전화번호, 건물사무소 담당자, 입주일, 자본금, 직원수,</p>
													<button type="button" class="btn" onclick="$(this).prev().toggleClass('on');$(this).toggleClass('on');"></button>
												</div>
											</td>
											<td>김상민 (사원)</td>
											<td>
												<span class="txt">수신/SMS</span>
												<span class="icon blue">찾음</span>
											</td>
											<td>오후<br>05:40</td>
											<td>10</td>
										</tr>
										<tr>
											<td class="center">760</td>
											<td>차양호 경영지도사 사무소<br>김미연 (부사장)</td>
											<td>
												<div class="dot-text">
													<p class="text">회사 홈페이지, 대표전화, 대표팩스, 대표이사 이메일, 대표이사 핸드폰, 건물사무소 전화번호, 건물사무소 담당자, 입주일, 자본금, 직원수,회사 홈페이지, 대표전화, 대표팩스, 대표이사 이메일, </p>
													<button type="button" class="btn" onclick="$(this).prev().toggleClass('on');$(this).toggleClass('on');"></button>
												</div>
											</td>
											<td>김상민 (사원)</td>
											<td>
												<span class="txt">발신/회사전화</span>
												<span class="icon green">통화중</span>
											</td>
											<td>오후<br>05:40</td>
											<td>10</td>
										</tr>
										<tr>
											<td class="center">760</td>
											<td>차양호 경영지도사 사무소<br>김미연 (부사장)</td>
											<td>
												<div class="dot-text">
													<p class="text">회사 홈페이지, 대표전화, 대표팩스, 대표이사 이메일, 대표이사 핸드폰, 건물사무소 전화번호, 건물사무소 담당자, 입주일, 자본금, 직원수,회사 홈페이지, 대표전화, 대표팩스, 대표이사 이메일, </p>
													<button type="button" class="btn" onclick="$(this).prev().toggleClass('on');$(this).toggleClass('on');"></button>
												</div>
											</td>
											<td>김상민 (사원)</td>
											<td>
												<span class="txt">발신/SMS</span>
												<span class="icon purple">안받음</span>
											</td>
											<td>오후<br>05:40</td>
											<td>10</td>
										</tr>
										<tr>
											<td class="center">760</td>
											<td>차양호 경영지도사 사무소<br>김미연 (부사장)</td>
											<td>
												<div class="dot-text">
													<p class="text">회사 홈페이지, 대표전화, 대표팩스, 대표이사 이메일, 대표이사 핸드폰, 건물사무소 전화번호, 건물사무소 담당자, 입주일, 자본금, 직원수,회사 홈페이지, 대표전화, 대표팩스, 대표이사 이메일, </p>
													<button type="button" class="btn" onclick="$(this).prev().toggleClass('on');$(this).toggleClass('on');"></button>
												</div>
											</td>
											<td>김상민 (사원)</td>
											<td>
												<span class="txt">발신/핸드폰</span>
												<span class="icon red">못찾음</span>
											</td>
											<td>오후<br>05:40</td>
											<td>10</td>
										</tr>
										<tr>
											<td class="center">760</td>
											<td>차양호 경영지도사 사무소<br>김미연 (부사장)</td>
											<td>
												<div class="dot-text">
													<p class="text">회사 홈페이지, 대표전화, 대표팩스, 대표이사 이메일, 대표이사 핸드폰, 건물사무소 전화번호, 건물사무소 담당자, 입주일, 자본금, 직원수,회사 홈페이지, 대표전화, 대표팩스, 대표이사 이메일, </p>
													<button type="button" class="btn" onclick="$(this).prev().toggleClass('on');$(this).toggleClass('on');"></button>
												</div>
											</td>
											<td>김상민 (사원)</td>
											<td>
												<span class="txt">수신/SMS</span>
												<span class="icon blue">찾음</span>
											</td>
											<td>오후<br>05:40</td>
											<td>10</td>
										</tr>
									</tbody>
								</table>
							</div>
							<div class="com-paging">
								<button type="button" class="prev-btn"><span class="blind">이전</span></button>
								<button type="button" class="on">1</button>
								<button type="button">2</button>
								<button type="button">3</button>
								<button type="button">4</button>
								<button type="button">5</button>
								<button type="button" class="next-btn"><span class="blind">다음</span></button>
							</div>
						</div>
						<div class="today-miss-item min-height-380">
							<div class="top-search-cnt">
								<span class="tit">오늘의 미해결</span>
								<div class="menu-wrap">
									<div class="day-select">
										<button type="button" class="left-btn"></button>
										<span class="day two-type">
											<input type="text" value="06.24 금" readonly class="com-calendar">
											<span class="ic">~</span>
											<input type="text" value="07.24 금" readonly class="com-calendar">
										</span>
										<button type="button" class="right-btn"></button>
									</div>
									<div class="keyword-input">
										<input type="text" placeholder="검색 키워드 입력">
										<button type="button" class="search-btn"></button>
									</div>
									<div class="com-radio-select w-90">
										<button type="button" class="open-btn">담당자</button>
										<ul class="check-list">
											<li>
												<input type="radio" name="menu-radio-1" id="menu-radio-1" checked>
												<label for="menu-radio-1">담당자</label>
											</li>
										</ul>
									</div>
									<div class="com-radio-select w-90">
										<button type="button" class="open-btn">교신여부</button>
										<ul class="check-list">
											<li>
												<input type="radio" name="menu-radio-2" id="menu-radio-2" checked>
												<label for="menu-radio-2">교신여부</label>
											</li>
										</ul>
									</div>
									<div class="com-radio-select">
										<button type="button" class="open-btn">10P</button>
										<ul class="check-list">
											<li>
												<input type="radio" name="menu-radio-3" id="menu-radio-3" checked>
												<label for="menu-radio-3">10P</label>
											</li>
										</ul>
									</div>
									<div class="txt-info">
										<span class="txt">전체 :</span>
										<span class="num">10</span>
									</div>
								</div>
							</div>
							<div class="table-scroll no-scroll">
								<table>
									<colgroup>
										<col style='width:45px;'>
										<col style='width:250px;'>
										<col style='width:160px;'>
										<col style='width:160px;'>
										<col style='width:110px;'>
										<col style='width:90px;'>
										<col style='width:100px;'>
										<col style='width:50px;'>
									</colgroup>
									<thead>
										<tr>
											<th class="center">번호</th>
											<th>회사명</th>
											<th>교신자</th>
											<th>담당자</th>
											<th>교신수단</th>
											<th>교신여부</th>
											<th>교신시도</th>
											<th class="center">횟수</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td class="center">360</td>
											<td>차양호 경영지도사 사무소</td>
											<td>김미연 (부사장)</td>
											<td>김상민 (사원)</td>
											<td>발신/SMS</td>
											<td>
												<span class="icon green">통화중</span>
											</td>
											<td>오후 05:40</td>
											<td class="center">10</td>
										</tr>
										<tr>
											<td class="center">359</td>
											<td>차양호 경영지도사 사무소</td>
											<td>김미연 (부사장)</td>
											<td>김상민 (사원)</td>
											<td>발신/SMS</td>
											<td>
												<span class="icon green">통화중</span>
											</td>
											<td>오후 05:40</td>
											<td class="center">10</td>
										</tr>
										<tr>
											<td class="center">358</td>
											<td>차양호 경영지도사 사무소</td>
											<td>김미연 (부사장)</td>
											<td>김상민 (사원)</td>
											<td>발신/SMS</td>
											<td>
												<span class="icon purple">안받음</span>
											</td>
											<td>오후 05:40</td>
											<td class="center">10</td>
										</tr>
										<tr>
											<td class="center">357</td>
											<td>차양호 경영지도사 사무소</td>
											<td>김미연 (부사장)</td>
											<td>김상민 (사원)</td>
											<td>발신/SMS</td>
											<td>
												<span class="icon green">통화중</span>
											</td>
											<td>오후 05:40</td>
											<td class="center">10</td>
										</tr>
										<tr>
											<td class="center">356</td>
											<td>차양호 경영지도사 사무소</td>
											<td>김미연 (부사장)</td>
											<td>김상민 (사원)</td>
											<td>발신/SMS</td>
											<td>
												<span class="icon green">통화중</span>
											</td>
											<td>오후 05:40</td>
											<td class="center">10</td>
										</tr>
									</tbody>
								</table>
							</div>
							<div class="com-paging">
								<button type="button" class="prev-btn"><span class="blind">이전</span></button>
								<button type="button" class="on">1</button>
								<button type="button">2</button>
								<button type="button">3</button>
								<button type="button">4</button>
								<button type="button">5</button>
								<button type="button" class="next-btn"><span class="blind">다음</span></button>
							</div>
						</div>
					</div>
					<div class="visit-box">
						<div class="advice-area full">
							<div class="top-tab-item">
								<span class="tit">교신방법 및 교신내용</span>
								<div class="action-btn">
									<button type="button" class="write-btn">저장</button>
								</div>
							</div>
							<div class="text-info-cnt">
								<ul class="half-list">
									<li>
										<span class="tit">교신자</span>
										<div class="form two-type">
											<input type="text" value="강지수">
											<input type="text" value="강지수">
										</div>
										<span class="tit">상담자</span>
										<span class="txt">최다니엘 (마케팅팀/대리)</span>
									</li>
									<li>
										<span class="tit">교신수단</span>
										<div class="form full">
											<div class="select-cnt two-type">
												<select class="com-select">
													<option value="#">발신</option>
												</select>
												<select class="com-select">
													<option value="#">휴대폰</option>
												</select>
											</div>
											<div class="radio-select">
												<div class="com-radio">
													<input type="radio" name="radio-1" id="radio-1-1" checked>
													<label for="radio-1-1">수신거부</label>
												</div>
												<div class="com-radio">
													<input type="radio" name="radio-1" id="radio-1-2">
													<label for="radio-1-2">수신동의</label>
												</div>
											</div>
										</div>
									</li>
									<li>
										<span class="tit">교신여부</span>
										<div class="form full">
											<div class="select-cnt two-type">
												<select class="com-select">
													<option value="#">교신성공</option>
												</select>
												<select class="com-select">
													<option value="#">방문계약</option>
												</select>
											</div>
										</div>
									</li>
									<li>
										<span class="tit">재교신<br>/ 약속</span>
										<div class="form full">
											<div class="day-select">
												<button type="button" class="left-btn"></button>
												<span class="day"><input type="text" value="06.24 금" readonly class="com-calendar"></span>
												<button type="button" class="right-btn"></button>
											</div>
											<div class="select-cnt two-type dash">
												<select class="com-select">
													<option value="#">13:00</option>
												</select>
												<span class="ic">~</span>
												<select class="com-select">
													<option value="#">14:00</option>
												</select>
											</div>
											<div class="select-day-btn">
												<button type="button">오늘</button>
												<button type="button">다음날</button>
												<button type="button">1주</button>
												<button type="button">2주</button>
												<button type="button">3주</button>
												<button type="button">4주</button>
												<button type="button">3개월</button>
											</div>
										</div>
									</li>
								</ul>
								<ul class="full-list">
									<li>
										<span class="tit">내용요약</span>
										<div class="form">
											<input type="text" class="full" value="계약성사를 위한 프로필 프레젠테이션">
										</div>
									</li>
								</ul>
								<div class="detail-write-text">
									<div class="top-tab">
										<button type="button"><span>본인내용</span></button>
										<button type="button"><span>상대내용</span></button>
										<button type="button"><span>삼자내용</span></button>
										<button type="button"><span>전략멘토</span></button>
									</div>
									<!-- 글자 칼라 #666 , #338be8 , #3ea366 , #6259ca -->
									<textarea style="color: #6259ca;"></textarea>
								</div>
							</div>
							<div class="table-info-cnt">
								<div class="top-title">
									<span class="title">교신내역</span>
									<div class="select-choice">
										<div class="com-radio-select w100">
											<button type="button" class="open-btn">교신여부</button>
											<ul class="check-list">
												<li>
													<input type="radio" name="check-radio-1" id="check-radio-1" checked>
													<label for="check-radio-1">교신여부</label>
												</li>
											</ul>
										</div>
										<div class="com-radio-select w60">
											<button type="button" class="open-btn">4P</button>
											<ul class="check-list">
												<li>
													<input type="radio" name="check-radio-2" id="check-radio-2" checked>
													<label for="check-radio-2">4P</label>
												</li>
											</ul>
										</div>
										<span class="text">전체 : <span class="num">10</span></span>
									</div>
								</div>
								<div class="table-scroll max-height-330">
									<table>
										<colgroup>
											<col style='width:20%;'>
											<col style='width:46%;'>
											<col style='width:20%;'>
											<col style='width:14%;'>
										</colgroup>
										<thead>
											<tr>
												<th>교신자/상담자</th>
												<th class="center">내용요약</th>
												<th>교신수단/여부</th>
												<th>교신일시</th>
											</tr>
										</thead>
										<tbody>
											<tr class="on">
												<td>김미연 (부사장)<br>김상민 (사원)</td>
												<td>계약에 관한 당사 방문 후 상담 추가 진행</td>
												<td>
													<span class="txt">수신/SMS</span>
													<span class="icon blue">찾음</span>
												</td>
												<td>08.06 화<br>05:40</td>
											</tr>
											<tr>
												<td>김미연 (부사장)<br>김상민 (사원)</td>
												<td>계약에 관한 당사 방문 후 상담 추가 진행</td>
												<td>
													<span class="txt">수신/SMS</span>
													<span class="icon green">통화중</span>
												</td>
												<td>08.06 화<br>05:40</td>
											</tr>
											<tr>
												<td>김미연 (부사장)<br>김상민 (사원)</td>
												<td>계약에 관한 당사 방문 후 상담 추가 진행</td>
												<td>
													<span class="txt">발신/회사전화</span>
													<span class="icon green">통화중</span>
												</td>
												<td>08.06 화<br>05:40</td>
											</tr>
											<tr>
												<td>김미연 (부사장)<br>김상민 (사원)</td>
												<td>계약에 관한 당사 방문 후 상담 추가 진행</td>
												<td>
													<span class="txt">발신/SMS</span>
													<span class="icon purple">안받음</span>
												</td>
												<td>08.06 화<br>05:40</td>
											</tr>
											<tr>
												<td>김미연 (부사장)<br>김상민 (사원)</td>
												<td>계약에 관한 당사 방문 후 상담 추가 진행</td>
												<td>
													<span class="txt">발신/핸드폰</span>
													<span class="icon red"> 못찾음</span>
												</td>
												<td>08.06 화<br>05:40</td>
											</tr>
										</tbody>
									</table>
								</div>
								<div class="com-paging">
									<button type="button" class="prev-btn"><span class="blind">이전</span></button>
									<button type="button" class="on">1</button>
									<button type="button">2</button>
									<button type="button">3</button>
									<button type="button">4</button>
									<button type="button">5</button>
									<button type="button" class="next-btn"><span class="blind">다음</span></button>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="banner-info-area">
					<button type="button" class="banner sale-type"><span>솔루션 정액제 사용기간 길~수록 절감 할인 혜택</span></button>
					<button type="button" class="banner service-type"><span>서비스 추가시 1개월 전문 가이드 무료지원</span></button>
				</div>
			</div>
		</div>
	</div>
</body>

</html>
