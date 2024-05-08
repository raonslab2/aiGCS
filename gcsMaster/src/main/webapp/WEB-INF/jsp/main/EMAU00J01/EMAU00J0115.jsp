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
<script type="text/javascript">
$(document).ready(function() {
	
	var URLSearch = new URLSearchParams(location.search);
    var newParam = URLSearch.toString();
    console.log(newParam);	
    var coPk = newParam.substring(5);
    console.log(coPk);
    $.post("/empo/EMAU00H01/searchPk3.do", {coPk : coPk}).done(function(res){
		res.list.forEach(function(row, index) {
			console.log(row.coPk);
		var coPk = row.coPk;
		console.log(coPk);
		$("#coPk").val(coPk);
		$('.box_style01').append(checkListView(row));
		});
	}).fail(function(res) {
		alert("실패");
	})
	
	var checkListView = function (row) {
		var data= 
			'<div>' +
			'<ul>' +
			'<li class="width_40"><span>업체명</span><strong>' + row.buOrgName + '</strong></li>' +
			'<li class="width_60"><span>과제명</span><strong>' + row.buPjName + '</strong></li>' +
			'</ul>' +
			'</div>' ;
		return $(data);
	}
})

</script> 
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
				<%-- <div>
					<c:import url="/empo/EMAU00J01/IncSubject.do" />
				</div> --%>
			</div>
			
			<div class="appraisal_list">
				<dl>
					<dt>평가 결과 요약</dt>
					<dd>
						<div class="table_left">									
							<div class="table_guide ctable02">
								<table>
								  <thead>
									<tr>
									  <th scope="col" colspan="2">심층평가 결과</th>
									</tr>
								  </thead>
								  <tbody>
									<tr>
									  <th scope="row" class="bg">평점</th>
									  <td class="ac"><span class="fc_blue">78점</span> / 100점</td>
									</tr>
									<tr>
									  <th scope="row" class="bg">수준</th>
									  <td class="ac">양호</td>
									</tr>
									<tr>
									  <th scope="row" class="bg">순위</th>
									  <td class="ac"><span class="fc_blue">3위</span> / 8개 기업</td>
									</tr>
								  </tbody>
								</table>
							</div>
						</div>

						<div class="table_right">					
							<div class="table_guide ctable02">
								<table>
								  <thead>
									<tr>
									  <th scope="col">대항목</th>
									  <th scope="col">중항목</th>
									  <th scope="col">소항목</th>
									  <th scope="col">배점</th>
									  <th scope="col" colspan="2">점수</th>
									</tr>
								  </thead>
								  <tbody>
									<tr>
									  <th scope="row" rowspan="5" class="bg">기술성<br>(30)</th>
									  <th rowspan="2" class="leftBorder">목표기술 잠재력</th>
									  <td class="leftBorder">창의 도전성</td>
									  <td class="ac">5</td>
									  <td class="ac fc_blue">3</td>
									  <td rowspan="2" class="ac fc_blue">6</td>
									</tr>
									<tr>
									  <td class="leftBorder">기술 파급력</td>
									  <td class="ac">5</td>
									  <td class="ac fc_blue">3</td>
									</tr>
									<tr>
									  <th rowspan="3" class="leftBorder">목표기술 실현가능성</th>
									  <td>개발 역량(기반,실적)</td>
									  <td class="ac">10</td>
									  <td class="ac fc_blue">6</td>
									  <td rowspan="3" class="ac fc_blue">15</td>
									</tr>
									<tr>
									  <td class="leftBorder">개발 계획의 구체성/적정성</td>
									  <td class="ac">5</td>
									  <td class="ac fc_blue">4</td>
									</tr>
									<tr>
									  <td class="leftBorder">기술보호 적정성</td>
									  <td class="ac">5</td>
									  <td class="ac fc_blue">5</td>
									</tr>
									<tr>
									  <th scope="row" rowspan="5" class="bg">사업성<br>(60)</th>
									  <th rowspan="2" class="leftBorder">목표시장 잠재력</th>
									  <td>목표시장 혁신성</td>
									  <td class="ac">10</td>
									  <td class="ac fc_blue">10</td>
									  <td rowspan="2" class="ac fc_blue">18</td>
									</tr>
									<tr>
									  <td class="leftBorder">목표시장 규모 및 성장성</td>
									  <td class="ac">10</td>
									  <td class="ac fc_blue">8</td>
									</tr>
									<tr>
									  <th rowspan="3" class="leftBorder">사업화 실현가능성</th>
									  <td class="leftBorder">사업화 역량</td>
									  <td class="ac">15</td>
									  <td class="ac fc_blue">12</td>
									  <td rowspan="3" class="ac fc_blue">29</td>
									</tr>
									<tr>
									  <td class="leftBorder">시장 진입 가능성</td>
									  <td class="ac">10</td>
									  <td class="ac fc_blue">8</td>
									</tr>
									<tr>
									  <td class="leftBorder">사업화 투자계획 적정성</td>
									  <td class="ac">15</td>
									  <td class="ac fc_blue">9</td>
									</tr>
									<tr>
									  <th scope="row" rowspan="2" class="bg">정책 부합성<br>(10)</th>
									  <th class="leftBorder">고용 친화도</th>
									  <td class="ac"></td>
									  <td class="ac">5</td>
									  <td class="ac fc_blue">5</td>
									  <td rowspan="2" class="ac fc_blue">10</td>
									</tr>
									<tr>
									  <th class="leftBorder">사업별 특화 지표</th>
									  <td class="ac"></td>
									  <td class="ac">15</td>
									  <td class="ac fc_blue">12</td>
									</tr>
								  </tbody>
								</table>
							</div>
						</div>
					</dd>
				</dl>
			</div>
			
			
			
			<div class="btn_guide ac">
				<a href="<c:url value='/empo/EMAU00J01/EMAU00J0113.do'/>" class="btn_style01 btn_white">이전</a>
				<a href="<c:url value='/empo/EMAU00H01/EMAU00H0108.do'/>" class="btn_style01 btn_gray">종료</a>
			</div>
			
			
			
		</div>
		<!-- e :contents_guide -->
	</div>
	<!-- e :wrap -->
</body>
<script type="text/javascript">
	 $(document).ready(function() {
		
		
	}); 
</script>
</html>
