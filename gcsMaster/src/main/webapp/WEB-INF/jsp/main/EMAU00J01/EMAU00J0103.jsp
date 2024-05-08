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
				window.location.href = "<c:url value='/empo/EMAU00J01/EMAU00J0104.do?coPk="+ coPk +"'/>";
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
		<input type="hidden" name="checkList11" id="checkList11" value="">
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
							<li>목표기술 잠재력</li>
							<li>기술 파급력</li>
						</ul>
					</dd>
				</dl>
				<dl class="width_30">
					<dt>평가목적</dt>
					<dd>
						<ul>
							<li>개발하고자 하는 기술의 필요성, 중요성을 평가함</li>
						</ul>
					</dd>
				</dl>
				<dl class="width_50">
					<dt>평가주안점</dt>
					<dd>
						<ul>
							<li>개발 목표 기술의 필요성, 중요성은 어떠한가?</li>
							<li>개발 목표 기술의 파급력은 어떠한가?</li>
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
								  <td colspan="2">선택한 유관 기술로드맵의 기술적 가치가 높게 평가되고 있는가?</td>
								  <td class="text_c"><label><input type="radio" class="checkList8" value = "1" name="checkList8"> 예</label>
									  <label><input type="radio" class="checkList8"  value = "2" name="checkList8"> 아니오</label>
									  <label><input type="radio" class="checkList8"  value = "3" name="checkList8"> 보류</label>
								  </td>
								  <td rowspan="3">
									  <textarea class="input_w100" id="checkList111" name="checkList111">비고</textarea>
								  </td>
								</tr>
								<tr>
								  <td colspan="2">선택한 유관 기술로드맵의 경제적 가치가 높게 평가되고 있는가?</td>
								  <td class="text_c"><label><input type="radio"  value = "1" class="checkList9" name="checkList9"> 예</label>
									  <label><input type="radio" class="checkList9"  value = "2" name="checkList9"> 아니오</label>
									  <label><input type="radio" class="checkList9"  value = "3" name="checkList9"> 보류</label>
								  </td>
								</tr>
								<tr>
								  <td colspan="2">선택한 유관 기술로드맵의 정책적 가치가 높게 평가되고 있는가?</td>
								  <td class="text_c"><label><input type="radio" value = "1"class="checkList10" name="checkList10"> 예</label>
									  <label><input type="radio" class="checkList10" value = "2"name="checkList10"> 아니오</label>
									  <label><input type="radio" class="checkList10" value = "3"name="checkList10"> 보류</label>
								  </td>
								</tr>
								<tr class="top_line">
								  <td>개발 기술의 필요성</td>
								  <td>제안 기업의 기술 경쟁력 확보 측면에서 개발하고자 하는 기술의 필요성, 중요성 </td>
								  <td class="text_c"><label><input type="radio" value = "1" class="checkList12" name="checkList12"> 상</label>
									  <label><input type="radio" class="checkList12" value = "2" name="checkList12"> 중</label>
									  <label><input type="radio" class="checkList12" value = "3" name="checkList12"> 하</label>
								  </td>
								  <td><input type="text" class="input_w100" id="checkList13" name="checkList13"></td>
								</tr>
								<tr>
								  <td>기술 개발의 파급력</td>
								  <td>개발하고자 하는 기술이 향후 관련 기술 개발에 미치는 파급력</td>
								  <td class="text_c"><label><input type="radio" value = "1"class="checkList14" name="checkList14"> 상</label>
									  <label><input type="radio" class="checkList14" value = "2"name="checkList14"> 중</label>
									  <label><input type="radio" class="checkList14" value = "3"name="checkList14"> 하</label>
								  </td>
								  <td><input type="text" class="input_w100" id="checkList15" name="checkList15"></td>
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
						  <td>개발하고자 하는 기술의 필요성이 매우 높고, 향후 관련기술 개발에 대한 파급력도 매우 높음</td>
						</tr>
						<tr>
						  <th scope="row">우수</th>
						  <td>개발하고자 하는 기술의 필요성이 높고, 향후 관련기술 개발에 대한 파급력도 높음</td>
						</tr>
						<tr>
						  <th scope="row">양호</th>
						  <td>개발하고자 하는 기술의 필요성과 향후 관련기술 개발에 대한 파급력이 전반적으로 양호함</td>
						</tr>
						<tr>
						  <th scope="row">보통</th>
						  <td>개발하고자 하는 기술의 필요성과 향후 관련기술 개발에 대한 파급력이 보통 수준을 유지함</td>
						</tr>
						<tr>
						  <th scope="row">미흡</th>
						  <td>개발하고자 하는 기술의 필요성이 다소 미흡하고, 향후 관련기술 개발에 대한 파급력이 높지 않음</td>
						</tr>
						<tr>
						  <th scope="row">매우 미흡</th>
						  <td>개발하고자 하는 기술의 필요성과 향후 관련기술 개발에 대한 파급력이 모두 매우 미흡함</td>
						</tr>
					  </tbody>
					</table>
				</div>
				
				<dl>
					<dt>평가점수</dt>
					<dd><input type="text" class="input_w80"  id="evalScore2" name="evalScore2"/></dd>
				</dl>
			</div>
			
			
			<div class="btn_guide ac">
				<a href="<c:url value='/empo/EMAU00J01/EMAU00J0102.do'/>" class="btn_style01 btn_white back"  >이전</a>
				<button type="button" class="btn_style01 btn_gray" id="button">다음</button>
			</div>
			
			
			
		</div>
		<!-- e :contents_guide -->
		</form>
	</div>
	<!-- e :wrap -->
</body>
</html>
