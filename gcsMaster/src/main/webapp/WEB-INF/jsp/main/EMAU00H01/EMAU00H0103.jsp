<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<%
    String searchWord = request.getParameter("searchWord");
    String searchIndex = request.getParameter("searchIndex");
%>

<script type="text/javascript">
	$(document).ready(function() {
		
		$("#formPopSearch").submit(function() {
			var searchWord = $("#searchWord").val();
			if ($.trim(searchWord).length < 1) {
				alert("기관 ID 또는 기관명을 입력하세요.");
				$("#searchWord").focus();
				return false;
			}

			else {
				fnPopupOpen("/empo/EMAU00H01/EMAU00H0103.do", "#formPopSearch");	// ../js/popup.js 참고
				return false;
			}
			
		});

		$(document).on('click', '.btnPopSelect', function() {

			var orgId = $(this).parent().parent().find("td").eq(0).text();
			var orgName = $(this).parent().parent().find("td").eq(1).text();
			var orgNum = $(this).parent().parent().find("td").eq(2).text();
			var orgRepre = $(this).parent().parent().find("td").eq(3).text();
//			alert(orgId);
//			alert(orgName);
//			alert(orgNum);
//			alert(orgRepre);
			
			$(".searchOrgName").eq(<%=searchIndex%>).val(orgName);
			fnPopupClose();
		});
		
	
	});


</script>

<!-- 기관검색 팝업 -->
<div class="popup_guide box_w1000">
	<a href="javascript:void(0)" class="closebtn" onclick="fnPopupClose()">닫기</a><!--검색버튼 클릭시 팝업있음-->
	<h3>기관선택</h3>
	<div class="popup_content">
		<form name="formPopSearch" id="formPopSearch" method="post">
		<input type="hidden" name="searchIndex" id="searchIndex" value="<%=searchIndex%>"/>
		<div class="search_box01">
			<span>기관ID 또는 기관명</span> 
			<input type="text" name="searchWord" id="searchWord" value="<%=searchWord%>">
			<button type="submit">검색</button>
		</div>
		</form>

		<div class="table_guide bbs_write01">
			<table>
			  <caption></caption>
			  <colgroup>
				  <col style="width:20%;">
				  <col style="width:30%;">
				  <col style="width:20%;">
				  <col style="width:20%;">
				  <col style="width:10%;">
			  </colgroup>
			  <thead>
				<tr>
					<th>기관ID</th>
					<th>기관명</th>
					<th>사업자등록번호</th>
					<th>대표자</th>
					<th>선택</th>
				</tr>
			  </thead>
			  <tbody>
				<tr>
				  <td>SMTECH1212</td>
				  <td>에이스포장지쇼핑1</td>
				  <td>128-25-65481</td>
				  <td>기정원</td>
				  <td><button type="button" class="btn_style02 btn_gray btnPopSelect">선택</button></td>
				</tr>
				<tr>
				  <td>SMTECH1213</td>
				  <td>에이스포장지쇼핑2</td>
				  <td>128-25-65482</td>
				  <td>김영희</td>
				  <td><button type="button" class="btn_style02 btn_gray btnPopSelect">선택</button></td>
				</tr>
				<tr>
				  <td>SMTECH1214</td>
				  <td>에이스포장지쇼핑3</td>
				  <td>128-25-65483</td>
				  <td>홍길동</td>
				  <td><button type="button" class="btn_style02 btn_gray btnPopSelect">선택</button></td>
				</tr>
				<tr>
				  <td>SMTECH1215</td>
				  <td>에이스포장지쇼핑4</td>
				  <td>128-25-65484</td>
				  <td>박철수</td>
				  <td><button type="button" class="btn_style02 btn_gray btnPopSelect">선택</button></td>
				</tr>
				<tr>
				  <td>SMTECH1216</td>
				  <td>(주)에이스포장5</td>
				  <td>128-25-65485</td>
				  <td>기정민</td>
				  <td><button type="button" class="btn_style02 btn_gray btnPopSelect">선택</button></td>
				</tr>
				<tr>
				  <td>SMTECH1217</td>
				  <td>에이스포장지쇼핑6</td>
				  <td>128-25-65486</td>
				  <td>기정</td>
				  <td><button type="button" class="btn_style02 btn_gray btnPopSelect">선택</button></td>
				</tr>
			  </tbody>
			</table>
		</div>
		<!-- e :bbs_write01 -->
	</div>
	<!-- e :bbs_write01 -->
</div>
<!-- e :popup_guide -->