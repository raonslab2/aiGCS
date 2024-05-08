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

<script type="text/javascript">
	var myLayout; // a var is required because this page utilizes: myLayout.allowOverflow() method

	$(document).ready(function() {
		myLayout = $('body').layout({
			// enable showOverflow on west-pane so popups will overlap north pane
			west__showOverflowOnHover : true

		//,	west__fxSettings_open: { easing: "easeOutBounce", duration: 750 }
		});
	});

</script>


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
	<style>
	.left {
        width: 50%;
        float: left;
        box-sizing: border-box;
      }
    .right {
        width: 50%;
        float: right;
        box-sizing: border-box;
      }
	</style>
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
				</ul> Pop-Up <!-- put this below so IE and FF render the same! -->
			</li>
		</ul>

		<p>
			<button onclick="myLayout.close('east')">닫기</button>
		</p>

		<p>...</p>
		<p>...</p>
		<p>...</p>
		<p>...</p>
		<p>...</p>
		<p>...</p>
		<p>...</p>
		<p>...</p>
		<p>...</p>
		<p>...</p>
		<p>...</p>
		<p>...</p>
		<p>...</p>
		<p>...</p>
		<p>...</p>
		<p>...</p>
		<p>...</p>
		<p>...</p>
		<p>...</p>
		<p>...</p>
		<p>...</p>
		<p>...</p>
		<p>...</p>
		<p>...</p>
		<p>...</p>
		<p>...</p>
		<p>...</p>
		<p>...</p>
		<p>...</p>
		<p>...</p>
		<p>...</p>
		<p>...</p>
		<p>...</p>
		<p>...</p>
		<p>...</p>
		<p>...</p>
	</div>
	
	<div class="ui-layout-center">
		
		<table style="width: 500px;">
			<tr> 
		    	<td colspan="3">
		    		<h1>휴일 설정 </h1>
		    	</td> 
			</tr>
			<tr> 
				<td><a href="<c:url value='/empo/process/eMAU00D01Main.do'/>">프로세스 매핑</a></td>
				<td><a href="<c:url value='/empo/process/eMAU00D02Main.do'/>">프로세스 설정</a></td>
				<td><a href="<c:url value='/empo/process/eMAU00D03Main.do'/>">표준일정 설정</a></td>
				<td><a href="<c:url value='/empo/process/eMAU00D04Main.do'/>">휴일 설정</a></td>
			</tr>
		</table>
		<!-- container 시작 -->
		<div id="container" style="margin-top: 10px">
	===
		</div>
		<!-- //container 끝 -->
	</div>

</body>
</html>
<script>
;(function() {
	var hoPk;
	
	var createView = function() {
		var data = "<tr class='createRow'>\r\n" + 
   		"	<td><input type='text' id='createHolidayName' /></td>\r\n" + 
   		"	<td><input type='date' id='createHolidayDate' /></td>\r\n" + 
   		"	<td>\r\n" +
   		"		<select id='createRepeatCycle'>\r\n" +
   		"			<option value='1'>매년</option>\r\n" +
   		"			<option value='0'>-</option>\r\n" +
   		"		</select>\r\n" +
   		"	</td>\r\n" +
   		"	<td><button class='holidayCreate'>저장</button></td>" +
   		"</tr>";
		return  $(data);
	}
	
	var makeHolidayCreate = function() {
		if ($('.createRow').length == 1) {
			alert("먼저 저장해주세요.");
		} else {
			$('#resultList').append(createView());
		}
	}
	
	var holidayCreate = function() {
		
		$("#dataHolidayName").val($('#createHolidayName').val());
		$("#dataHoliday").val($('#createHolidayDate').val());
		$("#dataRepeatCycle").val($("#createRepeatCycle").val());
		
		var formSer = $("#createForm").serialize();
		
		$.ajax({
			type: 'post'
			, url: '/empo/auth/eMAU00D04holidayCreate.do'
			, data : formSer
		}).done(function(res) {
			$('.createRow').remove();
			$('#resultList').append(holidayListView(res.list));
		}).fail(function() {
			alert("b")
		})
		
		//$('#createHolidayName').val());
	}
	
	var holidayDetail = function() {
		hoPk = $(this).data('ho_pk');
		
		$.post('/empo/auth/eMAU00D04holidayDetail.do', { "hoPk" : hoPk } ).done(function(res) {
			$('#hoName').val(res.list.hoName);
			$('#hoHoliday').val(res.list.hoHoliday);
			
			$('input[name="hoRepeatCycle"]').filter(function(index, row) {
				if( $(row).val() == res.list.hoRepeatCycle ) {
					$(row).prop('checked', true);
				} else {
					$(row).prop('checked', false);
				}
			});
			
			$('input[name="hoUse"]').filter(function(index, row) {
				if( $(row).val() == res.list.hoUse ) {
					$(row).prop('checked', true);
				} else {
					$(row).prop('checked', false);
				}
			});
			
		}).fail(function() {
			alert("실패");
		})
	}
	
	var updateHoliday = function() {
		if (hoPk == undefined) {
			alert("휴일명을 먼저 선택해주세요.");
		} else {
			var el = $(this).parent();
			var hoName = el.children('#hoName').val();
			var hoHoliday = el.children('#hoHoliday').val();
			var hoRepeatCycle = $('input[name="hoRepeatCycle"]:checked').val();
	        var hoUse = $('input[name="hoUse"]:checked').val();
	        
	        data = {
	        	"hoPk" : hoPk
	        	, "hoName" : hoName
	        	, "hoHoliday" : hoHoliday 
	        	, "hoRepeatCycle" : hoRepeatCycle
	        	, "hoUse" : hoUse
	        }
			
			//$.post("/empo/auth/eMAU00D04holidayUpdate.do", data)
		}
	}
	
	$(function() {
		$(document).on('click', '.rowHoliday', holidayDetail);
		$('#makeHolidayCreate').click( makeHolidayCreate );
		$(document).on('click', '.holidayCreate', holidayCreate);
		$('#updateHoliday').click( updateHoliday );
		
		initList();
	});
	
	var holidayListView = function(row) {
        var data = " <tr class='row' >\r\n" + 
		"	<td><a data-ho_pk='" + row.hoPk + "' class='rowHoliday' style='cursor:pointer;'>" + row.hoName + "</a></td>\r\n" + 
		"	<td>"+ row.hoHoliday +"</td>\r\n" + 
		"	<td>"+ row.hoRepeatCycleName +"</td>\r\n" +  
		"	<td></td>" +
		" </tr>";
		return  $(data);
	}
	
	function initList() {
		
		$.post('/empo/process/eMAU00D04List.do').done(function(res) {
			console.log(res.list)
			res.list.forEach(function(row, index) {
				$('#resultList').append(holidayListView(row));
			});
		}).fail(function() {
			alert("실패");
		})
	}
})();
	
</script>