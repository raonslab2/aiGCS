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
		alert(row.coPk);
		alert(row.buPjName);
		alert(row.buOrgName);
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
				window.location.href = "<c:url value='/empo/EMAU00J01/EMAU00J0105.do?coPk="+ coPk +"'/>";
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
		<input type="hidden" name="checkList18" id="checkList18" value="">
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
							<li>기술개발 조직 및 인력 구성은 어떠한가?</li>
							<li>기술개발 투자의 적정성은 어떠한가?</li>
							<li>기술개발 수행을 위한 시설 및 장비는 어떠한가?</li>
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
								  <td colspan="2">상시 근로자수 대비 연구인력의 비중이 적절한가?</td>
								  <td class="text_c"><label><input type="radio" value = "1" class="checkList16" name="checkList16"> 예</label>
									  <label><input type="radio" class="checkList16" value = "2" name="checkList16"> 아니오</label>
									  <label><input type="radio" class="checkList16" value = "3" name="checkList16"> 보류</label>
								  </td>
								  <td rowspan="2">
									  <textarea class="input_w100" id="checkList181" name="checkList181">비고</textarea>
								  </td>
								</tr>
								<tr>
								  <td colspan="2">주관연구기관의 과제책임자가 충분한 경력과 R&D 역량을 갖추고 있는가?</td>
								  <td class="text_c"><label><input type="radio" value = "1" class="checkList17" name="checkList17"> 예</label>
									  <label><input type="radio" class="checkList17" value = "2" name="checkList17"> 아니오</label>
									  <label><input type="radio" class="checkList17" value = "3" name="checkList17"> 보류</label>
								  </td>
								</tr>
								<tr class="top_line">
								  <td rowspan="2">기술개발 조직 및 인력구성</td>
								  <td>기술개발 전담 조직 및 인력 규모의 적정성</td>
								  <td class="text_c"><label><input type="radio" value = "1" class="checkList19" name="checkList19"> 우수</label>
									  <label><input type="radio" class="checkList19" value = "2" name="checkList19"> 보통</label>
									  <label><input type="radio" class="checkList19" value = "3" name="checkList19"> 미흡</label>
								  </td>
								  <td><input type="text" class="input_w100" id="checkList20" name="checkList20"></td>
								</tr>
								<tr>
								  <td class="leftBorder">기술개발 전담 인력의 경력 및 숙련도</td>
								  <td class="text_c"><label><input type="radio" value = "1" class="checkList21" name="checkList21"> 우수</label>
									  <label><input type="radio" class="checkList21" value = "2" name="checkList21"> 보통</label>
									  <label><input type="radio" class="checkList21" value = "3" name="checkList21"> 미흡</label>
								  </td>
								  <td><input type="text" class="input_w100" id="checkList22" name="checkList22"></td>
								</tr>
								<tr>
								  <td>기술개발 책임자 전문성</td>
								  <td>기술개발 책임자의 경력, 전문성</td>
								  <td class="text_c"><label><input type="radio" value = "1" class="checkList23" name="checkList23"> 우수</label>
									  <label><input type="radio" class="checkList23" value = "2" name="checkList23"> 보통</label>
									  <label><input type="radio" class="checkList23" value = "3" name="checkList23"> 미흡</label>
								  </td>
								  <td><input type="text" class="input_w100" id="checkList24" name="checkList24"></td>
								</tr>
								<tr>
								  <td>기술개발 투자의 적정성</td>
								  <td>R&D 투자비중을 통해 현재 R&D수준</td>
								  <td class="text_c"><label><input type="radio" value = "1" class="checkList25" name="checkList25"> 우수</label>
									  <label><input type="radio" class="checkList25" value = "2" name="checkList25"> 보통</label>
									  <label><input type="radio" class="checkList25" value = "3" name="checkList25"> 미흡</label>
								  </td>
								  <td><input type="text" class="input_w100" id="checkList26" name="checkList26"></td>
								</tr>
								<tr>
								  <td>기술개발 설비 보유현황 및 관리수준</td>
								  <td>R&D에 필요한 설비의 보유 및 관리 수준</td>
								  <td class="text_c"><label><input type="radio" value = "1" class="checkList27" name="checkList27"> 우수</label>
									  <label><input type="radio" class="checkList27" value = "2" name="checkList27"> 보통</label>
									  <label><input type="radio" class="checkList27" value = "3"  name="checkList27"> 미흡</label>
								  </td>
								  <td><input type="text" class="input_w100" id="checkList28" name="checkList28"></td>
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
						  <td>기술개발 조직, 책임자 전문성이 매우 우수하고, 기술개발 투자 및 설비 수준이 매우 우수함</td>
						</tr>
						<tr>
						  <th scope="row">우수</th>
						  <td>기술개발 조직, 책임자 전문성이 우수하고, 기술개발 투자 및 설비 수준 역시 전반적으로 우수함</td>
						</tr>
						<tr>
						  <th scope="row">양호</th>
						  <td>기술개발 조직, 책임자 전문성, 기술개발 투자 및 설비 수준이 전반적으로 양호함</td>
						</tr>
						<tr>
						  <th scope="row">보통</th>
						  <td>기술개발 조직, 책임자 전문성, 기술개발 투자 및 설비 보유 현황이 보통 수준을 유지함 </td>
						</tr>
						<tr>
						  <th scope="row">미흡</th>
						  <td>기술개발 조직, 책임자 전문성이 부족하고, 기술개발 투자 및 설비 수준 역시 미흡함</td>
						</tr>
						<tr>
						  <th scope="row">매우 미흡</th>
						  <td>기술개발 조직, 책임자 전문성, 기술개발 투자 및 설비 수준이 모두 매우 미흡함</td>
						</tr>
					  </tbody>
					</table>
				</div>
				
				<dl>
					<dt>평가점수</dt>
					<dd><input type="text" class="input_w80"  id="evalScore3" name="evalScore3"/></dd>
				</dl>
			</div>
			
			<div class="btn_guide ac">
				<a href="<c:url value='/empo/EMAU00J01/EMAU00J0103.do'/>" class="btn_style01 btn_white">이전</a>
				<button type="button" class="btn_style01 btn_gray" id="button">다음</button>
			</div>
			
			
			
		</div>
		</form>
		<!-- e :contents_guide -->
	</div>
	<!-- e :wrap -->
</body>
</html>
