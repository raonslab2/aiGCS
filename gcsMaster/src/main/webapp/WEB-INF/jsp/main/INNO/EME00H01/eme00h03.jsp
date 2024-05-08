<%--
  Class Name : gA02Main.jsp
  Description : GCS
  Modification Information
 
      수정일         수정자                   수정내용
    -------    --------    ---------------------------
     2021.11.01   SCJ       GCS 생성
 
    author   : SCJ
    since    : 2021.11.01
--%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page import="egovframework.com.cmm.LoginVO" %>
 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta charset="utf-8">
<link rel="icon" href="/images/favicon.svg" type="image/svg+xml" />
<title>INNO GROUP</title>  
        <meta name="viewport"
            content="width=device-width, initial-scale=1, maximum-scale=1, minimum-scale=1, user-scalable=no">
        <c:import url="/EmpPageLink.do?link=main/include/src" />  
	<meta charset="utf-8">	
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
	<meta name="viewport" content="width=device-width, initial-scale=1" />
	<link rel="stylesheet" type="text/css" href="/inno/assets/css/jquery-ui.min.css" />
	<link rel="stylesheet" type="text/css" href="/inno/assets/css/common.css" />
	<script src="/inno/assets/js/jquery-3.6.1.min.js"></script>
	<script src="/inno/assets/js/jquery-ui.min.js"></script>
	<script src="/inno/assets/js/slick.min.js"></script>
	<script src="/inno/assets/js/common.js"></script>
	<!--나경아 추가-->
	<style>
	.photo-upload-type {
		background: transparent !important
	}
	
	.photo-upload-type .pop-container {
		left: 78%
	}
	</style>
</head>

