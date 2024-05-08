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
				window.location.href = "<c:url value='/empo/EMAU00J01/EMAU00J0110.do?coPk="+ coPk +"'/>";
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
		<input type="hidden" id="checkList9" name="checkList9">
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
							<li>목표시장 잠재력</li>
							<li>목표시장 규모 및 성장성</li>
						</ul>
					</dd>
				</dl>
				<dl class="width_30">
					<dt>평가목적</dt>
					<dd>
						<ul>
							<li>국내·외 시장 규모 및 성장성 평가</li>
							<li>국내·외 시장 규모 대비 사업화 목표의 적정성 평가</li>
						</ul>
					</dd>
				</dl>
				<dl class="width_50">
					<dt>평가주안점</dt>
					<dd>
						<ul>
							<li>국내·외 시장 규모 및 성장 잠재력은 어떠한가?</li>
							<li>국내·외 시장 규모 대비 매출 목표는 적정한가?</li>
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
								  <td colspan="2">계획서에서 제시하고 있는 예상 총 매출액 산정근거가 타당한가?</td>
								  <td class="text_c"><label><input type="radio"  value = "1" class="checkList7" name="checkList7"> 예</label>
									  <label><input type="radio" class="checkList7"  value = "2" name="checkList7"> 아니오</label>
									  <label><input type="radio" class="checkList7"  value = "3" name="checkList7"> 보류</label>
								  </td>
								  <td rowspan="2">
									  <textarea class="input_w100" id="checkList91" name="checkList91">비고</textarea>
								  </td>
								</tr>
								<tr>
								  <td colspan="2">계획서에서 제시하고 있는 국내·외 시장규모 산정근거가 타당한가?</td>
								  <td class="text_c"><label><input type="radio"  value = "1" class="checkList8" name="checkList8"> 예</label>
									  <label><input type="radio" class="checkList8"  value = "2" name="checkList8"> 아니오</label>
									  <label><input type="radio" class="checkList8"  value = "3" name="checkList8"> 보류</label>
								  </td>
								</tr>
								<tr class="top_line">
								  <td rowspan="2">국내 시장규모 및 성장 잠재력</td>
								  <td>국내 시장규모 및 성장 잠재력의 수준</td>
								  <td class="text_c"><label><input type="radio"  value = "1" class="checkList10" name="checkList10"> 우수</label>
									  <label><input type="radio" class="checkList10"  value = "2" name="checkList10"> 보통</label>
									  <label><input type="radio" class="checkList10"  value = "3" name="checkList10"> 미흡</label>
								  </td>
								  <td><input type="text" class="input_w100" id="checkList11" name="checkList11"></td>
								</tr>
								<tr>
								  <td class="leftBorder">산출 근거의 적정성</td>
								  <td class="text_c"><label><input type="radio" value = "1"  class="checkList12" name="checkList12"> 우수</label>
									  <label><input type="radio" class="checkList12"  value = "2" name="checkList12"> 보통</label>
									  <label><input type="radio" class="checkList12"  value = "3" name="checkList12"> 미흡</label>
								  </td>
								  <td><input type="text" class="input_w100" id="checkList13" name="checkList13"></td>
								</tr>
								<tr>
								  <td rowspan="2">국외 시장규모 및 성장 잠재력</td>
								  <td>해외 시장규모 및 성장 잠재력의 수준</td>
								  <td class="text_c"><label><input type="radio"  value = "1" class="checkList14" name="checkList14"> 우수</label>
									  <label><input type="radio" class="checkList14"  value = "2" name="checkList14"> 보통</label>
									  <label><input type="radio" class="checkList14"  value = "3" name="checkList14"> 미흡</label>
								  </td>
								  <td><input type="text" class="input_w100" id="checkList15" name="checkList15"></td>
								</tr>
								<tr>
								  <td class="leftBorder">산출 근거의 적정성</td>
								  <td class="text_c"><label><input type="radio" value = "1"  class="checkList16" name="checkList16"> 우수</label>
									  <label><input type="radio" class="checkList16"  value = "2" name="checkList16"> 보통</label>
									  <label><input type="radio" class="checkList16"  value = "3" name="checkList16"> 미흡</label>
								  </td>
								  <td><input type="text" class="input_w100" id="checkList17" name="checkList17"></td>
								</tr>
								<tr>
								  <td>매출 목표의 적정성</td>
								  <td>국내·외 시장 규모 및 성장 잠재력 대비 매출 목표의 적정성</td>
								  <td class="text_c"><label><input type="radio"  value = "1" class="checkList18" name="checkList18"> 우수</label>
									  <label><input type="radio" class="checkList18"  value = "2" name="checkList18"> 보통</label>
									  <label><input type="radio" class="checkList18"  value = "3" name="checkList18"> 미흡</label>
								  </td>
								  <td><input type="text" class="input_w100" id="checkList19" name="checkList19"></td>
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
						  <td>국내·외 시장규모 및 성장 잠재력이 매우 높고, 매출 목표를 매우 적정하게 설정함</td>
						</tr>
						<tr>
						  <th scope="row">우수</th>
						  <td>국내·외 시장규모 및 성장 잠재력이 높고, 매출 목표를 적정하게 설정함</td>
						</tr>
						<tr>
						  <th scope="row">양호</th>
						  <td>국내·외 시장규모 및 성장 잠재력, 매출 목표의 설정이 전반적으로 양호함</td>
						</tr>
						<tr>
						  <th scope="row">보통</th>
						  <td>국내·외 시장규모 및 성장 잠재력, 매출 목표 설정이  보통 수준을 유지함</td>
						</tr>
						<tr>
						  <th scope="row">미흡</th>
						  <td>국내·외 시장규모 및 성장 잠재력이 부족하고, 매출 목표 설정이 미흡함</td>
						</tr>
						<tr>
						  <th scope="row">매우 미흡</th>
						  <td>국내·외 시장규모 및 성장 잠재력이 매우 부족하고, 매출 목표 설정이 매우 미흡함</td>
						</tr>
					  </tbody>
					</table>
				</div>
				
				<dl>
					<dt>평가점수</dt>
					<dd><input type="text" class="input_w80" id="evalScore2" name="evalScore2"/></dd>
				</dl>
			</div>
			
			
			<div class="btn_guide ac">
				<a href="<c:url value='/empo/EMAU00J01/EMAU00J0108.do'/>" class="btn_style01 btn_white">이전</a>
				<button type="button" class="btn_style01 btn_gray" id="button">다음</button>
			</div>
			
			
			
		</div>
		</form>
		<!-- e :contents_guide -->
	</div>
	<!-- e :wrap -->
</body>
</html>
