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
		
		$("#button").click(function () {
			if (confirm("저장하시겠습니까?")) {
				var formSer = $('#form').serialize();
				var buPjName = $('#buPjName').val();
				$.post("/empo/EMAU00H01/insertEMAU00H0101.do", formSer).done(function(res){
					$.post("/empo/EMAU00H01/searchPk.do", {buPjName : buPjName}).done(function(res){
						res.list.forEach(function(row, index) {
							console.log(row.coPk);
						window.location.href = "<c:url value='/empo/EMAU00H01/EMAU00H0102.do?coPk="+ row.coPk +"'/>";
						});
						alert(row.coPk);
					}).fail(function() {
						alert("실패");
					})
				}).fail(function() {
					alert("실패");
				})
			}
			else {
				return false;
			}
		});

		
		console.log($('#test').val());
		// 달력 입력 datepicker 설정
		$('.inputCalendar').datepicker({
			onSelect: function(formattedDate, date, inst) {
				//console.log(formattedDate);
				//console.log(date);
				//console.log(inst);
				//console.log(inst.$el.attr("id"));

				// 날짜 포맷 변경
				var newDate = formattedDate.substr(0,4) + "-" + formattedDate.substr(5,2) + "-" + formattedDate.substr(8,2) + "";
				inst.$el.val(newDate);

				var id = inst.$el.attr("id");

				// 1차년도 개발기간 시작일자가 입력되면 총개발기간 시작일자 입력
				if (id == "buStepOneSt") {
					$("#buDevAllSt").val(newDate);
				} 

				// 3차년도 개발기간 완료일자가 입력되면 총개발기간 완료일자 입력
				else if (id == "buStepThrEd") {
					$("#buDevAllEd").val(newDate);
				}
			}
		});	

		// 저장하기 버튼 클릭
		$("#formInput").submit(function () {

			if (confirm("저장하시겠습니까?")) {
				$(this).attr("action", "<c:url value='/empo/EMAU00H01/EMAU00H0102.do'/>");
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

		<form id="form" name="form" method="post">
		<div class="contents_guide">
			<h4>사업개요</h4>
			<div class="table_guide bbs_write01">
				<table class=" table_l">
				  <caption></caption>
				  <tbody>
					<tr>
					  <th scope="row">사업분류</th>
					  <td><select class="input_w50" id="buCate" name ="buCate">
						  	<option>사업분류 예시</option>
						  </select>
					  </td>
					  <th scope="row">과제번호</th>
					  <td><input type="text" class="input_w50 input_disable" readonly id="buNum" name="buNum"> 자동부여</td>
					</tr>
					<tr>
					  <th scope="row">공고</th>
					  <td><select class="input_w90" id="buNotice" name ="buNotice">
						  	<option>사업공고 예시</option>
						  </select>
					  </td>
					  <th scope="row">과제명</th>
					  <td><input type="text" class="input_w90" id="buPjName" name ="buPjName"></td>
					</tr>
					<tr>
					  <th scope="row">세부공고</th>
					  <td><select class="input_w90" id="buPjDeNotice" name ="buPjDeNotice">
						  	<option>사업세부공고 예시</option>
						  </select>
					  </td>
					  <th scope="row">제품/서비스명</th>
					  <td><input type="text" class="input_w90" id="buPjService" name ="buPjService"></td>
					</tr>
				  </tbody>
				</table>
			</div>
			<!-- e :bbs_write01 -->
			
			<h4>과제개요</h4>
			<div class="table_guide bbs_write01">
				<table class=" table_l">
				  <caption></caption>
				  <tbody>
					<tr>
					  <th scope="row">1차년도 개발기간</th>
					  <td><input type="text" class="inputCalendar" id="buStepOneSt" name ="buStepOneSt" > ~ <input type="text" class="inputCalendar" id=buStepOneEd name ="buStepOneEd"></td>
					  <th scope="row" rowspan="3">총개발기간</th>
					  <td rowspan="3"><input type="text" class="inputCalendar" id="buDevAllSt" name ="buDevAllSt"> ~ <input type="text" class="inputCalendar" id="buDevAllEd" name ="buDevAllEd"></td>
					  <th scope="row" rowspan="3">보안등급</th>
					  <td rowspan="3"><label><input type="radio" class="buSecGrade" name ="buSecGrade" value="1" checked> 보안과제</label> <label><input type="radio" class="buSecGrade" value="0" name ="buSecGrade"> 일반과제</label></td>
					</tr>
					<tr>
					  <th scope="row">2차년도 개발기간</th>
					  <td><input type="text" class="inputCalendar" id="buStepTwoSt" name ="buStepTwoSt"> ~ <input type="text" class="inputCalendar" id="buStepTwoEd" name ="buStepTwoEd"></td>
					</tr>
					<tr>
					  <th scope="row">3차년도 개발기간</th>
					  <td><input type="text" class="inputCalendar" id="buStepThrSt" name ="buStepThrSt"> ~ <input type="text" class="inputCalendar" id="buStepThrEd" name ="buStepThrEd"></td>
					</tr>
					<tr>
					  <th scope="row">최종목표 요약</th>
					  <td colspan="5"><textarea rows="5" class="input_w100" id="buObjSumEd" name ="buObjSumEd"></textarea></td>
					</tr>
					<tr>
					  <th scope="row">1차년도 개발내용 요약</th>
					  <td colspan="5"><textarea rows="5" class="input_w100" id="buStepOneSum" name ="buStepOneSum"></textarea></td>
					</tr>
					<tr>
					  <th scope="row">2차년도 개발내용 요약</th>
					  <td colspan="5"><textarea rows="5" class="input_w100" id="buStepTwoSum" name ="buStepTwoSum"></textarea></td>
					</tr>
					<tr>
					  <th scope="row">3차년도 개발내용 요약</th>
					  <td colspan="5"><textarea rows="5" class="input_w100" id="buStepThrSum" name ="buStepThrSum"></textarea></td>
					</tr>
					<tr>
					  <th scope="row">키워드 (한글)</th>
					  <td colspan="5"><input type="text" class="input_w15" id="buKeywordKor" name ="buKeywordKor"> <input type="text" class="input_w15" id="buKeywordKor2" name ="buKeywordKor2"> <input type="text" class="input_w15" id="buKeywordKor3" name ="buKeywordKor3"> <input type="text" class="input_w15" id="buKeywordKor4" name ="buKeywordKor4"> <input type="text" class="input_w15" id="buKeywordKor5" name ="buKeywordKor5"></td>
					</tr>
					<tr>
					  <th scope="row">키워드 (영문)</th>
					  <td colspan="5"><input type="text" class="input_w15" id="buKeywordEng" name ="buKeywordEng"> <input type="text" class="input_w15" id="buKeywordEng2" name ="buKeywordEng2"> <input type="text" class="input_w15" id="buKeywordEng3" name ="buKeywordEng3"> <input type="text" class="input_w15" id="buKeywordEng4" name ="buKeywordEng4"> <input type="text" class="input_w15" id="buKeywordEng5" name ="buKeywordEng5"></td>
					</tr>
				  </tbody>
				</table>
			</div>
			<!-- e :bbs_write01 -->
			
			<h4>과제기술 분류</h4>
			<div class="table_guide bbs_write01">
				<table class=" table_l">
				  <tbody>
					<tr>
					  <th scope="row">산업기술표준분류</th>
					  <td>
					  	<select class="input_w30" id="buTecStaGro" name ="buTecStaGro" >
							<option>선택</option>
						</select>
						<select class="input_w30" id="buTecStaGro2" name ="buTecStaGro2">
							<option>해당없음</option>
						</select>
						<select class="input_w30" id="buTecStaGro3" name ="buTecStaGro3">
							<option>해당없음</option>
						</select>
					  </td>
					  <th scope="row">적용분야</th>
					  <td>
					  	<select class="input_w90" id="buApp" name ="buApp">
							<option>선택</option>
						</select>
					  </td>
					</tr>
					<tr>
					  <th scope="row">6T분류</th>
					  <td>
						<select class="input_w30" id="bu6tGro" name ="bu6tGro">
							<option>선택</option>
						</select>
						<select class="input_w30" id="bu6tGro2" name ="bu6tGro2">
							<option>해당없음</option>
						</select>
						<select class="input_w30" id="bu6tGro3" name ="bu6tGro3">
							<option>해당없음</option>
						</select>
					  </td>
					  <th scope="row">10대기술분류</th>
					  <td>
					  	<select class="input_w90" id="bu10MTech" name ="bu10MTech">
							<option>선택</option>
						</select>
					  </td>
					</tr>
					<tr>
					  <th scope="row">국가과학기술분류</th>
					  <td colspan="3">
						<select class="input_w30" id="buNatSciTecGro" name ="buNatSciTecGro">
							<option>선택</option>
						</select>
						<select class="input_w30" id="buNatSciTecGro2" name ="buNatSciTecGro2">
							<option>해당없음</option>
						</select>
						<select class="input_w30" id="buNatSciTecGro3" name ="buNatSciTecGro3">
							<option>해당없음</option>
						</select>
					  </td>
					</tr>
					<tr>
					  <th scope="row">국가중점기술분류</th>
					  <td colspan="3">
						<select class="input_w30" id="buNatEmpTecGro" name ="buNatEmpTecGro">
							<option>선택</option>
						</select>
						<select class="input_w30" id="buNatEmpTecGro2" name ="buNatEmpTecGro2">
							<option>해당없음</option>
						</select>
						<select class="input_w30" id="buNatEmpTecGro3" name ="buNatEmpTecGro3">
							<option>해당없음</option>
						</select>
					  </td>
					</tr>
					<tr>
					  <th scope="row">기술로드맵전략분류</th>
					  <td colspan="3">
						<select class="input_w30" id="buTecMapStrGro" name ="buTecMapStrGro">
							<option>선택</option>
						</select>
						<select class="input_w30" id="buTecMapStrGro2" name ="buTecMapStrGro2">
							<option>해당없음</option>
						</select>
						<select class="input_w30" id="buTecMapStrGro3" name ="buTecMapStrGro3">
							<option>해당없음</option>
						</select>
					  </td>
					</tr>
					<tr>
					  <th scope="row">한국표준산업분류</th>
					  <td colspan="3">
						<select class="input_w15" id="buKorStaIndGro" name ="buKorStaIndGro">
							<option>선택</option>
						</select>
						<select class="input_w15" id="buKorStaIndGro2" name ="buKorStaIndGro2">
							<option>해당없음</option>
						</select>
						<select class="input_w15" id="buKorStaIndGro3" name ="buKorStaIndGro3">
							<option>해당없음</option>
						</select>
						<select class="input_w15" id="buKorStaIndGro4" name ="buKorStaIndGro4">
							<option>해당없음</option>
						</select>
						<select class="input_w15" id="buKorStaIndGro5" name ="buKorStaIndGro5">
							<option>해당없음</option>
						</select>
					  </td>
					</tr>
				  </tbody>
				</table>
			</div>
			<!-- e :bbs_write01 -->
			
			<div class="btn_guide ac">
				<button type="button" class="btn_style01 btn_orange" id="button">저장하기</button>
				<a href="<c:url value='/empo/EMAU00H01/EMAU00H0102.do'/>" class="btn_style01 btn_gray">다음단계</a>
			</div>
			
		</div>
		</form>
		<!-- e :contents_guide -->
	</div>
	<!-- e :wrap -->
</body>
</html>
