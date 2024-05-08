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
    $("#button").click(function () {
		if (confirm("저장하시겠습니까?")) {
			var textArea = $("textarea#checkList111").val();
			console.log(textArea);
			$("#checkList11").val(textArea);
			var formSer = $('#form').serialize();
			$.post("/empo/EMAU00J01/insertEMAU00J0103.do", formSer).done(function(res){
				window.location.href = "<c:url value='/empo/EMAU00J01/EMAU00J0106.do?coPk="+ coPk +"'/>";
			}).fail(function() {
				alert("실패");
			})
		}
		else {
			return false;
		}
	});
})

</script> 
<body>
	<!-- s :wrap -->
	<div id="wrap">
		<div class="menu_guide">
			<c:import url="/EmpPageLink.do?link=main/include2/menu02" />
		</div>
		<form id="form" name="form" method="post">
		<input type="hidden" id="checkList31" name="checkList31" value="">
		<!-- e :menu_guide -->
		<div class="contents_guide">
			<div class="box_style01">
				<%-- <div>
					<c:import url="/empo/EMAU00J01/IncSubject.do" />
				</div> --%>
			</div>
			
			<div class="tab_menu">
				<c:import url="/empo/EMAU00J01/IncTabMenu01.do" />
			</div>
			
			<div class="appraisal_list">
				<dl class="width_20">
					<dt>평가항목</dt>
					<dd>
						<ul>
							<li class="bgnone">기술성</li>
							<li>목표기술 실현가능성 </li>
							<li>기술개발 역량</li>
						</ul>
					</dd>
				</dl>
				<dl class="width_30">
					<dt>평가목적</dt>
					<dd>
						<ul>
							<li>기술개발 역량을 다면적으로 평가함</li>
						</ul>
					</dd>
				</dl>
				<dl class="width_50">
					<dt>평가주안점</dt>
					<dd>
						<ul>
							<li>기술개발 수행 실적은 어떠한가?</li>
						</ul>
					</dd>
				</dl>
				<dl>
					<dt>확인사항</dt>
					<dd class="border_none">
						<div class="table_guide ctable01">
							<table>
							  <tbody>
								<tr>
								  <td colspan="2">주관연구기관이 관련 국가연구개발사업 수행실적을 충분히 보유하고 있는가?</td>
								  <td class="text_c"><label><input type="radio" value = "1" class="checkList29" name="checkList29"> 예</label>
									  <label><input type="radio" class="checkList29" value = "2"name="checkList29"> 아니오</label>
									  <label><input type="radio" class="checkList29" value = "3"name="checkList29"> 보류</label>
								  </td>
								  <td rowspan="2">
									  <textarea class="input_w100" id="checkList311" name="checkList311">비고</textarea>
								  </td>
								</tr>
								<tr>
								  <td colspan="2">주관연구기관이 관련 민간연구개발사업 수행실적을 충분히 보유하고 있는가?</td>
								  <td class="text_c"><label><input type="radio" value = "1"class="checkList30" name="checkList30"> 예</label>
									  <label><input type="radio" class="checkList30" value = "2"name="checkList30"> 아니오</label>
									  <label><input type="radio" class="checkList30" value = "3" name="checkList30"> 보류</label>
								  </td>
								</tr>
								<tr class="top_line">
								  <td rowspan="2">연구개발 사업 참여 수준</td>
								  <td>지원 기업의 국가 연구개발 사업 참여 수준을 참여 건수 및 총과제 책임 건수를 기준으로 확인</td>
								  <td class="text_c"><label><input type="radio"  value = "1" class="checkList32" name="checkList32"> 우수</label>
									  <label><input type="radio" class="checkList32"  value = "2" name="checkList32"> 보통</label>
									  <label><input type="radio" class="checkList32"  value = "3" name="checkList32"> 미흡</label>
								  </td>
								  <td><input type="text" class="input_w100" id="checkList33" name="checkList33"></td>
								</tr>
								<tr>
								  <td class="leftBorder">지원 기업의 민간 연구개발 사업 참여 수준을 참여 건수 및 총과제 책임 건수를 기준으로 확인</td>
								  <td class="text_c"><label><input type="radio"  value = "1" class="checkList34" name="checkList34"> 우수</label>
									  <label><input type="radio" class="checkList34"  value = "2" name="checkList34"> 보통</label>
									  <label><input type="radio" class="checkList34"  value = "3" name="checkList34"> 미흡</label>
								  </td>
								  <td><input type="text" class="input_w100" id="checkList35" name="checkList35"></td>
								</tr>
								<tr>
								  <td rowspan="2">기술 및 제품 관련 산업재산권 확보 수준</td>
								  <td>국내·외 등록 및 출원 특허의 사업화 가치 수준</td>
								  <td class="text_c"><label><input type="radio"  value = "1" class="checkList36" name="checkList36"> 우수</label>
									  <label><input type="radio" class="checkList36"  value = "2" name="checkList36"> 보통</label>
									  <label><input type="radio" class="checkList36"  value = "3" name="checkList36"> 미흡</label>
								  </td>
								  <td><input type="text" class="input_w100" id="checkList37" name="checkList37"></td>
								</tr>
								<tr>
								  <td class="leftBorder">국내·외 등록 실용신안, 프로그램, 다자인 등의 사업화 가치 수준 </td>
								  <td class="text_c"><label><input type="radio"  value = "1" class="checkList38" name="checkList38"> 우수</label>
									  <label><input type="radio" class="checkList38"  value = "2" name="checkList38"> 보통</label>
									  <label><input type="radio" class="checkList38"  value = "3" name="checkList38"> 미흡</label>
								  </td>
								  <td><input type="text" class="input_w100" id="checkList39" name="checkList39"></td>
								</tr>
							  </tbody>
							</table>
						</div>
					</dd>
				</dl>
			</div>
			
			<div class="standard_list">
				<div class="table_guide ctable02">
					<table>
					  <thead>
						<tr>
						  <th scope="col" colspan="2">평가기준</th>
						</tr>
					  </thead>
					  <tbody>
						<tr>
						  <th scope="row">매우 우수</th>
						  <td>기술 및 제품 관련 산업재산권 확보 수준이 매우 우수하고, 연구개발 사업 참여 수준도 매우 우수함</td>
						</tr>
						<tr>
						  <th scope="row">우수</th>
						  <td>기술 및 제품 관련 산업재산권 확보 수준이 우수하고, 연구개발 사업 참여 수준도 전반적으로 우수함</td>
						</tr>
						<tr>
						  <th scope="row">양호</th>
						  <td>기술 및 제품 관련 산업재산권 확보 수준 및 연구개발 사업 참여 수준이 양호함</td>
						</tr>
						<tr>
						  <th scope="row">보통</th>
						  <td>기술 및 제품 관련 산업재산권 확보 수준 및 연구개발 사업 참여 수준이 보통 수준을 유지함</td>
						</tr>
						<tr>
						  <th scope="row">미흡</th>
						  <td>기술 및 제품 관련 산업재산권 확보 수준이 부족하고, 연구개발 사업 참여 수준도 미흡함</td>
						</tr>
						<tr>
						  <th scope="row">매우 미흡</th>
						  <td>기술 및 제품 관련 산업재산권 확보 수준 및 연구개발 사업 참여 수준이 모두 매우 미흡함</td>
						</tr>
					  </tbody>
					</table>
				</div>
				
				<dl>
					<dt>평가점수</dt>
					<dd><input type="text" class="input_w80" id="evalScore4" name="evalScore4"/></dd>
				</dl>
			</div>
			
			<div class="btn_guide ac">
				<a href="<c:url value='/empo/EMAU00J01/EMAU00J0104.do'/>" class="btn_style01 btn_white">이전</a>
				<button type="button" class="btn_style01 btn_gray" id="button">다음</button>
			</div>
			
			
			
		</div>
		</form>
		<!-- e :contents_guide -->
	</div>
	<!-- e :wrap -->
</body>
</html>
