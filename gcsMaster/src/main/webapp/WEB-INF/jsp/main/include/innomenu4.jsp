<%--
  Class Name : EgovIncHeader.jsp
  Description : 화면상단 Header(include)
  Modification Information
 
      수정일         수정자                   수정내용
    -------    --------    ---------------------------
     2021.05.18   MBA       신규
 
    author   : 평가계획관리시스템 MBA
    since    : 2021.05.18 
--%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="egovframework.com.cmm.LoginVO" %> 

<%
    String url = request.getRequestURI() ;
	LoginVO user = (LoginVO) request.getSession().getAttribute("LoginVO");
	String grmName = (String) user.getGrmName();
	String mbAuth = (String) user.getMbAuth();
	System.out.println(mbAuth);
%>

			<a href="target_company_A.html"><span class="logo"><span class="blind">Target CRM</span></span></a>
			<ul class="menu-list">
				<li>
					<a  href="<c:url value='/inno/EMA00H01/h01001.do'/>" class="menu-type"><span>주소록관리</span></a>
					<ul class="sub-menu-list">
						<li>
							<a <% if (url.indexOf("h01001") > -1) { %> class="on" <% } %> href="<c:url value='/inno/EMA00H01/h01001.do'/>">최근기록</a>
						</li>
						<li>
							<a <% if (url.indexOf("h01002") > -1) { %> class="on" <% } %> href="<c:url value='/inno/EMA00H01/h01002.do'/>">미해결기록</a>
						</li>
						<li>
							<a <% if (url.indexOf("h01003") > -1) { %> class="on" <% } %> href="<c:url value='/inno/EMA00H01/h01003.do'/>">전체기록</a>
						</li>
						<li>
							<a <% if (url.indexOf("h01004") > -1) { %> class="on" <% } %> href="<c:url value='/inno/EMA00H01/h01004.do'/>">주소록관리</a>
						</li>
						<li>
							<a <% if (url.indexOf("h01005") > -1) { %> class="on" <% } %> href="<c:url value='/inno/EMA00H01/h01005.do'/>">개인관리</a>
						</li>
						<li>
							<a <% if (url.indexOf("h01006") > -1) { %> class="on" <% } %> href="<c:url value='/inno/EMA00H01/h01006.do'/>">거래처관리</a>
						</li>
						<li>
							<a <% if (url.indexOf("h01007") > -1) { %> class="on" <% } %> href="<c:url value='/inno/EMA00H01/h01007.do'/>">비서업무대행</a>
						</li>
					</ul>
				</li>
				<li>
					<a href="<c:url value='/inno/EMB00H01/emb00h01.do'/>" ><span>스케줄</span></a>
				</li>
				<li>
					<a href="<c:url value='/inno/EMC00H01/emc00h01.do'/>" class="menu-type"><span>타깃 세일즈</span></a>
					<ul class="sub-menu-list">
						<li>
							<a <% if (url.indexOf("emc00h01") > -1) { %> class="on" <% } %> href="<c:url value='/inno/EMC00H01/emc00h01.do'/>">리스트</a>
						</li>
						<li>
							<a <% if (url.indexOf("emc00h02") > -1) { %> class="on" <% } %> href="<c:url value='/inno/EMC00H01/emc00h02.do'/>">타깃 리스트</a>
						</li>
						<li>
							<a <% if (url.indexOf("emc00h03") > -1) { %> class="on" <% } %> href="<c:url value='/inno/EMC00H01/emc00h03.do'/>">찜리스트</a>
						</li>
						<li>
							<a <% if (url.indexOf("emc00h04") > -1) { %> class="on" <% } %> href="<c:url value='/inno/EMC00H01/emc00h04.do'/>">경로예약</a>
						</li>
						<li>
							<a <% if (url.indexOf("emc00h05") > -1) { %> class="on" <% } %> href="<c:url value='/inno/EMC00H01/emc00h05.do'/>">방문상황</a>
						</li>
						<li>
							<a <% if (url.indexOf("emc00h06") > -1) { %> class="on" <% } %> href="<c:url value='/inno/EMC00H01/emc00h06.do'/>">업무대행</a>
						</li>
					</ul>
				</li>
				<li>
					<a href="<c:url value='/inno/EMD00H01/emd00h01.do'/>" class="menu-type on"><span>프로모션</span></a>
					<ul class="sub-menu-list">
						<li>
							<a <% if (url.indexOf("emd00h01") > -1) { %> class="on" <% } %> href="<c:url value='/inno/EMD00H01/emd00h01.do'/>">TM</a>
						</li>
						<li>
							<a <% if (url.indexOf("emd00h02") > -1) { %> class="on" <% } %> href="<c:url value='/inno/EMD00H01/emd00h02.do'/>">PR</a>
						</li>
					</ul>
				</li>


				<li>
					<a <% if (url.indexOf("eme00h01") > -1) { %> class="on" <% } %> href="<c:url value='/inno/EME00H01/eme00h01.do'/>"><span>TM</span></a>
				</li>
				<li>
					<a <% if (url.indexOf("eme00h02") > -1) { %> class="on" <% } %> href="<c:url value='/inno/EME00H01/eme00h02.do'/>"><span>신규 데이터</span></a>
				</li>
				<li>
					<a <% if (url.indexOf("eme00h03") > -1) { %> class="on" <% } %> href="<c:url value='/inno/EME00H01/eme00h03.do'/>"><span>구 데이터</span></a>
				</li>
				<li>
					<a <% if (url.indexOf("eme00h04") > -1) { %> class="on" <% } %> href="<c:url value='/inno/EME00H01/eme00h04.do'/>"><span>리서치</span></a>
				</li>
				<li>
					<a <% if (url.indexOf("eme00h05") > -1) { %> class="on" <% } %> href="<c:url value='/inno/EME00H01/eme00h05.do'/>"><span>CRM</span></a>
				</li>
			</ul>