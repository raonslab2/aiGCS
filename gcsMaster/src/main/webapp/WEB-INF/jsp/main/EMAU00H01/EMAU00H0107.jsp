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
<title>과제접수 등록</title>
<c:import url="/EmpPageLink.do?link=main/include2/src" />

<script type="text/javascript">
	$(document).ready(function() {
		
		$("#button").click(function () {
			if (confirm("저장하시겠습니까?")) {
				var formSer = $('#form').serialize();
				console.log(formSer);
				$.post("/empo/EMAU00H01/insertEMAU00H0107.do", formSer).done(function(res){
					window.location.href = "<c:url value='/empo/EMAU00H01/EMAU00H0101.do'/>";
				}).fail(function() {
					alert("실패");
				})
			}
			else {
				return false;
			}
		});

		// 달력 입력 datepicker 설정
		$('.inputCalendar').datepicker({
			onSelect: function(formattedDate, date, inst) {
				//console.log(formattedDate);
				//console.log(date);
				//console.log(inst);
				//console.log(inst.$el.attr("id"));

				// 날짜 포맷 변경
				var newDate = formattedDate.substr(0,4) + "-" + formattedDate.substr(5,2) + "-" + formattedDate.substr(8,2) + "";
			
			}
		});	

		// 이메일 선택
		$(".sltDomain").each(function(index) {
			$(this).change(function() {
				var domain = $(this).val();
				if ($.trim(domain).length > 0) {
					$(".txtDomain").eq(index).val($(this).val());
				}
				else {
					$(".txtDomain").eq(index).val("");
				}
			});
		});

		 // 고용정보 근로자수 자동입력 
		$(".empCnt").blur(function() {

			var empSum = 0;

			$(".empCnt").each(function(index) {
				var empCnt = $(this).val();
				empCnt = empCnt.replace(/[^\d]+/g, "");

				if (!$.isNumeric(empCnt) || $.trim(empCnt).length < 1) {
					empCnt = 0;
				}

				empSum = parseInt(empSum) + parseInt(empCnt);

				if ($.isNumeric(empCnt)) {
					if (empCnt != "0") {
						empCnt = String(empCnt);
						empCnt = empCnt.replace(/\B(?=(\d{3})+(?!\d))/g, ",");
						$(".empCnt").eq(index).val(empCnt);
					}
				}

			}); 
			
			var empTotal = String(empSum);
			empTotal = empTotal.replace(/\B(?=(\d{3})+(?!\d))/g, ",");
			$(".empTotal").val(empTotal);
		});

		
		// 저장하기 버튼 클릭
		$("#formInput").submit(function () {

			if (confirm("저장하시겠습니까?")) {
				$(this).attr("action", "EMAU00H0101.do");
				//return false;
			}
			else {
				return false;
			}
		});
		
	});

	// 정보 입력 라인 추가 버튼
	function fnInfoLineAdd(name) {
		var listName = $("."+name);

		var tr = listName.find("tr:last").clone();
		tr.find("input").val("");
		tr.find("select").val("");
		listName.append(tr);	
		
		// 달력 입력 datepicker 설정
		$('.inputCalendar').datepicker({
			onSelect: function(formattedDate, date, inst) {
				//console.log(formattedDate);
				//console.log(date);
				//console.log(inst);
				//console.log(inst.$el.attr("id"));

				// 날짜 포맷 변경
				var newDate = formattedDate.substr(0,4) + "-" + formattedDate.substr(5,2) + "-" + formattedDate.substr(8,2) + "";
			}		
		});	
	};


	// 취소버튼
	function fnInputCancel() {
		alert("취소되었습니다.");
		return false;
	}

</script>

</head>

