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
<title>TIPA 스케쥴기반 평가관리시스템</title>
<%@ include file = "../include/src.jsp" %>
</head>

<body>
	<!-- s :wrap -->
	<div id="wrap">
		<!-- s :lnb_guide -->
		<div class="lnb_guide">
			<c:import url="/EmpPageLink.do?link=main/include/menu" /> 
		</div>
		<!-- e :lnb_guide -->
			
		<!-- s :right_guide -->
		<div class="right_guide">

			<!-- 화면 상단 시작 -->
			<div class="top_guide">

				<!-- 1차 메뉴명 -->
				<h3>프로세스 관리</h3>

				<c:import url="/EmpPageLink.do?link=main/include/top" /> 
			</div>
			<!-- 화면 상단 종료 -->
			
			<!-- s :contents_guide -->
			<div class="contents_guide">
				<div class="submenu_guide">
					<ul>
						<!-- 2차메뉴명 -->
						<li><a href="/empo/process/eMAU00D01Main.do">프로세스 매핑</a></li>
						<li><a href="/empo/process/eMAU00D02Main.do">프로세스 설정</a></li>
						<li><a href="/empo/process/eMAU00D03Main.do" class="active">표준일정 설정</a></li>
						<li><a href="/empo/process/eMAU00D04Main.do">휴일설정</a></li>
					</ul>
				</div>
				
				<!-- s :search_box01 -->
				<div class="search_box01">
					<input type="text" class="input_w30 input_style01">
					<button type="button" class="btn_style04 btn_search01">검색</button>
				</div>
				<!-- e :search_box01 -->
				
					
				<div class="btn_guide ar mt-45 mb10">
					<button type="button" class="btn_style02 btn_gray">분류이동편집</button>
					<a href="#" class="btn_style02 btn_gray">프로세스 가져오기</a>
				</div>
				<!-- e :btn_guide -->
				
				<p class="ar text_type02 mb10">시작일, 완료일 등록 및 변경 : 오른쪽 마우스 클릭, 일자 등록(수정) 후 상단(프로세스 저장] 버튼을 클릭해주세요.</p>
				<div class="bbs_list scroll sbox_h500">
					<table>
					  <caption>사업정보</caption>
					  <thead>
						<tr>
						  <th scope="col">프로세스</th>
						  <th scope="col">주요일정</th>
						  <th scope="col">사용여부</th>
						  <th scope="col">시작일</th>
						  <th scope="col">완료일</th>
						</tr>
					  </thead>		  
					  <tbody>
						<tr>
						  <td class="text_l"><span class="step_icon icon_off01"></span> 사업공고</td>
						  <td>∨</td>
						  <td>∨</td>	
						  <td>2021.04.03</td>
						  <td>2021.04.03</td>
						</tr>
						<tr>
						  <td class="text_l"><span class="step_icon icon_off01"></span> 과제접수</td>
						  <td><input type="checkbox"></td>
						  <td><input type="checkbox"></td>	
						  <td><button type="button" class="btn_style03 btn_red" onclick="openPopup()">등록</button> </td><!--//클릭시팝업나옴-->
						  <td><button type="button" class="btn_style03 btn_white">등록</button></td>
						</tr>
						<tr>
						  <td class="text_l"><span class="step_icon icon_off01"></span> 사전점검</td>
						  <td><input type="checkbox"></td>
						  <td><input type="checkbox"></td>	
						  <td><button type="button" class="btn_style03 btn_red">등록</button></td>
						  <td><button type="button" class="btn_style03 btn_white">등록</button></td>
						</tr>  
						<tr>
						  <td class="text_l"><span class="step_icon icon_on01"></span> 서면평가</td>
						  <td><input type="checkbox"></td>
						  <td><input type="checkbox"></td>	
						  <td><button type="button" class="btn_style03 btn_red">등록</button></td>
						  <td><button type="button" class="btn_style03 btn_white">등록</button></td>
						</tr>
						<tr>
						  <td class="text_l icon_arrow"><span class="step_icon icon_off02"></span>PMS내 분과구성</td>
						  <td><input type="checkbox"></td>
						  <td><input type="checkbox"></td>	
						  <td><button type="button" class="btn_style03 btn_red">등록</button></td>
						  <td><button type="button" class="btn_style03 btn_white">등록</button></td>
						</tr>
						<tr>
						  <td class="text_l icon_arrow"><span class="step_icon icon_off02"></span>평가전문위원회 구성계획 수립</td>
						  <td><input type="checkbox"></td>
						  <td><input type="checkbox"></td>	
						  <td><button type="button" class="btn_style03 btn_red">등록</button></td>
						  <td><button type="button" class="btn_style03 btn_white">등록</button></td>
						</tr>
						<tr>
						  <td class="text_l icon_arrow"><span class="step_icon icon_off02"></span>평가전문위원회 구성</td>
						  <td><input type="checkbox"></td>
						  <td><input type="checkbox"></td>	
						  <td><button type="button" class="btn_style03 btn_red">등록</button></td>
						  <td><button type="button" class="btn_style03 btn_white">등록</button></td>
						</tr>
						<tr>
						  <td class="text_l"><span class="step_icon icon_off01"></span> 대면평가</td>
						  <td><input type="checkbox"></td>
						  <td><input type="checkbox"></td>	
						  <td><button type="button" class="btn_style03 btn_red">등록</button></td>
						  <td><button type="button" class="btn_style03 btn_white">등록</button></td>
						</tr>  
					  </tbody>
					</table>
				</div>
				<!-- e :content_table -->
					
				<!-- s :popup -->
                <div id="Layer_popup" class="Layer_popup">
                    <p class="right01"></p><!--왼쪽 말풍선인경우 class="left01" 변경-->
                    <div class="popup_guide popup_w200 popup_type02 box_mh400">
                        <a href="javascript:void(0)" class="closebtn" onclick="closePopup()">닫기</a>
                        <div class="popup_content">
                            <h5>TO-DO</h5>
							<ul class="data_list03 mb30">
								<li><input type="checkbox" checked> 적용안함</li>
								<li><input type="checkbox"> 시작일</li>
								<li><input type="checkbox"> 완료일</li>
							</ul>
							<h5>알람설정</h5>
							<ul class="data_list03">
								<li><input type="checkbox"> 설정안함</li>
								<li><input type="checkbox"> 10분 전</li>
								<li><input type="checkbox"> 30분 전</li>
								<li><input type="checkbox"> 1시간 전</li>
								<li><input type="checkbox" checked> 1일 전</li>
								<li><input type="checkbox"> 2일 전</li>
								<li><input type="checkbox"> 3일 전</li>
								<li><input type="checkbox"> 7일 전</li>
							</ul>
                        </div>
                        <!-- e :popup_content -->
                    </div>
					
					<div class="popup_guide popup_w400 popup_type01 box_mh400">
                        <a href="javascript:void(0)" class="closebtn" onclick="closePopup()">닫기</a>
                        <div class="popup_content bbs_write01">
                            <ul>
								<li><span>시작일</span>
                            		<input type="text" class="input_w60 input_style01"><button type="button" class="btn_style04 btn_date01">달력</button>
								</li>
								<li><span>완료일</span>
                            		<input type="text" class="input_w60 input_style01"><button type="button" class="btn_style04 btn_date01">달력</button>
								</li>
							</ul>
							<div class="btn_guide ac mt20">
								<button type="button" class="btn_style05 btn_gray">취소</button>
								<button type="button" class="btn_style05 btn_red">확인</button>
							</div>
							
                        </div>
                        <!-- e :popup_content -->
                    </div>
					
                </div>
                <!-- e :popup -->
                <script>
                function openPopup() {
                  document.getElementById("Layer_popup").style.display = "block";
                }

                function closePopup() {
                  document.getElementById("Layer_popup").style.display = "none";
                }
                </script>

                
					
			</div>
			<!-- e :contents_guide -->
		</div>
		<!-- e :right_guide -->
	</div>
	<!-- e :wrap -->
</body>
</html>
