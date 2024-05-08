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
				window.location.href = "<c:url value='/empo/EMAU00J01/EMAU00J0111.do?coPk="+ coPk +"'/>";
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
</head>

<body>
	<!-- s :wrap -->
	<div id="wrap">
		<div class="menu_guide">
			<c:import url="/EmpPageLink.do?link=main/include2/menu02" />
		</div>
		<form id="form" name="form" method="post">
		<input type="hidden" name="checkList22" id="checkList22">
		<!-- e :menu_guide -->
		<div class="contents_guide">
			<div class="box_style01">
				<%-- <div>
					<c:import url="/empo/EMAU00J01/IncSubject.do" />
				</div> --%>
			</div>
			
			<div class="tab_menu">
				<c:import url="/empo/EMAU00J01/IncTabMenu02.do" />
			</div>
			
			<div class="appraisal_list">
				<dl class="width_20">
					<dt>평가항목</dt>
					<dd>
						<ul>
							<li class="bgnone">사업성</li>
							<li>사업화 실현가능성</li>
							<li>사업화 역량</li>
						</ul>
					</dd>
				</dl>
				<dl class="width_30">
					<dt>평가목적</dt>
					<dd>
						<ul>
							<li>기존 개발 기술의 사업화 실적을 통해 사업화 역량을 평가</li>
						</ul>
					</dd>
				</dl>
				<dl class="width_50">
					<dt>평가주안점</dt>
					<dd>
						<ul>
							<li>기존 개발 기술의 사업화 실적의 수준은 어떠한가?</li>
							<li>기존 사업화 실적의 제안 과제와의 연관성은 어떠한가?</li>
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
								  <td colspan="2">주관연구기관 또는 수요처의 사업화책임자가 충분한 경력과 사업화 역량을 갖추고 있는가?</td>
								  <td class="text_c"><label><input type="radio"  value = "1" class="checkList20" name="checkList20"> 예</label>
									  <label><input type="radio" class="checkList20" value = "2"  name="checkList20"> 아니오</label>
									  <label><input type="radio" class="checkList20"  value = "3" name="checkList20"> 보류</label>
								  </td>
								  <td rowspan="2">
									  <textarea class="input_w100" id="checkList221" name="checkList221">비고</textarea>
								  </td>
								</tr>
								<tr>
								  <td colspan="2">사업화 계획에 '수출'이 계획되어 있는 경우, 기존 사업화 실적 중에 수출로 이어진 실적이 충분히 있는가? </td>
								  <td class="text_c"><label><input type="radio"  value = "1" class="checkList21" name="checkList21"> 예</label>
									  <label><input type="radio" class="checkList21" value = "2"  name="checkList21"> 아니오</label>
									  <label><input type="radio" class="checkList21" value = "3"  name="checkList21"> 보류</label>
								  </td>
								</tr>
								<tr class="top_line">
								  <td>기존 기술 사업화 실적의 수준</td>
								  <td>연구개발 결과물을 활용하여 만들어낸 기존 사업화 실적(내수, 수출 5년 이내 실적)의 수준</td>
								  <td class="text_c"><label><input type="radio" value = "1"  class="checkList23" name="checkList23"> 우수</label>
									  <label><input type="radio" class="checkList23" value = "2"  name="checkList23"> 보통</label>
									  <label><input type="radio" class="checkList23" value = "3"  name="checkList23"> 미흡</label>
								  </td>
								  <td><input type="text" class="input_w100" id="checkList24" name="checkList24"></td>
								</tr>
								<tr>
								  <td>기존 기술 사업화 실적의 제안 과제와의 연관성</td>
								  <td>연구개발 결과물을 활용하여 만들어낸 기존 사업화 실적이 제안 과제와 연관된 정도</td>
								  <td class="text_c"><label><input type="radio" value = "1"  class="checkList25" name="checkList25"> 상</label>
									  <label><input type="radio" class="checkList25" value = "2"  name="checkList25"> 중</label>
									  <label><input type="radio" class="checkList25" value = "3"  name="checkList25"> 하</label>
								  </td>
								  <td><input type="text" class="input_w100" id="checkList26" name="checkList26"></td>
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
						  <td>기술 사업화 실적 수준이 매우 우수하고, 제안 과제와의 연관성도 매우 높음</td>
						</tr>
						<tr>
						  <th scope="row">우수</th>
						  <td>기술 사업화 실적 수준이 우수하고, 제안 과제와의 연관성도 비교적 높음</td>
						</tr>
						<tr>
						  <th scope="row">양호</th>
						  <td>기술 사업화 실적 수준 및 제안 과제와의 연관성이 전반적으로 양호함</td>
						</tr>
						<tr>
						  <th scope="row">보통</th>
						  <td>기술 사업화 실적 수준 및 제안 과제와의 연관성이 보통 수준을 유지함</td>
						</tr>
						<tr>
						  <th scope="row">미흡</th>
						  <td>기술 사업화 실적 수준이 다소 부족하고, 제안 과제와의 연관성도 미흡함</td>
						</tr>
						<tr>
						  <th scope="row">매우 미흡</th>
						  <td>기술 사업화 실적 수준 및 제안 과제와의 연관성이 모두 매우 미흡함</td>
						</tr>
					  </tbody>
					</table>
				</div>
				
				<dl>
					<dt>평가점수</dt>
					<dd><input type="text" class="input_w80" id="evalScore3" name="evalScore3"/></dd>
				</dl>
			</div>
			
			
			<div class="btn_guide ac">
				<a href="<c:url value='/empo/EMAU00J01/EMAU00J0109.do'/>" class="btn_style01 btn_white">이전</a>
				<button type="button" class="btn_style01 btn_gray" id="button">다음</button>
			</div>
			
			
			
		</div>
		</form>
		<!-- e :contents_guide -->
	</div>
	<!-- e :wrap -->
</body>
</html>
