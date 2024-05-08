<%--
  Class Name : EgovLoginUsr.jsp
  Description : Login 인증 화면
  Modification Information
 
      수정일         수정자                   수정내용
    -------    --------    ---------------------------
     2021.07.13    민병안          최초 생성 
 
    author   : 로그인기능
    since    : 2021.07.13 
--%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<title>TIPA 스케쥴기반 평가관리시스템</title>
<c:import url="/EmpPageLink.do?link=main/include/src" />

</head>

<script type="text/javascript">
	$(document).ready(function() {
		
		$("#auth").click(function() {
			var mbCode = $("#mbCode").val();
	        if(mbCode.length<1){
	        	alert("사원번호를 입력해 주시기 바랍니다.");
	        	return false;
	        }
	        
	        //사원번호 호출    d
	    	var emailAuth = $('#emailAuth').serialize(); 
	    	$.post('/empo/login/eMAU00002EmailAuth.do', emailAuth).done(function(res) {  
	    		if(res.result == 'success'){
	    			alert("인증서가 발송되었습니다.");
	    		}
	    	}).fail(function() {
	    		alert("인증 전송이 실패하였습니다.");
	    	});
	        
		});
		
	});
 </script>

<body>
	<!-- s :wrap -->
	<div id="wrap" class="login_wrap">
		<!-- s :login_guide -->
		<div class="login_guide">
			<h1>
				<span>TIPA 중소기업기술정보진흥원</span>
				<strong>비밀번호 찾기</strong>
				<div class="pwd_search_exp">
					계정으로 등록된 이메일 주소를 입력해 주세요.<br>
					인증번호를 전송해 드립니다.
				</div>
			</h1> 
			<form:form name="emailAuth" method="post" action="#LINK">
			<ul class="pwd_info">
			    
				<li><strong>사원번호</strong></li>
				<li><input type="text" name="mbCode" id="mbCode"></li>
				<li><strong>E-MAIL</strong></li>
				<li>
					<input type="text" class="email" id="mbEmail" placeholder="">
					<button type="button"  class="auth" id="auth">인증요청</button>
				</li>
				<li class="error_txt">이메일 주소를 정확하게 입력하십시요.</li>
				<li><strong>인증번호 입력</strong></li>
				<li><input type="text" placeholder=""></li>
				<li class="error_txt">이메일 주소로 발송된 인증번호를 입력해 주세요.</li>
				<li><button type="button">확인</button></li>
			</ul>
			</form:form> 
		</div>
		<!-- e :lnb_guide -->
	</div>
	<!-- e :wrap -->
</body>
</html>
