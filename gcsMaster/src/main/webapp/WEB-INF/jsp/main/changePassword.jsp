<%--
  Class Name : EgovMainView.jsp 
  Description : 메인화면
  Modification Information
 
      수정일         수정자                   수정내용
    -------    --------    ---------------------------
     2011.08.31   JJY       경량환경 버전 생성
 
    author   : 실행환경개발팀 JJY
    since    : 2011.08.31 
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

<title>Simple Layout Demo</title>

<script type="text/javascript" src="<c:url value='/'/>js/jquery.min.3.1.1.js"></script>
<script type="text/javascript" src="<c:url value='/'/>js/jquery.ui.all.js"></script>
<script type="text/javascript" src="<c:url value='/'/>js/jquery.layout.js"></script>
<link href="<c:url value='/'/>css/layout_all.css" rel="stylesheet" type="text/css">

</head>
<body>
	<div>
		기존 비밀번호 : <input type="text" /><br/>
		변경 비밀번호 : <input type="text" /><br/>
		비밀번호 확인 : <input type="text" /><br/><br/>
		<button id="change" class="btn w85 type1">확인</button>
		<button id="cancel" class="btn w85 type1">취소</button>
	</div>
</body>
</html>
<script>
;(function() {
	
})();
	
</script>