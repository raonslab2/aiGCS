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
<script type="text/javascript">
	$(document).ready(function() {

		$("#date1").datepicker();
		
 
		
		$("#date2").datepicker({
			onSelect:function(dateText, inst) {
				console.log(dateText);
				console.log(inst);
			}
		});
		
		//평가종류 불러오기
		searchEmPjDiCode();
		
		//초기 리스트 호출 
		initList();   
	});
	
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
	
	function checkAll() {
        if ($("#checkAll").is(':checked')) {
            $("input[type=checkbox]").prop("checked", true);
        } else {
            $("input[type=checkbox]").prop("checked", false);
        }
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
    		"	<td style='text-align: center;' ><input type=\"checkbox\"/></td>\r\n" + 
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
</script>
</head>

<body>
	<!-- s :wrap -->
	<div id="wrap">
		<!-- 1차 메뉴 시작 -->
		<div class="lnb_guide">
		    <c:import url="/EmpPageLink.do?link=main/include/menu" /> 
		</div>
		<!-- 1차 메뉴 종료 -->
			
		<!-- s :right_guide -->
		<div class="right_guide">

			<!-- 화면 상단 시작 -->
			<div class="top_guide">

				<!-- 1차 메뉴명 -->
				<h3>가용자원</h3>
                <c:import url="/EmpPageLink.do?link=main/include/top" />  
			</div>
			<!-- 화면 상단 종료 -->
			
			<!-- s :contents_guide -->
			<div class="contents_guide">
				<div class="submenu_guide">
					<ul>
						<!-- 2차메뉴명 -->
						<li><a href="<c:url value='/empo/resources/eMAU00C01Main.do'/>" class="active">분과구성 현황</a></li>
						<li><a href="<c:url value='/empo/resources/eMAU00C02Main.do'/>">가용자원 조회(간사)</a></li>
						<li><a href="<c:url value='/empo/resources/eMAU00C03Main.do'/>">가용자원 조회(평과장)</a></li>
					</ul>
				</div>
				
				
                <!-- 검색 필드 박스 시작 -->
                <div id="search_field"> 
                  <fieldset><legend>조건정보 영역</legend>  
					<form class="searchForm" id="searchForm" method="post">
						<div id="search_field">
						 평가기간
						
						
						<input type="text" name="searchVuDayStart" id="date1" size="12" />
						 
						<input type="text" name="searchVuDayEnd" id="date2" size="12" />
						<a href="#" class="button white small" onclick="fn_searchDate(1);">오늘</a> 
						<a href="#" class="button white small" onclick="fn_searchDate(2);">7일</a> 
						<a href="#" class="button white small" onclick="fn_searchDate(3);">15일</a> 
						<a href="#" class="button white small" onclick="fn_searchDate(4);">1개월</a> 
						<a href="#" class="button white small" onclick="fn_searchDate(5);">3개월</a> 
						<a href="#" class="button white small" onclick="fn_searchDate(0);">전체</a> 
				 
                        &nbsp;&nbsp;&nbsp;
                                                평가종류
						<select id="searchEmPjDiCode" name="searchEmPjDiCode">
							<option value="" >전체</option> 
						</select>              

		 &nbsp;&nbsp;&nbsp; 
							<a href="#" class="button white medium" onclick="searchList();">검색</a>
							
							 
						</div>
					</form>
				 </fieldset>
			  </div>
			<!-- //검색 필드 박스 끝 -->
            <div id="content2"> 
					<div class="bbs_list busList">

						<table border="0" summary="현황,사업명,평가죵류,분과번호,분과위원회명,담당간가,평가장소,평가시작일시,평가종료일시,등록일 페이지 입니다." cellpadding="0" cellspacing="0">
							<caption>사용자목록관리</caption>
							<colgroup>
								<col width="20px">
			                    <col width="7%">
			                    <col width="">
			                    <col width="7%">
			                    <col width="7%">
			                    <col width="7%">
			                    <col width="7%">
			                    <col width="7%">
			                    <col width="7%">
			                    <col width="7%">
			                    <col width="7%">
		                    </colgroup>
		                    <thead>
		                    	<tr >
		                    		<th scope="col" nowrap="nowrap"><input type="checkbox" id="checkAll" onclick="checkAll();"></th>
		                    		<th scope="col" nowrap="nowrap">현황</th>
			                        <th scope="col" nowrap="nowrap">사업명</th> 
			                        <th scope="col" nowrap="nowrap">평가종류</th> 
			                        <th scope="col" nowrap="nowrap">분과번호</th> 
			                        <th scope="col" nowrap="nowrap">분가위원회명</th> 
			                        <th scope="col" nowrap="nowrap">담당간사</th> 
			                        <th scope="col" nowrap="nowrap">평가장소</th> 
			                        <th scope="col" nowrap="nowrap">평가시작일시</th> 
			                        <th scope="col" nowrap="nowrap">평가종료일시</th> 
			                        <th scope="col" nowrap="nowrap">등록일</th>  
		                    	</tr>
		                    </thead>
		                    <tbody id="resultList">
		                    </tbody>
						</table>
					</div>
            </div>

			</div>
			<!-- e :contents_guide -->
		</div>
		<!-- e :right_guide -->
	</div>
	<!-- e :wrap -->
	
<script>
 
	
</script>
</body>
</html>

