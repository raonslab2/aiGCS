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
				window.location.href = "<c:url value='/empo/EMAU00J01/EMAU00J0108.do?coPk="+ coPk +"'/>";
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
		<input type="hidden" id="checkList48" name="checkList48" value="">
		<!-- e :menu_guide -->
		<div class="contents_guide">
			<div class="box_style01">
			<%-- 	<div>
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
							<li>기술보호 적정성</li>
						</ul>
					</dd>
				</dl>
				<dl class="width_30">
					<dt>평가목적</dt>
					<dd>
						<ul>
							<li>기술개발 결과물에 대한 지식재산권 확보, 유사 특허 회피 방안 평가</li>
							<li>기술 유출 방지 대책 평가</li>
						</ul>
					</dd>
				</dl>
				<dl class="width_50">
					<dt>평가주안점</dt>
					<dd>
						<ul>
							<li>기술개발 결과물에 대한 지식재산권 확보, 유사 특허 회피 방안의 적정성은 어떠한가?</li>
							<li>개발 기술의 유출 방지 대책의 적정성은 어떠한가?</li>
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
								  <td colspan="2">연구개발 시 향후 위협이 될 가능성이 높은 기존 지식재산권이 존재하지 않는가?</td>
								  <td class="text_c"><label><input type="radio"  value = "1" class="checkList47" name="checkList47"> 예</label>
									  <label><input type="radio" class="checkList47"  value = "2" name="checkList47"> 아니오</label>
									  <label><input type="radio" class="checkList47"  value = "3" name="checkList47"> 보류</label>
								  </td>
								  <td>
									  <textarea class="input_w100" id="checkList481" name="checkList481">비고</textarea>
								  </td>
								</tr>
								<tr class="top_line">
								  <td>지식재산권 확보 방안</td>
								  <td>핵심기술의 지식재산권 확보 방안의 적정성을 평가</td>
								  <td class="text_c"><label><input type="radio" value = "1"  class="checkList49" name="checkList49"> 우수</label>
									  <label><input type="radio" class="checkList49" value = "2"  name="checkList49"> 보통</label>
									  <label><input type="radio" class="checkList49"  value = "3" name="checkList49"> 미흡</label>
								  </td>
								  <td><input type="text" class="input_w100" id="checkList50" name="checkList50"></td>
								</tr>
								<tr>
								  <td>유사 특허 회피 방안</td>
								  <td>선행, 유사 특허가 있는 경우, 이를 회피하기 위한 방안의 적정성을 확인</td>
								  <td class="text_c"><label><input type="radio"  value = "1" class="checkList51" name="checkList51"> 우수</label>
									  <label><input type="radio" class="checkList51"  value = "2" name="checkList51"> 보통</label>
									  <label><input type="radio" class="checkList51"  value = "3" name="checkList51"> 미흡</label>
								  </td>
								  <td><input type="text" class="input_w100" id="checkList52" name="checkList52"></td>
								</tr>
								<tr>
								  <td>기술유출 방지 대책</td>
								  <td>기술개발 산출물(사업계획서, 최종보고서, 연구노트, 실험 데이터, 디자인·설계도, 기타 결과물 등)에 대한 무단복제, 외부유출 등 기술유출 방지대책의 적정성을 확인</td>
								  <td class="text_c"><label><input type="radio"  value = "1" class="checkList53" name="checkList53"> 우수</label>
									  <label><input type="radio" class="checkList53"  value = "2" name="checkList53"> 보통</label>
									  <label><input type="radio" class="checkList53"  value = "3" name="checkList53"> 미흡</label>
								  </td>
								  <td><input type="text" class="input_w100" id="checkList54" name="checkList54"></td>
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
						  <td>지식재산권 확보 및 유사 특허 회피 방안이 매우 우수하고, 기술유출 방지 대책도 매우 적정함</td>
						</tr>
						<tr>
						  <th scope="row">우수</th>
						  <td>지식재산권 확보 및 유사 특허 회피 방안이 우수하고, 기술유출 방지 대책도 적정함</td>
						</tr>
						<tr>
						  <th scope="row">양호</th>
						  <td>지식재산권 확보 및 유사 특허 회피 방안, 기술유출 방지 대책이 전반적으로 양호함</td>
						</tr>
						<tr>
						  <th scope="row">보통</th>
						  <td>지식재산권 확보 및 유사 특허 회피 방안, 기술유출 방지 대책이 보통 수준을 유지함</td>
						</tr>
						<tr>
						  <th scope="row">미흡</th>
						  <td>지식재산권 확보 및 유사 특허 회피 방안이 다소 미흡하고, 기술유출 방지 대책도 보완이 필요함</td>
						</tr>
						<tr>
						  <th scope="row">매우 미흡</th>
						  <td>지식재산권 확보 및 유사 특허 회피 방안이 매우 미흡하고, 기술유출 방지 대책도 매우 부족함</td>
						</tr>
					  </tbody>
					</table>
				</div>
				
				<dl>
					<dt>평가점수</dt>
					<dd><input type="text" class="input_w80" id="evalScore6" name="evalScore6"/></dd>
				</dl>
			</div>
			
			
			<div class="btn_guide ac">
				<a href="<c:url value='/empo/EMAU00J01/EMAU00J0106.do'/>" class="btn_style01 btn_white">이전</a>
				<button type="button" class="btn_style01 btn_gray" id="button">다음</button>
			</div>
			
			
			
		</div>
		</form>
		<!-- e :contents_guide -->
	</div>
	<!-- e :wrap -->
</body>
</html>
