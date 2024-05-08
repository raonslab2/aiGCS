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
<title>과제접수현황</title>
<c:import url="/EmpPageLink.do?link=main/include2/src" />  


<script type="text/javascript">

	$(document).ready(function() {	

		$("#searchForm").submit(function () {
			$(this).attr("action", "<c:url value='/empo/EMAU00H01/EMAU00H0108.do'/>");
		});
		
		$(".btnList12").click(function() {
			window.location.href = "<c:url value='/empo/EMAU00J01/EMAU00J0102.do'/>";
		});
		
	});

		

	// 기관명 클릭했을 때 과제접수 화면으로 이동
	function fnGoRevieve() {
		window.location.href = "<c:url value='/empo/EMAU00H01/EMAU00H0101.do'/>";
	}

	

	// 과제명 클릭했을 때 과제접수 현황으로 이동
	function fnGoState() {
		window.location.href = "<c:url value='/empo/EMAU00J01/EMAU00J0101.do'/>";
	}
	


</script>

</head>

<body>
	<!-- s :wrap -->
	<div id="wrap">
		<h3>과제접수 현황</h3>
		<!-- e :menu_guide -->
		<div class="contents_guide">

			<form name="searchForm" id="searchForm" method="post">
			<div class="box_style01 box_style02">
				<div>
					<ul>
						<li><span>기관명</span><strong><input type="text" class="input_w100" placeholder="기관명을 입력하세요."></strong></li>
						<li><span>세부사업</span><strong><input type="text" class="input_w100" placeholder="세부사업명을 입력하세요."></strong></li>
					</ul>
					<div class="btn_guide">
						<button type="submit"  class="btn_style01 btn_blue">조회</button>
					</div>
				</div>
			</div>
			</form>
			
			<div class="table_guide bbs_list">
                <table>
                    <caption></caption>

                    <thead>
                    <tr>
                      <th scope="col">기관명</th>
                      <th scope="col">세부사업명</th>
                      <th scope="col">과제명</th>
                      <th scope="col">등록일시</th>
                      <th scope="col">평가</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                      <td><a href="javascript:void(0);" onclick="fnGoRevieve();">가이스트코리아</a></td>
                      <td class="text_l">중소기업혁신개발사업(수출지향형) 1차</td>
                      <td class="text_l"><a href="javascript:void(0);" onclick="fnGoState();">친환경 탄성개발제 연구</a></td>
                      <td>2021.09.21 09:00</td>
                      <td><button type="button" class="btn_style01 btn_blue" onclick="location.href='<c:url value='/empo/EMAU00J01/EMAU00J0102.do'/>'" >평가하기</button></td>
                    </tr>
                    <tr>
                      <td><a href="javascript:void(0);" onclick="fnGoRevieve();">가이스트코리아</a></td>
                      <td class="text_l">중소기업혁신개발사업(수출지향형) 1차</td>
					  <td class="text_l"><a href="javascript:void(0);" onclick="fnGoState();">친환경 탄성개발제 연구</a></td>
					  <td>2021.09.21 09:00</td>
                      <td><button type="button" class="btn_style01 btn_blue" onclick="location.href='<c:url value='/empo/EMAU00J01/EMAU00J0102.do'/>'" >평가하기</button></td>
                    </tr>
					<tr>
                      <td><a href="javascript:void(0);" onclick="fnGoRevieve();">가이스트코리아</a></td>
                      <td class="text_l">중소기업혁신개발사업(수출지향형) 1차</td>
					  <td class="text_l"><a href="javascript:void(0);" onclick="fnGoState();">친환경 탄성개발제 연구</a></td>
                      <td>2021.09.21 09:00</td>
                      <td><button type="button" class="btn_style01 btn_blue" onclick="location.href='<c:url value='/empo/EMAU00J01/EMAU00J0102.do'/>'" >평가하기</button></td>
                    </tr>
					<tr>
                      <td><a href="javascript:void(0);" onclick="fnGoRevieve();">가이스트코리아</a></td>
                      <td class="text_l">중소기업혁신개발사업(수출지향형) 1차</td>
                      <td class="text_l"><a href="javascript:void(0);" onclick="fnGoState();">친환경 탄성개발제 연구</a></td>
                      <td>2021.09.21 09:00</td>
                      <td><button type="button" class="btn_style01 btn_blue" onclick="location.href='<c:url value='/empo/EMAU00J01/EMAU00J0102.do'/>'" >평가하기</button></td>
                    </tr>
					<tr>
                      <td><a href="javascript:void(0);" onclick="fnGoRevieve();">가이스트코리아</a></td>
                      <td class="text_l">중소기업혁신개발사업(수출지향형) 1차</td>
                      <td class="text_l"><a href="javascript:void(0);" onclick="fnGoState();">친환경 탄성개발제 연구</a></td>
                      <td>2021.09.21 09:00</td>
                      <td><button type="button" class="btn_style01 btn_blue" onclick="location.href='<c:url value='/empo/EMAU00J01/EMAU00J0102.do'/>'" >평가하기</button></td>
                    </tr>
					<tr>
                      <td><a href="javascript:void(0);" onclick="fnGoRevieve();">가이스트코리아</a></td>
                      <td class="text_l">중소기업혁신개발사업(수출지향형) 1차</td>
                      <td class="text_l"><a href="#">친환경 탄성개발제 연구</a></td>
                      <td>2021.09.21 09:00</td>
                      <td><button type="button" class="btn_style01 btn_blue" onclick="location.href='<c:url value='/empo/EMAU00J01/EMAU00J0102.do'/>'" >평가하기</button></td>
                    </tr>
                    <tr>
                      <td><a href="javascript:void(0);" onclick="fnGoRevieve();">가이스트코리아</a></td>
                      <td class="text_l">중소기업혁신개발사업(수출지향형) 1차</td>
                      <td class="text_l"><a href="javascript:void(0);" onclick="fnGoState();">친환경 탄성개발제 연구</a></td>
                      <td>2021.09.21 09:00</td>
                      <td><button type="button" class="btn_style01 btn_blue" onclick="location.href='<c:url value='/empo/EMAU00J01/EMAU00J0102.do'/>'" >평가하기</button></td>
                    </tr>
					<tr>
                      <td><a href="javascript:void(0);" onclick="fnGoRevieve();">가이스트코리아</a></td>
                      <td class="text_l">중소기업혁신개발사업(수출지향형) 1차</td>
                      <td class="text_l"><a href="javascript:void(0);" onclick="fnGoState();">친환경 탄성개발제 연구</a></td>
                      <td>2021.09.21 09:00</td>
                      <td><button type="button" class="btn_style01 btn_blue" onclick="location.href='<c:url value='/empo/EMAU00J01/EMAU00J0102.do'/>'" >평가하기</button></td>
                    </tr>
					<tr>
                      <td><a href="javascript:void(0);" onclick="fnGoRevieve();">가이스트코리아</a></td>
                      <td class="text_l">중소기업혁신개발사업(수출지향형) 1차</td>
                      <td class="text_l"><a href="javascript:void(0);" onclick="fnGoState();">친환경 탄성개발제 연구</a></td>
                      <td>2021.09.21 09:00</td>
                      <td><button type="button" class="btn_style01 btn_blue" onclick="location.href='<c:url value='/empo/EMAU00J01/EMAU00J0102.do'/>'" >평가하기</button></td>
                    </tr>
					<tr>
                      <td><a href="javascript:void(0);" onclick="fnGoRevieve();">가이스트코리아</a></td>
                      <td class="text_l">중소기업혁신개발사업(수출지향형) 1차</td>
                      <td class="text_l"><a href="javascript:void(0);" onclick="fnGoState();">친환경 탄성개발제 연구</a></td>
                      <td>2021.09.21 09:00</td>
                      <td><button type="button" class="btn_style01 btn_blue" onclick="location.href='<c:url value='/empo/EMAU00J01/EMAU00J0102.do'/>'" >평가하기</button></td>
                    </tr>
                  </tbody>
                </table>
            </div>
            <!-- e :bbs_list -->

            <div class="bbs_page">
              <ul>
                <li class="first"><a href="#" title="첫 페이지 바로가기"><img src="../../images/bbs_prev02.gif" alt="첫 페이지"></a></li>
                <li class="prev"><a href="#" title="이전 페이지(1page) 바로가기"><img src="../../images/bbs_prev01.gif" alt="이전 페이지"></a></li>
                <li class="active">1</li>
                <li class=""><a href="#" title="2페이지 바로가기">2</a></li>
                <li class=""><a href="#" title="3페이지 바로가기">3</a></li>
                <li class=""><a href="#" title="4페이지 바로가기">4</a></li>
                <li class=""><a href="#" title="5페이지 바로가기">5</a></li>
                <li class="next"><a href="#" title="다음 페이지(11page) 바로가기"><img src="../../images/bbs_next01.gif" alt="다음 페이지"></a></li>
                <li class="last"><a href="#" title="끝 페이지(67page) 바로가기"><img src="../../images/bbs_next02.gif" alt="마지막 페이지"></a></li>
              </ul>
            </div>
            <!-- e :bbs_page -->
			
		</div>
		<!-- e :contents_guide -->
	</div>
	<!-- e :wrap -->
</body>
<script>
$(document).ready(function() {
	$.post("/empo/EMAU00H01/searchBusiness.do")
	
});

</script>
</html>
