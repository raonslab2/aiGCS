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
	var coPk = "";
	$(document).ready(function() {
		
		var URLSearch = new URLSearchParams(location.search);
	    var newParam = URLSearch.toString();
	    console.log(newParam);	
	    var coPk = newParam.substring(5);
	    console.log(coPk);
	    $.post("/empo/EMAU00H01/searchPk2.do", {coPk : coPk}).done(function(res){
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
				$.post("/empo/EMAU00H01/insertEMAU00H0102.do", formSer).done(function(res){
					window.location.href = "<c:url value='/empo/EMAU00H01/EMAU00H0104.do?coPk="+ coPk +"'/>";
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


		// 기관 ID 또는 기관명 검색 버튼
		$(".btnOrgSearch").each(function(index) {
			$(this).click(function() {
				//console.log($(this));
				//console.log(index);

				var searchWord = $(".searchOrgName").eq(index).val();		
				searchWord = encodeURIComponent(searchWord);	
				index = encodeURIComponent(index);
				fnPopupOpen("/empo/EMAU00H01/EMAU00H0103.do?searchWord="+searchWord+"&searchIndex="+index, "");	// ../js/popup.js 참고

			});
		});


		// 기관정보 확인 버튼
		$(".btnOrgInfoConfirm").each(function(index) {
			$(this).click(function() {
				alert((index+1)+"번째 기관정보 확인 버튼 이벤트 입니다.");
			});
		});


		

		// 저장하기 버튼 클릭
		$("#formInput").submit(function () {

			if (confirm("저장하시겠습니까?")) {
				$(this).attr("action", "<c:url value='/empo/EMAU00H01/EMAU00H0104.do'/>");
				//return false;
			}
			else {
				return false;
			}
		});
	});
	
	var checkListView = function (row) {
		var data= 
			'<div>' +
			'<ul>' +
			'<li><span>과제명</span><strong>' + row.buPjName + '</strong></li>'
			'</ul>' +
			'</div>' ;
		return $(data);
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
						<li><span>과제명</span><strong>친환경 탄성 포장재 개발연구 친환경 탄성 포장재 개발연구 친환경 탄성 포장재 개발연구 친환경 탄성 포장재 개발연구 친환경 탄성 포장재 개발연구 친환경 탄성 포장재 개발연구 친환경 탄성 포장재 개발연구 친환경 탄성 포장재 개발연구</strong></li>
					</ul>
				</div> -->
			</div>
			
			
			<h4>주관기관</h4>
			<!-- <div class="search_box01">
				<span>기관ID 또는 기관명</span> 
				<input type="text" class="searchOrgName">
				<button type="button" class="btnOrgSearch">검색</button>
			</div> -->
		  <div class="table_guide bbs_write01">
				<table>
				  <caption></caption>
				  <thead>
					<tr>
						<th>기관명</th>
						<th>사업자등록번호</th>
						<th>법인등록번호</th>
						<th>대표자</th>
						<!-- <th>기관정보</th> -->
					</tr>
				  </thead>
				  <tbody>
					<tr>
					  <td><input type="text" class="input_w100" id="buOrgName" name="buOrgName"></td>
					  <td><input type="text" class="input_w100" id="buComRegNum" name="buComRegNum"></td>
					  <td><input type="text" class="input_w100" id="buCorRegNum" name="buCorRegNum"></td>
					  <td><input type="text" class="input_w100" id="buRep" name="buRep"></td>
					  <!-- <td><button type="button" class="btn_style02 btn_gray2 btnOrgInfoConfirm">기관정보 확인</button></td> -->
					</tr>
				  </tbody>
				</table>
			</div>
			<!-- e :bbs_write01 -->
			
			<h5>과제 관련 국가/민간연구기술개발사업 실적 선택</h5>
			<div class="table_guide bbs_write01">
				<table>
				  <caption></caption>
				  <colgroup>
					  <col style="width: 5%;">
					  <col style="width: 7%;">
					  <col >
					  <col >
					  <col >
					  <col >
					  <col >
					  <col >
					  <col >
					  <col >
				  </colgroup>
				  <thead>
					<tr>
						<th>선택</th>
						<th>과제유형</th>
						<th>사업명</th>
						<th>과제명</th>
						<th>최종목표및핵심내용</th>
						<th>참여시작일</th>
						<th>참여종료일</th>
						<th>사업비(천원)</th>
						<th>담당역할</th>
						<th>과제현황</th>
					</tr>
				  </thead>
				  <tbody>
					<tr>
					  <td><input type="text" class="input_w100" id="buAssType" name="buAssType"></td><!-- 국가/민간</td> -->
					  <td><input type="text" class="input_w100" id="buBusName" name="buBusName"></td>
					  <td><input type="text" class="input_w100" id="buProTit" name="buProTit"></td>
					  <td><input type="text" class="input_w100" id="buFinGoalCorCon" name="buFinGoalCorCon"></td>
					  <td><input type="text" class="inputCalendar" id="buParStDat" name="buParStDat"></td>
					  <td><input type="text" class="inputCalendar" id="buParEdDat" name="buParEdDat"></td>
					  <td><input type="text" class="input_w100" id="buBusExp" name="buBusExp"></td>
					  <td><input type="text" class="input_w100" id="buResRol" name="buResRol"></td><!-- 주관/공동/참여/위탁</td> -->
					  <td><input type="text" class="input_w100" id="buTasSta" name="buTasSta"></td><!-- 진행중/기술개발완료/제품개발완료/사업화성공</td> -->
					</tr>
				  </tbody>
				</table>
			</div>
			<!-- e :bbs_write01 -->
			
			
			<h4>공동개발기관</h4>
			<!-- <div class="search_box01">
				<span>기관ID 또는 기관명</span> 
				<input type="text" class="searchOrgName">
				<button type="button" class="btnOrgSearch">검색</button>
			</div> -->
		  <div class="table_guide bbs_write01">
				<table>
				  <caption></caption>
				  <thead>
					<tr>
						<th>기관명</th>
						<th>사업자등록번호</th>
						<th>법인등록번호</th>
						<th>대표자</th>
						<!-- <th>기관정보</th> -->
					</tr>
				  </thead>
				  <tbody>
					<tr>
					  <td><input type="text" class="input_w100" id="buOrgName2" name="buOrgName2"></td>
					  <td><input type="text" class="input_w100" id="buComRegNum2" name="buComRegNum2"></td>
					  <td><input type="text" class="input_w100" id="buCorRegNum2" name="buCorRegNum2"></td>
					  <td><input type="text" class="input_w100" id="buRep2" name="buRep2"></td>
					  <!-- <td><button type="button" class="btn_style02 btn_gray2 btnOrgInfoConfirm">기관정보 확인</button></td> -->
					</tr>
				  </tbody>
				</table>
			</div>
			<!-- e :bbs_write01 -->
			
			<h5>과제 관련 국가/민간연구기술개발사업 실적 선택</h5>
			<div class="table_guide bbs_write01">
				<table>
				  <caption></caption>
				  <colgroup>
					  <col style="width: 5%;">
					  <col style="width: 7%;">
					  <col >
					  <col >
					  <col >
					  <col >
					  <col >
					  <col >
					  <col >
					  <col >
				  </colgroup>
				  <thead>
					<tr>
						<th>선택</th>
						<th>과제유형</th>
						<th>사업명</th>
						<th>과제명</th>
						<th>최종목표및핵심내용</th>
						<th>참여시작일</th>
						<th>참여종료일</th>
						<th>사업비(천원)</th>
						<th>담당역할</th>
						<th>과제현황</th>
					</tr>
				  </thead>
				  <tbody>
					<tr>
					  <td><input type="text" class="input_w100" id="buAssType2" name="buAssType2"></td>
					  <td><input type="text" class="input_w100" id="buBusName2" name="buBusName2"></td>
					  <td><input type="text" class="input_w100" id="buProTit2" name="buProTit2"></td>
					  <td><input type="text" class="input_w100" id="buFinGoalCorCon2" name="buFinGoalCorCon2"></td>
					  <td><input type="text" class="inputCalendar" id="buParStDat2" name="buParStDat2"></td>
					  <td><input type="text" class="inputCalendar" id="buParEdDat2" name="buParEdDat2"></td>
					  <td><input type="text" class="input_w100" id="buBusExp2" name="buBusExp2"></td><!-- 주관/공동/참여/위탁</td> -->
					  <td><input type="text" class="input_w100" id="buResRol2" name="buResRol2"></td><!-- 진행중/기술개발완료/제품개발완료/사업화성공</td> -->
					  <td><input type="text" class="input_w100" id="buTasSta2" name="buTasSta2"></td>
					</tr>
				  </tbody>
				</table>
			</div>
			<!-- e :bbs_write01 -->
			
			
			<h4>참여기관</h4>
			<!-- <div class="search_box01">
				<span>기관ID 또는 기관명</span> 
				<input type="text" class="searchOrgName">
				<button type="button" class="btnOrgSearch">검색</button>
			</div> -->
		  <div class="table_guide bbs_write01">
				<table>
				  <caption></caption>
				  <thead>
					<tr>
						<th>기관명</th>
						<th>사업자등록번호</th>
						<th>법인등록번호</th>
						<th>대표자</th>
						<!-- <th>기관정보</th> -->
					</tr>
				  </thead>
				  <tbody>
					<tr>
					  <td><input type="text" class="input_w100" id="buOrgName3" name="buOrgName3"></td>
					  <td><input type="text" class="input_w100" id="buComRegNum3" name="buComRegNum3"></td>
					  <td><input type="text" class="input_w100" id="buCorRegNum3" name="buCorRegNum3"></td>
					  <td><input type="text" class="input_w100" id="buRep3" name="buRep3"></td>
					  <!-- <td><button type="button" class="btn_style02 btn_gray2 btnOrgInfoConfirm">기관정보 확인</button></td> -->
					</tr>
				  </tbody>
				</table>
			</div>
			<!-- e :bbs_write01 -->
			
			<h5>과제 관련 국가/민간연구기술개발사업 실적 선택</h5>
			<div class="table_guide bbs_write01">
				<table>
				  <caption></caption>
				  <colgroup>
					  <col style="width: 5%;">
					  <col style="width: 7%;">
					  <col >
					  <col >
					  <col >
					  <col >
					  <col >
					  <col >
					  <col >
					  <col >
				  </colgroup>
				  <thead>
					<tr>
						<th>선택</th>
						<th>과제유형</th>
						<th>사업명</th>
						<th>과제명</th>
						<th>최종목표및핵심내용</th>
						<th>참여시작일</th>
						<th>참여종료일</th>
						<th>사업비(천원)</th>
						<th>담당역할</th>
						<th>과제현황</th>
					</tr>
				  </thead>
				  <tbody>
					<tr>
					  <td><input type="text" class="input_w100" id="buAssType3" name="buAssType3"></td><!-- 국가/민간</td> -->
					  <td><input type="text" class="input_w100" id="buBusName3" name="buBusName3"></td>
					  <td><input type="text" class="input_w100" id="buProTit3" name="buProTit3"></td>
					  <td><input type="text" class="input_w100" id="buFinGoalCorCon3" name="buFinGoalCorCon3"></td>
					  <td><input type="text" class="inputCalendar" id="buParStDat3" name="buParStDat3"></td>
					  <td><input type="text" class="inputCalendar" id="buParEdDat3" name="buParEdDat3"></td>
					  <td><input type="text" class="input_w100" id="buBusExp3" name="buBusExp3"></td>
					  <td><input type="text" class="input_w100" id="buResRol3" name="buResRol3"></td><!-- 주관/공동/참여/위탁</td> -->
					  <td><input type="text" class="input_w100" id="buTasSta3" name="buTasSta3"></td><!-- 진행중/기술개발완료/제품개발완료/사업화성공</td> -->
					</tr>
				  </tbody>
				</table>
			</div>
			<!-- e :bbs_write01 -->
			
			
			<h4>위탁연구기관</h4>
			<!-- <div class="search_box01">
				<span>기관ID 또는 기관명</span> 
				<input type="text" class="searchOrgName">
				<button type="button" class="btnOrgSearch">검색</button>
			</div> -->
		    <div class="table_guide bbs_write01">
				<table>
				  <caption></caption>
				  <thead>
					<tr>
						<th>기관명</th>
						<th>사업자등록번호</th>
						<th>법인등록번호</th>
						<th>대표자</th>
						<!-- <th>기관정보</th> -->
					</tr>
				  </thead>
				  <tbody>
					<tr>
					  <td><input type="text" class="input_w100" id="buOrgName4" name="buOrgName4"></td>
					  <td><input type="text" class="input_w100" id="buComRegNum4" name="buComRegNum4"></td>
					  <td><input type="text" class="input_w100" id="buCorRegNum4" name="buCorRegNum4"></td>
					  <td><input type="text" class="input_w100" id="buRep4" name="buRep4"></td>
					  <!-- <td><button type="button" class="btn_style02 btn_gray2 btnOrgInfoConfirm">기관정보 확인</button></td> -->
					</tr>
				  </tbody>
				</table>
			</div>
			<!-- e :bbs_write01 -->
			
			<h5>과제 관련 국가/민간연구기술개발사업 실적 선택</h5>
			<div class="table_guide bbs_write01">
				<table>
				  <caption></caption>
				  <colgroup>
					  <col style="width: 5%;">
					  <col style="width: 7%;">
					  <col >
					  <col >
					  <col >
					  <col >
					  <col >
					  <col >
					  <col >
					  <col >
				  </colgroup>
				  <thead>
					<tr>
						<th>선택</th>
						<th>과제유형</th>
						<th>사업명</th>
						<th>과제명</th>
						<th>최종목표및핵심내용</th>
						<th>참여시작일</th>
						<th>참여종료일</th>
						<th>사업비(천원)</th>
						<th>담당역할</th>
						<th>과제현황</th>
					</tr>
				  </thead>
				  <tbody>
					<tr>
					  <td><input type="text" class="input_w100" id="buAssType4" name="buAssType4"></td><!-- 국가/민간</td> -->
					  <td><input type="text" class="input_w100" id="buBusName4" name="buBusName4"></td>
					  <td><input type="text" class="input_w100" id="buProTit4" name="buProTit4"></td>
					  <td><input type="text" class="input_w100" id="buFinGoalCorCon4" name="buFinGoalCorCon4"></td>
					  <td><input type="text" class="inputCalendar" id="buParStDat4" name="buParStDat4"></td>
					  <td><input type="text" class="inputCalendar" id="buParEdDat4" name="buParEdDat4"></td>
					  <td><input type="text" class="input_w100" id="buBusExp4" name="buBusExp4"></td>
					  <td><input type="text" class="input_w100" id="buResRol4" name="buResRol4"></td><!-- 주관/공동/참여/위탁</td> -->
					  <td><input type="text" class="input_w100" id="buTasSta4" name="buTasSta4"></td><!-- 진행중/기술개발완료/제품개발완료/사업화성공</td> -->
					</tr>
				  </tbody>
				</table>
			</div>
			<!-- e :bbs_write01 -->
			
			
			<h4>수요처</h4>
			<!-- <div class="search_box01">
				<span>기관ID 또는 기관명</span> 
				<input type="text" class="searchOrgName">
				<button type="button" class="btnOrgSearch">검색</button>
			</div> -->
		    <div class="table_guide bbs_write01">
				<table>
				  <caption></caption>
				  <thead>
					<tr>
						<th>기관명</th>
						<th>사업자등록번호</th>
						<th>법인등록번호</th>
						<th>대표자</th>
						<!-- <th>기관정보</th> -->
					</tr>
				  </thead>
				  <tbody>
					<tr>
					  <td><input type="text" class="input_w100" id="buOrgName5" name="buOrgName5"></td>
					  <td><input type="text" class="input_w100" id="buComRegNum5" name="buComRegNum5"></td>
					  <td><input type="text" class="input_w100" id="buCorRegNum5" name="buCorRegNum5"></td>
					  <td><input type="text" class="input_w100" id="buRep5" name="buRep5"></td>
					  <!-- <td><button type="button" class="btn_style02 btn_gray2 btnOrgInfoConfirm">기관정보 확인</button></td> -->
					</tr>
				  </tbody>
				</table>
			</div>
			<!-- e :bbs_write01 -->

			
			<div class="btn_guide ac">
				<a href="<c:url value='/empo/EMAU00H01/EMAU00H0101.do'/>" class="btn_style01 btn_white">이전단계</a>
				<button type="button" class="btn_style01 btn_orange" id="button">저장하기</button>
				<a href="<c:url value='/empo/EMAU00H01/EMAU00H0104.do'/>" class="btn_style01 btn_gray">다음단계</a>
			</div>
			
		</div>
		</form>
		<!-- e :contents_guide -->

		<!-- 팝업 띄울 공간 -->
		<div id="divPopup" class="overlay"></div>

	</div>
	<!-- e :wrap -->
</body>
</html>
