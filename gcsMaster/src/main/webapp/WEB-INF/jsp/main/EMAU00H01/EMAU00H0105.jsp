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
<title>과제접수 등록</title>
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
			$('#box_style01').append(checkListView(row));
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
		// 별점 선택
		$(".starPoint1").each(function(index) {
			$(this).click(function() {
				for (var i=0; i <= index; i++) {
					$(".starPoint1").eq(i).css("display", "none");
					$(".starPoint2").eq(i).css("display", "");
				
				}
				var value3= $(this).next().attr("value");
				$("#starData").val(value3);
				console.log(value3);
			});
		});
		$(".starPoint2").each(function(index) {
			$(this).click(function() {
				for (var i=index; i<=5; i++) {
					$(".starPoint1").eq(i).css("display", "");
					$(".starPoint2").eq(i).css("display", "none");
				}
				var value3= $(this).attr("value");
				value3 = value3 - 1;
				$("#starData").val(value3);
				console.log(value3);
			});
		});
		
		$("#button").click(function () {
			var textArea = $("textarea#buSelRoaConTec1").val();
			console.log(textArea);
			$("#buSelRoaConTec").val(textArea);
			var value = $("#star").attr("value");
			console.log("value " + value);
			var value2 = $("#star2").attr("value");
			console.log(value2);
			if($("#buAutCon").is(":checked")==false){
				alert("모든 약관에 동의 하셔야 다음 단계로 진행 가능합니다.")
			}else if($("#buAutCon2").is(":checked")==false){
				alert("모든 약관에 동의 하셔야 다음 단계로 진행 가능합니다.")
			}else{
			
			if (confirm("저장하시겠습니까?")) {
				var formSer = $('#form').serialize();
				$.post("/empo/EMAU00H01/insertEMAU00H0105.do", formSer).done(function(res){
					confirm("저장되었습니다.")
					window.location.href = "<c:url value='/empo/EMAU00J01/EMAU00J0102.do?coPk="+ coPk +"'/>";
				}).fail(function() {
					alert("실패");
				})
			}
			else {
				return false;
			}
			}
		});
		
		$("#btnSearch").click(function() { 
			$("#divResult").css("display","");
		});
		

		

		
	
		// 저장하기 버튼 클릭
		$("#formInput").submit(function () {

			if (confirm("저장하시겠습니까?")) {
				//return false;
			}
			else {
				return false;
			}
		});
	});
</script>


</head>

<body>
	<!-- s :wrap -->
	<div id="wrap">
		<div class="menu_guide">
			<c:import url="/EmpPageLink.do?link=main/include2/menu01" />
		</div>
		<!-- e :menu_guide -->

		
		<form name="form" id="form" method="post">
		<input type="hidden" name="starData" id="starData" >
		<input type="hidden" name="buSelRoaConTec" id="buSelRoaConTec" value="">
		<input type="hidden" id="coPk" name="coPk">
		<div class="contents_guide">
			<div class="box_style01" id="box_style01">
				<!-- <div>
					<ul>
						<li class="width_40"><span>업체명</span><strong>(주)에이스포장건설</strong></li>
						<li class="width_60"><span>과제명</span><strong>친환경 탄성 포장재 개발연구</strong></li>
					</ul>
				</div> -->
			</div>
			
			<h4>중소기업 R&D 기술로드맵과의 연계성</h4>
			
			<div class="table_guide bbs_write01">
				<table class="table_l">
					<caption></caption>
					<colgroup>
						<col style="width:15%;">
						<col style="width:%;">
					</colgroup>
					<tbody>
						<tr>
							<th colspan="2" class="ac">본 과제를 통해 개발하고자 하는 기술과 가장 관련성이 높은 기술로드맵을 선택합니다.</th>
						</tr>
						<tr>
							<th>기술로드맵 분류</th>
							
							<td>
								<select class="input_w20 multiple" id="buTecRodClaOne" name="buTecRodClaOne" multiple>
									<option value="">전기/전자</option>
									<option value="">정보/통신</option>
									<option value="">에너지/자원</option>
									<option value="">원자력</option>
									<option value="">환경</option>
									<option value="">건설/교통</option>
								</select>

								<select class="input_w20 multiple" id="buTecRodClaTwo" name="buTecRodClaTwo" multiple>
									<option value="">환경보건</option>
									<option value="">환경예측/감시/평가</option>
									<option value="">친환경소재/제품</option>
									<option value="">친환경공정</option>
									<option value="">측정분석장비/장치</option>
									<option value="">청정생산/설비</option>
								</select>

								<select class="input_w40 multiple" id="buTecRodClaThr" name="buTecRodClaThr" multiple>
									<option value="">환경오염 유발물질 대체물질(소재) 개발</option>
									<option value="">오염물질 제거효율향상 소재/제품 개발</option>
									<option value="">달리 분류되지 않는 친환경 소재/제품</option>
								</select>
								
								&nbsp;&nbsp;&nbsp;
								<button type="button" class="btn_style01 btn_blue btnSearch" id="btnSearch" >조회</button>

							</td>
						</tr>
					</tbody>
				</table>
			</div>
			<!-- e :bbs_write01 -->

			<div id="divResult" style="display:none;">		 
				<c:import url="/empo/EMAU00H01/EMAU00H0106.do" />
			</div>
			
		</div>
		</form>
		<!-- e :contents_guide -->
	</div>
	<!-- e :wrap -->
</body>
</html>
