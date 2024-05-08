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
          <c:import url="/EmpPageLink.do?link=main/include/innomenu3" />            
		</div>
		<!-- container -->
		<div class="container">
			<div class="location-content">
				<div class="location-area">
					<span class="location">타깃 세일즈 / <strong>업무대행</strong></span>
				</div>
				<span class="logo-area">
					<img src="/inno/assets/images/logo.png" alt="지우회계법인">
				</span>
				<div class="menu-area">
					<div class="lang-box">
						<div id="lang_now">
							<img src="/inno/assets/images/flags/4x3/kr.svg">
						</div>
						<select class="language">
							<option value="kr">KOR</option>
							<option value="us">ENG</option>
							<option value="jp">JPN</option>
							<option value="fr">FRN</option>
							<option value="ru">RUS</option>
							<option value="uz">UZB</option>
						</select>
					</div>
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
				<div class="com-top-tab ver2">
					<!-- <a href="target_company_1.html" class="on">전체 주소록</a>
					<a href="#">MY 주소록</a>
					<a href="#">거래처 주소록</a>
					<a href="#">인맥관리</a> -->
				</div>
				<div class="map-info-area">
					<div class="info-list-box2">
						<div class="form-photo-info">
							<div class="top-photo">
								<img src="/inno/assets/images/temp_bg.png" alt="">
							</div>
							<div class="top-tab-item title-type">
								<span class="tit">○○○○ 영업프로 업무대행 신청</span>
								<div class="action-btn">
									<button type="button" class="save-btn">등록</button>
								</div>
							</div>
							<div class="text-info-cnt">
								<ul class="half-list">
									<li>
										<span class="tit">이름</span>
										<div class="form">
											<input type="text" class="txt-input">
										</div>
										<span class="tit">직위</span>
										<div class="form">
											<input type="text" class="txt-input">
										</div>
									</li>
									<li>
										<span class="tit">부서</span>
										<div class="form">
											<input type="text" class="txt-input">
										</div>
										<span class="tit">핸드폰</span>
										<div class="form">
											<input type="text" class="txt-input">
										</div>
									</li>
									<li>
										<span class="tit">이메일</span>
										<div class="form full email">
											<input type="text" class="txt-input">
											<span class="ic">@</span>
											<select class="com-select">
												<option value="#">직접입력</option>
											</select>
										</div>
									</li>
									<li>
										<span class="tit">인재경력</span>
										<div class="form full">
											<select class="com-select year">
												<option value="#">3년 이하</option>
											</select>
										</div>
									</li>
									<li>
										<span class="tit">대행기간</span>
										<div class="form full">
											<select class="com-select month">
												<option value="#">3개월</option>
											</select>
										</div>
									</li>
								</ul>
							</div>
						</div>
					</div>
					<div class="visit-box">
						<div class="info-area">
							<div class="request-history-info">
								<span class="top-title">신청내역</span>
								<div class="table-scroll center no-scroll">
									<table>
										<colgroup>
											<col style='width:90px;'>
											<col style='width:80px;'>
											<col style='width:90px;'>
											<col style='width:90px;'>
											<col style='width:90px;'>
											<col style='width:90px;'>
										</colgroup>
										<thead>
											<tr>
												<th>신청일시</th>
												<th>부서</th>
												<th>이름</th>
												<th>직위</th>
												<th>대행기간</th>
												<th>신청결과  </th>
											</tr>
										</thead>
										<tbody>
											<tr class="on">
												<td>17:50</td>
												<td>영업</td>
												<td>박미영</td>
												<td>사원</td>
												<td>3개월</td>
												<td>미처리</td>
											</tr>
											<tr>
												<td>17:50</td>
												<td>영업</td>
												<td>박미영</td>
												<td>사원</td>
												<td>3개월</td>
												<td>미처리</td>
											</tr>
											<tr>
												<td>17:50</td>
												<td>영업</td>
												<td>박미영</td>
												<td>사원</td>
												<td>3개월</td>
												<td>미처리</td>
											</tr>
											<tr>
												<td>17:50</td>
												<td>영업</td>
												<td>박미영</td>
												<td>사원</td>
												<td>3개월</td>
												<td>미처리</td>
											</tr>
											<tr>
												<td>17:50</td>
												<td>영업</td>
												<td>박미영</td>
												<td>사원</td>
												<td>3개월</td>
												<td>미처리</td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
							<div class="sth-history-info">
								<div class="top-search-cnt">
									<span class="tit">대행상담 내역</span>
									<div class="menu-wrap">
										<div class="com-radio-select w-90">
											<button type="button" class="open-btn">대행유형</button>
											<ul class="check-list">
												<li>
													<input type="radio" name="location-radio-1" id="location-radio-1" checked>
													<label for="location-radio-1">대행유형</label>
												</li>
											</ul>
										</div>
										<div class="com-radio-select">
											<button type="button" class="open-btn">10P</button>
											<ul class="check-list">
												<li>
													<input type="radio" name="location-radio-2" id="location-radio-2" checked>
													<label for="location-radio-2">10P</label>
												</li>
											</ul>
										</div>
										<div class="txt-info">
											<span class="txt">전체 :</span>
											<span class="num">10</span>
										</div>
									</div>
								</div>
								<div class="table-scroll max-height-310">
									<table>
										<colgroup>
											<col style='width:100px;'>
											<col style='width:250px;'>
											<col style='width:100px;'>
											<col style='width:80px;'>
										</colgroup>
										<thead>
											<tr>
												<th>교신자/상담자</th>
												<th class="center">내용요약</th>
												<th>유형/결과</th>
												<th>교신일시</th>
											</tr>
										</thead>
										<tbody>
											<tr class="on">
												<td>김미연 (부사장)<br>김상민 (사원) </td>
												<td>계약에 관한 당사 방문 후 상담 추가 진행</td>
												<td>
													<span class="txt">대면상담</span>
													<span class="icon blue">찾음</span></td>
												<td>08.06 화<br>10:40</td>
											</tr>
											<tr>
												<td>김미연 (부사장)<br>김상민 (사원) </td>
												<td>계약에 관한 당사 방문 후 상담 추가 진행</td>
												<td>
													<span class="txt">비대면상담</span>
													<span class="icon green">통화중</span></td>
												<td>08.06 화<br>10:40</td>
											</tr>
											<tr>
												<td>김미연 (부사장)<br>김상민 (사원) </td>
												<td>계약에 관한 당사 방문 후 상담 추가 진행</td>
												<td>
													<span class="txt">비대면상담</span>
													<span class="icon purple">안받음</span></td>
												<td>08.06 화<br>10:40</td>
											</tr>
											<tr>
												<td>김미연 (부사장)<br>김상민 (사원) </td>
												<td>계약에 관한 당사 방문 후 상담 추가 진행</td>
												<td>
													<span class="txt">비대면상담</span>
													<span class="icon red">계약완료</span></td>
												<td>08.06 화<br>10:40</td>
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
						<div class="advice-area">
							<div class="top-tab-item">
								<span class="tit">대면 대행상담</span>
							</div>
							<div class="text-info-cnt">
								<ul class="half-list">
									<li>
										<span class="tit">면담자</span>
										<span class="txt">강지수 (대표이사)</span>
										<span class="tit">상담자</span>
										<span class="txt">최다니엘 (마케팅팀/대리)</span>
									</li>
									<li>
										<span class="tit">방문일시</span>
										<span class="txt">07.30 (화) 09:00</span>
										<span class="tit">방문결과</span>
										<span class="txt">계약완료</span>
									</li>
									<li>
										<span class="tit">재방문일</span>
										<span class="txt">07.01 (월) 13 : 00 ~ 14:00 </span>
									</li>
								</ul>
								<ul class="full-list">
									<li>
										<span class="tit">내용요약</span>
										<span class="txt">계약에 관한 당사 방문 후 상담 추가 진행</span>
									</li>
								</ul>
								<div class="detail-text">
									<p>본인 내용을 입력합니다.본인 내용을 입력합니다.<br>본인 내용을 입력합니다. 본인 내용을 입력합니다.</p>
									<p class="blue">본인 내용을 입력합니다.본인 내용을 입력합니다.<br>본인 내용을 입력합니다. 본인 내용을 입력합니다.</p>
									<p class="green">본인 내용을 입력합니다.본인 내용을 입력합니다.<br>본인 내용을 입력합니다. 본인 내용을 입력합니다.</p>
									<p class="purple">본인 내용을 입력합니다.본인 내용을 입력합니다.<br>본인 내용을 입력합니다. 본인 내용을 입력합니다.</p>
								</div>
								<div class="detail-sub-text">
									<span class="tit">이슈</span>
									<p class="txt">영업 프레젠테이션 관심으로 고민상담 만족으로 최종 계약을 위해 귀사의 방문하여 계약 서류 이행
									계약완료까지 고객사 당사 방문에서 계약에 관한 상담 준비 필요</p>
								</div>
								<div class="detail-sub-text">
									<span class="tit">결과</span>
									<p class="txt">영업 프레젠테이션 후 고객사 상담진행 비전 전략 계책 제안 후 계약 성사</p>
								</div>
							</div>
							<div class="com-paging day-type">
								<button type="button" class="prev-btn"><span class="blind">이전</span></button>
								<button type="button" class="on">07.01 월</button>
								<button type="button"  onclick="location.href='target_company_4_4.html'">05.02 수</button>
								<button type="button">04.02 수</button>
								<button type="button">02.02 수</button>
								<button type="button" class="next-btn"><span class="blind">다음</span></button>
							</div>
						</div>
					</div>
				</div>
				
			</div>
		</div>
	</div>
</body>

</html>
