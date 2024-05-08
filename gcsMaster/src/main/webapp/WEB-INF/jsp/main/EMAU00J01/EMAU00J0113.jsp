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
				window.location.href = "<c:url value='/empo/EMAU00J01/EMAU00J0114.do?coPk="+ coPk +"'/>";
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
		<input type="hidden" id="checkList3" name="checkList3">
		<!-- e :menu_guide -->
		<div class="contents_guide">
			<div class="box_style01">
				<%-- <div>
					<c:import url="/empo/EMAU00J01/IncSubject.do" />
				</div> --%>
			</div>
			
			<div class="tab_menu">
				<c:import url="/empo/EMAU00J01/IncTabMenu03.do" />
			</div>
			
			<div class="appraisal_list">
				<dl class="width_20">
					<dt>평가항목</dt>
					<dd>
						<ul>
							<li class="bgnone">정책부합성</li>
							<li>고용친화도</li>
						</ul>
					</dd>
				</dl>
				<dl class="width_30">
					<dt>평가목적</dt>
					<dd>
						<ul>
							<li>본 사업을 통한 고용 창출 및 기술인력에 대한 교육, 보상제도를 평가함</li>
						</ul>
					</dd>
				</dl>
				<dl class="width_50">
					<dt>평가주안점</dt>
					<dd>
						<ul>
							<li>향후 고용 창출 수준 및 계획의 구체성은 어떠한가?</li>
							<li>기술인력에 대한 교육 및 보상 제도는 어떠한가?</li>
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
								  <td colspan="2">현재의 조직규모를 고려해 볼 때, 신규 고용 인원수는 적절하게 계획되어 있는가?</td>
								  <td class="text_c"><label><input type="radio"  value = "1" class="checkList1" name="checkList1"> 예</label>
									  <label><input type="radio" class="checkList1"  value = "2" name="checkList1"> 아니오</label>
									  <label><input type="radio" class="checkList1"  value = "3" name="checkList1"> 보류</label>
								  </td>
								  <td rowspan="2">
									  <textarea class="input_w100" id="checkList31" name="checkList31">비고</textarea>
								  </td>
								</tr>
								<tr>
								  <td colspan="2">청년인력으로 참여연구원을 채용할 계획을 갖고 있는 경우, 청년인력에게 홍보 및 리쿠르트 할 구체적인 계획을 보유하고 있는가?</td>
								  <td class="text_c"><label><input type="radio"  value = "1" class="checkList2" name="checkList2"> 예</label>
									  <label><input type="radio" class="checkList2"  value = "2" name="checkList2"> 아니오</label>
									  <label><input type="radio" class="checkList2"  value = "3" name="checkList2"> 보류</label>
								  </td>
								</tr>
								<tr class="top_line">
								  <td rowspan="2">고용 창출</td>
								  <td>현재 고용 현황 및 향후 고용 창출 수준</td>
								  <td class="text_c"><label><input type="radio"  value = "1" class="checkList4" name="checkList4"> 우수</label>
									  <label><input type="radio" class="checkList4"  value = "2" name="checkList4"> 보통</label>
									  <label><input type="radio" class="checkList4"  value = "3" name="checkList4"> 미흡</label>
								  </td>
								  <td><input type="text" class="input_w100" id="checkList5" name="checkList5"></td>
								</tr>
								<tr>
								  <td class="leftBorder">고용유지, 향후 고용창출을 위한 계획의 구체성, 적정성</td>
								  <td class="text_c"><label><input type="radio"  value = "1" class="checkList6" name="checkList6"> 우수</label>
									  <label><input type="radio" class="checkList6"  value = "2" name="checkList6"> 보통</label>
									  <label><input type="radio" class="checkList6"  value = "3" name="checkList6"> 미흡</label>
								  </td>
								  <td><input type="text" class="input_w100" id="checkList7" name="checkList7"></td>
								</tr>
								<tr>
								  <td>교육 및 보상 제도</td>
								  <td>
									기술인력을 위한 교육 및 보상제도<br>
									(교육프로그램 운영, R&D 성과 공유, 스톡옵션, 직무보상발명제도 등)
								   </td>
								  <td class="text_c"><label><input type="radio"  value = "1" class="checkList8" name="checkList8"> 우수</label>
									  <label><input type="radio" class="checkList8" value = "2"  name="checkList8"> 보통</label>
									  <label><input type="radio" class="checkList8" value = "3"  name="checkList8"> 미흡</label>
								  </td>
								  <td><input type="text" class="input_w100" id="checkList9" name="checkList9"></td>
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
						  <td>고용 창출 수준 및 이를 계획이 매우 구체적이며, 교육 및 보상제도가 매우 우수함</td>
						</tr>
						<tr>
						  <th scope="row">우수</th>
						  <td>고용 창출 수준 및 이를 계획이 구체적이며, 교육 및 보상제도가 전반적으로 우수함</td>
						</tr>
						<tr>
						  <th scope="row">양호</th>
						  <td>고용 창출 수준 및 이를 계획, 교육 및 보상제도가 전반적으로 양호함</td>
						</tr>
						<tr>
						  <th scope="row">보통</th>
						  <td>고용 창출 수준 및 이를 계획, 교육 및 보상제도가 보통 수준을 유지함</td>
						</tr>
						<tr>
						  <th scope="row">미흡</th>
						  <td>고용 창출 수준 및 이를 계획이 구체성이 부족하며, 교육 및 보상제도 역시 미흡함</td>
						</tr>
						<tr>
						  <th scope="row">매우 미흡</th>
						  <td>고용 창출 수준 및 이를 계획, 교육 및 보상제도가 모두 매우 미흡함</td>
						</tr>
					  </tbody>
					</table>
				</div>
				
				<dl>
					<dt>평가점수</dt>
					<dd><input type="text" class="input_w80" id="evalScore" name="evalScore"/></dd>
				</dl>
			</div>
			
			
			<div class="btn_guide ac">
				<a href="<c:url value='/empo/EMAU00J01/EMAU00J0112.do'/>" class="btn_style01 btn_white">이전</a>
				<button type="button" class="btn_style01 btn_gray" id="button">다음</button>
			</div>
			
			
			
		</div>
		<!-- e :contents_guide -->
		</form>
	</div>
	<!-- e :wrap -->
</body>
</html>
