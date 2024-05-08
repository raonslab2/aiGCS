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
			var textArea = $("textarea#checkList31").val();
			console.log(textArea);
			$("#checkList3").val(textArea);
			var formSer = $('#form').serialize();
			$.post("/empo/EMAU00J01/insertEMAU00J0102.do", formSer).done(function(res){
				window.location.href = "<c:url value='/empo/EMAU00J01/EMAU00J0103.do?coPk="+ coPk +"'/>";
			
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
		<!-- e :menu_guide -->
		<form id="form" name="form" method="post">
		<input type="hidden" name="checkList3" id="checkList3" value="">
		<div class="contents_guide">
			<div class="box_style01">
				<%-- <div>
					<c:import url="/empo/EMAU00J01/IncSubject.do" /> 
				</div> --%>
			</div>
			
			<div class="tab_menu">
				<c:import url="/empo/EMAU00J01/IncTabMenu01.do" /> 
				<%-- <%@ include file = "inc_tab_menu01.jsp" %> --%>
			</div>
			
			<div class="appraisal_list">
				<dl class="width_20">
					<dt>평가항목</dt>
					<dd>
						<ul>
							<li class="bgnone">기술성</li>
							<li>목표기술 잠재력</li>
							<li>창의 도전성</li>
						</ul>
					</dd>
				</dl>
				<dl class="width_30">
					<dt>평가목적</dt>
					<dd>
						<ul>
							<li>기술개발 내용의 및 목표의 창의성 및 도전성을 평가함</li>
						</ul>
					</dd>
				</dl>
				<dl class="width_50">
					<dt>평가주안점</dt>
					<dd>
						<ul>
							<li>기술개발 내용의 창의성, 차별성은 어떠한가?</li>
							<li>기술개발 목표의 도전성은 어떠한가?</li>
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
								  <td colspan="2">현재 개발하고자 하는 기술과 관련성이 높은 기존 지식재산권(특허 등)이 부재한가?</td>
								  <td class="text_c"><label><input type="radio" class="checkList1" name="checkList1" value="2"> 예</label>
									  <label><input type="radio" class="checkList1" name="checkList1" value="1"> 아니오</label>
									  <label><input type="radio"class="checkList1" name="checkList1" value="0"> 보류</label>
								  </td>
								  <td rowspan="2">
									  <textarea class="input_w100" id="checkList31" name="checkList31">비고</textarea>
								  </td>
								</tr>
								<tr>
								  <td colspan="2">선택한 유관 기술로드맵의 R&D 난이도가 높게 평가되고 있는가?</td>
								  <td class="text_c"><label><input type="radio" class="checkList2" name="checkList2" value="2"> 예</label>
									  <label><input type="radio" class="checkList2" name="checkList2" value="1"> 아니오</label>
									  <label><input type="radio" class="checkList2" name="checkList2" value="0"> 보류</label>
								  </td>
								</tr>
								<tr class="top_line">
								  <td>개발 기술의 독창성</td>
								  <td>기존 기술 대비 개발하고자 하는 기술의 독창성, 차별성 </td>
								  <td class="text_c"><label><input type="radio" class="checkList4" name="checkList4" value="2"> 상</label>
									  <label><input type="radio" class="checkList4" name="checkList4" value="1"> 중</label>
									  <label><input type="radio" class="checkList4" name="checkList4" value="0"> 하</label>
								  </td>
								  <td><input type="text" class="input_w100" id="checkList5" name="checkList5"></td>
								</tr>
								<tr>
								  <td>개발 기술의 도전성</td>
								  <td>기존 기술 대비 개발하고자 하는 기술의 도전성, 난이도</td>
								  <td class="text_c"><label><input type="radio" class="checkList6" name="checkList6" value="2"> 상</label>
									  <label><input type="radio" class="checkList6" name="checkList6" value="1"> 중</label>
									  <label><input type="radio" class="checkList6" name="checkList6" value="0"> 하</label>
								  </td>
								  <td><input type="text" class="input_w100" id="checkList7" name="checkList7"></td>
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
						  <td>기존 기술 대비 개발하고자 하는 기술이 매우 독창적이고, 개발 목표도 매우 도전적임</td>
						</tr>
						<tr>
						  <th scope="row">우수</th>
						  <td>기존 기술 대비 개발하고자 하는 기술이 독창적이고, 개발 목표가 도전적임</td>
						</tr>
						<tr>
						  <th scope="row">양호</th>
						  <td>기존 기술 대비 개발하고자 하는 기술의 독창성과 개발 목표의 도전성이 전반적으로 양호함</td>
						</tr>
						<tr>
						  <th scope="row">보통</th>
						  <td>기존 기술 대비 개발하고자 하는 기술의 독창성과 개발 목표의 도전성이 보통 수준을 유지함</td>
						</tr>
						<tr>
						  <th scope="row">미흡</th>
						  <td>기존 기술 대비 개발하고자 하는 기술의 독창성이 다소 미흡하고, 개발 목표의 도전성이 높지 않음</td>
						</tr>
						<tr>
						  <th scope="row">매우 미흡</th>
						  <td>기존 기술 대비 개발하고자 하는 기술의 독창성과 개발 목표의 도전성 모두 매우 낮음</td>
						</tr>
					  </tbody>
					</table>
				</div>
				
				<dl>
					<dt>평가점수</dt>
					<dd><input type="text"  class="input_w80"  id="evalScore" name="evalScore"/></dd>
					<!-- onKeyup="this.value=this.value.replace(/[^0-5]/g,'');" -->
				</dl>
			</div>
			
			
			<div class="btn_guide ac">
				<a href="<c:url value='/empo/EMAU00J01/EMAU00J0101.do'/>" class="btn_style01 btn_white">이전</a>
				<button type="button" class="btn_style01 btn_gray" id="button">다음</button>
			</div>
			
			
			
		</div>
		<!-- e :contents_guide -->
		</form>
	</div>
	<!-- e :wrap -->
</body>
</html>
