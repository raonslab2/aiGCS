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
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

	<title>Simple Layout Demo</title> 
	

	<script type="text/javascript" src="<c:url value='/'/>js/jquery.min.3.1.1.js"></script>
	<script type="text/javascript" src="<c:url value='/'/>js/jquery.ui.all.js"></script>
	<script type="text/javascript" src="<c:url value='/'/>js/jquery.layout.js"></script>

	<script type="text/javascript" src="<c:url value='/'/>js/complex.js"></script>
	
	<link href="<c:url value='/'/>css/common.css" rel="stylesheet" type="text/css" >
	<link href="<c:url value='/'/>css/layout_all.css" rel="stylesheet" type="text/css" >

	<script type="text/javascript">

	var myLayout; // a var is required because this page utilizes: myLayout.allowOverflow() method

	$(document).ready(function () {
		//년도
		setDateBox();
		
		
		myLayout = $('body').layout({
			// enable showOverflow on west-pane so popups will overlap north pane
			west__showOverflowOnHover: true

		//,	west__fxSettings_open: { easing: "easeOutBounce", duration: 750 }
		});
		
		var mbCode = $('#mCode').val(); 
		var data = {
			"mbCode": mbCode
		}
		var jsonData = JSON.stringify(data);
		//alert("jsonData::"+jsonData);
		
		$.ajax({
			type: 'post'
			, url: '/empo/rpa/eMAU00RpaTest.do'
			, data : jsonData
			, contentType : "application/json; charset=utf-8"
			, dataType: "json" // 서버에서 보내줄 데이터의 타입 
			, success : function(res) {
				var result = res.list; 
				//alert("post result::"+result)
				
		          		
			}
			, error : function() {
				alert("post 실패")
			}
			
		});
		 
 
 	});
	
	   // select box 연도 , 월 표시
    function setDateBox(){
        var dt = new Date();
        var year = "";
        var com_year = dt.getFullYear();
        // 발행 뿌려주기
        //$("#YEAR").append("<option value=''>년도</option>");
        // 올해 기준으로5년전을 보여준다.
        for(var y = (com_year-4); y <= (com_year); y++){
        	if(y == com_year ){
        		$("#YEAR").append("<option selected value='"+ y +"'>"+ y + " 년" +"</option>");
        	}else{
        		$("#YEAR").append("<option value='"+ y +"'>"+ y + " 년" +"</option>");
        	}
            
        }
        // 월 뿌려주기(1월부터 12월)
        var month;
        $("#MONTH").append("<option value=''>월</option>");
        for(var i = 1; i <= 12; i++){
            $("#MONTH").append("<option value='"+ i +"'>"+ i + " 월" +"</option>");
        }
    }
 
	
    function press(event) {
        if (event.keyCode==13) {
            fn_select('1');
        }
    }

    function fn_select(pageNo){
        document.frm.pageIndex.value = pageNo; 
        document.frm.action = "<c:url value='/empo/business/eMAU00E01Main.do'/>";
        document.frm.submit();
    }
    function fn_egov_insert_addbbsUseInf(){
        document.frm.action = "<c:url value='/cop/com/addBBSUseInf.do'/>";
        document.frm.submit();      
    }
    function fn_egov_select_bbsUseInf(bbsId, trgetId){
        document.frm.bbsId.value = bbsId;
        document.frm.trgetId.value = trgetId;
        document.frm.action = "<c:url value='/cop/com/selectBBSUseInf.do'/>";
        document.frm.submit();
    }

	</script>
 
<style type="text/css">
    h1 {font-size:12px;}
    caption {visibility:hidden; font-size:0; height:0; margin:0; padding:0; line-height:0;}
    
    A:link    { color: #000000; text-decoration:none; }
    A:visited { color: #000000; text-decoration:none; }
    A:active  { color: #000000; text-decoration:none; }
    A:hover   { color: #fa2e2e; text-decoration:none; }
</style>
</head>
<body>
 
    	
    	
<!-- manually attach allowOverflow method to pane -->
<div class="ui-layout-north" onmouseover="myLayout.allowOverflow('north')" onmouseout="myLayout.resetOverflow(this)">
   <c:import url="/EmpPageLink.do?link=main/include/EmpIncHeader" />
</div>

<!-- allowOverflow auto-attached by option: west__showOverflowOnHover = true -->
<div class="ui-layout-west">
	<c:import url="/EmpPageLink.do?link=main/include/EmpIncMenu" />
</div>

<div class="ui-layout-south">
	하단 &nbsp;
	<button onclick="myLayout.toggle('north')">Toggle North Pane</button>
</div>

<div class="ui-layout-east">
	This is the east pane, closable, slidable and resizable

	<!-- attach allowOverflow method to this specific element -->
	<ul onmouseover="myLayout.allowOverflow(this)" onmouseout="myLayout.resetOverflow('east')">
		<li>
			<ul>
				<li>one</li>
				<li>two</li>
				<li>three</li>
				<li>four</li>
				<li>five</li>
			</ul>
			Pop-Up <!-- put this below so IE and FF render the same! -->
		</li>
	</ul>

	<p><button onclick="myLayout.close('east')">닫기</button></p>

	<p>fffff</p> 
</div>

<div class="ui-layout-center">
       
       <!-- 검색 필드 박스 시작 -->
       <div id="menu_field"> 
     <table style="width:500px;">
		  <tr> 
		    <td colspan="3">
		    <h1>사업 관리_사업명 </h1></td> 
		  </tr>
		  <tr> 
		    <td><a href="<c:url value='/empo/business/eMAU00E01Main.do'/>">사업명</a></td>
		    <td><a href="<c:url value='/empo/business/eMAU00E02Main.do'/>">사업부서</a></td>
		  </tr>
     </table>	
       </div>
       <!-- //검색 필드 박스 끝 -->
       
    <!-- container 시작 -->
    <div id="container" style="margin-top:10px">
     
    </div>  
    <!-- //container 끝 -->  
       
   
       
    


</div>

</body>
</html>