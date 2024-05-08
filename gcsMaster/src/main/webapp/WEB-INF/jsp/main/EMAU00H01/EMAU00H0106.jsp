<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>


<div class="table_guide bbs_write01">
	<table class="table_l">
		<caption></caption>
		<colgroup>
			<col width="15%">
			<col width="%">
			<col width="35%">
		</colgroup>
		<tbody>
			<tr>
				<th>로드맵 선택</th>				
				<td>
					<table class="table_c">
						<caption></caption>
						<colgroup>
							<col width="%">
							<col width="10%">
							<col width="8%">
							<col width="8%">
							<col width="8%">
							<col width="8%">
							<col width="8%">
							<col width="10%">
							<col width="12%">
						</colgroup>
						<tbody>
							<tr>
								<th rowspan="2">기술명</th>		
								<th colspan="2">주요성능지표</th>		
								<th colspan="3">연차별 목표</th>		
								<th rowspan="2">세계 최고 수준</th>		
								<th rowspan="2">유사 과제 조회</th>		
								<th rowspan="2">시험규격</th>		
							</tr>
							<tr>
								<th>지표명</th>		
								<th>단위</th>		
								<th>2020년</th>		
								<th>2021년</th>	
								<th>2022년</th>	
							</tr>
							<tr>
								<th rowspan="5">
									<label><input type="radio" checked> 라텍스 코팅제</label>
								</th>
								<td>인장강도</td>
								<td>MPa</td>
								<td>2.5</td>
								<td>3.0</td>
								<td>3.5</td>
								<td>3.5</td>
								<td rowspan="5">3건</td>
								<td rowspan="5">KSF 3888-2</td>
							</tr>
							<tr>
								<td>신장률</td>
								<td>%</td>
								<td>450</td>
								<td>475</td>
								<td>500</td>
								<td>510</td>
							</tr>
							<tr>
								<td>Pb 함유량</td>
								<td>mg/kg</td>
								<td>90</td>
								<td>80</td>
								<td>70</td>
								<td>70</td>
							</tr>
							<tr>
								<td>Cd 함유량</td>
								<td>mg/kg</td>
								<td>50</td>
								<td>45</td>
								<td>40</td>
								<td>45</td>
							</tr>
							<tr>
								<td>휘발성 유기화합물</td>
								<td>mg/kg</td>
								<td>50</td>
								<td>45</td>
								<td>40</td>
								<td>45</td>
							</tr>
							<tr>
								<th rowspan="5">
									<label><input type="radio" checked> 탄성 포장제</label>
								</th>
								<td>인장강도</td>
								<td>MPa</td>
								<td>0.5</td>
								<td>0.7</td>
								<td>1.0</td>
								<td>0.7</td>
								<td rowspan="5">2건</td>
								<td rowspan="5">KSF 3888-2</td>
							</tr>
							<tr>
								<td>신장률</td>
								<td>%</td>
								<td>40</td>
								<td>42</td>
								<td>44</td>
								<td>45</td>
							</tr>
							<tr>
								<td>미끄럼저항</td>
								<td>BPN</td>
								<td>47</td>
								<td>49</td>
								<td>51</td>
								<td>50</td>
							</tr>
							<tr>
								<td>충격흡수성</td>
								<td>%</td>
								<td>35</td>
								<td>40</td>
								<td>50</td>
								<td>50</td>
							</tr>
						</tbody>
					</table>
				</td>

				<td style="vertical-align: top;">
					<table class="table_l">
						<caption></caption>
						<colgroup>
							<col width="%">
							<col width="40%">
						</colgroup>
						<tbody>
							<tr>
								<th class="al">선택한 로드맵과의 연계성 평가<br>(자체평가/정량평가)</th>		
								<td id="buAssRelSrlRoa" >
									<span class="starPoint starPoint1">☆</span>
									<span class="starPoint starPoint2" style="display:none;" id="star" value="1">★</span>
									<span class="starPoint starPoint1">☆</span>
									<span class="starPoint starPoint2" style="display:none;" id="star2" value="2">★</span>
									<span class="starPoint starPoint1">☆</span>
									<span class="starPoint starPoint2" style="display:none;" id="star3" value="3">★</span>
									<span class="starPoint starPoint1">☆</span>
									<span class="starPoint starPoint2" style="display:none;" id="star4" value="4">★</span>
									<span class="starPoint starPoint1">☆</span>
									<span class="starPoint starPoint2" style="display:none;" id="star5" value="5">★</span>
								</td>
							</tr>
							<tr>
								<th colspan="2" class="al">선택한 로드맵과의 연계성 기술(정성평가)</th>		
							</tr>
							<tr>
								<td colspan="2">
									<textarea class="input_w100" rows="15" id="buSelRoaConTec1" name="buSelRoaConTec1"></textarea>
								</td>
							</tr>
						</tbody>
					</table>
				</td>
			</tr>
		</tbody>
	</table>
</div>


<h4>연구개발 계획 탑재</h4>

