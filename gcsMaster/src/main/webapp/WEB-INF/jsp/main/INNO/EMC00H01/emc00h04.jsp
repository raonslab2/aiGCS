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
					<span class="location">타깃 세일즈 / <strong>경로예약</strong></span>
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
						<div class="top-info-item">
							<span class="info">
								<span class="tit">당월찜수</span>
								<span class="num">20</span>
							</span>
							<span class="info">
								<span class="tit">잔여찜수</span>
								<span class="num blue">20</span>
							</span>
							<span class="info">
								<span class="tit">보너스찜수</span>
								<span class="num blue">5</span>
							</span>
						</div>
						<div class="select-item">
							<div class="round-wrap">
								<div class="day-select">
									<button type="button" class="left-btn"></button>
									<!-- <span class="day">
										<input type="text" value="06.24 금" readonly class="com-calendar">
										<span class="ic">~</span>
										<input type="text" value="06.24 금" readonly class="com-calendar">
									</span> -->
									<span id="date_box_info" class="day"></span>
									<button type="button" class="right-btn"></button>
								</div>
								<div class="location-select si-type">
									<div class="com-radio-select">
										<button type="button" class="open-btn">서울</button>
										<ul class="check-list">
											<li>
												<input type="radio" name="location-radio" id="location-radio-1" checked>
												<label for="location-radio-1">서울</label>
											</li>
											<li>
												<input type="radio" name="location-radio" id="location-radio-2">
												<label for="location-radio-2">경기</label>
											</li>
											<li>
												<input type="radio" name="location-radio" id="location-radio-3">
												<label for="location-radio-3">인천</label>
											</li>
											<li>
												<input type="radio" name="location-radio" id="location-radio-4">
												<label for="location-radio-4">세종</label>
											</li>
											<li>
												<input type="radio" name="location-radio" id="location-radio-5">
												<label for="location-radio-5">대전</label>
											</li>
											<li>
												<input type="radio" name="location-radio" id="location-radio-6">
												<label for="location-radio-6">충남</label>
											</li>
											<li>
												<input type="radio" name="location-radio" id="location-radio-7">
												<label for="location-radio-7">충북</label>
											</li>
											<li>
												<input type="radio" name="location-radio" id="location-radio-8">
												<label for="location-radio-8">강원</label>
											</li>
											<li>
												<input type="radio" name="location-radio" id="location-radio-9">
												<label for="location-radio-9">경남</label>
											</li>
											<li>
												<input type="radio" name="location-radio" id="location-radio-10">
												<label for="location-radio-10">경북</label>
											</li>
											<li>
												<input type="radio" name="location-radio" id="location-radio-11">
												<label for="location-radio-11">대구</label>
											</li>
											<li>
												<input type="radio" name="location-radio" id="location-radio-12">
												<label for="location-radio-12">울산</label>
											</li>
											<li>
												<input type="radio" name="location-radio" id="location-radio-12">
												<label for="location-radio-13">광주</label>
											</li>
											<li>
												<input type="radio" name="location-radio" id="location-radio-13">
												<label for="location-radio-13">전남</label>
											</li>
											<li>
												<input type="radio" name="location-radio" id="location-radio-14">
												<label for="location-radio-14">전북</label>
											</li>
											<li>
												<input type="radio" name="location-radio" id="location-radio-15">
												<label for="location-radio-15">부산</label>
											</li>
											<li>
												<input type="radio" name="location-radio" id="location-radio-16">
												<label for="location-radio-16">제주</label>
											</li>
										</ul>
									</div>
								</div>
								<div class="location-select si-type">
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
								<div class="location-select si-type2">
									<div class="com-radio-select">
										<button type="button" class="open-btn">행정구역</button>
										<ul class="check-list">
											<li>
												<input type="radio" name="gu2-radio" id="gu2-radio-1" checked>
												<label for="gu2-radio-1">강동구</label>
											</li>
											<li>
												<input type="radio" name="gu2-radio" id="gu2-radio-2">
												<label for="gu2-radio-2">송파구</label>
											</li>
											<li>
												<input type="radio" name="gu2-radio" id="gu2-radio-3">
												<label for="gu2-radio-3">강남구</label>
											</li>
										</ul>
									</div>
								</div>
							</div>
						</div>
						<div class="sort-info-item">
							<div class="icon-info">
								<span class="all">전체</span>
								<span class="today">오늘</span>
								<span class="tomorrow">내일</span>
							</div>
							<div class="total-info">총 <span class="num">300</span>건</div>
						</div>
						<div class="com-list-info">
							<ul class="list">
								<li class="on"><!-- 활성화 클래스 on// -->
									<div class="txt-info wide-type">
										<div class="title">
											<span class="company">이노매니지먼트</span>
											<span class="name">이창호(45세/남) 광고기획</span>
											<span class="address">압구정로48길 34 삼주빌딩 501호</span>
										</div>
										<ul class="dot-list">
											<li class="red">09:00~10:00  지우회계법인</li>
											<li class="green">13:00~14:00  하나은행 압구정금융센터지점</li>
											<li class="blue">16:00~17:00  경영가이드맵</li>
											<li class="purple">18:00~19:00  경영가이드맵</li>
										</ul>
									</div>
								</li>
								<li>
									<div class="txt-info wide-type">
										<div class="title">
											<span class="company">이노매니지먼트</span>
											<span class="name">이창호(45세/남) 광고기획</span>
											<span class="address">압구정로48길 34 삼주빌딩 501호</span>
										</div>
										<ul class="dot-list">
											<li class="red">09:00~10:00  지우회계법인</li>
										</ul>
									</div>
								</li>
								<li>
									<div class="txt-info wide-type">
										<div class="title">
											<span class="company">이노매니지먼트</span>
											<span class="name">이창호(45세/남) 광고기획</span>
											<span class="address">압구정로48길 34 삼주빌딩 501호</span>
										</div>
										<ul class="dot-list">
											<li class="blue">16:00~17:00  경영가이드맵</li>
											<li class="purple">18:00~19:00  경영가이드맵</li>
										</ul>
									</div>
								</li>
								<li>
									<div class="txt-info wide-type">
										<div class="title">
											<span class="company">이노매니지먼트</span>
											<span class="name">이창호(45세/남) 광고기획</span>
											<span class="address">압구정로48길 34 삼주빌딩 501호</span>
										</div>
										<ul class="dot-list">
											<li class="red">09:00~10:00  지우회계법인</li>
										</ul>
									</div>
								</li>
								<li>
									<div class="txt-info wide-type">
										<div class="title">
											<span class="company">이노매니지먼트</span>
											<span class="name">이창호(45세/남) 광고기획</span>
											<span class="address">압구정로48길 34 삼주빌딩 501호</span>
										</div>
										<ul class="dot-list">
											<li class="blue">16:00~17:00  경영가이드맵</li>
											<li class="purple">18:00~19:00  경영가이드맵</li>
										</ul>
									</div>
								</li>
								<li>
									<div class="txt-info wide-type">
										<div class="title">
											<span class="company">이노매니지먼트</span>
											<span class="name">이창호(45세/남) 광고기획</span>
											<span class="address">압구정로48길 34 삼주빌딩 501호</span>
										</div>
										<ul class="dot-list">
											<li class="red">09:00~10:00  지우회계법인</li>
										</ul>
									</div>
								</li>
								<li>
									<div class="txt-info wide-type">
										<div class="title">
											<span class="company">이노매니지먼트</span>
											<span class="name">이창호(45세/남) 광고기획</span>
											<span class="address">압구정로48길 34 삼주빌딩 501호</span>
										</div>
										<ul class="dot-list">
											<li class="blue">16:00~17:00  경영가이드맵</li>
											<li class="purple">18:00~19:00  경영가이드맵</li>
										</ul>
									</div>
								</li>
								<li>
									<div class="txt-info wide-type">
										<div class="title">
											<span class="company">이노매니지먼트</span>
											<span class="name">이창호(45세/남) 광고기획</span>
											<span class="address">압구정로48길 34 삼주빌딩 501호</span>
										</div>
										<ul class="dot-list">
											<li class="red">09:00~10:00  지우회계법인</li>
										</ul>
									</div>
								</li>
								<li>
									<div class="txt-info wide-type">
										<div class="title">
											<span class="company">이노매니지먼트</span>
											<span class="name">이창호(45세/남) 광고기획</span>
											<span class="address">압구정로48길 34 삼주빌딩 501호</span>
										</div>
										<ul class="dot-list">
											<li class="blue">16:00~17:00  경영가이드맵</li>
											<li class="purple">18:00~19:00  경영가이드맵</li>
										</ul>
									</div>
								</li>
								<li>
									<div class="txt-info wide-type">
										<div class="title">
											<span class="company">이노매니지먼트</span>
											<span class="name">이창호(45세/남) 광고기획</span>
											<span class="address">압구정로48길 34 삼주빌딩 501호</span>
										</div>
										<ul class="dot-list">
											<li class="red">09:00~10:00  지우회계법인</li>
										</ul>
									</div>
								</li>
							</ul>
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
					<div class="map-box">
						<!-- 맵 영역 -->
						<div class="temp-img"></div>
					</div>
				</div>
				
			</div>
		</div>
	</div>
	<!-- 레이어 팝업 : 방문예약 등록 -->
	<div class="layer-pop info-type" data-index="1">
		<div class="pop-container">
			<div class="top-info-content">
				<span class="title">방문예약 등록</span>
				<button type="button" class="close-btn" onclick="$(this).closest('.layer-pop').hide();"><span class="blind">팝업 닫기</span></button>
			</div>
			<div class="pop-content">
				<ul class="info-list-box">
					<li>
						<span class="tit">회사명</span>
						<div class="detail-info">
							<span class="txt">에스케이데브코솔라파워플랜트</span>
						</div>
					</li>
					<li>
						<span class="tit">업종</span>
						<div class="detail-info">
							<span class="txt">태양광 발전(PV)자산 개발</span>
						</div>
					</li>
					<li>
						<span class="tit">면담자</span>
						<div class="detail-info">
							<span class="txt">카린알렉상드라파트리시아부토나 (45세/남) </span>
						</div>
					</li>
					<li>
						<span class="tit">방문일시</span>
						<div class="detail-info">
							<div class="input-calendar">
								<input type="text" value="06.24 (목) 13 : 00 ~ 14:00">
							</div>
						</div>
					</li>
					<li>
						<span class="tit">타업종<br>예약</span>
						<div class="detail-info">
							<span class="txt">
								06.24 (목) 10:00 ~ 11:00<br>
								06.24 (목) 16:00 ~ 17:00<br>
								06.25 (금) 09:00 ~ 10:00<br>
								06.25 (금) 13:00 ~ 14:00
							</span>
						</div>
					</li>
				</ul>
				<div class="bottom-btn-area">
					<button type="button" class="cancel-btn" onclick="$(this).closest('.layer-pop').hide();">취소</button>
					<button type="button" class="confirm-btn">등록</button>
				</div>
			</div>
		</div>
	</div>

	<!-- 레이어 팝업 : 방문예약 변경 -->
	<div class="layer-pop info-type" data-index="2">
		<div class="pop-container">
			<div class="top-info-content">
				<span class="title">방문예약 변경</span>
				<button type="button" class="close-btn" onclick="$(this).closest('.layer-pop').hide();"><span class="blind">팝업 닫기</span></button>
			</div>
			<div class="pop-content">
				<ul class="info-list-box">
					<li>
						<span class="tit">회사명</span>
						<div class="detail-info">
							<span class="txt">에스케이데브코솔라파워플랜트</span>
						</div>
					</li>
					<li>
						<span class="tit">업종</span>
						<div class="detail-info">
							<span class="txt">태양광 발전(PV)자산 개발</span>
						</div>
					</li>
					<li>
						<span class="tit">면담자</span>
						<div class="detail-info">
							<span class="txt">카린알렉상드라파트리시아부토나 (45세/남) </span>
						</div>
					</li>
					<li>
						<span class="tit">방문일시</span>
						<div class="detail-info">
							<div class="input-calendar">
								<input type="text" value="06.24 (목) 13 : 00 ~ 14:00">
							</div>
						</div>
					</li>
					<li>
						<span class="tit">타업종<br>예약</span>
						<div class="detail-info">
							<span class="txt">
								06.24 (목) 10:00 ~ 11:00<br>
								06.24 (목) 16:00 ~ 17:00<br>
								06.25 (금) 09:00 ~ 10:00<br>
								06.25 (금) 13:00 ~ 14:00
							</span>
						</div>
					</li>
				</ul>
				<div class="bottom-btn-area">
					<button type="button" class="cancel-btn" onclick="$(this).closest('.layer-pop').hide();">취소</button>
					<button type="button" class="confirm-btn">등록</button>
				</div>
			</div>
		</div>
	</div>   
</body>

</html>
