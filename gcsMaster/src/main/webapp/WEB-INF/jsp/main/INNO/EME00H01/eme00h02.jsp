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
					<span class="location">신규 데이터</span>
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
				<div class="com-top-tab ver2">
					<a href="target_company_E.html" class="on">등기열람표</a>
					<a href="target_company_E_b.html">신설법인</a>
				</div>
				<div class="list-info-area">
					<div class="top-select-box">
						<div class="logo-item">
							<img src="/inno/assets/images/logo_count.png" alt="">
						</div>
						<div class="input-item">
							<div class="input-cnt">
								<input type="text" class="num-input" value="134111">
								<span class="ic">-</span>
								<div class="com-radio-select">
									<button type="button" class="open-btn">구역</button>
									<ul class="check-list">
										<li>
											<input type="radio" name="gu-radio" id="gu-radio-1" checked>
											<label for="gu-radio-1">1구역</label>
										</li>
										<li>
											<input type="radio" name="gu-radio" id="gu-radio-2">
											<label for="gu-radio-2">2구역</label>
										</li>
										<li>
											<input type="radio" name="gu-radio" id="gu-radio-3">
											<label for="gu-radio-3">3구역</label>
										</li>
										<li>
											<input type="radio" name="gu-radio" id="gu-radio-4">
											<label for="gu-radio-4">4구역</label>
										</li>
										<li>
											<input type="radio" name="gu-radio" id="gu-radio-5">
											<label for="gu-radio-5">5구역</label>
										</li>
									</ul>
								</div>
							</div>
							<div class="icon-cnt">
								<span class="icon">
									<span class="tit">조사</span>
									<span class="txt green">결재대기</span>
								</span>
								<span class="icon">
									<span class="tit">A</span>
									<span class="txt gray">등기취하</span>
								</span>
								<span class="icon">
									<span class="tit">B</span>
									<span class="txt blue">본점이전</span>
								</span>
								<span class="icon">
									<span class="tit">C</span>
									<span class="txt orange">지점설립</span>
								</span>
							</div>
						</div>
						<div class="day-info-item">
							<div class="title-cnt">
								<span class="day">22.07.29 목</span>
								<span class="txt">시간별 작업량</span>
							</div>
							<div class="time-cnt">
								<button type="button" class="left-btn"></button>
								<div class="time-info">
									<ul class="list">
										<li>
											<span class="time">09H</span>
											<span class="num">50</span>
										</li>
										<li>
											<span class="time">10H</span>
											<span class="num">90</span>
										</li>
										<li>
											<span class="time">11H</span>
											<span class="num">88</span>
										</li>
										<li>
											<span class="time">12H</span>
											<span class="num">0</span>
										</li>
										<li>
											<span class="time">13H</span>
											<span class="num">70</span>
										</li>
										<li>
											<span class="time">14H</span>
											<span class="num">0</span>
										</li>
										<li>
											<span class="time">15H</span>
											<span class="num">60</span>
										</li>
										<li>
											<span class="time">16H</span>
											<span class="num">90</span>
										</li>
										<li>
											<span class="time">17H</span>
											<span class="num">0</span>
										</li>
										<li>
											<span class="time">18H</span>
											<span class="num">0</span>
										</li>
									</ul>
								</div>
								<button type="button" class="right-btn"></button>
							</div>
							<div class="result-cnt">
								<ul class="list">
									<li>
										<span class="tit">결제대기</span>
										<button type="button" class="arrow-btn">
											<span class="num">834</span>
											<span class="txt">건</span>
										</button>
									</li>
									<li>
										<span class="tit">결재완료</span>
										<button type="button" class="arrow-btn">
											<span class="num">834</span>
											<span class="txt">건</span>
										</button>
									</li>
									<li>
										<span class="tit">입력완료</span>
										<button type="button" class="arrow-btn">
											<span class="num">834</span>
											<span class="txt">건</span>
										</button>
									</li>
								</ul>
							</div>
						</div>
						<div class="search-item">
							<div class="input-cnt">
								<button type="button" class="left-btn"></button>
								<div class="input-form">
									<input type="text" value="646963">
									<button type="button" class="search-btn"></button>
								</div>
								<button type="button" class="right-btn"></button>
							</div>
							<div class="txt-cnt">
								<button type="button" class="arrow-btn">
									<span class="txt">최종등기 확인</span>
									<span class="num">38364</span>
								</button>
							</div>
						</div>
					</div>
					<div class="status-info-box">
						<div class="status-item">
							<div class="top-cnt">
								<span class="tit">등기</span>
								<span class="tit">상태</span>
							</div>
							<ul class="list-cnt">
								<li>
									<span class="num">000075</span>
									<div class="round-info">
										<span class="txt">조사</span>
										<span class="txt">A</span>
										<span class="txt">B</span>
										<span class="txt">C</span>
									</div>
								</li>
								<li>
									<span class="num">000075</span>
									<span class="full-txt green">결재대기</span>
								</li>
								<li>
									<span class="num">000075</span>
									<span class="full-txt gray">등기취하</span>
								</li>
								<li>
									<span class="num">000075</span>
									<span class="full-txt blue">본점이전</span>
								</li>
								<li>
									<span class="num">000075</span>
									<span class="full-txt orange">지점설립</span>
								</li>
								<li>
									<span class="num black-bg">000075</span>
									<div class="round-info">
										<span class="txt">조사</span>
										<span class="txt">A</span>
										<span class="txt">B</span>
										<span class="txt">C</span>
									</div>
								</li>
								<li>
									<span class="num black-bg yellow-txt">000075</span>
									<div class="round-info">
										<span class="txt">조사</span>
										<span class="txt">A</span>
										<span class="txt">B</span>
										<span class="txt">C</span>
									</div>
								</li>
								<li>
									<span class="num">000075</span>
									<div class="round-info">
										<span class="txt">조사</span>
										<span class="txt">A</span>
										<span class="txt">B</span>
										<span class="txt">C</span>
									</div>
								</li>
								<li>
									<span class="num">000075</span>
									<span class="full-txt green">결재대기</span>
								</li>
								<li>
									<span class="num">000075</span>
									<span class="full-txt gray">등기취하</span>
								</li>
								<li>
									<span class="num">000075</span>
									<span class="full-txt blue">본점이전</span>
								</li>
								<li>
									<span class="num">000075</span>
									<span class="full-txt orange">지점설립</span>
								</li>
								<li>
									<span class="num black-bg">000075</span>
									<div class="round-info">
										<span class="txt">조사</span>
										<span class="txt">A</span>
										<span class="txt">B</span>
										<span class="txt">C</span>
									</div>
								</li>
								<li>
									<span class="num black-bg yellow-txt">000075</span>
									<div class="round-info">
										<span class="txt">조사</span>
										<span class="txt">A</span>
										<span class="txt">B</span>
										<span class="txt">C</span>
									</div>
								</li>
								<li>
									<span class="num">000075</span>
									<div class="round-info">
										<span class="txt">조사</span>
										<span class="txt">A</span>
										<span class="txt">B</span>
										<span class="txt">C</span>
									</div>
								</li>
								<li>
									<span class="num">000075</span>
									<span class="full-txt green">결재대기</span>
								</li>
								<li>
									<span class="num">000075</span>
									<span class="full-txt gray">등기취하</span>
								</li>
								<li>
									<span class="num">000075</span>
									<span class="full-txt blue">본점이전</span>
								</li>
								<li>
									<span class="num">000075</span>
									<span class="full-txt orange">지점설립</span>
								</li>
								<li>
									<span class="num black-bg">000075</span>
									<div class="round-info">
										<span class="txt">조사</span>
										<span class="txt">A</span>
										<span class="txt">B</span>
										<span class="txt">C</span>
									</div>
								</li>
								<li>
									<span class="num black-bg yellow-txt">000075</span>
									<div class="round-info">
										<span class="txt">조사</span>
										<span class="txt">A</span>
										<span class="txt">B</span>
										<span class="txt">C</span>
									</div>
								</li>
							</ul>
						</div>
						<div class="status-item">
							<div class="top-cnt">
								<span class="tit">등기</span>
								<span class="tit">상태</span>
							</div>
							<ul class="list-cnt">
								<li>
									<span class="num">000075</span>
									<div class="round-info">
										<span class="txt">조사</span>
										<span class="txt">A</span>
										<span class="txt">B</span>
										<span class="txt">C</span>
									</div>
								</li>
								<li>
									<span class="num">000075</span>
									<span class="full-txt green">결재대기</span>
								</li>
								<li>
									<span class="num">000075</span>
									<span class="full-txt gray">등기취하</span>
								</li>
								<li>
									<span class="num">000075</span>
									<span class="full-txt blue">본점이전</span>
								</li>
								<li>
									<span class="num">000075</span>
									<span class="full-txt orange">지점설립</span>
								</li>
								<li>
									<span class="num black-bg">000075</span>
									<div class="round-info">
										<span class="txt">조사</span>
										<span class="txt">A</span>
										<span class="txt">B</span>
										<span class="txt">C</span>
									</div>
								</li>
								<li>
									<span class="num black-bg yellow-txt">000075</span>
									<div class="round-info">
										<span class="txt">조사</span>
										<span class="txt">A</span>
										<span class="txt">B</span>
										<span class="txt">C</span>
									</div>
								</li>
								<li>
									<span class="num">000075</span>
									<div class="round-info">
										<span class="txt">조사</span>
										<span class="txt">A</span>
										<span class="txt">B</span>
										<span class="txt">C</span>
									</div>
								</li>
								<li>
									<span class="num">000075</span>
									<span class="full-txt green">결재대기</span>
								</li>
								<li>
									<span class="num">000075</span>
									<span class="full-txt gray">등기취하</span>
								</li>
								<li>
									<span class="num">000075</span>
									<span class="full-txt blue">본점이전</span>
								</li>
								<li>
									<span class="num">000075</span>
									<span class="full-txt orange">지점설립</span>
								</li>
								<li>
									<span class="num black-bg">000075</span>
									<div class="round-info">
										<span class="txt">조사</span>
										<span class="txt">A</span>
										<span class="txt">B</span>
										<span class="txt">C</span>
									</div>
								</li>
								<li>
									<span class="num black-bg yellow-txt">000075</span>
									<div class="round-info">
										<span class="txt">조사</span>
										<span class="txt">A</span>
										<span class="txt">B</span>
										<span class="txt">C</span>
									</div>
								</li>
								<li>
									<span class="num">000075</span>
									<div class="round-info">
										<span class="txt">조사</span>
										<span class="txt">A</span>
										<span class="txt">B</span>
										<span class="txt">C</span>
									</div>
								</li>
								<li>
									<span class="num">000075</span>
									<span class="full-txt green">결재대기</span>
								</li>
								<li>
									<span class="num">000075</span>
									<span class="full-txt gray">등기취하</span>
								</li>
								<li>
									<span class="num">000075</span>
									<span class="full-txt blue">본점이전</span>
								</li>
								<li>
									<span class="num">000075</span>
									<span class="full-txt orange">지점설립</span>
								</li>
								<li>
									<span class="num black-bg">000075</span>
									<div class="round-info">
										<span class="txt">조사</span>
										<span class="txt">A</span>
										<span class="txt">B</span>
										<span class="txt">C</span>
									</div>
								</li>
								<li>
									<span class="num black-bg yellow-txt">000075</span>
									<div class="round-info">
										<span class="txt">조사</span>
										<span class="txt">A</span>
										<span class="txt">B</span>
										<span class="txt">C</span>
									</div>
								</li>
							</ul>
						</div>
						<div class="status-item">
							<div class="top-cnt">
								<span class="tit">등기</span>
								<span class="tit">상태</span>
							</div>
							<ul class="list-cnt">
								<li>
									<span class="num">000075</span>
									<div class="round-info">
										<span class="txt">조사</span>
										<span class="txt">A</span>
										<span class="txt">B</span>
										<span class="txt">C</span>
									</div>
								</li>
								<li>
									<span class="num">000075</span>
									<span class="full-txt green">결재대기</span>
								</li>
								<li>
									<span class="num">000075</span>
									<span class="full-txt gray">등기취하</span>
								</li>
								<li>
									<span class="num">000075</span>
									<span class="full-txt blue">본점이전</span>
								</li>
								<li>
									<span class="num">000075</span>
									<span class="full-txt orange">지점설립</span>
								</li>
								<li>
									<span class="num black-bg">000075</span>
									<div class="round-info">
										<span class="txt">조사</span>
										<span class="txt">A</span>
										<span class="txt">B</span>
										<span class="txt">C</span>
									</div>
								</li>
								<li>
									<span class="num black-bg yellow-txt">000075</span>
									<div class="round-info">
										<span class="txt">조사</span>
										<span class="txt">A</span>
										<span class="txt">B</span>
										<span class="txt">C</span>
									</div>
								</li>
								<li>
									<span class="num">000075</span>
									<div class="round-info">
										<span class="txt">조사</span>
										<span class="txt">A</span>
										<span class="txt">B</span>
										<span class="txt">C</span>
									</div>
								</li>
								<li>
									<span class="num">000075</span>
									<span class="full-txt green">결재대기</span>
								</li>
								<li>
									<span class="num">000075</span>
									<span class="full-txt gray">등기취하</span>
								</li>
								<li>
									<span class="num">000075</span>
									<span class="full-txt blue">본점이전</span>
								</li>
								<li>
									<span class="num">000075</span>
									<span class="full-txt orange">지점설립</span>
								</li>
								<li>
									<span class="num black-bg">000075</span>
									<div class="round-info">
										<span class="txt">조사</span>
										<span class="txt">A</span>
										<span class="txt">B</span>
										<span class="txt">C</span>
									</div>
								</li>
								<li>
									<span class="num black-bg yellow-txt">000075</span>
									<div class="round-info">
										<span class="txt">조사</span>
										<span class="txt">A</span>
										<span class="txt">B</span>
										<span class="txt">C</span>
									</div>
								</li>
								<li>
									<span class="num">000075</span>
									<div class="round-info">
										<span class="txt">조사</span>
										<span class="txt">A</span>
										<span class="txt">B</span>
										<span class="txt">C</span>
									</div>
								</li>
								<li>
									<span class="num">000075</span>
									<span class="full-txt green">결재대기</span>
								</li>
								<li>
									<span class="num">000075</span>
									<span class="full-txt gray">등기취하</span>
								</li>
								<li>
									<span class="num">000075</span>
									<span class="full-txt blue">본점이전</span>
								</li>
								<li>
									<span class="num">000075</span>
									<span class="full-txt orange">지점설립</span>
								</li>
								<li>
									<span class="num black-bg">000075</span>
									<div class="round-info">
										<span class="txt">조사</span>
										<span class="txt">A</span>
										<span class="txt">B</span>
										<span class="txt">C</span>
									</div>
								</li>
								<li>
									<span class="num black-bg yellow-txt">000075</span>
									<div class="round-info">
										<span class="txt">조사</span>
										<span class="txt">A</span>
										<span class="txt">B</span>
										<span class="txt">C</span>
									</div>
								</li>
							</ul>
						</div>
						<div class="status-item">
							<div class="top-cnt">
								<span class="tit">등기</span>
								<span class="tit">상태</span>
							</div>
							<ul class="list-cnt">
								<li>
									<span class="num">000075</span>
									<div class="round-info">
										<span class="txt">조사</span>
										<span class="txt">A</span>
										<span class="txt">B</span>
										<span class="txt">C</span>
									</div>
								</li>
								<li>
									<span class="num">000075</span>
									<span class="full-txt green">결재대기</span>
								</li>
								<li>
									<span class="num">000075</span>
									<span class="full-txt gray">등기취하</span>
								</li>
								<li>
									<span class="num">000075</span>
									<span class="full-txt blue">본점이전</span>
								</li>
								<li>
									<span class="num">000075</span>
									<span class="full-txt orange">지점설립</span>
								</li>
								<li>
									<span class="num black-bg">000075</span>
									<div class="round-info">
										<span class="txt">조사</span>
										<span class="txt">A</span>
										<span class="txt">B</span>
										<span class="txt">C</span>
									</div>
								</li>
								<li>
									<span class="num black-bg yellow-txt">000075</span>
									<div class="round-info">
										<span class="txt">조사</span>
										<span class="txt">A</span>
										<span class="txt">B</span>
										<span class="txt">C</span>
									</div>
								</li>
								<li>
									<span class="num">000075</span>
									<div class="round-info">
										<span class="txt">조사</span>
										<span class="txt">A</span>
										<span class="txt">B</span>
										<span class="txt">C</span>
									</div>
								</li>
								<li>
									<span class="num">000075</span>
									<span class="full-txt green">결재대기</span>
								</li>
								<li>
									<span class="num">000075</span>
									<span class="full-txt gray">등기취하</span>
								</li>
								<li>
									<span class="num">000075</span>
									<span class="full-txt blue">본점이전</span>
								</li>
								<li>
									<span class="num">000075</span>
									<span class="full-txt orange">지점설립</span>
								</li>
								<li>
									<span class="num black-bg">000075</span>
									<div class="round-info">
										<span class="txt">조사</span>
										<span class="txt">A</span>
										<span class="txt">B</span>
										<span class="txt">C</span>
									</div>
								</li>
								<li>
									<span class="num black-bg yellow-txt">000075</span>
									<div class="round-info">
										<span class="txt">조사</span>
										<span class="txt">A</span>
										<span class="txt">B</span>
										<span class="txt">C</span>
									</div>
								</li>
								<li>
									<span class="num">000075</span>
									<div class="round-info">
										<span class="txt">조사</span>
										<span class="txt">A</span>
										<span class="txt">B</span>
										<span class="txt">C</span>
									</div>
								</li>
								<li>
									<span class="num">000075</span>
									<span class="full-txt green">결재대기</span>
								</li>
								<li>
									<span class="num">000075</span>
									<span class="full-txt gray">등기취하</span>
								</li>
								<li>
									<span class="num">000075</span>
									<span class="full-txt blue">본점이전</span>
								</li>
								<li>
									<span class="num">000075</span>
									<span class="full-txt orange">지점설립</span>
								</li>
								<li>
									<span class="num black-bg">000075</span>
									<div class="round-info">
										<span class="txt">조사</span>
										<span class="txt">A</span>
										<span class="txt">B</span>
										<span class="txt">C</span>
									</div>
								</li>
								<li>
									<span class="num black-bg yellow-txt">000075</span>
									<div class="round-info">
										<span class="txt">조사</span>
										<span class="txt">A</span>
										<span class="txt">B</span>
										<span class="txt">C</span>
									</div>
								</li>
							</ul>
						</div>
						<div class="status-item">
							<div class="top-cnt">
								<span class="tit">등기</span>
								<span class="tit">상태</span>
							</div>
							<ul class="list-cnt">
								<li>
									<span class="num">000075</span>
									<div class="round-info">
										<span class="txt">조사</span>
										<span class="txt">A</span>
										<span class="txt">B</span>
										<span class="txt">C</span>
									</div>
								</li>
								<li>
									<span class="num">000075</span>
									<span class="full-txt green">결재대기</span>
								</li>
								<li>
									<span class="num">000075</span>
									<span class="full-txt gray">등기취하</span>
								</li>
								<li>
									<span class="num">000075</span>
									<span class="full-txt blue">본점이전</span>
								</li>
								<li>
									<span class="num">000075</span>
									<span class="full-txt orange">지점설립</span>
								</li>
								<li>
									<span class="num black-bg">000075</span>
									<div class="round-info">
										<span class="txt">조사</span>
										<span class="txt">A</span>
										<span class="txt">B</span>
										<span class="txt">C</span>
									</div>
								</li>
								<li>
									<span class="num black-bg yellow-txt">000075</span>
									<div class="round-info">
										<span class="txt">조사</span>
										<span class="txt">A</span>
										<span class="txt">B</span>
										<span class="txt">C</span>
									</div>
								</li>
								<li>
									<span class="num">000075</span>
									<div class="round-info">
										<span class="txt">조사</span>
										<span class="txt">A</span>
										<span class="txt">B</span>
										<span class="txt">C</span>
									</div>
								</li>
								<li>
									<span class="num">000075</span>
									<span class="full-txt green">결재대기</span>
								</li>
								<li>
									<span class="num">000075</span>
									<span class="full-txt gray">등기취하</span>
								</li>
								<li>
									<span class="num">000075</span>
									<span class="full-txt blue">본점이전</span>
								</li>
								<li>
									<span class="num">000075</span>
									<span class="full-txt orange">지점설립</span>
								</li>
								<li>
									<span class="num black-bg">000075</span>
									<div class="round-info">
										<span class="txt">조사</span>
										<span class="txt">A</span>
										<span class="txt">B</span>
										<span class="txt">C</span>
									</div>
								</li>
								<li>
									<span class="num black-bg yellow-txt">000075</span>
									<div class="round-info">
										<span class="txt">조사</span>
										<span class="txt">A</span>
										<span class="txt">B</span>
										<span class="txt">C</span>
									</div>
								</li>
								<li>
									<span class="num">000075</span>
									<div class="round-info">
										<span class="txt">조사</span>
										<span class="txt">A</span>
										<span class="txt">B</span>
										<span class="txt">C</span>
									</div>
								</li>
								<li>
									<span class="num">000075</span>
									<span class="full-txt green">결재대기</span>
								</li>
								<li>
									<span class="num">000075</span>
									<span class="full-txt gray">등기취하</span>
								</li>
								<li>
									<span class="num">000075</span>
									<span class="full-txt blue">본점이전</span>
								</li>
								<li>
									<span class="num">000075</span>
									<span class="full-txt orange">지점설립</span>
								</li>
								<li>
									<span class="num black-bg">000075</span>
									<div class="round-info">
										<span class="txt">조사</span>
										<span class="txt">A</span>
										<span class="txt">B</span>
										<span class="txt">C</span>
									</div>
								</li>
								<li>
									<span class="num black-bg yellow-txt">000075</span>
									<div class="round-info">
										<span class="txt">조사</span>
										<span class="txt">A</span>
										<span class="txt">B</span>
										<span class="txt">C</span>
									</div>
								</li>
							</ul>
						</div>
						<div class="status-item">
							<div class="top-cnt">
								<span class="tit">등기</span>
								<span class="tit">상태</span>
							</div>
							<ul class="list-cnt">
								<li>
									<span class="num">000075</span>
									<div class="round-info">
										<span class="txt">조사</span>
										<span class="txt">A</span>
										<span class="txt">B</span>
										<span class="txt">C</span>
									</div>
								</li>
								<li>
									<span class="num">000075</span>
									<span class="full-txt green">결재대기</span>
								</li>
								<li>
									<span class="num">000075</span>
									<span class="full-txt gray">등기취하</span>
								</li>
								<li>
									<span class="num">000075</span>
									<span class="full-txt blue">본점이전</span>
								</li>
								<li>
									<span class="num">000075</span>
									<span class="full-txt orange">지점설립</span>
								</li>
								<li>
									<span class="num black-bg">000075</span>
									<div class="round-info">
										<span class="txt">조사</span>
										<span class="txt">A</span>
										<span class="txt">B</span>
										<span class="txt">C</span>
									</div>
								</li>
								<li>
									<span class="num black-bg yellow-txt">000075</span>
									<div class="round-info">
										<span class="txt">조사</span>
										<span class="txt">A</span>
										<span class="txt">B</span>
										<span class="txt">C</span>
									</div>
								</li>
								<li>
									<span class="num">000075</span>
									<div class="round-info">
										<span class="txt">조사</span>
										<span class="txt">A</span>
										<span class="txt">B</span>
										<span class="txt">C</span>
									</div>
								</li>
								<li>
									<span class="num">000075</span>
									<span class="full-txt green">결재대기</span>
								</li>
								<li>
									<span class="num">000075</span>
									<span class="full-txt gray">등기취하</span>
								</li>
								<li>
									<span class="num">000075</span>
									<span class="full-txt blue">본점이전</span>
								</li>
								<li>
									<span class="num">000075</span>
									<span class="full-txt orange">지점설립</span>
								</li>
								<li>
									<span class="num black-bg">000075</span>
									<div class="round-info">
										<span class="txt">조사</span>
										<span class="txt">A</span>
										<span class="txt">B</span>
										<span class="txt">C</span>
									</div>
								</li>
								<li>
									<span class="num black-bg yellow-txt">000075</span>
									<div class="round-info">
										<span class="txt">조사</span>
										<span class="txt">A</span>
										<span class="txt">B</span>
										<span class="txt">C</span>
									</div>
								</li>
								<li>
									<span class="num">000075</span>
									<div class="round-info">
										<span class="txt">조사</span>
										<span class="txt">A</span>
										<span class="txt">B</span>
										<span class="txt">C</span>
									</div>
								</li>
								<li>
									<span class="num">000075</span>
									<span class="full-txt green">결재대기</span>
								</li>
								<li>
									<span class="num">000075</span>
									<span class="full-txt gray">등기취하</span>
								</li>
								<li>
									<span class="num">000075</span>
									<span class="full-txt blue">본점이전</span>
								</li>
								<li>
									<span class="num">000075</span>
									<span class="full-txt orange">지점설립</span>
								</li>
								<li>
									<span class="num black-bg">000075</span>
									<div class="round-info">
										<span class="txt">조사</span>
										<span class="txt">A</span>
										<span class="txt">B</span>
										<span class="txt">C</span>
									</div>
								</li>
								<li>
									<span class="num black-bg yellow-txt">000075</span>
									<div class="round-info">
										<span class="txt">조사</span>
										<span class="txt">A</span>
										<span class="txt">B</span>
										<span class="txt">C</span>
									</div>
								</li>
							</ul>
						</div>
						<div class="status-item">
							<div class="top-cnt">
								<span class="tit">등기</span>
								<span class="tit">상태</span>
							</div>
							<ul class="list-cnt">
								<li>
									<span class="num">000075</span>
									<div class="round-info">
										<span class="txt">조사</span>
										<span class="txt">A</span>
										<span class="txt">B</span>
										<span class="txt">C</span>
									</div>
								</li>
								<li>
									<span class="num">000075</span>
									<span class="full-txt green">결재대기</span>
								</li>
								<li>
									<span class="num">000075</span>
									<span class="full-txt gray">등기취하</span>
								</li>
								<li>
									<span class="num">000075</span>
									<span class="full-txt blue">본점이전</span>
								</li>
								<li>
									<span class="num">000075</span>
									<span class="full-txt orange">지점설립</span>
								</li>
								<li>
									<span class="num black-bg">000075</span>
									<div class="round-info">
										<span class="txt">조사</span>
										<span class="txt">A</span>
										<span class="txt">B</span>
										<span class="txt">C</span>
									</div>
								</li>
								<li>
									<span class="num black-bg yellow-txt">000075</span>
									<div class="round-info">
										<span class="txt">조사</span>
										<span class="txt">A</span>
										<span class="txt">B</span>
										<span class="txt">C</span>
									</div>
								</li>
								<li>
									<span class="num">000075</span>
									<div class="round-info">
										<span class="txt">조사</span>
										<span class="txt">A</span>
										<span class="txt">B</span>
										<span class="txt">C</span>
									</div>
								</li>
								<li>
									<span class="num">000075</span>
									<span class="full-txt green">결재대기</span>
								</li>
								<li>
									<span class="num">000075</span>
									<span class="full-txt gray">등기취하</span>
								</li>
								<li>
									<span class="num">000075</span>
									<span class="full-txt blue">본점이전</span>
								</li>
								<li>
									<span class="num">000075</span>
									<span class="full-txt orange">지점설립</span>
								</li>
								<li>
									<span class="num black-bg">000075</span>
									<div class="round-info">
										<span class="txt">조사</span>
										<span class="txt">A</span>
										<span class="txt">B</span>
										<span class="txt">C</span>
									</div>
								</li>
								<li>
									<span class="num black-bg yellow-txt">000075</span>
									<div class="round-info">
										<span class="txt">조사</span>
										<span class="txt">A</span>
										<span class="txt">B</span>
										<span class="txt">C</span>
									</div>
								</li>
								<li>
									<span class="num">000075</span>
									<div class="round-info">
										<span class="txt">조사</span>
										<span class="txt">A</span>
										<span class="txt">B</span>
										<span class="txt">C</span>
									</div>
								</li>
								<li>
									<span class="num">000075</span>
									<span class="full-txt green">결재대기</span>
								</li>
								<li>
									<span class="num">000075</span>
									<span class="full-txt gray">등기취하</span>
								</li>
								<li>
									<span class="num">000075</span>
									<span class="full-txt blue">본점이전</span>
								</li>
								<li>
									<span class="num">000075</span>
									<span class="full-txt orange">지점설립</span>
								</li>
								<li>
									<span class="num black-bg">000075</span>
									<div class="round-info">
										<span class="txt">조사</span>
										<span class="txt">A</span>
										<span class="txt">B</span>
										<span class="txt">C</span>
									</div>
								</li>
								<li>
									<span class="num black-bg yellow-txt">000075</span>
									<div class="round-info">
										<span class="txt">조사</span>
										<span class="txt">A</span>
										<span class="txt">B</span>
										<span class="txt">C</span>
									</div>
								</li>
							</ul>
						</div>
						<div class="status-item">
							<div class="top-cnt">
								<span class="tit">등기</span>
								<span class="tit">상태</span>
							</div>
							<ul class="list-cnt">
								<li>
									<span class="num">000075</span>
									<div class="round-info">
										<span class="txt">조사</span>
										<span class="txt">A</span>
										<span class="txt">B</span>
										<span class="txt">C</span>
									</div>
								</li>
								<li>
									<span class="num">000075</span>
									<span class="full-txt green">결재대기</span>
								</li>
								<li>
									<span class="num">000075</span>
									<span class="full-txt gray">등기취하</span>
								</li>
								<li>
									<span class="num">000075</span>
									<span class="full-txt blue">본점이전</span>
								</li>
								<li>
									<span class="num">000075</span>
									<span class="full-txt orange">지점설립</span>
								</li>
								<li>
									<span class="num black-bg">000075</span>
									<div class="round-info">
										<span class="txt">조사</span>
										<span class="txt">A</span>
										<span class="txt">B</span>
										<span class="txt">C</span>
									</div>
								</li>
								<li>
									<span class="num black-bg yellow-txt">000075</span>
									<div class="round-info">
										<span class="txt">조사</span>
										<span class="txt">A</span>
										<span class="txt">B</span>
										<span class="txt">C</span>
									</div>
								</li>
								<li>
									<span class="num">000075</span>
									<div class="round-info">
										<span class="txt">조사</span>
										<span class="txt">A</span>
										<span class="txt">B</span>
										<span class="txt">C</span>
									</div>
								</li>
								<li>
									<span class="num">000075</span>
									<span class="full-txt green">결재대기</span>
								</li>
								<li>
									<span class="num">000075</span>
									<span class="full-txt gray">등기취하</span>
								</li>
								<li>
									<span class="num">000075</span>
									<span class="full-txt blue">본점이전</span>
								</li>
								<li>
									<span class="num">000075</span>
									<span class="full-txt orange">지점설립</span>
								</li>
								<li>
									<span class="num black-bg">000075</span>
									<div class="round-info">
										<span class="txt">조사</span>
										<span class="txt">A</span>
										<span class="txt">B</span>
										<span class="txt">C</span>
									</div>
								</li>
								<li>
									<span class="num black-bg yellow-txt">000075</span>
									<div class="round-info">
										<span class="txt">조사</span>
										<span class="txt">A</span>
										<span class="txt">B</span>
										<span class="txt">C</span>
									</div>
								</li>
								<li>
									<span class="num">000075</span>
									<div class="round-info">
										<span class="txt">조사</span>
										<span class="txt">A</span>
										<span class="txt">B</span>
										<span class="txt">C</span>
									</div>
								</li>
								<li>
									<span class="num">000075</span>
									<span class="full-txt green">결재대기</span>
								</li>
								<li>
									<span class="num">000075</span>
									<span class="full-txt gray">등기취하</span>
								</li>
								<li>
									<span class="num">000075</span>
									<span class="full-txt blue">본점이전</span>
								</li>
								<li>
									<span class="num">000075</span>
									<span class="full-txt orange">지점설립</span>
								</li>
								<li>
									<span class="num black-bg">000075</span>
									<div class="round-info">
										<span class="txt">조사</span>
										<span class="txt">A</span>
										<span class="txt">B</span>
										<span class="txt">C</span>
									</div>
								</li>
								<li>
									<span class="num black-bg yellow-txt">000075</span>
									<div class="round-info">
										<span class="txt">조사</span>
										<span class="txt">A</span>
										<span class="txt">B</span>
										<span class="txt">C</span>
									</div>
								</li>
							</ul>
						</div>
					</div>
				</div>
				
			</div>
		</div>
	</div>

</body>
</html>