<div class="table_guide bbs_write01">
	<table class="table_l">
		<caption></caption>
		<colgroup>
			<col width="15%">
			<col width="%">
		</colgroup>
		<tbody>
			<tr>
				<th colspan="2" class="ac">
					다음에서 제공하고 있는 양식(HWP)을 바탕으로, 연구개발 계획을 작성하여 탑재합니다.
					<span class="file"><a href="#">연구개발 계획 HWP 표준양식 다운로드</a></span>
				</th>
			</tr>
			<tr>
				<th>경로주소</th>				
				<td>
					<input type="file" class="file input_w50" id="buRouPath" name="uploadFile"/>
					<button type="submit" class="btn_style01 btn_red">탑재</button>
				</td>
			</tr>
			
			<tr>
				<th>구성항목 확인 및 검증</th>				
				<td>
					<table class="table_c">
						<caption></caption>
						<colgroup>
							<col width="20%">
							<col width="%">
							<col width="20%">
						</colgroup>
						<tbody>
							<tr>
								<th>대항목</th>		
								<th>소항목</th>		
								<th>검증결과</th>		
								<th>인식결과 조회</th>		
							</tr>
							<tr>
								<th rowspan="2">개발기술개요</th>
								<td>개발기술 개요 및 필요성</td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<td>개발기술의 독창성과 차별성</td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<th rowspan="4">기술개발 준비 현황</th>
								<td>선행연구결과 및 애로사항</td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<td>관련 지식재산권 현황</td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<td>지식재산권 확보 회피 방안</td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<td>기술유출 방지대책</td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<th rowspan="2">기술개발 최종목표</th>
								<td>기술개발 최종목표</td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<td>성능지표 목표 및 측정방법</td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<th rowspan="2">기술개발 내용</th>
								<td>연차별 개발내용</td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<td>수행기관별 업무분장</td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<th>기술개발 일정</th>
								<td>연차별 일정표</td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<th>연구시설장비 활용 및 확보</th>
								<td>연구시설장비 활용 및 확보<br>현황 및 계획</td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<th rowspan="7">사업비 계획</th>
								<td>연차별 사업비 총괄표</td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<td>인건비 계상내역</td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<td>주관기관 연차별 사업비 총괄</td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<td>공동개발기관/참여기업/위탁기관 연차별 사업비 총괄</td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<td>1차년도 사업비 비목별 소요명세</td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<td>2차년도 사업비 비목별 소요명세</td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<td>3차년도 사업비 비목별 소요명세</td>
								<td></td>
								<td></td>
							</tr>
						</tbody>
					</table>
				</td>	
			</tr>

			<tr>
				<th colspan="2" class="ac">
					자동으로 탑재된 연구개발 계획의 각 항목들이 모두 적절하게 인식되었음을 확인하였습니다.
					&nbsp;&nbsp;&nbsp;
					<label><input type="checkbox" id="buAutCon" name="uploadFile"> 확인</label>
				</th>
			</tr>
		</tbody>
	</table>
</div>
<!-- e :bbs_write01 -->


<h4>사업화 계획 탑재</h4>

<div class="table_guide bbs_write01">
	<table class="table_l">
		<caption></caption>
		<colgroup>
			<col width="15%">
			<col width="%">
		</colgroup>
		<tbody>
			<tr>
				<th colspan="2" class="ac">
					다음에서 제공하고 있는 양식(HWP)을 바탕으로, 사업화 계획을 작성하여 탑재합니다.
					<span class="file"><a href="#">사업화 계획 HWP 표준양식 다운로드</a></span>
				</th>
			</tr>
			<tr>
				<th>경로주소</th>				
				<td>
					<input type="file" class="file input_w50" id="buRouPath2" name="buRouPath2" />
					<button type="submit" class="btn_style01 btn_red">탑재</button>
				</td>
			</tr>
			
			<tr>
				<th>구성항목 확인 및 검증</th>				
				<td>
					<table class="table_c">
						<caption></caption>
						<colgroup>
							<col width="20%">
							<col width="%">
							<col width="20%">
						</colgroup>
						<tbody>
							<tr>
								<th>대항목</th>		
								<th>소항목</th>		
								<th>검증결과</th>		
								<th>인식결과 조회</th>		
							</tr>
							<tr>
								<th rowspan="5">사업화 목표</th>
								<td>사업화 목표 및 산정근거</td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<td>사업화 실적 목표</td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<td>국내외 시장규모 예상</td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<td>국내외 주요시장 경쟁사</td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<td>목표시장 혁신성</td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<th rowspan="6">사업화 상세계획</th>
								<td>제품화 계획</td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<td>양산계획</td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<td>판로개척 계획</td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<td>기술개발 후 국내외 주요 판매처 현황</td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<td>사업화를 위한 후속 투자계획</td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<td>해외시장 진출계획</td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<th rowspan="3">고용 계획</th>
								<td>고용유지 및 고용창출 계획</td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<td>고용지원 및 촉진 관련 제도 운영 현황</td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<td>고용 현황 및 향후 계획</td>
								<td></td>
								<td></td>
							</tr>
						</tbody>
					</table>
				</td>	
			</tr>

			<tr>
				<th colspan="2" class="ac">
					자동으로 탑재된 사업화 계획의 각 항목들이 모두 적절하게 인식되었음을 확인하였습니다.
					&nbsp;&nbsp;&nbsp;
					<label><input type="checkbox" id="buAutCon2" name="buAutCon2"> 확인</label>
				</th>
			</tr>
		</tbody>
	</table>
</div>
<!-- e :bbs_write01 -->


<div class="btn_guide ac">
	<a href="<c:url value='/empo/EMAU00H01/EMAU00H0104.do'/>" class="btn_style01 btn_white">이전단계</a>
	<button type="button" class="btn_style01 btn_orange" id="button">저장하기</button>
	<button type="button" class="btn_style01 btn_gray" id="button2">제출하기</button>
</div>