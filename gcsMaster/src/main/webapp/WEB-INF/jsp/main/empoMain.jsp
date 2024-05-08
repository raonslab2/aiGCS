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
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Language" content="ko" >
<title>표준프레임워크 경량환경 홈페이지 템플릿</title>
<link href="<c:url value='/'/>css/common.css" rel="stylesheet" type="text/css" >
</head>
<script type="text/javascript" src="<c:url value='/js/vue.js' />"></script> 
<script type="text/javascript" src="<c:url value='/js/jquery.min.3.1.1.js' />"></script> 

<script type="text/javascript"> 
	//alert("HEAD ALERT 경고창");
	//window.onload = function(){ 
		//alert("window.onload ALERT 경고창"); 
	//	}
	
	$(document).ready(function(){ 
		//alert("$(document).ready ALERT 경고창"); 
		<!--
		 var user = {name:'홍길동' , address:'서울시'};
		 var data = JSON.stringify(user);

 
		 
		   $.ajax({
		        url:"<c:url value='/mia/miazb0010/blockVcChallenge.do'/>",
		        data:data,
		        dataType:'text',
		        processData:false,
		        contentType:false,
		        type:'POST',
		        success: function(data){
		            console.log(data);
		            //alert(data);
		        }
		    });
          -->
 
		 
		}) 
		
  function getBlockDidDocVcCreate(){
		
	  var callback = "getBlockDidDocVcCreateResult";
	  
	  //vc challenge call
	  var tmVal = "";
	  var params = jQuery("loginForm").serialize(); 
 
      var str = $("#loginForm").serialize();
     
      $.ajax({
          url: "<c:url value='/mia/miazb0010/blockVcChallenge2.do'/>",
          type: "POST",
          data: str,
          async : false,
          success: function(data){
        	  alert("result:"+ data.result);  
        	  alert("option:"+ data.option); 
      
              
              
              tmVcChallenge = data;
              var filter = "win16|win32|win64|mac";
              var vWebType = "";
              if (navigator.platform ) {
               if (filter.indexOf(navigator.platform.toLowerCase()) < 0) {
                vWebType = "MOBILE";
               } else {
                vWebType = "PC";
               }
              }
              
             if(vWebType == "MOBILE"){
            	 window.location = "mnhis://getBlockDidDocVcCreate?userId=7308131111111&pw=111111&vcChallenge="+tmVcChallenge+"&calback="+callback;
             }else{
            	 alert("호출: mnhis://getBlockDidDocVcCreate?userId=7308131111111&pw=111111&vcChallenge="+tmVcChallenge+"&calback="+callback);
         		var tmDidDoc ="{\r\n" + 
				"\"birthdate\" : \"2000-02-22\",\r\n" + 
				"\"@context\" : [\"https://www.w3.org/2018/credentials/v1\", \"https://www.ezid.com/vc\"],\r\n" + 
				"\"employeeId\" : \"200570\",\r\n" + 
				"\"name\" : \"BlockChain\",\r\n" + 
				"\"proof\" : {\r\n" + 
				"\"challenge\" : "+tmVcChallenge+",\r\n" + 
				"\"created\" : \"2021-04-01T06:13:20Z\",\r\n" + 
				"\"proofPurpose\" : \"assertionMethod\",\r\n" + 
				"\"jws\" : \"ewoJImFsZyIgOiAiRWREU0EiLAoJImNyaXQiIDogImI2NCIsCgkiYjY0IiA6IGZhbHNlCn0..wHzLAgPTsqE2fWy4I1Oif080SgfNuqegvD3eDW5Lu7LoMBLHdzM1_uTatdWlHDPExdLN9mBVjKBGtcuRFVLhCA\",\r\n" + 
				"\"type\" : \"Ed25519Signature2018\",\r\n" + 
				"\"verificationMethod\" : \"did:nexid:kDik8c41Cmg8Dkmc04zPpo6sxlhqeS#keys-1\"\r\n" + 
				"},\r\n" + 
				"\"tid\" : \"59b632aa-107b-43da-8073-1fb40f2fa069\"\r\n" + 
				"}";
				//getBlockDidDocVcCreateResult(tmDidDoc);
             } 
          },
          error: function(){
              alert("blockVcChallenge error");
          }
      });  
  }
 
	</script>
 
<body>

<noscript>자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다.</noscript>	
<!-- 전체 레이어 시작 -->
<form name="loginForm" id="loginForm" method="post">
			<input type="hidden" name="test" id="test" value="" />
			<input type="hidden" name="vcIssueMsq" id="vcIssueMsq" value="" />
</form>
<div id="wrap">
	<!-- header 시작 -->
	<div id="header_mainsize">
	    <c:import url="/EmpPageLink.do?link=main/include/EmpIncHeader" />
	</div>
 	
	<!-- //header 끝 -->
	<!-- container 시작 -->
	<div id="main_container" style="height:400px;">

		
		단위테스트<br>
		1. DID & VC 생성<br> 
		       </a>
		    <div class="buttons">
		      <a href="#" onclick="javascript:getBlockDidDocVcCreate(); return false;">DID 및 VC 생성 테스트( 클릭 ==> 모바일에 생성 요청)
		   </div> 
		<br><br><br>
		2. VP 검증<br><br>
		
		    <div class="buttons">
		     <a href="#" onclick="javascript:fn_didVp('11'); return false;">VP 로그인 테스트 </a>
		   </div> 
	</div>
	<!-- footer 시작 -->
	<div id="footer"><c:import url="/EmpPageLink.do?link=main/include/EmpIncFooter" /></div>
	<!-- //footer 끝 -->
<!-- //전체 레이어 끝 -->
</div>
</body>
</html>