<body>
	<!-- s :wrap -->
	<div id="wrap">
		<div class="menu_guide">
			<c:import url="/EmpPageLink.do?link=main/include2/menu01" />
		</div>
		<!-- e :menu_guide -->

		<form name="form" id="form" method="post">
		<div class="contents_guide">
			
			<h4>계정정보</h4>
			
			<div class="table_guide bbs_write01">
				<table class=" table_l">
					<caption></caption>
					<colgroup>
						<col width="10%">
						<col width="23%">
						<col width="10%">
						<col width="23%">
						<col width="10%">
						<col width="%">
					</colgroup>

					<tbody>
						<tr>							
							<th scope="row">기관 ID</th>
							<td><input type="text" class="input_w80" id="buAgnId" name="buAgnId"></td>
							<th scope="row">Password</th>
							<td><input type="password" class="input_w80" id="buPw" name="buPw"></td>
							<th scope="row">Password 확인</th>
							<td><input type="password" class="input_w80" id="buPwCon" name="buPwCon"></td>
						</tr>
						<tr>							
							<th scope="row">계정관리자 성명</th>
							<td><input type="text" class="input_w80" id="buAccManName" name="buAccManName"></td>
							
							<th>이메일 주소</th>
							<td>
								<input type="text" class="input_w25 txtEmail" id="buEmAdd" name="buEmAdd">
								@
								<input type="text" class="input_w25 txtDomain" id="buEmAdd2" name="buEmAdd2">
								<select class="input_w40 sltDomain">
									<option value="">직접입력</option>
									<option value="naver.com">naver.com</option>
									<option value="gmail.com">gmail.com</option>
									<option value="daum.net">daum.net</option>
								</select>
							</td>
							<th>휴대 전화번호</th>
							<td>
								<select style="width:80px;" id="buMobPhoNum" name="buMobPhoNum">
									<option value="010">010</option>
									<option value="011">011</option>
									<option value="016">016</option>
								</select>
								-
								<input type="text" style="width:70px;" id="buMobPhoNum2" name="buMobPhoNum2">
								-
								<input type="text" style="width:70px;" id="buMobPhoNum3" name="buMobPhoNum3">
								<!-- <button type="button" class="btn_style02 btn_green">인증</button> -->
							</td>
						</tr>
					</tbody>
				</table>
			</div>
			<!-- e :bbs_write01 -->
			
			<h4>기본정보</h4>
			
			<div class="table_guide bbs_write01">
				<table class=" table_l">
					<caption></caption>
					<colgroup>
						<col width="8%">
						<col width="17%">
						<col width="8%">
						<col width="17%">
						<col width="8%">
						<col width="17%">
						<col width="8%">
						<col width="17%">
					</colgroup>

					<tbody>
						<tr>							
							<th scope="row">사업자등록번호</th>
							<td colspan="3"><input type="text" style="width:250px;" id="buComRegNum" name="buComRegNum"></td>
							<th scope="row">법인등록번호</th>
							<td colspan="3">
								<input type="text" style="width:250px;" id="buCorRegNum" name="buCorRegNum">
							</td>
						</tr>

						<tr>							
							<th scope="row">기관명</th>
							<td><input type="text" class="input_w80" id="buOrgName" name="buOrgName"></td>
							<th scope="row">기업형태</th>
							<td colspan="3">								
								<label><input type="radio" class="buCorType" name="buCorType" value="4"> 개인기업</label>
								<label><input type="radio" class="buCorType" name="buCorType" value="3"> 일반법인기업</label>
								<label><input type="radio" class="buCorType" name="buCorType" value="2"> 외감법인기업</label>
								<label><input type="radio" class="buCorType" name="buCorType" value="1"> 기타</label>
							</td>	
							<th scope="row">설립년월일</th>
							<td><input type="text" class="inputCalendar" id="buDateEst" name="buDateEst"></td>
						</tr>

						<tr>						
							<th scope="row">업종구분</th>
							<td><input type="text" class="input_w80" id="buIndCla" name="buIndCla"></td>			
							<th scope="row">주생상품(납품처)</th>
							<td colspan="3"><input type="text" class="input_w80" id="buMainPro" name="buMainPro"></td>	
							<th scope="row">홈페이지</th>
							<td>http:// <input type="text" class="input_w60" id="buHomePage" name="buHomePage"></td>
						</tr>

						<tr>							
							<th scope="row">본사 주소</th>
							<td colspan="3">
								<input type="text" class="input_w70" id="buHeaAdd" name="buHeaAdd">
								&nbsp;&nbsp;&nbsp;
								<label><input type="radio" class="buHeaAdd2" name="buHeaAdd2" value="1"> 자가</label>
								<label><input type="radio" class="buHeaAdd2" name="buHeaAdd2" value="0"> 임대</label>
							</td>
							<th scope="row">주사업장 주소</th>
							<td colspan="3">
								<input type="text" class="input_w70" id="buMainBusAdd" name="buMainBusAdd">
								&nbsp;&nbsp;&nbsp;
								<label><input type="radio" class="buMainBusAdd2" name="buMainBusAdd2"value="1"> 자가</label>
								<label><input type="radio" class="buMainBusAdd2" name="buMainBusAdd2"value="0"> 임대</label>
							</td>
						</tr>
						<tr>							
							<th scope="row">본사 면적</th>
							<td colspan="3">
								<input type="text" style="width:120px;" id="buHeaArea" name="buHeaArea">
								&nbsp;&nbsp;&nbsp;
								<label><input type="radio" class="buHeaArea2" name="buHeaArea2" value="1"> ㎡</label>
								<label><input type="radio" class="buHeaArea2" name="buHeaArea2" value="0"> 평</label>
							</td>
							<th scope="row">주사업장 면적</th>
							<td colspan="3">
								<input type="text" style="width:120px;" id="buMainBusArea" name="buMainBusArea">
								&nbsp;&nbsp;&nbsp;
								<label><input type="radio" class="buMainBusArea2" name="buMainBusArea2" value="1"> ㎡</label>
								<label><input type="radio" class="buMainBusArea2" name="buMainBusArea2" value="0"> 평</label>
							</td>
						</tr>
						<tr>							
							<th scope="row">본사 보증금</th>
							<td><input type="text" style="width:120px;" id="buHeaOffDep" name="buHeaOffDep"></td>
							<th scope="row">본사 월세</th>
							<td><input type="text" style="width:120px;" id="buHeaOffMonRent" name="buHeaOffMonRent"></td>	
							<th scope="row">주사업장 보증금</th>
							<td><input type="text" style="width:120px;" id="buMainBusDep" name="buMainBusDep"></td>
							<th scope="row">주사업장 월세</th>
							<td><input type="text" style="width:120px;" id="buMainBusMonRent" name="buMainBusMonRent"></td>
						</tr>
					</tbody>
				</table>
			</div>
			<!-- e :bbs_write01 -->
			
			
			<h4>고용정보</h4>
			
			<div class="table_guide bbs_write01">
				<table class=" table_l">
					<caption></caption>
					<colgroup>
						<col width="%">
						<col width="%">
						<col width="%">
						<col width="%">
						<col width="%">
						<col width="%">
					</colgroup>

					<tbody>
						<tr>							
							<th scope="row" rowspan="3">상시 근로자수</th>
							<td rowspan="3"><input type="text" style="width:100px;" class="empTotal" id="buNumFtWor" name="buNumFtWor"> 명 (자동입력)</td>
							<!-- (자동입력) -->
							<th scope="row">사무직 근로자수</th>
							<td>
								<input type="text" style="width:100px;" class="empCnt" id="buNumOffWor" name="buNumOffWor"> 명
							</td>
							<th scope="row">기술직 중 연구소 연구원 근로자수</th>
							<td>
								<input type="text" style="width:100px;" class="empCnt" id="buNumLabWor" name="buNumLabWor"> 명
							</td>
						</tr>
						<tr>	
							<th scope="row" class="leftBorder">기능직 근로자수</th>
							<td>
								<input type="text" style="width:100px;" class="empCnt" id="buNumSkiWor" name="buNumSkiWor"> 명
							</td>
							<th scope="row">기술직 중 일반 기술직 근로자수</th>
							<td>
								<input type="text" style="width:100px;" class="empCnt" id="buNumTecWor" name="buNumTecWor"> 명
							</td>
						</tr>
						<tr>	
							<th scope="row" class="leftBorder">기타</th>
							<td colspan="3">
								<input type="text" style="width:100px;" class="empCnt" id="buOther" name="buOther"> 명
							</td>
						</tr>
					</tbody>
				</table>
			</div>
			<!-- e :bbs_write01 -->
			

				<h4>대표자 정보</h4>
			
			<div class="table_guide bbs_write01">
				<table class=" table_l">
					<caption></caption>
					<colgroup>
						<col width="10%">
						<col width="23%">
						<col width="15%">
						<col width="%">
					</colgroup>

					<tbody>
						<tr>							
							<th scope="row">성명</th>
							<td><input type="text" class="input_w80" id="buName" name="buName"></td>
							<th scope="row">생년월일</th>
							<td><input type="text" class="inputCalendar" id="buDateBir" name="buDateBir"></td>
						</tr>
						<tr>							
							<th scope="row">전화번호</th>
							<td><input type="text" class="input_w80" id="buPhoNum" name="buPhoNum"></td>
							
							<th>이메일 주소</th>
							<td>
								<input type="text" class="input_w25 txtEmail" id="buEmAdd3" name="buEmAdd3">
								@
								<input type="text" class="input_w25 txtDomain" id="buEmAdd4" name="buEmAdd4">
								<select class="input_w40 sltDomain">
									<option value="">직접입력</option>
									<option value="naver.com">naver.com</option>
									<option value="daum.net">daum.net</option>
								</select>
							</td>
						</tr>
						<tr>							
							<th scope="row">팩스번호</th>
							<td><input type="text" class="input_w80" id="buFaxNum" name="buFaxNum"></td>					
							<th>휴대 전화번호</th>
							<td>
								<select style="width:80px;" id="buMobPhoNum4" name="buMobPhoNum4">
									<option value="">010</option>
								</select>
								-
								<input type="text" style="width:70px;" id="buMobPhoNum5" name="buMobPhoNum5">
								-
								<input type="text" style="width:70px;" id="buMobPhoNum6" name="buMobPhoNum6">
							</td>
						</tr>
					</tbody>
				</table>
			</div>
			<!-- e :bbs_write01 -->

			
			<h4>주주 정보</h4>
			<div class="table_guide bbs_write01">
				<table>
				  <caption></caption>
				  <colgroup>
						<col width="%">
						<col width="20%">
						<col width="20%">
						<col width="20%">
						<col width="20%">
				  </colgroup>
				  <thead>
					<tr>
						<th rowspan="2">주주명</th>
						<th rowspan="2">실제 경영자와의 관계</th>
						<th colspan="2">보유주식수</th>
						<th rowspan="2">보유주식금액(천원)</th>
					</tr>
					<tr>
						<th>보통주</th>
						<th>일반주</th>
					</tr>
				  </thead>
				  <tbody class="listStock">
						
						<tr>
							<td><input type="text" class="input_w90" id="buShaName" name="buShaName"></td>							
							<td><input type="text" class="input_w90" id="buRelMan" name="buRelMan"></td>							
							<td><input type="text" class="input_w90" id="buHolStoOrdSto" name="buHolStoOrdSto"></td>							
							<td><input type="text" class="input_w90" id="buHolStoSto" name="buHolStoSto"></td>					
							<td><input type="text" class="input_w90" id="buAmoStoHel" name="buAmoStoHel"></td>
						</tr>
				  </tbody>
				</table>
				<div class="btn_add"><span onclick="fnInfoLineAdd('listStock');">추가</span></div>
			</div>
			<!-- e :bbs_write01 -->

			<h4>재무정보</h4>
			
			<div class="table_guide bbs_write01">
				<table class=" table_l">
					<caption></caption>
					<colgroup>
						<col width="10%">
						<col width="25%">
						<col width="10%">
						<col width="23%">
						<col width="10%">
						<col width="%">
					</colgroup>

					<tbody>
						<tr>							
							<th scope="row">기준회계년도</th>
							<td>
								<select style="width:150px;" id="buBaseFisYear" name="buBaseFisYear">
									<option value="">2021</option>
									<option value="">2020</option>
								</select>
							</td>
							<th scope="row">수출액</th>
							<td colspan="3">
								<input type="text" style="width:150px;" id="buEaports" name="buEaports"> 백만원
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<input type="text" style="width:150px;" id="buEaports2" name="buEaports2"> 만불
							</td>
						</tr>
						<tr>							
							<th scope="row">부채총계</th>
							<td><input type="text" style="width:150px;" id="buTotDebt" name="buTotDebt"> 백만원</td>		
							<th scope="row">영업이익</th>
							<td><input type="text" style="width:150px;" id="buOpePro" name="buOpePro"> 백만원</td>		
							<th scope="row">유동자산</th>
							<td><input type="text" style="width:150px;" id="buCurAss" name="buCurAss"> 백만원</td>
						</tr>
						<tr>							
							<th scope="row">자본총계</th>
							<td><input type="text" style="width:150px;" id="buTotDebt" name="buTotDebt"> 백만원</td>		
							<th scope="row">R&D투자액</th>
							<td><input type="text" style="width:150px;" id="buOpePro" name="buOpePro"> 백만원</td>		
							<th scope="row">유동부채</th>
							<td><input type="text" style="width:150px;" id="buCurAss" name="buCurAss"> 백만원</td>
						</tr>
						<tr>							
							<th scope="row">자산총계</th>
							<td><input type="text" style="width:150px;" id="buTotAss" name="buTotAss"> 백만원 <!-- (자동계산) --></td>		
							
							<th scope="row">재고자산</th>
							<td><input type="text" style="width:150px;" id="buIvn" name="buIvn"> 백만원</td>		
							<th scope="row">유동고정자산</th>
							<td><input type="text" style="width:150px;" id="buCurFixAss" name="buCurFixAss"> 백만원</td>
						</tr>
						<tr>							
							<th scope="row">당기순이익</th>
							<td><input type="text" style="width:150px;" id="buNetInc" name="buNetInc"> 백만원</td>		
							<th scope="row">당기매출액</th>
							<td><input type="text" style="width:150px;" id="buCurSal" name="buCurSal"> 백만원</td>		
							<th scope="row">전기매출액</th>
							<td><input type="text" style="width:150px;" id="buRleSal" name="buRleSal"> 백만원</td>
						</tr>
					</tbody>
				</table>
			</div>
			<!-- e :bbs_write01 -->


			<h4>인증/성과 정보</h4>
			
			<div class="table_guide bbs_write01">
				<table class=" table_l">
					<caption></caption>
					<colgroup>
						<col width="%">
						<col width="20%">
						<col width="20%">
					</colgroup>

					<tbody>
						<tr>		
							<td>
								<input type="checkbox"> 
								「소재·부품·장비 감송기업 100」 선정기업
							</td>
							<th scope="row">INNO-BIZ기업 지정번호</th>
							<td>
								<input type="text" class="input_w80" id="buComDesNum" name="buComDesNum">
							</td>
						</tr>
						<tr>		
							<td>
								<input type="checkbox"> 
								「소재·부품·장비 감송기업 100」 최종 단계 미선정기업
							</td>
							<th scope="row">INNO-BIZ기업 유효기간</th>
							<td>
								<input type="text" class="inputCalendar" id="buComValPer" name="buComValPer">
							</td>
						</tr>
						<tr>		
							<td colspan="3">
								<input type="checkbox"> 
								「K-유니콘 후보 200 프로그램」에 선정된 중소기업
							</td>
						</tr>
						<tr>		
							<td>
								<input type="checkbox"> 
								「중소기업기술혁신 촉진법」제15조에 따른 기술혁신형 중소기업(INNO-BIZ)
							</td>
							<th scope="row">벤처기업 지정번호</th>
							<td>
								<input type="text" class="input_w80" id="buVenComDesNum" name="buVenComDesNum">
							</td>
						</tr>
						<tr>		
							<td>
								<input type="checkbox"> 
								「중소기업기술혁신 촉진법」제15조의2에 따른 경영혁신형 중소기업
							</td>
							<th scope="row">벤처기업 유효기간</th>
							<td>
								<input type="text" class="inputCalendar" id="buVenComValPer" name="buVenComValPer">
							</td>
						</tr>
						<tr>		
							<td colspan="3">
								<input type="checkbox"> 
								「중소기업인력지원특별법」제18조의2에 따른 인재육성형 중소기업
							</td>
						</tr>
						<tr>		
							<td colspan="3">
								<input type="checkbox"> 
								「여성기업지원에 관한 법률」제2조에 따른 여성기업
							</td>
						</tr>
						<tr>		
							<td colspan="3">
								<input type="checkbox"> 
								「장애인기업활동 촉진법」제2조에 따른 장애인기업
							</td>
						</tr>
						<tr>		
							<td colspan="3">
								<input type="checkbox"> 
								「중소기업 사업전환 촉진에 관한 특별법」제8조에 따른 사업전환계획 승인기업
							</td>
						</tr>
						<tr>		
							<td colspan="3">
								<input type="checkbox">&nbsp; 
								마이스터고등학교·특성화고등학교·중소기업인력양성대학(계약학과, 기술사관, 취업맞춤반)과 산학협약을 체결한 기업
							</td>
						</tr>
						<tr>		
							<td colspan="3">
								<input type="checkbox"> 
								「중소기업진흥에 관한 법률」제62조23에 따른 '지방중소기업특별지원지역'내에 소재하고 있는 지방중소기업
							</td>
						</tr>
						<tr>		
							<td colspan="3">
								<input type="checkbox">&nbsp; 
								요령 제2조제28호에 따른 산업위기지역 소재 중소기업
							</td>
						</tr>
						<tr>		
							<td colspan="3">
								<input type="checkbox">&nbsp; 
								기업활력법 승인기업
							</td>
						</tr>
						<tr>		
							<td colspan="3">
								<input type="checkbox">&nbsp; 
								중기부 R&D지원사업의 수혜이력을 보유한 기업 중 최근 3년간 연평균 매출증가율이 15%이상인 기업
							</td>
						</tr>
						<tr>		
							<td colspan="3">
								<input type="checkbox">&nbsp; 
								민간투자유치실적(1억원 이상) 보유기업, 코스닥, 코넥스, 스타트업마켓(KSM) 등록기업
							</td>
						</tr>
						<tr>		
							<td colspan="3">
								<input type="checkbox">&nbsp;
								최근 3년 이내 신탁기술을 이전받은 중소기업
							</td>
						</tr>
						<tr>		
							<td colspan="3">
								<input type="checkbox">&nbsp; 
								최근 3년 이내 정보 출연연구기관, 대학 등과의 기술 이전계약 체결 기업
							</td>
						</tr>
						<tr>		
							<td colspan="3">
								<input type="checkbox"> 
								「발명진흥법」제11조의2에 따른 직무발명보상 우수기업 또는 「지식재산기본법」제32조에 따른 지식재산경영 인증기업
							</td>
						</tr>
						<tr>		
							<td colspan="3">
								<input type="checkbox">&nbsp; 
								성과 조사, 분석 결과 종합등급이 A등급인 경우
							</td>
						</tr>
						<tr>		
							<td colspan="3">
								<input type="checkbox">&nbsp; 
								성과 조사, 분석 결과 종합등급이 B등급인 경우
							</td>
						</tr>
						<tr>		
							<td colspan="3">
								<input type="checkbox">&nbsp; 
								중기부 기술료 납품 상한액 완납기업
							</td>
						</tr>
						<tr>		
							<td colspan="3">
								<input type="checkbox">&nbsp; 
								WC300 선정기업 중 WC300 전용 R&D(글로벌중소기업육성프로젝트지원) 미참여 기업
							</td>
						</tr>
						<tr>		
							<td colspan="3">
								<input type="checkbox">&nbsp;
								6개월 이내 근로자 수 90% 이상 유지한 기업
							</td>
						</tr>
						<tr>		
							<td colspan="3">
								<input type="checkbox">&nbsp;
								6개월 이내 6개월 평균 근로자 수가 6개월 전 근로자 수 대비 150% 증가한 기업
							</td>
						</tr>
					</tbody>
				</table>
			</div>
			<!-- e :bbs_write01 -->

			<h4>국가연구개발사업 실적</h4>
			
			<div class="table_guide bbs_write01">
				<table>
				  <caption></caption>
				  <colgroup>
						<col width="%">
						<col width="%">
						<col width="%">
						<col width="150px;">
						<col width="150px;">
						<col width="150px;">
						<col width="150px;">
						<col width="%">
						<col width="%">
						<col width="%">
						<col width="%">
						<col width="%">
				  </colgroup>
				  <thead>
					<tr>
						<th>프로그램명</th>
						<th>과제명</th>
						<th>최종목표 및<br>핵심내용</th>
						<th>과제<br>시작일</th>
						<th>과제<br>종료일</th>
						<th>참여<br>시작일</th>
						<th>참여<br>종료일</th>
						<th>총정부<br>출연금<br>(천원)</th>
						<th>담당역할</th>
						<th>기관정부<br>출연금<br>(천원)</th>
						<th>과제현황</th>
						<th>완료실적<br>(매출/고용)</th>
					</tr>
				  </thead>
				  <tbody class="listGov">
						
						<tr>
							<td><input type="text" class="input_w90" id="buProName" name="buProName"></td>							
							<td><input type="text" class="input_w90" id="buProTit" name="buProTit"></td>							
							<td><input type="text" class="input_w90" id="buFinGoalCorCon" name="buFinGoalCorCon"></td>							
							<td><input type="text" class="inputCalendar" id="buAssStaDat" name="buAssStaDat"></td>					
							<td><input type="text" class="inputCalendar" id="buAssEndDat" name="buAssEndDat"></td>
							<td><input type="text" class="inputCalendar" id="buParStaDat" name="buParStaDat"></td>							
							<td><input type="text" class="inputCalendar" id="buParEndDat" name="buParEndDat"></td>							
							<td><input type="text" class="input_w90" id="buTotGovApp" name="buTotGovApp"></td>							
							<td><input type="text" class="input_w90" id="buResRole" name="buResRole"></td>					
							<td><input type="text" class="input_w90" id="buIntGovApp" name="buIntGovApp"></td>							
							<td><input type="text" class="input_w90" id="buTaskSta" name="buTaskSta"></td>					
							<td><input type="text" class="input_w90" id="buComRes" name="buComRes"></td>
						</tr>
				  </tbody>
				</table>
				<div class="btn_add"><span onclick="fnInfoLineAdd('listGov');">추가</span></div>
			</div>
			<!-- e :bbs_write01 -->



			<h4>민간연구개발사업 실적</h4>
			
			<div class="table_guide bbs_write01">
				<table>
				  <caption></caption>
				  <colgroup>
						<col width="%">
						<col width="%">
						<col width="%">
						<col width="150px;">
						<col width="150px;">
						<col width="150px;">
						<col width="150px;">
						<col width="%">
						<col width="%">
						<col width="%">
						<col width="%">
						<col width="%">
				  </colgroup>
				  <thead>
					<tr>
						<th>사업명</th>
						<th>과제명</th>
						<th>최종목표 및<br>핵심내용</th>
						<th>사업<br>시작일</th>
						<th>사업<br>종료일</th>
						<th>참여<br>시작일</th>
						<th>참여<br>종료일</th>
						<th>총사업비<br>(천원)</th>
						<th>담당역할</th>
						<th>기관<br>사업비<br>(천원)</th>
						<th>사업현황</th>
						<th>완료실적<br>(매출/고용)</th>
					</tr>
				  </thead>
				  <tbody class="listPri">
						
						<tr>
							<td><input type="text" class="input_w90" id="buBusName" name="buBusName"></td>							
							<td><input type="text" class="input_w90" id="buProTit2" name="buProTit2"></td>					
							<td><input type="text" class="input_w90" id="buFinGoalCorCon2" name="buFinGoalCorCon2"></td>							
							<td><input type="text" class="inputCalendar" id="buBusStDate" name="buBusStDate"></td>							
							<td><input type="text" class="inputCalendar" id="buBusEndDate" name="buBusEndDate"></td>					
							<td><input type="text" class="inputCalendar" id="buParStaDate" name="buParStaDate"></td>
							<td><input type="text" class="inputCalendar" id="buParEndDate" name="buParEndDate"></td>							
							<td><input type="text" class="input_w90" id="buTotProCost" name="buTotProCost"></td>							
							<td><input type="text" class="input_w90" id="buResRole2" name="buResRole2"></td>							
							<td><input type="text" class="input_w90" id="buInsBusExp" name="buInsBusExp"></td>					
							<td><input type="text" class="input_w90" id="buBusSta" name="buBusSta"></td>							
							<td><input type="text" class="input_w90" id="buComRes2" name="buComRes2"></td>
						</tr>
				  </tbody>
				</table>
				<div class="btn_add"><span onclick="fnInfoLineAdd('listPri');">추가</span></div>
			</div>
			<!-- e :bbs_write01 -->


			<h4>보유시설·장비 현황</h4>
			
			<div class="table_guide bbs_write01">
				<table>
				  <caption></caption>
				  <colgroup>
						<col width="%">
						<col width="%">
						<col width="%">
						<col width="%">
						<col width="%">
				  </colgroup>
				  <thead>
					<tr>
						<th>시설장비명</th>
						<th>규격</th>
						<th>구입가격</th>
						<th>구입년도</th>
						<th>용도</th>
					</tr>
				  </thead>
				  <tbody class="listEqu">
						
						<tr>
							<td><input type="text" class="input_w90" id="buFacEquName" name="buFacEquName"></td>							
							<td><input type="text" class="input_w90" id="buStandard" name="buStandard"></td>							
							<td><input type="text" class="input_w90" id="buPurPri" name="buPurPri"></td>							
							<td><input type="text" class="input_w90" id="buTearPur" name="buTearPur"></td>							
							<td><input type="text" class="input_w90" id="buPur" name="buPur"></td>	
						</tr>
				  </tbody>
				</table>
				<div class="btn_add"><span onclick="fnInfoLineAdd('listEqu');">추가</span></div>
			</div>
			<!-- e :bbs_write01 -->


			<h4>사업화 실적</h4>
			
			<div class="table_guide bbs_write01">
				<table>
				  <caption></caption>
				  <colgroup>
						<col width="%">
						<col width="%">
						<col width="%">
						<col width="%">
						<col width="%">
						<col width="%">
				  </colgroup>
				  <thead>
					<tr>
						<th>사업화 품목명</th>
						<th>사업화 연도</th>
						<th>품목용도</th>
						<th>품질 및 가격경쟁력</th>
						<th>수출여부</th>
						<th>판매채널(온·오프라인)</th>
					</tr>
				  </thead>
				  <tbody class="listResult">
						
						<tr>
							<td><input type="text" class="input_w90" id="buComItemName" name="buComItemName"></td>							
							<td><input type="text" class="input_w90" id="buComYear" name="buComYear"></td>							
							<td><input type="text" class="input_w90" id="buItemUse" name="buItemUse"></td>							
							<td><input type="text" class="input_w90" id="buQuaPriCom" name="buQuaPriCom"></td>							
							<td><input type="text" class="input_w90" id="buExpNot" name="buExpNot"></td>						
							<td><input type="text" class="input_w90" id="buSalCha" name="buSalCha"></td>	
						</tr>
				  </tbody>
				</table>
				<div class="btn_add"><span onclick="fnInfoLineAdd('listResult');">추가</span></div>
			</div>
			<!-- e :bbs_write01 -->

			<div class="btn_guide ac">
				<button type="button" class="btn_style01 btn_orange" id="button">저장</button>
				<button type="button" class="btn_style01 btn_gray" onclick="fnInputCancel();">취소</button>
			</div>
			
		</div>
		</form>
		<!-- e :contents_guide -->
	</div>
	<!-- e :wrap -->
</body>
</html>
