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
	    
		
		$("#button").click(function () {
			if (confirm("저장하시겠습니까?")) {
				var formSer = $('#form').serialize();
				$.post("/empo/EMAU00H01/insertEMAU00H0104.do", formSer).done(function(res){
					window.location.href = "<c:url value='/empo/EMAU00H01/EMAU00H0105.do?coPk="+ coPk +"'/>";
				}).fail(function() {
					alert("실패");
				})
			}
			else {
				return false;
			}
		});
		
		// 달력 입력 datepicker 설정
		$('.inputCalendar').datepicker({
			onSelect: function(formattedDate, date, inst) {
				//console.log(formattedDate);
				//console.log(date);
				//console.log(inst);
				//console.log(inst.$el.attr("id"));

				// 날짜 포맷 변경
				var newDate = formattedDate.substr(0,4) + "-" + formattedDate.substr(5,2) + "-" + formattedDate.substr(8,2) + "";
			}
		});	
	
		// 저장하기 버튼 클릭
		$("#formInput").submit(function () {

			if (confirm("저장하시겠습니까?")) {
				$(this).attr("action", "<c:url value='/empo/EMAU00H01/EMAU00H0105.do'/>");
				//return false;
			}
			else {
				return false;
			}
		});

		// 이메일 선택
		$(".sltDomain").each(function(index) {
			$(this).change(function() {
				var domain = $(this).val();
				if ($.trim(domain).length > 0) {
					$(".txtDomain").eq(index).val($(this).val());
				}
				else {
					$(".txtDomain").eq(index).val("");
				}
			});
		});
		
		// 숫자 올림버튼, 내림버튼 설정 : spinner()
		spinner();

		// 참여연구원 목록 추가 버튼
		$(".btnListNowAdd").click(function() {

			$( ".spinner" ).spinner( "destroy" );

			var tr = $(".listNow tr:last").clone();
			tr.find("input").val("");
			tr.find("select").val("");
			$(".listNow").append(tr);
			
			spinner();
			
			// 달력 입력 datepicker 설정
			$('.inputCalendar').datepicker({
				dateFormat : 'mm/dd/yyyy'		// 날짜 형태 설정		
			});	
		});
		

		// 채용 예정 참여연구원 목록 추가 버튼
		$(".btnListExpectAdd").click(function() {

			$( ".spinner" ).spinner( "destroy" );

			var tr = $(".listExpect tr:last").clone();
			tr.find("input").val("");
			tr.find("select").val("");
			$(".listExpect").append(tr);
			
			spinner();
		});
		
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
	});

	// 숫자 올림버튼, 내림버튼 설정 : spinner()
	function spinner() {
		$(".spinner").each(function () {
			var self = $(this),
				min = self.data('min'),
				max = self.data('max'),
				step = self.data('step');
			$(this).spinner({
				min: min,
				max: max,
				step: step
			})
		});
	}
	
	
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
			
			
			<h4>주관기관 주요인력</h4>
			
			<h5>대표자
				<span>※ 주관기관 대표자 기본정보는 기관정보로부터 자동으로 입력됩니다.</span>
			</h5>
			 
			<div class="table_guide bbs_write01">
				<table class="table_l">
				  <caption></caption>
				  <colgroup>
					  <col style="width:15%;">
					  <col style="width:35%;">
					  <col style="width:15%;">
					  <col style="width:35%;">
				  </colgroup>
				  <tbody>
					<tr>
					  <th>성명</th>
					  <td><input type="text" class="input_w80" id="buName" name="buName"></td>
					  <th>생년월일</th>
					  <td><input type="text" class="inputCalendar" id="buDateBir" name="buDateBir"></td>
					</tr>
					<tr>
					  <th>전화번호</th>
					  <td><input type="text" class="input_w80" id="buPhoNum" name="buPhoNum"></td>
					  <th>이메일 주소</th>
					  <td>
						<input type="text" class="input_w30 txtEmail" id="buEmAdd" name="buEmAdd">
						@
						<input type="text" class="input_w30 txtDomain" id="buEmAdd2" name="buEmAdd2">
						  <select class="input_w30 sltDomain">
						  	<option value="">직접입력</option>
							<option value="naver.com">naver.com</option>
							<option value="daum.net">daum.net</option>
					    </select>
					  </td>
					</tr>
					<tr>
					  <th>팩스번호</th>
					  <td><input type="text" class="input_w80" id="buFaxNum" name="buFaxNum"></td>
					  <th>휴대전화번호</th>
					  <td>
						<select class="input_w30" id="buMobPhoNum" name="buMobPhoNum">
						  	<option value="010">010</option>
					    </select>
						-
						<input type="text" class="input_w30" id="buMobPhoNum2" name="buMobPhoNum2">
						-
						<input type="text" class="input_w30" id="buMobPhoNum3" name="buMobPhoNum3">
					   </td>
					</tr>
					<tr>
					  <th>동종업계 종사기간</th>
					  <td><input type="text" class="input_w20" id="buDurWorSameInd" name="buDurWorSameInd"> 년</td>
					  <th>대표자 역량<br>(자유기술)</th>
					  <td><textarea class="input_w100" rows="3" id="buRepAbl" name="buRepAbl"></textarea></td>
					</tr>
				  </tbody>
				</table>
			</div>
			<!-- e :bbs_write01 -->
			
			<h5>과제책임자</h5>
			<div class="table_guide bbs_write01">
				<table class="table_l">
				  <caption></caption>
				  <colgroup>
					  <col style="width:15%;">
					  <col style="width:35%;">
					  <col style="width:15%;">
					  <col style="width:35%;">
				  </colgroup>
				  <tbody>
					<tr>
					  <th>성명</th>
					  <td><input type="text" class="input_w80" id="buName2" name="buName2"></td>
					  <th>생년월일</th>
					  <td><input type="text" class="inputCalendar" id="buDateBir2" name="buDateBir2"></td>
					</tr>
					<tr>
					  <th>전화번호</th>
					  <td><input type="text" class="input_w80" id="buPhoNum2" name="buPhoNum2"></td>
					  <th>이메일 주소</th>
					  <td>
						<input type="text" class="input_w30 txtEmail" id="buEmAdd3" name="buEmAdd3">
						@
						<input type="text" class="input_w30 txtDomain" id="buEmAdd4" name="buEmAdd4">
						  <select class="input_w30 sltDomain" >
						  	<option value="">직접입력</option>
							<option value="naver.com">naver.com</option>
							<option value="daum.net">daum.net</option>
					    </select>
					  </td>
					</tr>
					<tr>
					  <th>팩스번호</th>
					  <td><input type="text" class="input_w80" id="buFaxNum2" name="buFaxNum2"></td>
					  <th>휴대전화번호</th>
					  <td>
						<select class="input_w30" id="buMobPhoNum4" name="buMobPhoNum4">
						  	<option value="">010</option>
					    </select>
						-
						<input type="text" class="input_w30" id="buMobPhoNum5" name="buMobPhoNum5">
						-
						<input type="text" class="input_w30" id="buMobPhoNum6" name="buMobPhoNum6">
					   </td>
					</tr>
					<tr>
					  <th>동종업계 종사기간</th>
					  <td><input type="text" class="input_w20" id="buDurWorSameInd2" name="buDurWorSameInd2"> 년</td>
					  <th>과제책임자 역량<br>(자유기술)</th>
					  <td><textarea class="input_w100" rows="3" id="buTasManAbl" name="buTasManAbl"></textarea></td>
					</tr>
				  </tbody>
				</table>
			</div>
			<!-- e :bbs_write01 -->
			
			<h5>사업화책임자</h5>
			<div class="table_guide bbs_write01">
				<table class="table_l">
				  <caption></caption>
				  <colgroup>
					  <col style="width:15%;">
					  <col style="width:35%;">
					  <col style="width:15%;">
					  <col style="width:35%;">
				  </colgroup>
				  <tbody>
					<tr>
					  <th>성명</th>
					  <td><input type="text" class="input_w80" id="buName3" name="buName3"></td>
					  <th>생년월일</th>
					  <td><input type="text" class="inputCalendar" id="buDateBir3" name="buDateBir3"></td>
					</tr>
					<tr>
					  <th>전화번호</th>
					  <td><input type="text" class="input_w80" id="buPhoNum3" name="buPhoNum3"></td>
					  <th>이메일 주소</th>
					  <td>
						<input type="text" class="input_w30 txtEmail" id="buEmAdd5" name="buEmAdd5">
						@
						<input type="text" class="input_w30 txtDomain" id="buEmAdd6" name="buEmAdd6">
						  <select class="input_w30 sltDomain">
						  	<option value="">직접입력</option>
							<option value="naver.com">naver.com</option>
							<option value="daum.net">daum.net</option>
					    </select>
					  </td>
					</tr>
					<tr>
					  <th>팩스번호</th>
					  <td><input type="text" class="input_w80" id="buFaxNum3" name="buFaxNum3"></td>
					  <th>휴대전화번호</th>
					  <td>
						<select class="input_w30" id="buMobPhoNum7" name="buMobPhoNum7">
						  	<option value="">010</option>
					    </select>
						-
						<input type="text" class="input_w30" id="buMobPhoNum8" name="buMobPhoNum8">
						-
						<input type="text" class="input_w30" id="buMobPhoNum9" name="buMobPhoNum9">
					   </td>
					</tr>
					<tr>
					  <th>동종업계 종사기간</th>
					  <td><input type="text" class="input_w20" id="buDurWorSameInd3" name="buDurWorSameInd3"> 년</td>
					  <th>사업화책임자 역량<br>(자유기술)</th>
					  <td><textarea class="input_w100" rows="3" id="buSocManAbl" name="buSocManAbl"></textarea></td>
					</tr>
				  </tbody>
				</table>
			</div>
			<!-- e :bbs_write01 -->
			
			<h5>실무책임자</h5>
			<div class="table_guide bbs_write01">
				<table class="table_l">
				  <caption></caption>
				  <colgroup>
					  <col style="width:15%;">
					  <col style="width:35%;">
					  <col style="width:15%;">
					  <col style="width:35%;">
				  </colgroup>
				  <tbody>
					<tr>
					  <th>성명</th>
					  <td><input type="text" class="input_w80" id="buName4" name="buName4"></td>
					  <th>생년월일</th>
					  <td><input type="text" class="inputCalendar" id="buDateBir4" name="buDateBir4"></td>
					</tr>
					<tr>
					  <th>전화번호</th>
					  <td><input type="text" class="input_w80" id="buPhoNum4" name="buPhoNum4"></td>
					  <th>이메일 주소</th>
					  <td>
						<input type="text" class="input_w30 txtEmail" id="buEmAdd7" name="buEmAdd7">
						@
						<input type="text" class="input_w30 txtDomain" id="buEmAdd8" name="buEmAdd8">
						  <select class="input_w30 sltDomain">
						  	<option value="">직접입력</option>
							<option value="naver.com">naver.com</option>
							<option value="daum.net">daum.net</option>
					    </select>
					  </td>
					</tr>
					<tr>
					  <th>팩스번호</th>
					  <td><input type="text" class="input_w80" id="buFaxNum4" name="buFaxNum4"></td>
					  <th>휴대전화번호</th>
					  <td>
						<select class="input_w30" id="buMobPhoNum10" name="buMobPhoNum10">
						  	<option value="">010</option>
					    </select>
						-
						<input type="text" class="input_w30" id="buMobPhoNum11" name="buMobPhoNum11">
						-
						<input type="text" class="input_w30" id="buMobPhoNum12" name="buMobPhoNum12">
					   </td>
					</tr>
				  </tbody>
				</table>
			</div>
			<!-- e :bbs_write01 -->
			
			
			<h4>참여연구원</h4>
			<div class="table_guide bbs_write01">
				<table>
				  <caption></caption>
				  <colgroup>
						<col width="8%">
						<col width="%">
						<col width="8%">
						<col width="8%">
						<col width="%">
						<col width="%">
						<col width="6%">
						<col width="7%">
						<col width="8%">
						<col width="8%">
						<col width="8%">
						<col width="6%">
				  </colgroup>
				  <thead>
					<tr>
						<th>소속기관<br>유형</th>
						<th>기관명</th>
						<th>책임자<br>여부</th>
						<th>성명</th>
						<th>생년월일</th>
						<th>입사일</th>
						<th>직위</th>
						<th>연봉총액<br>(천원)</th>
						<th>최종학위</th>
						<th>보유<br>자격증</th>
						<th>참여증인<br>국가연구<br>개발사업</th>
						<th>본사업<br>참여율(%)</th>
					</tr>
				  </thead>
				  <tbody class="listNow">
						<tr>
							<td>
								<select id="buAffType" name="buAffType">
									<option>주관</option>
								</select>
							</td>
							<td>
								<select id="buOrgName" name="buOrgName">
									<option>기관명1</option>
									<option>기관명2</option>
								</select>
							</td>
							<td>
								<label class="switch">
									<input type="checkbox" id="buResOrNot" name="buResOrNot" value="1" checked>
									<span class="slider"></span>
								</label>
							</td>
							<td><input type="text" class="input_w100" id="buName5" name="buName5"></td>
							<td><input type="text" class="inputCalendar" id="buDateBir5" name="buDateBir5"></td>
							<td><input type="text" class="inputCalendar" id="buDateEnt" name="buDateEnt"></td>
							<td><input type="text" class="input_w100" id="buSpot" name="buSpot"></td>
							<td><input type="text" class="input_w100" id="buTotAnnSal" name="buTotAnnSal"></td>
							<td><input type="text" class="input_w100" id="buFinDeg" name="buFinDeg"></td>
							<td><input type="text" class="input_w100" id="buHolCer" name="buHolCer"></td>
							<td><input type="text" class="input_w100" id="buPatNatRdPro" name="buPatNatRdPro"></td>
							<td><input type="text" class="input_w100 spinner" min="0" max="100" id="buPatRatePro" name="buPatRatePro"></td>
						</tr>
				  </tbody>
				</table>
				<div class="btn_add"><span class="btnListNowAdd">추가</span></div>
			</div>
			<!-- e :bbs_write01 -->
			
			<h4>채용 예정 참여연구원</h4>
			<div class="table_guide bbs_write01">
				<table>
				  <caption></caption>
				  <colgroup>
						<col width="15%">
						<col width="20%">
						<col width="%">
						<col width="10%">
						<col width="10%">
						<col width="10%">
						<col width="10%">
				  </colgroup>
				  <thead>
					<tr>
						<th>소속기관<br>유형</th>
						<th>기관명</th>
						<th>최종학위</th>
						<th>신규채용여부</th>
						<th>청년인력여부</th>
						<th>연봉총액<br>(천원)</th>
						<th>본사업<br>참여율(%)</th>
					</tr>
				  </thead>
				  <tbody class="listExpect">
						<tr>
							<td>
								<select class="input_w90" id="buAffType2" name="buAffType2">
									<option>주관</option>
								</select>
							</td>
							<td>
								<select class="input_w90" id="buOrgName2" name="buOrgName2">
									<option>에이스포장</option>
								</select>
							</td>
							<td><input type="text" class="input_w90" id="buFinDeg2" name="buFinDeg2"></td>
							<td>
								<label class="switch">
									<input type="checkbox" id="buNewHir" name="buNewHir" value="1" checked>
									<span class="slider"></span>
								</label>
							</td>
							<td>
								<label class="switch">
									<input type="checkbox" id="buYonMan" name="buYonMan" value="1"  checked>
								<span class="slider"></span>
								</label>
							</td>
							<td><input type="text" class="input_w100" id="buTotAnnSal2" name="buTotAnnSal2"></td>
							<td><input type="text" class="input_w100 spinner" min="0" max="100" id="buPatRatePro2" name="buPatRatePro2"></td>
						</tr>
				  </tbody>
				</table>
				<div class="btn_add"><span class="btnListExpectAdd">추가</span></div>
			</div>
			<!-- e :bbs_write01 -->
			
			
			<div class="btn_guide ac">
				<a href="<c:url value='/empo/EMAU00H01/EMAU00H0102.do'/>" class="btn_style01 btn_white">이전단계</a>
				<button type="button" class="btn_style01 btn_orange" id="button">저장하기</button>
				<a href="<c:url value='/empo/EMAU00H01/EMAU00H0105.do'/>" class="btn_style01 btn_gray">다음단계</a>
			</div>
			
		</div>
		</form>
		<!-- e :contents_guide -->
	</div>
	<!-- e :wrap -->
</body>
</html>
