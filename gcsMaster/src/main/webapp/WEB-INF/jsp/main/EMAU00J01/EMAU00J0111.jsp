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
				window.location.href = "<c:url value='/empo/EMAU00J01/EMAU00J0112.do?coPk="+ coPk +"'/>";
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
		<input type="hidden" id="checkList29" name="checkList29">
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
							<li>시장진입 가능성</li>
						</ul>
					</dd>
				</dl>
				<dl class="width_30">
					<dt>평가목적</dt>
					<dd>
						<ul>
							<li>개발 기술의 최종 제품화 및 양산 가능성 평가</li>
							<li>양산 제품의 판로개척 가능성 평가</li>
						</ul>
					</dd>
				</dl>
				<dl class="width_50">
					<dt>평가주안점</dt>
					<dd>
						<ul>
							<li>개발 기술의 제품화 및 양산 가능성은 어떠한가?</li>
							<li>양산 제품의 판로개척 가능성은 어떠한가?</li>
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
								  <td colspan="2">신제품 개발을 기술개발결과물 목표로 정한 경우, 기존에 보유한 사업화 경험과 역량으로 신제품의 사업화를 성공적으로 이루어낼 수 있겠는가?</td>
								  <td class="text_c"><label><input type="radio" value = "1"  class="checkList27" name="checkList27"> 예</label>
									  <label><input type="radio" class="checkList27" value = "2"  name="checkList27"> 아니오</label>
									  <label><input type="radio" class="checkList27" value = "3"  name="checkList27"> 보류</label>
								  </td>
								  <td rowspan="2">
									  <textarea class="input_w100" id="checkList291" name="checkList291">비고</textarea>
								  </td>
								</tr>
								<tr>
								  <td colspan="2">조직 내부에 수출업무를 관리할 충분한 내부 역량이 있는가? 해외 유통을 담당할 파트너가 있는가?</td>
								  <td class="text_c"><label><input type="radio" value = "1"  class="checkList28" name="checkList28"> 예</label>
									  <label><input type="radio" class="checkList28" value = "2"  name="checkList28"> 아니오</label>
									  <label><input type="radio" class="checkList28" value = "3"  name="checkList28"> 보류</label>
								  </td>
								</tr>
								<tr class="top_line">
								  <td>제품화</td>
								  <td>개발할 기술의 최종 제품/서비스화 계획의 구체성 및 성공 가능성 </td>
								  <td class="text_c"><label><input type="radio" value = "1"  class="checkList30" name="checkList29"> 상</label>
									  <label><input type="radio" class="checkList30" value = "2"  name="checkList30"> 중</label>
									  <label><input type="radio" class="checkList30" value = "3"  name="checkList30"> 하</label>
								  </td>
								  <td><input type="text" class="input_w100" id="checkList31" name="checkList31"></td>
								</tr>
								<tr>
								  <td>양산</td>
								  <td>제품화 이후 양산 계획과 방법의 구체성 및 성공 가능성</td>
								  <td class="text_c"><label><input type="radio"  value = "1" class="checkList32" name="checkList32"> 상</label>
									  <label><input type="radio" class="checkList32"  value = "2" name="checkList32"> 중</label>
									  <label><input type="radio" class="checkList32"  value = "3" name="checkList32"> 하</label>
								  </td>
								  <td><input type="text" class="input_w100" id="checkList33" name="checkList33"></td>
								</tr>
								<tr>
								  <td>판로개척</td>
								  <td>양산 제품의 국내·외 마케팅, 유통, 판매 전략의 구체성 및 적절성</td>
								  <td class="text_c"><label><input type="radio"  value = "1" class="checkList34" name="checkList34"> 우수</label>
									  <label><input type="radio" class="checkList34"  value = "2" name="checkList34"> 보통</label>
									  <label><input type="radio" class="checkList34"  value = "3" name="checkList34"> 미흡</label>
								  </td>
								  <td><input type="text" class="input_w100" id="checkList35" name="checkList35"></td>
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
						  <td>개발 기술의 제품화, 양산 계획의 적절성 및 가능성이 매우 높고, 판로개척 계획이 매우 우수함</td>
						</tr>
						<tr>
						  <th scope="row">우수</th>
						  <td>개발 기술의 제품화, 양산 계획의 적절성 및 가능성이 높고, 판로개척 계획도 우수함</td>
						</tr>
						<tr>
						  <th scope="row">양호</th>
						  <td>개발 기술의 제품화, 양산 계획, 판로개척 계획이 전반적으로 양호함</td>
						</tr>
						<tr>
						  <th scope="row">보통</th>
						  <td>개발 기술의 제품화, 양산 계획, 판로개척 계획이 보통 수준을 유지함</td>
						</tr>
						<tr>
						  <th scope="row">미흡</th>
						  <td>개발 기술의 제품화, 양산 계획의 적절성 및 가능성이 미흡하고, 판로개척 계획도 부족함</td>
						</tr>
						<tr>
						  <th scope="row">매우 미흡</th>
						  <td>개발 기술의 제품화, 양산 계획, 판로개척 계획이 모두 매우 미흡함</td>
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
				<a href="<c:url value='/empo/EMAU00J01/EMAU00J0110.do'/>" class="btn_style01 btn_white">이전</a>
				<button type="button" class="btn_style01 btn_gray" id="button">다음</button>
			</div>
			
			
			
		</div>
		</form>
		<!-- e :contents_guide -->
	</div>
	<!-- e :wrap -->
</body>
</html>
