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
				window.location.href = "<c:url value='/empo/EMAU00J01/EMAU00J0113.do?coPk="+ coPk +"'/>";
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
		<input type="hidden" id="checkList37" name="checkList37">
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
							<li>사업화 투자계획 적정성</li>
						</ul>
					</dd>
				</dl>
				<dl class="width_30">
					<dt>평가목적</dt>
					<dd>
						<ul>
							<li>개발할 기술의 사업화를 위한 후속 투자계획의 구체성 및 적정성을 평가</li>
						</ul>
					</dd>
				</dl>
				<dl class="width_50">
					<dt>평가주안점</dt>
					<dd>
						<ul>
							<li>사업화를 위한 투자계획의 구체성은 어떠한가?</li>
							<li>제품화 및 양산, 판로개척 계획 대비 사업화를 위한 투자계획의 적절성은 어떠한가?</li>
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
								  <td colspan="2">사업화를 위한 후속투자금을 마련할 적절한 계획을 보유하고 있는가?</td>
								  <td class="text_c"><label><input type="radio"  value = "1" class="checkList36" name="checkList36"> 예</label>
									  <label><input type="radio" class="checkList36"  value = "2" name="checkList36"> 아니오</label>
									  <label><input type="radio" class="checkList36"  value = "3" name="checkList36"> 보류</label>
								  </td>
								  <td>
									  <textarea class="input_w100" id="checkList371" name="checkList371">비고</textarea>
								  </td>
								</tr>
								<tr class="top_line">
								  <td>사업화 투자계획의 구체성</td>
								  <td>개발할 기술의 양산 및 판로개척에 필요한 투입 금액이 구체적으로 제시되었는지 확인</td>
								  <td class="text_c"><label><input type="radio"  value = "1" class="checkList38" name="checkList38"> 우수</label>
									  <label><input type="radio" class="checkList38"  value = "2" name="checkList38"> 보통</label>
									  <label><input type="radio" class="checkList38"  value = "3" name="checkList38"> 미흡</label>
								  </td>
								  <td><input type="text" class="input_w100" class="checkList39" name="checkList39"></td>
								</tr>
								<tr>
								  <td>사업화 투자계획의 적정성</td>
								  <td>개발할 기술의 양산 및 판로개척 계획의 실현을 위해 투입 금액의 적정성</td>
								  <td class="text_c"><label><input type="radio"  value = "1" class="checkList40" name="checkList40"> 우수</label>
									  <label><input type="radio" class="checkList40"  value = "2" name="checkList40"> 보통</label>
									  <label><input type="radio" class="checkList40"  value = "3" name="checkList40"> 미흡</label>
								  </td>
								  <td><input type="text" class="input_w100" id="checkList41" name="checkList41"></td>
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
						  <td>사업화를 위한 투자계획이 매우 구체적이며, 사업화 목표 대비 투자계획이 매우 적정함</td>
						</tr>
						<tr>
						  <th scope="row">우수</th>
						  <td>사업화를 위한 투자계획이 구체적이며, 사업화 목표 대비 투자계획이 적정함</td>
						</tr>
						<tr>
						  <th scope="row">양호</th>
						  <td>사업화를 위한 투자계획의 구체성, 사업화 목표 대비 투자계획의 적정성이 양호함</td>
						</tr>
						<tr>
						  <th scope="row">보통</th>
						  <td>사업화를 위한 투자계획의 구체성, 사업화 목표 대비 투자계획의 적정성이 보통 수준을 유지함</td>
						</tr>
						<tr>
						  <th scope="row">미흡</th>
						  <td>사업화를 위한 투자계획의 구체성이 부족하고, 사업화 목표 대비 투자계획의 적정성도 미흡함</td>
						</tr>
						<tr>
						  <th scope="row">매우 미흡</th>
						  <td>사업화를 위한 투자계획의 구체성, 사업화 목표 대비 투자계획의 적정성이 모두 매우 미흡함</td>
						</tr>
					  </tbody>
					</table>
				</div>
				
				<dl>
					<dt>평가점수</dt>
					<dd><input type="text" class="input_w80" id="evalScore5" name="evalScore5"/></dd>
				</dl>
			</div>
			
			
			<div class="btn_guide ac">
				<a href="<c:url value='/empo/EMAU00J01/EMAU00J0111.do'/>" class="btn_style01 btn_white">이전</a>
				<button type="button" class="btn_style01 btn_gray" id="button">다음</button>
			</div>
			
			
			
		</div>
		</form>
		<!-- e :contents_guide -->
	</div>
	<!-- e :wrap -->
</body>
</html>
