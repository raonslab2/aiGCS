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
	<script type="text/javascript" src="<c:url value='/'/>js/jquery-ui-1.12.1/jquery-ui.min.js"></script>
	<script type="text/javascript" src="<c:url value='/'/>js/jquery.layout.js"></script>
	

	

	<script type="text/javascript" src="<c:url value='/'/>js/complex.js"></script>
	
	<link href="<c:url value='/'/>css/common.css" rel="stylesheet" type="text/css" >
	<link rel="stylesheet" href="<c:url value='/'/>js/jquery-ui-1.12.1/jquery-ui.min.css"> 
	<link href="<c:url value='/'/>css/layout_all.css" rel="stylesheet" type="text/css" >
	<link href="<c:url value='/'/>css/menu_style.css" rel="stylesheet" type="text/css" >
	
    
    <script src="<c:url value='/'/>js/jquery-ui-1.12.1/datepicker-ko.js"></script>
    
     <link rel="stylesheet" href="//cdn.rawgit.com/fgelinas/timepicker/master/jquery.ui.timepicker.css">
     <script src='//cdn.rawgit.com/fgelinas/timepicker/master/jquery.ui.timepicker.js'></script>
 

	<script type="text/javascript">

	var myLayout; // a var is required because this page utilizes: myLayout.allowOverflow() method

	$(document).ready(function () {
		//년도
		setDateBox();
 
		$("#date1").datepicker();
		$("#date2").datepicker();
		
		$('.timepicker').timepicker({ 
		});
 
	 
		
		
		myLayout = $('body').layout({
			// enable showOverflow on west-pane so popups will overlap north pane
			west__showOverflowOnHover: true

		//,	west__fxSettings_open: { easing: "easeOutBounce", duration: 750 }
		});
		
		var mbCode = $('#mCode').val(); 
		var data = {
			"mbCode": mbCode
		}
		<!--
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
		-->
		//권한 활당받은 사업명 , 당해년도
		searchUserPjList();
		
		//평가구분
		searchEmPjVuCode();
		
	    //평가종류
		searchEmPjDiCode();
		
		//초기 리스트 호출
		initList();  
		
		openMenu(event, 'tab1');
		
	 
 
 
 	});
   
	//권한받은 프로젝트
	function searchUserPjList(){
	    //평가종류
		$('#searchUserPjList').children('option:not(:first)').remove();
		var data = "";
		$.get( '/empo/resources/searchUserPjList.do', { "searchCode" : data } ).done(function(res) {
			console.log(res.list)
			res.list.forEach( function(row, index) {
				var option = $('<option value="'+ row.comKey +'">'+ row.comValue +'</option>');
				$('#searchUserPjList').append(option)
			})
		}).fail(function() {
			alert("실패")
		});
	}
		
	function searchEmPjVuCode(){
	    //평가종류
		$('#searchVuDiCode').children('option:not(:first)').remove();
		var data = "";
		$.get( '/empo/resources/searchEmPjVuCode.do', { "searchCode" : data } ).done(function(res) {
			console.log(res.list)
			res.list.forEach( function(row, index) {
				var option = $('<option value="'+ row.vuDiCode +'">'+ row.vuDiTitle +'</option>');
				$('#searchEmPjVuCode').append(option)
			})
		}).fail(function() {
			alert("실패")
		});
	}
	
	function searchEmPjDiCode(){
	    //평가종류
		$('#searchEmPjDiCode').children('option:not(:first)').remove();
		var data = "";
		$.get( '/empo/resources/searchEmPjDiCode.do', { "searchCode" : data } ).done(function(res) {
			console.log(res.list)
			res.list.forEach( function(row, index) {
				var option = $('<option value="'+ row.vuDiCode +'">'+ row.vuDiTitle +'</option>');
				$('#searchEmPjDiCode').append(option)
			})
		}).fail(function() {
			alert("실패")
		});
	}
	
	function searchAreaCode(){
	    //평가종류
		$('#searchAreaCode').children('option:not(:first)').remove();
		var data = "";
		$.get( '/empo/resources/searchAreaCode.do', { "searchCode" : data } ).done(function(res) {
			console.log(res.list)
			res.list.forEach( function(row, index) {
				var option = $('<option value="'+ row.vuDiCode +'">'+ row.vuDiTitle +'</option>');
				$('#searchAreaCode').append(option)
			})
		}).fail(function() {
			alert("실패")
		});
	}
 
	function initList(){ 
		$('#table_default > tbody > tr').remove();
		var pcCode = '2';
		var checkListView = function(row) { 
			
			//
			var pjDataTitle = "";
			if(row.pjState == '0'){
				pjDataTitle = "대기";
			}else if(row.pjState == '1'){
				pjDataTitle = "진행중";
			}else if(row.pjState == '2'){
				pjDataTitle = "완료";
			}
			
			var vuDiCodeTitle = "";
			if(row.vuDiCode == '1'){
				vuDiCodeTitle = "전자평가";
			}else if(row.vuDiCode == '2'){
				vuDiCodeTitle = "온라인평가";
			}else if(row.vuDiCode == '3'){
				vuDiCodeTitle = "오프라인평가";
			}
			
	        var data = " <tr style='text-align: center;border: 1px solid #ddd;height:28px;'>\r\n" + 
    		"	<td style='text-align: center;' >"+ row.paPk + "</td>\r\n" + 
    		"	<td>"+ pjDataTitle +"</td>\r\n" + 
    		"	<td style='text-align: center;'>"+row.pjTitle+"</td>\r\n" +  
    		"	<td>"+vuDiCodeTitle+"</td>\r\n" + 
    		"	<td>5</td>\r\n" + 
    		"	<td>6</td>\r\n" + 
    		"	<td>7</td>\r\n" + 
    		"	<td>8</td>\r\n" +  
    		"	<td>"+ row.vuDayStart +"</td>\r\n" + 
    		"	<td>"+ row.vuDayEnd +"</td>\r\n" + 
    		"	<td>"+ row.vuDayWrite +"</td>\r\n" + 
    		" </tr>";
			return  $(data);
		} 
		var param = $("#searchForm").serialize();
	    $.ajax({
	        type : 'POST',
	        url : '/empo/resources/eMAU00C01List.do',
	        dataType : 'json',
	        data :param,
	        success : function(result) { 
				var clUseList = [];			
				
				result.list.forEach(function(row, index) {
					clUseList.push(row.clUse);
					console.log(clUseList); 
					$('#resultList').append(checkListView(row));
				});
 
	        },
	        error: function(request, status, error) {
	             // 에러 출력을 활성화 하려면 아래 주석을 해제한다. 

	            //console.log(request + "/" + status + "/" + error);
	        }
	    }); // End Ajax Request
	  
	}
	
	function searchList(){
	
		 initList();
	}
	
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
    
    //날짜
    function fn_searchDate(tmp){ 
    	
    	 
 
    	if(tmp == '0'){
            $("#date1").val("");
            $("#date2").val("");
    	}else{
    		var tm_startDay = "";
    		if(tmp == '1'){
    			//1주일전
    			tm_startDay = today(); 
    		}else if(tmp == '2'){
    			//1주일전
    			tm_startDay = lastWeek(7); 
    		}else if(tmp == '3'){
    			//15일전
    			tm_startDay = lastWeek(15); 
    		}else if(tmp == '4'){
    			//1개월
    			tm_startDay = lastMonth(1); 
    		}else if(tmp == '5'){
    			//2개월
    			tm_startDay = lastMonth(3); 
    		}
            $("#date1").val(tm_startDay);
            $("#date2").val(today());
    	}

    }
 
    function getDateStr(myDate){
    	return (myDate.getFullYear() + '-' + (myDate.getMonth() + 1) + '-' + myDate.getDate())
    }
    
    /* 오늘 날짜를 문자열로 반환 */
    function today() {
      var d = new Date()
      return getDateStr(d)
    }
    
    /* 오늘로부터 1주일전 날짜 반환 */
    function lastWeek(tmp) {
      var d = new Date()
      var dayOfMonth = d.getDate()
      d.setDate(dayOfMonth - tmp)
      return getDateStr(d)
    }
    
    /* 오늘로부터 1개월전 날짜 반환 */
    function lastMonth(tmp) {
      var d = new Date()
      var monthOfYear = d.getMonth()
      d.setMonth(monthOfYear - tmp)
      return getDateStr(d)
    }
    
 
    $(function() {
        //----- OPEN
        $('[data-popup-open]').on('click', function(e)  {
            var targeted_popup_class = jQuery(this).attr('data-popup-open');
            $('[data-popup="' + targeted_popup_class + '"]').fadeIn(450);

            e.preventDefault();
        });

        //----- CLOSE
        $('[data-popup-close]').on('click', function(e)  {
            var targeted_popup_class = jQuery(this).attr('data-popup-close');
            $('[data-popup="' + targeted_popup_class + '"]').fadeOut(350);

            e.preventDefault();
        });
    });
	</script>
 
<style type="text/css">
    h1 {font-size:12px;}
    caption {visibility:hidden; font-size:0; height:0; margin:0; padding:0; line-height:0;}
    
    A:link    { color: #000000; text-decoration:none; }
    A:visited { color: #000000; text-decoration:none; }
    A:active  { color: #000000; text-decoration:none; }
    A:hover   { color: #fa2e2e; text-decoration:none; }
   
.popup {
  display: none;
  position:fixed;
  width: 100%;
  height: 100%;
  top:0;
  left:0;
  background:rgba(0,0,0,0.5);
}

.popup-inner {
  position:absolute;
  width: 50%;
  height: 50%;
  top:50%;
  left:50%;
  transform:translate(-50%, -50%);
  padding : 10px;
  background:#fff;
}

.popup-close{
  position: absolute;
  display: block;
  top:10px;
  right: 10px;
}
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
  
       
    <!-- container 시작 -->
    <div id="container" style="margin-top:10px;width:100%">
     ===
    </div>  
        <!-- //container 끝 -->  
 
  

</div>

</body>
</html>