<body>
 
	<div id="wrap">
		<!-- lnb -->
		<div class="lnb-container">
		  <!-- left menu -->
          <c:import url="/EmpPageLink.do?link=main/include/innomenu5" />            
		</div>
		<!-- container -->
		<div class="container">
			<div class="location-content">
				<div class="location-area">
					<span class="location">구 데이터</span>
				</div>
				<span class="logo-area">
					<img src="/inno/assets/images/logo.png" alt="지우회계법인">
				</span>
				<div class="menu-area">
					<div class="user-box">
						<img src="/inno/assets/images/temp_photo.png" alt="" class="photo">
						<div class="info">
							<span class="tit">관리자</span>
							<strong>김상민</strong>
						</div>
					</div>
					<div class="link-box">
						<a href="#" class="icon-out"></a>
						<a href="#" class="icon-charge"></a>
					</div>
				</div>
			</div>
			<div class="view-content">
				<div class="com-top-tab">
					<div class="com-top-tab_lt">
						<a href="target_company_12.html" class="on">완성 데이터</a>
						<a href="#" >가공 데이터</a>
						<a href="#" >기초 데이터</a>
					</div>

					<div class="com-top-tab_rt">
						<div class="menu-btn">
							<button type="button" class="excel-up-btn">엑셀 업로드</button>
							<button type="button" class="phone-add-btn">연락처 추가</button>
							<button type="button" class="sort-btn">병합 정리</button>
							<button type="button" class="trash-btn">휴지통</button>
						</div>
						<span class="tab-right-info">
							<span class="txt">가공데이터 전체</span>
							<span class="num">592,000</span>
						</span>
					</div>

					
				</div>
				
				<div class="list-info-area">
					<div class="top-search-box">
						<div class="select-wrap">
							<div class="select-item">
								<div class="com-radio-select">
									<button type="button" class="open-btn">탭 생성</button>
									<ul class="check-list">
										<li>
											<input type="radio" name="sort-radio-7-1" id="sort-radio-7-1" checked>
											<label for="sort-radio-7-1">탭 생성</label>
										</li>
									</ul>
								</div>
							</div>
							<div class="select-item">
								<div class="input-search sc2">
									<input  type="text" placeholder="신규 탭 입력">
									<button type="button" class="search-btn"></button>
								</div>
							</div>
							<div class="select-item">
								<div class="com-radio-select w-100">
									<button type="button" class="open-btn">대분류 업종</button>
									<ul class="check-list">
										<li>
											<input type="radio" name="sort-radio-1" id="sort-radio-1-1" checked>
											<label for="sort-radio-1-1">대분류 업종</label>
										</li>
									</ul>
								</div>
								<div class="com-radio-select">
									<button type="button" class="open-btn">자본금</button>
									<ul class="check-list">
										<li>
											<input type="radio" name="sort-radio-2" id="sort-radio-2-1" checked>
											<label for="sort-radio-2-1">자본금</label>
										</li>
									</ul>
								</div>
								<div class="com-radio-select">
									<button type="button" class="open-btn">설립일</button>
									<ul class="check-list">
										<li>
											<input type="radio" name="sort-radio-3" id="sort-radio-3-1" checked>
											<label for="sort-radio-3-1">설립일</label>
										</li>
									</ul>
								</div>
								<div class="com-radio-select">
									<button type="button" class="open-btn">선택검색</button>
									<ul class="check-list">
										<li>
											<input type="radio" name="sort-radio-4" id="sort-radio-4-1" checked>
											<label for="sort-radio-4-1">선택검색</label>
										</li>
									</ul>
								</div>
								<div class="input-search">
									<input type="text" placeholder="검색 키워드 입력">
									<button type="button" class="search-btn"></button>
								</div>
							</div>

							<div class="select-item">
								<div class="com-radio-select">
									<button type="button" class="open-btn">업무분장</button>
									<ul class="check-list">
										<li>
											<input type="radio" name="sort-radio-5" id="sort-radio-5-1" checked>
											<label for="sort-radio-5-1">자동분장</label>
										</li>
										<li>
											<input type="radio" name="sort-radio-5" id="sort-radio-5-2">
											<label for="sort-radio-5-2">수동분장</label>
										</li>
									</ul>
								</div>
								<div class="com-radio-select">
									<button type="button" class="open-btn">부서</button>
									<ul class="check-list">
										<li>
											<input type="radio" name="sort-radio-6" id="sort-radio-6-1" checked>
											<label for="sort-radio-6-1">부서</label>
										</li>
									</ul>
								</div>
								<div class="com-radio-select">
									<button type="button" class="open-btn">담당자</button>
									<ul class="check-list">
										<li>
											<input type="radio" name="sort-radio-7" id="sort-radio-7-1" checked>
											<label for="sort-radio-7-1">담당자</label>
										</li>
									</ul>
								</div>
								<button type="button" class="search-send-btn"></button>
							</div>
							<!-- <div class="select-item">
								<input type="file" id="execl_select" onchange="readExcel()">
								
							</div> -->
						</div>
						<div class="sort-wrap">
							
							<div class="com-radio-select">
								<button type="button" class="open-btn">10p</button>
								<ul class="check-list">
									<li>
										<input type="radio" name="sort-radio-num" id="sort-radio-num" checked>
										<label for="sort-radio-num">10p</label>
									</li>
								</ul>
							</div>
							<span class="num-txt">
								<span class="txt">전체: </span>
								<span class="num"></span>
							</span>
						</div>
					</div>
					<div class="table-input-box">
						<div class="scroll-wrap">
							<!-- <iframe width="100%" height="699" src="http://innocrm.testapp.uz/getinformation"></iframe> -->
							<iframe width="100%" height="699" src="http://innocrm.testapp.uz/organizations"></iframe>
							
						</div>
					</div>
					<div class="bottom-paging-box">
						<div class="com-paging">
							<!-- <button type="button" class="prev-btn"><span class="blind">이전</span></button>
							<button type="button" class="on">1</button>
							<button type="button">2</button>
							<button type="button">3</button>
							<button type="button">4</button>
							<button type="button">5</button>
							<button type="button" class="next-btn"><span class="blind">다음</span></button> -->
						</div>
						<!-- <div class="upload-btn-item">
							<button type="button" class="upload-btn"></button>
							<div class="com-radio-select">
								<button type="button" class="open-btn">엑셀</button>
								<ul class="check-list">
									<li>
										<input type="radio" name="bottom-radio-1" id="bottom-radio-1-1" checked>
										<label for="bottom-radio-1-1">엑셀</label>
									</li>
									<li>
										<input type="radio" name="bottom-radio-1" id="bottom-radio-1-2">
										<label for="bottom-radio-1-2">워드</label>
									</li>
								</ul>
							</div>
						</div> -->
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- <script>
		function readExcel() {
			let input = event.target,
				reader = new FileReader();
			reader.onload = function () {
				let data = reader.result;
				let workBook = XLSX.read(data, { type: 'binary' });
				workBook.SheetNames.forEach(function (sheetName) {
					console.log('SheetName: ' + sheetName);
					let rows = XLSX.utils.sheet_to_json(workBook.Sheets[sheetName]);
					console.log(JSON.stringify(rows));//문자열화

					let sheet_li_num = JSON.stringify(rows).length;
					console.log(sheet_li_num);
					
				})
			};
			reader.readAsBinaryString(input.files[0]);
		};

		
	</script> -->
</body>

</html>
