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
          <c:import url="/EmpPageLink.do?link=main/include/innomenu" />          
		</div>
		<!-- container -->
		<div class="container">
			<div class="location-content">
				<div class="location-area">
					<span class="location">주소록관리</span>
				</div>
				<span class="logo-area">
					<img src="/inno/assets/images/logo.png" alt="지우회계법인">
				</span>
				<div class="menu-area">
					<div class="lang-box">
						<div id="lang_now">
							<img src="assets/images/flags/4x3/kr.svg">
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
				<div class="com-top-tab">
					<!-- <a href="target_company_1.html">리스트</a>
					<a href="target_company_2.html">찜리스트</a>
					<a href="target_company_3.html">경로예약</a>
					<a href="#" class="on">방문상황</a>
					<a href="target_company_21.html">업무대행</a> -->
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
								<span class="num">20</span>
							</span>
							<span class="info">
								<span class="tit">보너스찜수</span>
								<span class="num">5</span>
							</span>
						</div>
						<div class="select-item">
							<div class="round-wrap">
								<div class="day-select">
									<button type="button" class="left-btn"></button>
									<span class="day"><input type="text" value="06.24 금" readonly class="com-calendar"></span>
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
												<label for="location-radio-4">대전</label>
											</li>
											<li>
												<input type="radio" name="location-radio" id="location-radio-5">
												<label for="location-radio-5">세종</label>
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
												<label for="location-radio-8">광주</label>
											</li>
											<li>
												<input type="radio" name="location-radio" id="location-radio-9">
												<label for="location-radio-9">전남</label>
											</li>
											<li>
												<input type="radio" name="location-radio" id="location-radio-10">
												<label for="location-radio-10">전북</label>
											</li>
											<li>
												<input type="radio" name="location-radio" id="location-radio-11">
												<label for="location-radio-11">충남</label>
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
							</div>
						</div>
						<div class="sort-info-item">
							<div class="icon-info">
								<span class="all">전체</span>
								<span class="today">오늘</span>
								<span class="yesterday">하루전</span>
								<span class="before-2">이틀전</span>
								<span class="before-7">3~7일전</span>
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
										<div class="photo-info">
											<div class="round-item">
												<div class="line">
													<span class="txt">09:00~10:00  지우회계법인</span>
													<span class="round complete">계약완료</span>
												</div>
												<div class="line">
													<span class="txt">13:00~14:00  KEB하나은행365압구정KEB하나은행365압구정KEB하나은행365압구정</span>
													<span class="round interest">관심보임</span>
												</div>
												<div class="line">
													<span class="txt">16:00~17:00  경영가이드맵</span>
													<span class="round fail">방문실패</span>
												</div>
											</div>
											<div class="photo-item"  onclick="makePop();">
												<img src="/inno/assets/images/temp_photo_2.png" alt="" class="photo">
												<span class="detail">
													<span class="num">+3</span>
													<button type="button" class="more-btn"><span class="blind">더보기</span></button>
												</span>
											</div>
										</div>
									</div>
								</li>
								<li>
									<div class="txt-info wide-type">
										<div class="title">
											<span class="company">이노매니지먼트</span>
											<span class="name">이창호(45세/남) 광고기획</span>
											<span class="address">압구정로48길 34 삼주빌딩 501호</span>
										</div>
										<div class="photo-info">
											<div class="round-item">
												<div class="line">
													<span class="txt">09:00~10:00  지우회계법인</span>
													<span class="round complete">계약완료</span>
												</div>
												<div class="line">
													<span class="txt">13:00~14:00  KEB하나은행365압구정KEB하나은행365압구정KEB하나은행365압구정</span>
													<span class="round visit">재방문</span>
												</div>
											</div>
											<div class="photo-item"  onclick="makePop();">
												<img src="/inno/assets/images/temp_photo_2.png" alt="" class="photo">
												<span class="detail">
													<span class="num">+3</span>
													<button type="button" class="more-btn"><span class="blind">더보기</span></button>
												</span>
											</div>
										</div>
									</div>
								</li>
								<li>
									<div class="txt-info wide-type">
										<div class="title">
											<span class="company">이노매니지먼트</span>
											<span class="name">이창호(45세/남) 광고기획</span>
											<span class="address">압구정로48길 34 삼주빌딩 501호</span>
										</div>
										<div class="photo-info">
											<div class="round-item">
												<div class="line">
													<span class="txt">09:00~10:00  지우회계법인</span>
													<span class="round complete">계약완료</span>
												</div>
												<div class="line">
													<span class="txt">13:00~14:00  KEB하나은행365압구정KEB하나은행365압구정KEB하나은행365압구정</span>
												</div>
												<div class="line">
													<span class="txt">13:00~14:00  KEB하나은행365압구정</span>
													<span class="round fail">방문실패</span>
												</div>
											</div>
											<div class="photo-item"  onclick="makePop();">
												<img src="/inno/assets/images/temp_photo_2.png" alt="" class="photo">
												<span class="detail">
													<span class="num">+3</span>
													<button type="button" class="more-btn"><span class="blind">더보기</span></button>
												</span>
											</div>
										</div>
									</div>
								</li>
								<li>
									<div class="txt-info wide-type">
										<div class="title">
											<span class="company">이노매니지먼트</span>
											<span class="name">이창호(45세/남) 광고기획</span>
											<span class="address">압구정로48길 34 삼주빌딩 501호</span>
										</div>
										<div class="photo-info">
											<div class="round-item full">
												<div class="line">
													<span class="txt">09:00~10:00  지우회계법인</span>
													<span class="round complete">계약완료</span>
												</div>
												<div class="line">
													<span class="txt">13:00~14:00  KEB하나은행365압구정KEB하나은행365압구정KEB하나은행365압구정</span>
													<span class="round interest">관심보임</span>
												</div>
												<div class="line">
													<span class="txt">16:00~17:00  경영가이드맵</span>
													<span class="round fail">방문실패</span>
												</div>
											</div>
										</div>
									</div>
								</li>
								<li>
									<div class="txt-info wide-type">
										<div class="title">
											<span class="company">이노매니지먼트</span>
											<span class="name">이창호(45세/남) 광고기획</span>
											<span class="address">압구정로48길 34 삼주빌딩 501호</span>
										</div>
										<div class="photo-info">
											<div class="round-item">
												<div class="line">
													<span class="txt">09:00~10:00  지우회계법인</span>
													<span class="round complete">계약완료</span>
												</div>
												<div class="line">
													<span class="txt">13:00~14:00  KEB하나은행365압구정KEB하나은행365압구정KEB하나은행365압구정</span>
													<span class="round visit">재방문</span>
												</div>
											</div>
											<div class="photo-item"  onclick="makePop();">
												<img src="/inno/assets/images/temp_photo_2.png" alt="" class="photo">
												<span class="detail">
													<span class="num">+3</span>
													<button type="button" class="more-btn"><span class="blind">더보기</span></button>
												</span>
											</div>
										</div>
									</div>
								</li>
								<li>
									<div class="txt-info wide-type">
										<div class="title">
											<span class="company">이노매니지먼트</span>
											<span class="name">이창호(45세/남) 광고기획</span>
											<span class="address">압구정로48길 34 삼주빌딩 501호</span>
										</div>
										<div class="photo-info">
											<div class="round-item">
												<div class="line">
													<span class="txt">09:00~10:00  지우회계법인</span>
													<span class="round complete">계약완료</span>
												</div>
												<div class="line">
													<span class="txt">13:00~14:00  KEB하나은행365압구정KEB하나은행365압구정KEB하나은행365압구정</span>
												</div>
												<div class="line">
													<span class="txt">13:00~14:00  KEB하나은행365압구정</span>
													<span class="round fail">방문실패</span>
												</div>
											</div>
											<div class="photo-item"  onclick="makePop();">
												<img src="/inno/assets/images/temp_photo_2.png" alt="" class="photo">
												<span class="detail">
													<span class="num">+3</span>
													<button type="button" class="more-btn"><span class="blind">더보기</span></button>
												</span>
											</div>
										</div>
									</div>
								</li>
								<li>
									<div class="txt-info wide-type">
										<div class="title">
											<span class="company">이노매니지먼트</span>
											<span class="name">이창호(45세/남) 광고기획</span>
											<span class="address">압구정로48길 34 삼주빌딩 501호</span>
										</div>
										<div class="photo-info">
											<div class="round-item full">
												<div class="line">
													<span class="txt">09:00~10:00  지우회계법인</span>
													<span class="round complete">계약완료</span>
												</div>
												<div class="line">
													<span class="txt">13:00~14:00  KEB하나은행365압구정KEB하나은행365압구정KEB하나은행365압구정</span>
													<span class="round interest">관심보임</span>
												</div>
												<div class="line">
													<span class="txt">16:00~17:00  경영가이드맵</span>
													<span class="round fail">방문실패</span>
												</div>
											</div>
										</div>
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
					<div class="visit-box">
						<div class="info-area">
							<div class="photo-item">
								<div class="title">
									<span class="tit">방문포토</span>
									<span class="txt">이노매니지먼트 &lt; 지우회계법인</span>
								</div>
								<ul class="photo-list">
									<li>
										<div class="photo" onclick="makePop();">
											<img src="/inno/assets/images/temp_photo_2.png" alt="">
											<button type="button" class="more-btn"><span class="blind">더보기</span></button>
										</div>
										<div class="text">로드 뷰 / 보너스 0</div>
									</li>
									<li>
										<div class="photo" onclick="$('.layer-pop[data-index=1]').show();"></div>
										<div class="text">건물 인포 / 보너스 0</div>
									</li>
									<li>
										<div class="photo" onclick="makePop();">
											<img src="/inno/assets/images/temp_photo_2.png" alt="">
											<button type="button" class="more-btn"><span class="blind">더보기</span></button>
										</div>
										<div class="text">명함 / <strong>보너스 1+</strong></div>
									</li>
								</ul>
							</div>
							<div class="sales-item">
								<span class="title">세일즈 팁 체크</span>
								<div class="list-cnt">
									<div class="top-tab">
										<div class="tab-btn">
											<button type="button" class="on">방문가이드</button>
											<button type="button" onclick="location.href='target_company_4_3.html'">대면 상담</button>
											<button type="button">계약 성공</button>
										</div>
										<div class="action-btn">
											<button type="button" class="modify">수정</button>
											<button type="button" class="save">저장</button>
										</div>
									</div>
									<ul class="list-info">
										<li>
											<span class="num">1.</span>
											<span class="txt">교신자 사전조사</span>
											<button type="button" class="check-btn"></button>
										</li>
										<li>
											<span class="num">2.</span>
											<span class="txt">본인 명함 준비</span>
											<button type="button" class="check-btn"></button>
										</li>
										<li>
											<span class="num">3.</span>
											<span class="txt">본인 명함 준비</span>
											<button type="button" class="check-btn on"></button>
										</li>
										<li>
											<span class="num">4.</span>
											<span class="txt">본인 명함 준비</span>
											<button type="button" class="check-btn"></button>
										</li>
										<li>
											<span class="num">5.</span>
											<span class="txt">본인 명함 준비</span>
											<button type="button" class="check-btn on"></button>
										</li>
										<li>
											<span class="num">6.</span>
											<span class="txt">본인 명함 준비</span>
											<button type="button" class="check-btn"></button>
										</li>
										<li>
											<span class="num">7.</span>
											<span class="txt">본인 명함 준비</span>
											<button type="button" class="check-btn on"></button>
										</li>
										<li>
											<span class="num">8.</span>
											<span class="txt">본인 명함 준비</span>
											<button type="button" class="check-btn"></button>
										</li>
										<li>
											<span class="num">9.</span>
											<span class="txt">본인 명함 준비</span>
											<button type="button" class="check-btn on"></button>
										</li>
										<li>
											<span class="num">10.</span>
											<input type="text" class="input-txt">
											<button type="button" class="send-btn"></button>
										</li>
									</ul>
								</div>
							</div>
						</div>
						<div class="advice-area">
							<div class="top-tab-item">
								<div class="tab-btn">
									<button type="button" onclick="location.href='target_company_A.html'">비대면 상담</button>
									<button type="button" class="on">대면 상담</button>
								</div>
								<div class="action-btn">
									<div class="com-toggle">
										<input type="checkbox" name="toggle-check" id="toggle-check-1">
										<label for="toggle-check-1">팀공유</label>
									</div>
									<button type="button" onclick="location.href='target_company_4_4.html'">저장</button>
								</div>
							</div>
							<!-- 대면 상담 -->
							<div class="tab-view-item">
								<div class="text-info-cnt">
									<ul class="half-list">
										<li>
											<span class="tit">교신자</span>
											<div class="form two-type">
												<input type="text" value="강지수">
												<input type="text" value="남/37">
											</div>
											<span class="tit">상담자</span>
											<span class="txt">최다니엘 (마케팅팀/대리)</span>
										</li>
										<li>
											<span class="tit">방문결과</span>
											<div class="form full">
												<div class="select-cnt one-type">
													<select class="com-select">
														<option value="#">발신</option>
													</select>
												</div>
											</div>
										</li>
										<li>
											<span class="tit">재방문일</span>
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
											<button type="button"><span>첨부파일</span></button>
										</div>
										<!-- 글자 칼라 #666 , #338be8 , #3ea366 , #6259ca -->
										<textarea class="h-200" style="color: #6259ca;"></textarea>
										<span class="tit">이슈</span>
										<textarea class="h-70"></textarea>
										<span class="tit">결과</span>
										<textarea class="h-70"></textarea>
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
				<div class="banner-info-area">
					<!-- <button type="button" class="banner sale-type"><span>솔루션 정액제 사용기간 길~수록 절감 할인 혜택</span></button>
					<button type="button" class="banner service-type"><span>서비스 추가시 1개월 전문 가이드 무료지원</span></button> -->
				</div>
			</div>
		</div>
	</div>
	<!-- 레이어 팝업 : 방문포토 (고모리 란에 표기되는 포토올리기) -->
	<div class="layer-pop photo-upload-type" data-index="1">
		<div class="pop-container">
			<div class="top-info-content">
				<span class="title">포토 올리기</span>
				<button type="button" class="close-btn" onclick="$(this).closest('.layer-pop').hide();"><span class="blind">팝업 닫기</span></button>
			</div>
			<div class="pop-content no-padding">
				<div class="photo-upload-area">
					<div class="input-box">
						<input type="text" value="" placeholder="사진 파일 선택" value="" readonly>
						<div class="btn">
							<input type="file" name="file-btn" id="file-btn">
							<label for="file-btn"></label>
						</div>
					</div>
					<div class="list-box">
						<ul>
							<li>1. 4MB 이내 해상도 좋은 이미지 파일로 등록하세요</li>
							<li>2. 원본사진에 마우스를 드래그하여 사진 영역을 편집하세요</li>
						</ul>
					</div>
				</div>
				<div class="photo-crop-area">
					<div class="real-box">
						<span class="tit">원본사진</span>
						<div class="crop">
							<img src="/inno/assets/images/temp_crop_1.png" alt="">
						</div>
					</div>
					<span class="ic"></span>
					<div class="after-box">
						<span class="tit">수정사진</span>
						<div class="crop">
							<img src="/inno/assets/images/temp_crop_2.png" alt="">
						</div>
					</div>
				</div>
				<div class="bottom-btn-area">
					<button type="button" class="cancel-btn" onclick="$(this).closest('.layer-pop').hide();">취소</button>
					<button type="button" class="confirm-btn">등록</button>
				</div>
			</div>
		</div>
	</div>

	<!-- 레이어 팝업 : 방문포토 (리스트에 표기되는 공유 방문포토) -->
	<div class="layer-pop photo-type" data-index="2">
		<div class="pop-container">
			<div class="top-info-content">
				<span class="title">이노매니지먼트</span>
				<button type="button" class="close-btn" onclick="$(this).closest('.layer-pop').hide();"><span class="blind">팝업 닫기</span></button>
			</div>
			<div class="pop-content no-padding">
				<div class="slick-banner">
					<div class="banner">
						<span class="photo"><img src="/inno/assets/images/temp_banner_1.png" /></span>
					</div>
					<div class="banner">
						<span class="photo"><img src="/inno/assets/images/temp_banner_2.png" /></span>
					</div>
					<div class="banner">
						<span class="photo"><img src="/inno/assets/images/temp_banner_3.png" /></span>
					</div>
				</div>
				<div class="bottom-info-txt">
					<span class="tit">명함 및 인물사진</span>
					<span class="txt">건물 인포</span>
				</div>
			</div>
		</div>
	</div>  
</body>

</html>
