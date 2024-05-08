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
				window.location.href = "<c:url value='/empo/EMAU00J01/EMAU00J0109.do?coPk="+ coPk +"'/>";
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
		<input type="hidden" id="checkList2" name="checkList2" value="">
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
							<li>목표시장 혁신성</li>
						</ul>
					</dd>
				</dl>
				<dl class="width_30">
					<dt>평가목적</dt>
					<dd>
						<ul>
							<li>개발할 기술에 기반한 제품 및 서비스가 신산업 및 신사업 분야를 개척하는 정도를 평가함</li>
						</ul>
					</dd>
				</dl>
				<dl class="width_50">
					<dt>평가주안점</dt>
					<dd>
						<ul>
							<li>제품 및 서비스가 신산업 분야를 개척하는가?</li>
							<li>제품 및 서비스가 신사업 분야를 진출에 기여하는가?</li>
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
								  <td colspan="2">사업화 대상으로 고려하고 있는 제품과 유사한 제품이 시장에 존재하지 않는가?</td>
								  <td class="text_c"><label><input type="radio"  value = "1" class="checkList1" name="checkList1"> 예</label>
									  <label><input type="radio" class="checkList1"  value = "2" name="checkList1"> 아니오</label>
									  <label><input type="radio" class="checkList1"  value = "3" name="checkList1"> 보류</label>
								  </td>
								  <td>
									  <textarea class="input_w100" id="checkList21" name="checkList21">비고</textarea>
								  </td>
								</tr>
								<tr class="top_line">
								  <td>신산업 분야 개척 수준 </td>
								  <td>개발할 기술에 기반한 제품 및 서비스가 신규산업분야를 개척하거나 이의 기반에 되는 정도를 확인 </td>
								  <td class="text_c"><label><input type="radio"  value = "1" class="checkList3" name="checkList3"> 상</label>
									  <label><input type="radio" class="checkList3"  value = "2" name="checkList3"> 중</label>
									  <label><input type="radio" class="checkList3"  value = "3" name="checkList3"> 하</label>
								  </td>
								  <td><input type="text" class="input_w100" id="checkList4" name="checkList4"></td>
								</tr>
								<tr>
								  <td>신사업 분야 진출 수준 </td>
								  <td>개발할 기술에 기반한 제품 및 서비스가 지원 기업의 신규사업 분야 진출을 위한 기반이 되는 정도를 확인</td>
								  <td class="text_c"><label><input type="radio"  value = "1" class="checkList5" name="checkList5"> 상</label>
									  <label><input type="radio" class="checkList5"  value = "2" name="checkList5"> 중</label>
									  <label><input type="radio" class="checkList5"  value = "3" name="checkList5"> 하</label>
								  </td>
								  <td><input type="text" class="input_w100" id="checkList6" name="checkList6"></td>
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
						  <td>개발 기술에 기반한 제품 및 서비스는 신산업 개척 및 신사업 진출의 기반이 될 잠재력이 매우 높음</td>
						</tr>
						<tr>
						  <th scope="row">우수</th>
						  <td>개발 기술에 기반한 제품 및 서비스는 신산업 개척 잠재력이 높고, 신사업 진출의 기반이 될 수 있음</td>
						</tr>
						<tr>
						  <th scope="row">양호</th>
						  <td>개발 기술에 기반한 제품 및 서비스는 신산업 개척 및 신사업 진출의 기반이 될 잠재력이 양호함</td>
						</tr>
						<tr>
						  <th scope="row">보통</th>
						  <td>개발 기술에 기반한 제품 및 서비스는 신산업 개척 및 신사업 진출의 기반이 될 잠재력이 보통 수준임</td>
						</tr>
						<tr>
						  <th scope="row">미흡</th>
						  <td>개발 기술에 기반한 제품 및 서비스는 신산업 개척 잠재력이 미흡하고 및 신사업 진출의 기반이 될 가능성이 다소 미흡함</td>
						</tr>
						<tr>
						  <th scope="row">매우 미흡</th>
						  <td>개발 기술에 기반한 제품 및 서비스는 신산업 개척 및 신사업 진출의 기반이 될 가능성 모두 매우 미흡함</td>
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
				<a href="<c:url value='/empo/EMAU00J01/EMAU00J0107.do'/>" class="btn_style01 btn_white">이전</a>
				<button type="button" class="btn_style01 btn_gray" id="button">다음</button>
			</div>
			
			
			
		</div>
		<!-- e :contents_guide -->
		</form>
	</div>
	<!-- e :wrap -->
</body>
</html>
