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
          <c:import url="/EmpPageLink.do?link=main/include/innomenu4" />            
		</div>
		<!-- container -->
		<div class="container">
			<div class="location-content">
				<div class="location-area">
					<span class="location">프로모션 / <strong>PR</strong></span>
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
				<div class="com-top-tab">
					<div class="com-top-tab_lt">
						<a href="target_company_12.html" class="on">전체</a>
						<a href="#" >제안서</a>
						<a href="#" >홈페이지</a>
						<a href="#" >블로그·카페</a>
						<a href="#" >SNS</a>
					</div>

					<div class="com-top-tab_rt">
						<span class="tab-right-info">
							<span class="txt">가공데이터 전체</span>
							<span class="num">592,000</span>
						</span>
					</div>
					
				</div>
				
				<div class="list-info-area">
					<div class="top-search-box">
						<div class="select-wrap">
							
							<div class="select-item">
								<div class="com-radio-select w-115">
									<button type="button" class="open-btn">업종</button>
									<ul class="check-list">
										<li>
											<input type="radio" name="sort-radio-1" id="sort-radio-1-1" checked>
											<label for="sort-radio-1-1">업종</label>
										</li>
									</ul>
								</div>
								<div class="com-radio-select">
									<button type="button" class="open-btn">지역</button>
									<ul class="check-list">
										<li>
											<input type="radio" name="sort-radio-2" id="sort-radio-2-1" checked>
											<label for="sort-radio-2-1">지역</label>
										</li>
									</ul>
								</div>
								<div class="com-radio-select">
									<button type="button" class="open-btn">서비스</button>
									<ul class="check-list">
										<li>
											<input type="radio" name="sort-radio-3" id="sort-radio-3-1" checked>
											<label for="sort-radio-3-1">서비스</label>
										</li>
									</ul>
								</div>
								<div class="com-radio-select">
									<button type="button" class="open-btn">요금제</button>
									<ul class="check-list">
										<li>
											<input type="radio" name="sort-radio-4" id="sort-radio-4-1" checked>
											<label for="sort-radio-4-1">요금제</label>
										</li>
									</ul>
								</div>
								<div class="input-search">
									<input type="text" placeholder="검색 키워드 입력">
									<button type="button" class="search-btn"></button>
								</div>
							</div>


						</div>
						<div class="sort-wrap">
							<div class="set_item">
								<div class="set_item_name">
									항목설정
								</div>
								<div class="com-radio-select">
									<button type="button" class="open-btn">항목노출</button>
									<ul class="check-list">
										<li>
											<input type="radio" name="sort-radio-12" id="sort-radio-12" checked>
											<label for="sort-radio-12">항목노출</label>
										</li>
									</ul>
								</div>
							</div>
							<div class="com-radio-select">
								<button type="button" class="open-btn">10p</button>
								<ul class="check-list">
									<li>
										<input type="radio" name="sort-radio-num" id="sort-radio-num" checked>
										<label for="sort-radio-num">10p</label>
									</li>
								</ul>
							</div>
							<span class="num-txt">
								<span class="txt">전체: </span>
								<span class="num"></span>
							</span>
						</div>
					</div>
					<div class="table-input-box">
						<div class="scroll-wrap">
							<table class="check-table" >
								<colgroup>
									<col style='width:30px;'>
									<col style='width:220px;'>
									<col style='width:220px;'>
									<col style='width:160px;'>
									<col style='width:220px;'>
									<col style='width:100px;'>
									<col style='width:100px;'>
									<col style='width:100px;'>
									<col style='width:100px;'>
								</colgroup>
								<thead>
									<tr>
										<th class="center">
											<div>
												<input type="checkbox" name="check-1" id="check-1">
												<label for="check-1"></label>
											</div>
										</th>
										<th>회사명<br>업종</th>
										<th>회사주소<br>담당전화</th>
										<th>부서<br>담당자/직위</th>
										<th>핸드폰<br>이메일</th>
										<th>제안서</th>
										<th>홈페이지</th>
										<th>블로그·카페</th>
										<th>SNS</th>
									</tr>
								</thead>

								<tbody>
								<!--1~5-->
									<tr class="on">
										<td class="center" rowspan="2">
											<div class="com-check">
												<input type="checkbox" name="td-check-1" id="td-check-1">
												<label for="td-check-1"></label>
											</div>
										</td>
										<td>성현회계법이 서울본사</td>
										<td>서울 강남구 테헤란로 508 해성2...</td><!--2-->
										<td>총무</td>
										<td>010-2066-0000</td>
										<td rowspan="2">
											<!-- <span class="hp_img"></span><span class="hp_in">일반형<br>15P</span> -->
										</td>
										<td rowspan="2">
											<!-- <span class="hp_img"></span><span class="hp_in">일반형<br>15P</span> -->
										</td>
										<td rowspan="2">
											<!-- <span class="hp_img"></span><span class="hp_in">일반형<br>15P</span> -->
										</td>
										<td rowspan="2">

										</td>
									</tr>
									<tr class="on">
										<td>회계사</td>
										<td>02-517-8333</td>
										<td>박미영<span class="f_12">(부사장)</span></td>
										<td>bbb_bbb@hanmail.net</td>
									</tr>
									<tr>
										<td class="center" rowspan="2">
											<div class="com-check">
												<input type="checkbox" name="td-check-2" id="td-check-2">
												<label for="td-check-2"></label>
											</div>
										</td>
										<td>성현회계법이 서울본사</td>
										<td>서울 강남구 테헤란로 508 해성2...</td><!--2-->
										<td>총무</td>
										<td>010-2066-0000</td>
										<td rowspan="2">
											<!-- <span class="hp_img"></span><span class="hp_in">일반형<br>15P</span> -->
										</td>
										<td rowspan="2">
											<!-- <span class="hp_img"></span><span class="hp_in">일반형<br>15P</span> -->
										</td>
										<td rowspan="2">
											<!-- <span class="hp_img"></span><span class="hp_in">일반형<br>15P</span> -->
										</td>
										<td rowspan="2">

										</td>
									</tr>
									<tr>
										<td>회계사</td>
										<td>02-517-8333</td>
										<td>박미영<span class="f_12">(부사장)</span></td>
										<td>bbb_bbb@hanmail.net</td>
									</tr>
									<tr>
										<td class="center" rowspan="2">
											<div class="com-check">
												<input type="checkbox" name="td-check-3" id="td-check-3">
												<label for="td-check-3"></label>
											</div>
										</td>
										<td>성현회계법이 서울본사</td>
										<td>서울 강남구 테헤란로 508 해성2...</td><!--2-->
										<td>총무</td>
										<td>010-2066-0000</td>
										<td rowspan="2">
											<!-- <span class="hp_img"></span><span class="hp_in">일반형<br>15P</span> -->
										</td>
										<td rowspan="2">
											<!-- <span class="hp_img"></span><span class="hp_in">일반형<br>15P</span> -->
										</td>
										<td rowspan="2">
											<!-- <span class="hp_img"></span><span class="hp_in">일반형<br>15P</span> -->
										</td>
										<td rowspan="2">

										</td>
									</tr>
									<tr>
										<td>회계사</td>
										<td>02-517-8333</td>
										<td>박미영<span class="f_12">(부사장)</span></td>
										<td>bbb_bbb@hanmail.net</td>
									</tr>
									<tr>
										<td class="center" rowspan="2">
											<div class="com-check">
												<input type="checkbox" name="td-check-4" id="td-check-4">
												<label for="td-check-4"></label>
											</div>
										</td>
										<td>성현회계법이 서울본사</td>
										<td>서울 강남구 테헤란로 508 해성2...</td><!--2-->
										<td>총무</td>
										<td>010-2066-0000</td>
										<td rowspan="2">
											<!-- <span class="hp_img"></span><span class="hp_in">일반형<br>15P</span> -->
										</td>
										<td rowspan="2">
											<!-- <span class="hp_img"></span><span class="hp_in">일반형<br>15P</span> -->
										</td>
										<td rowspan="2">
											<!-- <span class="hp_img"></span><span class="hp_in">일반형<br>15P</span> -->
										</td>
										<td rowspan="2">

										</td>
									</tr>
									<tr>
										<td>회계사</td>
										<td>02-517-8333</td>
										<td>박미영<span class="f_12">(부사장)</span></td>
										<td>bbb_bbb@hanmail.net</td>
									</tr>
									<tr>
										<td class="center" rowspan="2">
											<div class="com-check">
												<input type="checkbox" name="td-check-5" id="td-check-5">
												<label for="td-check-5"></label>
											</div>
										</td>
										<td>성현회계법이 서울본사</td>
										<td>서울 강남구 테헤란로 508 해성2...</td><!--2-->
										<td>총무</td>
										<td>010-2066-0000</td>
										<td rowspan="2">
											<!-- <span class="hp_img"></span><span class="hp_in">일반형<br>15P</span> -->
										</td>
										<td rowspan="2">
											<!-- <span class="hp_img"></span><span class="hp_in">일반형<br>15P</span> -->
										</td>
										<td rowspan="2">
											<!-- <span class="hp_img"></span><span class="hp_in">일반형<br>15P</span> -->
										</td>
										<td rowspan="2">

										</td>
									</tr>
									<tr>
										<td>회계사</td>
										<td>02-517-8333</td>
										<td>박미영<span class="f_12">(부사장)</span></td>
										<td>bbb_bbb@hanmail.net</td>
									</tr>
								<!--6~10-->
									<tr>
										<td class="center" rowspan="2">
											<div class="com-check">
												<input type="checkbox" name="td-check-6" id="td-check-6">
												<label for="td-check-6"></label>
											</div>
										</td>
										<td>성현회계법이 서울본사</td>
										<td>서울 강남구 테헤란로 508 해성2...</td><!--2-->
										<td>총무</td>
										<td>010-2066-0000</td>
										<td rowspan="2">
											<!-- <span class="hp_img"></span><span class="hp_in">일반형<br>15P</span> -->
										</td>
										<td rowspan="2">
											<!-- <span class="hp_img"></span><span class="hp_in">일반형<br>15P</span> -->
										</td>
										<td rowspan="2">
											<!-- <span class="hp_img"></span><span class="hp_in">일반형<br>15P</span> -->
										</td>
										<td rowspan="2">

										</td>
									</tr>
									<tr>
										<td>회계사</td>
										<td>02-517-8333</td>
										<td>박미영<span class="f_12">(부사장)</span></td>
										<td>bbb_bbb@hanmail.net</td>
									</tr>

									<tr>
										<td class="center" rowspan="2">
											<div class="com-check">
												<input type="checkbox" name="td-check-7" id="td-check-7">
												<label for="td-check-7"></label>
											</div>
										</td>
										<td>성현회계법이 서울본사</td>
										<td>서울 강남구 테헤란로 508 해성2...</td><!--2-->
										<td>총무</td>
										<td>010-2066-0000</td>
										<td rowspan="2">
											<!-- <span class="hp_img"></span><span class="hp_in">일반형<br>15P</span> -->
										</td>
										<td rowspan="2">
											<!-- <span class="hp_img"></span><span class="hp_in">일반형<br>15P</span> -->
										</td>
										<td rowspan="2">
											<!-- <span class="hp_img"></span><span class="hp_in">일반형<br>15P</span> -->
										</td>
										<td rowspan="2">

										</td>
									</tr>
									<tr>
										<td>회계사</td>
										<td>02-517-8333</td>
										<td>박미영<span class="f_12">(부사장)</span></td>
										<td>bbb_bbb@hanmail.net</td>
									</tr>

									<tr>
										<td class="center" rowspan="2">
											<div class="com-check">
												<input type="checkbox" name="td-check-8" id="td-check-8">
												<label for="td-check-8"></label>
											</div>
										</td>
										<td>성현회계법이 서울본사</td>
										<td>서울 강남구 테헤란로 508 해성2...</td><!--2-->
										<td>총무</td>
										<td>010-2066-0000</td>
										<td rowspan="2">
											<!-- <span class="hp_img"></span><span class="hp_in">일반형<br>15P</span> -->
										</td>
										<td rowspan="2">
											<!-- <span class="hp_img"></span><span class="hp_in">일반형<br>15P</span> -->
										</td>
										<td rowspan="2">
											<!-- <span class="hp_img"></span><span class="hp_in">일반형<br>15P</span> -->
										</td>
										<td rowspan="2">

										</td>
									</tr>
									<tr>
										<td>회계사</td>
										<td>02-517-8333</td>
										<td>박미영<span class="f_12">(부사장)</span></td>
										<td>bbb_bbb@hanmail.net</td>
									</tr>

									<tr>
										<td class="center" rowspan="2">
											<div class="com-check">
												<input type="checkbox" name="td-check-9" id="td-check-9">
												<label for="td-check-9"></label>
											</div>
										</td>
										<td>성현회계법이 서울본사</td>
										<td>서울 강남구 테헤란로 508 해성2...</td><!--2-->
										<td>총무</td>
										<td>010-2066-0000</td>
										<td rowspan="2">
											<!-- <span class="hp_img"></span><span class="hp_in">일반형<br>15P</span> -->
										</td>
										<td rowspan="2">
											<!-- <span class="hp_img"></span><span class="hp_in">일반형<br>15P</span> -->
										</td>
										<td rowspan="2">
											<!-- <span class="hp_img"></span><span class="hp_in">일반형<br>15P</span> -->
										</td>
										<td rowspan="2">

										</td>
									</tr>
									<tr>
										<td>회계사</td>
										<td>02-517-8333</td>
										<td>박미영<span class="f_12">(부사장)</span></td>
										<td>bbb_bbb@hanmail.net</td>
									</tr>
									
									<tr>
										<td class="center" rowspan="2">
											<div class="com-check">
												<input type="checkbox" name="td-check-10" id="td-check-10">
												<label for="td-check-10"></label>
											</div>
										</td>
										<td>성현회계법이 서울본사</td>
										<td>서울 강남구 테헤란로 508 해성2...</td><!--2-->
										<td>총무</td>
										<td>010-2066-0000</td>
										<td rowspan="2">
											<!-- <span class="hp_img"></span><span class="hp_in">일반형<br>15P</span> -->
										</td>
										<td rowspan="2">
											<!-- <span class="hp_img"></span><span class="hp_in">일반형<br>15P</span> -->
										</td>
										<td rowspan="2">
											<!-- <span class="hp_img"></span><span class="hp_in">일반형<br>15P</span> -->
										</td>
										<td rowspan="2">

										</td>
									</tr>
									<tr>
										<td>회계사</td>
										<td>02-517-8333</td>
										<td>박미영<span class="f_12">(부사장)</span></td>
										<td>bbb_bbb@hanmail.net</td>
									</tr>

									<!--11~16-->
									<tr>
										<td class="center" rowspan="2">
											<div class="com-check">
												<input type="checkbox" name="td-check-11" id="td-check-11">
												<label for="td-check-11"></label>
											</div>
										</td>
										<td>성현회계법이 서울본사</td>
										<td>서울 강남구 테헤란로 508 해성2...</td><!--2-->
										<td>총무</td>
										<td>010-2066-0000</td>
										<td rowspan="2">
											<!-- <span class="hp_img"></span><span class="hp_in">일반형<br>15P</span> -->
										</td>
										<td rowspan="2">
											<!-- <span class="hp_img"></span><span class="hp_in">일반형<br>15P</span> -->
										</td>
										<td rowspan="2">
											<!-- <span class="hp_img"></span><span class="hp_in">일반형<br>15P</span> -->
										</td>
										<td rowspan="2">

										</td>
									</tr>
									<tr>
										<td>회계사</td>
										<td>02-517-8333</td>
										<td>박미영<span class="f_12">(부사장)</span></td>
										<td>bbb_bbb@hanmail.net</td>
									</tr>
									<tr>
										<td class="center" rowspan="2">
											<div class="com-check">
												<input type="checkbox" name="td-check-12" id="td-check-12">
												<label for="td-check-12"></label>
											</div>
										</td>
										<td>성현회계법이 서울본사</td>
										<td>서울 강남구 테헤란로 508 해성2...</td><!--2-->
										<td>총무</td>
										<td>010-2066-0000</td>
										<td rowspan="2">
											<!-- <span class="hp_img"></span><span class="hp_in">일반형<br>15P</span> -->
										</td>
										<td rowspan="2">
											<!-- <span class="hp_img"></span><span class="hp_in">일반형<br>15P</span> -->
										</td>
										<td rowspan="2">
											<!-- <span class="hp_img"></span><span class="hp_in">일반형<br>15P</span> -->
										</td>
										<td rowspan="2">

										</td>
									</tr>
									<tr>
										<td>회계사</td>
										<td>02-517-8333</td>
										<td>박미영<span class="f_12">(부사장)</span></td>
										<td>bbb_bbb@hanmail.net</td>
									</tr>

									<tr>
										<td class="center" rowspan="2">
											<div class="com-check">
												<input type="checkbox" name="td-check-13" id="td-check-13">
												<label for="td-check-13"></label>
											</div>
										</td>
										<td>성현회계법이 서울본사</td>
										<td>서울 강남구 테헤란로 508 해성2...</td><!--2-->
										<td>총무</td>
										<td>010-2066-0000</td>
										<td rowspan="2">
											<!-- <span class="hp_img"></span><span class="hp_in">일반형<br>15P</span> -->
										</td>
										<td rowspan="2">
											<!-- <span class="hp_img"></span><span class="hp_in">일반형<br>15P</span> -->
										</td>
										<td rowspan="2">
											<!-- <span class="hp_img"></span><span class="hp_in">일반형<br>15P</span> -->
										</td>
										<td rowspan="2">

										</td>
									</tr>
									<tr>
										<td>회계사</td>
										<td>02-517-8333</td>
										<td>박미영<span class="f_12">(부사장)</span></td>
										<td>bbb_bbb@hanmail.net</td>
									</tr>
									<tr>
										<td class="center" rowspan="2">
											<div class="com-check">
												<input type="checkbox" name="td-check-14" id="td-check-14">
												<label for="td-check-14"></label>
											</div>
										</td>
										<td>성현회계법이 서울본사</td>
										<td>서울 강남구 테헤란로 508 해성2...</td><!--2-->
										<td>총무</td>
										<td>010-2066-0000</td>
										<td rowspan="2">
											<!-- <span class="hp_img"></span><span class="hp_in">일반형<br>15P</span> -->
										</td>
										<td rowspan="2">
											<!-- <span class="hp_img"></span><span class="hp_in">일반형<br>15P</span> -->
										</td>
										<td rowspan="2">
											<!-- <span class="hp_img"></span><span class="hp_in">일반형<br>15P</span> -->
										</td>
										<td rowspan="2">

										</td>
									</tr>
									<tr>
										<td>회계사</td>
										<td>02-517-8333</td>
										<td>박미영<span class="f_12">(부사장)</span></td>
										<td>bbb_bbb@hanmail.net</td>
									</tr>
									<tr>
										<td class="center" rowspan="2">
											<div class="com-check">
												<input type="checkbox" name="td-check-15" id="td-check-15">
												<label for="td-check-15"></label>
											</div>
										</td>
										<td>성현회계법이 서울본사</td>
										<td>서울 강남구 테헤란로 508 해성2...</td><!--2-->
										<td>총무</td>
										<td>010-2066-0000</td>
										<td rowspan="2">
											<!-- <span class="hp_img"></span><span class="hp_in">일반형<br>15P</span> -->
										</td>
										<td rowspan="2">
											<!-- <span class="hp_img"></span><span class="hp_in">일반형<br>15P</span> -->
										</td>
										<td rowspan="2">
											<!-- <span class="hp_img"></span><span class="hp_in">일반형<br>15P</span> -->
										</td>
										<td rowspan="2">

										</td>
									</tr>
									<tr>
										<td>회계사</td>
										<td>02-517-8333</td>
										<td>박미영<span class="f_12">(부사장)</span></td>
										<td>bbb_bbb@hanmail.net</td>
									</tr>
									<tr>
										<td class="center" rowspan="2">
											<div class="com-check">
												<input type="checkbox" name="td-check-16" id="td-check-16">
												<label for="td-check-16"></label>
											</div>
										</td>
										<td>성현회계법이 서울본사</td>
										<td>서울 강남구 테헤란로 508 해성2...</td><!--2-->
										<td>총무</td>
										<td>010-2066-0000</td>
										<td rowspan="2">
											<!-- <span class="hp_img"></span><span class="hp_in">일반형<br>15P</span> -->
										</td>
										<td rowspan="2">
											<!-- <span class="hp_img"></span><span class="hp_in">일반형<br>15P</span> -->
										</td>
										<td rowspan="2">
											<!-- <span class="hp_img"></span><span class="hp_in">일반형<br>15P</span> -->
										</td>
										<td rowspan="2">

										</td>
									</tr>
									<tr>
										<td>회계사</td>
										<td>02-517-8333</td>
										<td>박미영<span class="f_12">(부사장)</span></td>
										<td>bbb_bbb@hanmail.net</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
					<div class="bottom-paging-box">
						<div class="com-paging">
							<button type="button" class="prev-btn"><span class="blind">이전</span></button>
							<button type="button" class="on">1</button>
							<button type="button">2</button>
							<button type="button">3</button>
							<button type="button">4</button>
							<button type="button">5</button>
							<button type="button" class="next-btn"><span class="blind">다음</span></button>
						</div>
						<div class="upload-btn-item">
							<button type="button" class="upload-btn"></button>
							<div class="com-radio-select">
								<button type="button" class="open-btn">엑셀</button>
								<ul class="check-list">
									<li>
										<input type="radio" name="bottom-radio-1" id="bottom-radio-1-1" checked>
										<label for="bottom-radio-1-1">엑셀</label>
									</li>
									<li>
										<input type="radio" name="bottom-radio-1" id="bottom-radio-1-2">
										<label for="bottom-radio-1-2">워드</label>
									</li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>

</html>
