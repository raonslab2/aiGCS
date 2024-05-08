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
<%@ include file="../include/src.jsp"%>
<style>
	.sb_style {
		margin: 5px;
	} 
</style>

<script type="text/javascript">
	$(document).ready(function() {
		setDateBox();
		setDateBox1();
		// 사업공고 목록 커서
		$(".busList > table > tbody> tr > td").css("cursor","pointer");

		// 사업명 또는 사업부서 선택에 따른 검색항목 변경
		$(".searchDiv").click(function() {
			var searchDiv = $("input[name='searchDiv']:checked").val();
			
			// 사업부서 선택
			if (searchDiv == "dept") {
				$("#searchName").attr("placeholder","사업부서 입력");	
			}
			
			// 사업명 선택
			else {
				$("#searchName").attr("placeholder","사업명 입력");	
			}
		});
		 
	});
		
	function setDateBox(){
        var dt = new Date();
        var year = "";
        var com_year = dt.getFullYear();
        // 발행 뿌려주기
        // 올해 기준으로5년전을 보여준다.
        for(var y = (com_year-4); y < (com_year+3); y++){
        	if(y == com_year ){
        		$("#searchYear").append("<option selected value='"+ y +"'>"+ y + " 년" +"</option>");
        		
        	}else{
        		$("#searchYear").append("<option value='"+ y +"'>"+ y + " 년" +"</option>");
        		//$("#searchAuthYear").append("<option value='"+ y +"'>"+ y + " 년" +"</option>");
        	}
            
        }
        
    }
	function setDateBox1(){
        var dt = new Date();
        var year = "";
        var com_year = dt.getFullYear();
        // 발행 뿌려주기
        //$("#YEAR").append("<option value=''>년도</option>");
        // 올해 기준으로5년전을 보여준다.
        for(var y = (com_year-4); y < (com_year+3); y++){
        	if(y == com_year-1 ){
        		$("#searchAuthYear").append("<option selected value='"+ y +"'>"+ y + " 년" +"</option>");
        	}else{
        		$("#searchAuthYear").append("<option value='"+ y +"'>"+ y + " 년" +"</option>");
        	}
            
        }
        
    }
	
    function press(event) {
        if (event.keyCode==13) {
            fn_select('1');
        }
    }
    
</script>
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
				<h3>사업관리</h3>

				<c:import url="/EmpPageLink.do?link=main/include/top" />
			</div>
			<!-- 화면 상단 종료 -->

			<!-- s :contents_guide -->


			<!-- s :content_col2 -->
			<div class="content_col2 box_mh100p box_style01">
				<div class="w70">

					<!-- 검색 form 시작 -->
					<form id="searchForm" name="searchForm" method="post">
						<input type="hidden" id="page" name="page" value="" />
						<div class="mb30 ac">
							<label><input type="radio" name="searchDiv" class="searchDiv" value="name" checked> 사업명</label> &nbsp;&nbsp;&nbsp; 
							<label><input type="radio" name="searchDiv" class="searchDiv" value="dept"> 사업부서</label> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
							<select name="searchYear" id="searchYear" title="년도" class="select w80">
							</select> 
							<span class="search_box03 input_w30"> 
								<input class="gSearch" type="text" id="searchName" name="searchName" placeholder="사업명 입력" onfocus="this.placeholder=''"> <!-- class="gSearch"  type="search" size="30"  value='<c:out value="${searchVO.searchPjTitle}" />' placeholder="사업명 입력" onfocus="this.placeholder=''" onblur="this.placeholder='사업명 입력'" name="searchPjTitle" id="searchPjTitle" -->
								<button type="button" id="commonSearch" name="commonSearch" class="btn_search01">검색</button>
							</span>
						</div>
					</form>
					<!-- 검색 form 종료 -->
					<p class="al" id="sysUpdate"></p>


					<div class="bbs_list busList" style="overflow: auto;">
						<table border="0">
							<thead>
								<tr>
									<!--   <th scope="col"><input type="checkbox" id="checkAll" onclick="checkAll();"  /></th> -->
									<th scope="col">사업년도</th>
									<th scope="col">사업명</th>
									<th scope="col">내역사업명</th>
									<th scope="col">내내역사업명</th>
									<th scope="col">공고명</th>
									<!-- <th scope="col">등록일</th> -->
									<th scope="col">사업부서</th>
								</tr>
							</thead>
							<tbody id="resultList">
								<%-- <tr>
					       		   <td><input type="checkbox"></td>
								   <td class="text_l" nowrap="nowrap"><strong><c:out value="${result.pjCode}"/></strong></td>
								   <td class="text_l" nowrap="nowrap">
				
				          			  <input type=hidden name="bbsId" value="<c:out value="${result.bbsId}"/>">
			          				  <input type=hidden name="trgetId" value="<c:out value="${result.trgetId}"/>">
				            
				          			  <a href="<c:url value='/cop/com/selectBBSUseInf.do'/>?bbsId=<c:out value='${result.bbsId}'/>&amp;trgetId=<c:out value='${result.trgetId}'/>">
				          		      <c:out value="${result.pjYear}"/>
				          			  </a>
				            
				  			      </td>
								  <td class="text_l" nowrap="nowrap"><c:out value="${result.pjCateCode1}"/></td>
								  <td class="text_l" nowrap="nowrap"><c:out value="${result.pjCateCode2}"/></td>
								  <td class="text_l" nowrap="nowrap"><c:out value="${result.pjTitle}"/></td>
								  <td class="text_l" nowrap="nowrap">
								   	<c:out value="${result.writeTime}"/>
								  </td>  
				        			<td class="text_l" nowrap="nowrap"><c:out value="${result.grMCode}"/></td> 
								</tr> --%>
								<%-- <c:if test="${fn:length(resultList) == 0}">
                   			    <tr>
                    		     <td nowrap colspan="6"><spring:message code="common.nodata.msg" /></td>  
                 	            </tr>      
                    		    </c:if> --%>
							</tbody>
						</table>
					</div>
					<!-- e : bbs_list -->
					<div class="bbs_page">
						<ul class="pagination">
							<!-- 
							<li class="first"><a href="#" title="첫 페이지 바로가기"><img src="/images/bbs_prev02.gif" alt="첫 페이지" style="margin: 10px;"></a></li>
							<li class="prev"><a href="#" title="이전 페이지(1page) 바로가기"><img src="/images/bbs_prev01.gif" alt="이전 페이지" style="margin: 10px;"></a></li>
							<li class="active">1</li>
							<li class=""><a href="#" title="2페이지 바로가기">2</a></li>
							<li class=""><a href="#" title="3페이지 바로가기">3</a></li>
							<li class=""><a href="#" title="4페이지 바로가기">4</a></li>
							<li class=""><a href="#" title="5페이지 바로가기">5</a></li>
							<li class="next"><a href="#" title="다음 페이지(11page) 바로가기"><img src="/images/bbs_next01.gif" alt="다음 페이지" style="margin: 10px;"></a></li>
							<li class="last"><a href="#" title="끝 페이지(67page) 바로가기"><img src="/images/bbs_next02.gif" alt="마지막 페이지" style="margin: 10px;"></a></li> 
							-->
						</ul>
					</div>
				</div>
				<!-- e :w70 -->

				<div class="w30 bbs_write01 business_right">
					<ul>
						<li><span>사업부서</span>
							<div class="btn_guide ar mt-30 mb10">
								<button type="button" class="btn_style03 btn_red" id="btnSave">저장</button>
							</div> <input type="text" id="resultGrSumName" class="input_w80 "
							readonly></li>
						<!-- <li><span>사업권한 가져오기</span>
							<form id="searchForm1" name="searchForm1" method="post">
								<select name="searchAuthYear" id="searchAuthYear" title="년도" class="select w80">
								</select> 
								<span class="search_box03 input_w50"> 
									<input type="text" name="searchAuthName" id="searchAuthName" placeholder="사업명 입력">
									<button type="button" class="btn_search01" id="btn_authBtn">검색</button>
								</span>
							</form></li> -->
						<li id="authLi"></li>

						<li><span>부서별 권한</span>
							<div class="result_box02">
								<ul class="data_list03">
									  <li><input type="radio" name="projectAuth" id="systemManagement" value="CODE00001"> 시스템관리</li>
									  <li><input type="radio" name="projectAuth" id="projectManagement" value="CODE00002"> 사업관리</li>
									  <li><input type="radio" name="projectAuth" id="manager" value="CODE00003"> 담당간사</li>
									  <li><input type="radio" name="projectAuth" id="practitioner" value="CODE00004"> 실무자</li>
								</ul>
							</div>
						</li>
						<li><span>담당자별 설정</span>
							<div class="btn_guide ar mt-30 mb10">
								<button type="button" class="btn_style03 btn_gray" id="btnUserChange">선택변경</button>
								<button type="button" class="btn_style03 btn_green" id="btnUserAdd">담당자 추가</button>
							</div>

							<form id="formUserList">
								<input type="hidden" name="authMode" id="authMode" value="" />
								<input type="hidden" name="dataMbCode" id="dataMbCode" value="" />
								<input type="hidden" name="dataMbName" id="dataMbName" value="" />
								<input type="hidden" name="dataGrmName" id="dataGrmName" value="" /> 
								<input type="hidden" name="dataPjCode" id="dataPjCode" value="" /> 
								<input type="hidden" name="dataPjTitle" id="dataPjTitle" value="" /> 
								<input type="hidden" name="dataAuCode" id="dataAuCode" value="" /> 
								<input type="hidden" name="dataPjAuId" id="dataPjAuId" value="" /> 
								<input type="hidden" name="dataPjYear" id="dataPjYear" value="" /> 
								<input type="hidden" name="dataAuName" id="dataAuName" value="" />
							</form>
							<div class="result_box02 scroll sbox_h400" id="memberResultList">
							</div></li>
					</ul>
					
				</div>
				<!-- e :bbs_write01 -->
				
			</div>
			<!-- e :content_col2 -->


			<!-- 팝업 띄울 공간 -->
			<div id="divPopup" class="overlay"></div>

		</div>
		<!-- e :contents_guide -->
	</div>
	<!-- e :right_guide -->
	</div>
	<!-- e :wrap -->

</body>

<script>
;(function() {
	var pjCode = "";
	var auCode = "";
	var pjYear = "";
	var grmCode = "";
	
	$("#searchName").autocomplete({
		source : function(request, response) {
			$.post('/empo/auth/searchProjectAutocomplete.do', { 
				"pjYear" : $('#searchYear').val()
				, "pjTitle" : $('#searchName').val() 
			}).done(function(res) {
				if ($('input[name="searchDiv"]:checked').val() == "name") {
					var list = [];
					res.list.forEach(function(row) {
						list.push(row.pjTitle);
					});
					response(list);
				}
			}).fail(function() {
				alert("실패");
			});
		},

		select : function(event, ui) {
			console.log(ui.item);
		},

		focus : function(event, ui) {
			return false;
			//event.preventDefault();
		}
	});
		
	$("#searchAuthName").autocomplete({
		source : function(request, response) {
			$.post('/empo/auth/searchProjectAutocomplete.do', { 
				"pjYear" : $('#searchAuthYear').val()
				, "pjTitle" : $('#searchAuthName').val() 
			}).done(function(res) {
				var list = [];
				res.list.forEach(function(row) {
					list.push(row.pjTitle);
				})
				response(list);
			}).fail(function() {
				alert("실패");
			});
		},

		select : function(event, ui) {
			console.log(ui.item);
		},

		focus : function(event, ui) {
			return false;
			//event.preventDefault();
		}
	});
	
	// 담당자 추가 버튼
	$("#btnUserAdd").click(function() {
		if (pjCode == "") {
			alert("사업을 먼저 선택하세요.");
			return false;
		}
		
		$('#dataAuCode').val("");
		$('#dataAuName').val("");
		$('#dataGrmName').val("");
		$('#dataMbName').val("");
		$('#dataPjAuId').val("");		
		$('input[name="checkField"]').filter(function(index, row) {
	    	$(row).prop('checked', false);
	    });
		$("#formUserList").find("#authMode").val("insert");
		fnPopupOpen("/empo/business/eMAU00E01BusinessCreatePopup.do", "#formUserList");	// ../js/popup.js 참고
	});
	
	// 선택변경 버튼
	$("#btnUserChange").click(function() {
		if ($("input[name=checkField]:checkbox:checked").length == 0) {
			alert("수정할 권한을 선택하세요.");
			return false;
		} else {
			$("#formUserList").find("#authMode").val("edit");
			fnPopupOpen("/empo/business/eMAU00E01BusinessCreatePopup.do", "#formUserList");	// ../js/popup.js 참고
		}
	});
	
	var search = function() {
		$("#page").val("");
		var formSer = $('#searchForm').serialize();
		
		$.post('/empo/business/eMAU00E01ProjectList.do', formSer).done(function(res) {
			
			$('#resultList').children().remove();
			$('.pagination').children().remove();
			$('.subTr').remove();  
			if(res.totalCnt == '0'){
				var data =  "<tr class='subTr'><td colspan='7' style='height:100px;'>자료가 존재하지 않습니다.</td></tr>" ;
				$('#resultList').append(data);
				$('.pagination').append(paginationView(res.paginationInfo));
				
				$('.' + res.paginationInfo.currentPageNo ).addClass("active");
				$('.pagination > li').css('cursor', 'pointer');
				
			}else{
				res.list.forEach(function(row, index) {
					console.log(row)
					$('#resultList').append(projectListView(row));
					mbCode = row.mbCode;	
				});
				$('.pagination').children().remove();
				$('.pagination').append(paginationView(res.paginationInfo));
				$('.' + res.paginationInfo.currentPageNo ).addClass("active");
				$('.pagination > li').css('cursor', 'pointer');
			} 
			
		}).fail(function() {
			alert("실패");
		})
	};
	
	var getPj = 0;
	var search1 = function() {
		if (pjCode == "") {
			alert("사업을 먼저 선택하세요.");
			return false;
		}
		if (auCode == null && $('.data_list04').length == 0) {
			getPj = 1;
			var formSer1 = $('#searchForm1').serialize();
			
			$.post('/empo/business/searchAuthList.do', formSer1).done(function(res) {
				$('.authButton').remove();  
				$('.pTag').remove();  
				$('.brTag').remove();  
				console.log( 'res.list'  + res.list )
				if(res.totalCnt1 == '0'){
					var data =  "<p class='pTag'>해당 사업이 없습니다.</p>" ;
					$('#authLi').append(data);
						
				}else{
					res.list.forEach(function(row, index) {
						console.log(row)
						$('#authLi').append(authListView(row));
						mbCode = row.mbCode;	
					});
				} 
			}).fail(function() {
				alert("실패");
			});
		} else {
			if (getPj == 1) {
				var formSer1 = $('#searchForm1').serialize();
				
				$.post('/empo/business/searchAuthList.do', formSer1).done(function(res) {
					$('.authButton').remove();  
					$('.pTag').remove();  
					$('.brTag').remove();  
					console.log( 'res.list'  + res.list )
					if(res.totalCnt1 == '0'){
						var data =  "<p class='pTag'>해당 사업이 없습니다.</p>" ;
						$('#authLi').append(data);
							
					}else{
						res.list.forEach(function(row, index) {
							console.log(row)
							$('#authLi').append(authListView(row));
							mbCode = row.mbCode;	
						});
					} 
				}).fail(function() {
					alert("실패");
				});
			} else {
				alert("선택한 사업은 설정된 권한이 있습니다.");	
			}
			
		}
		
	};
	
	var authListView = function(row) {
		console.log(row);
		var data = 
			"<button type='button' class='btn_style02 sb_style  btn_white authButton' data-pj_code='"+ row.pjCode + "'data-pjTitle='"+ row.pjTitle + "'data-pj_year='"+ row.pjYear + "'data-pj_code='"+ row.pjCode + "'data-pj_au_id='"+ row.pjAuId + "'>" + row.pjTitle + "</button>" ;
		
		return $(data);
	};
	
	var select1 = function() {
		if ( $('.authButton').length > 0 ) {
			$('.authButton').each(function(index, row) {
				$(this).removeClass("btn_blue");
				$(this).addClass("btn_white");
			});	
		}
		
		$(this).removeClass("btn_white");
		$(this).addClass("btn_blue");
		
		var selectPjCode = $(this).data('pj_code');
		console.log(selectPjCode);
		
		$.post('/empo/business/eMAU00E01ProjectDetail.do', { "pjCode" : selectPjCode }).done(function(res) {
			//$("#resultGrSumName").val(res.list.grSumName);
			//$('#dataPjAuId').val(res.list.pjAuId);
			//$('#dataPjTitle').val(res.list.pjTitle);
			//$('#dataPjYear').val(res.list.pjYear);
			//$('#dataPjCode').val(res.list.pjCode);
			
			
			$('input[name="projectAuth"]').filter(function(index, row) {
				if( $(row).val() == res.list.auCode ) {
					$(row).prop('checked', true);
					
					return false;
				} else {
					$(row).prop('checked', false);
				}
			});
			
			$.post('/empo/business/eMAU00E01MemberList.do', { "pjCode" : selectPjCode }).done(function(res) {
				$('.data_list04').remove();
				console.log(res.list)
				if(res.list.length == 0) {
					
				} else {
					res.list.forEach(function(row, index){
						$('.mCS_no_scrollbar_y').append(memberListView(row));
					})
				}
			}).fail(function() {
				alert("실패");
			});
			
			
		}).fail(function() {
			alert("실패");
		});
	};
	
	
	
	var memberListView = function(row) {
		console.log(row)
		var data = 
			"<ul class='data_list04' >" + 
			"<li>" +
			"<p><input type='checkbox' name='checkField' data-gr_m_name='"+ row.grSumName + "'data-mb_name='"+ row.mbName + "'data-mb_code='"+ row.mbCode + "'data-pj_year='"+ row.pjYear + "'data-pj_code='"+ row.pjCode + "'data-au_code='"+ row.auCode + "'data-pj_au_id='"+ row.pjAuId + "'data-au_name='"+ row.auName + "'>" + row.grmName  + "<span> "+ row.writeTime + "</span></p>"
			+ row.mbName + "<span class='auName'>"+ row.auName +"</span>" 
		+"</li>" +"</ul>" ; 
		return $(data);
	}
	
	
	var select = function() {
		pjCode = $(this).data('pj_code');
		pjYear = $(this).data('pj_year');
		grmCode = $(this).data('grm_code');
		console.log(pjCode);
		console.log(pjYear);
		getPj = 0;
		
		$('.subTr').each(function(index, row) {
			$(row).css("background-color","")
		})
		$(this).css("background-color","rgb(230, 251, 245);");
		
		$('.checkRow').filter(function(index, row) {
			$(row).prop('checked', false);
			var code = $(row).data('pj_code');
			if( code == pjCode ) {
				$(row).prop("checked", true);
			}
		})
		
		$.post('/empo/business/eMAU00E01ProjectDetail.do', { "pjCode" : pjCode, "grmCode" : grmCode }).done(function(res) {
			console.log(res.list);
			$('.authButton').remove();  
			$('.pTag').remove();  
			$('.brTag').remove();  
			$("#searchAuthName").val("");
			$("#resultGrSumName").val(res.list.grmName);
			$('#dataPjTitle').val(res.list.pjTitle);
			$('#dataPjYear').val(res.list.pjYear);
			$('#dataPjCode').val(res.list.pjCode);
			auCode = res.list.auCode;
			console.log(auCode);
			
			$('input[name="projectAuth"]').filter(function(index, row) {
				if( $(row).val() == res.list.auCode ) {
					$(row).prop('checked', true);
					
					return false;
				} else {
					$(row).prop('checked', false);
				}
			});
			
			$.post('/empo/business/eMAU00E01MemberList.do', { "pjCode" : pjCode }).done(function(res) {
				$('.data_list04').remove();
				console.log(res.list)
				if(res.list.length == 0) {
					
				} else {
					res.list.forEach(function(row, index){
						$('.mCS_no_scrollbar_y').append(memberListView(row));
					})
				}
			}).fail(function() {
				alert("실패");
			});
			
			
		}).fail(function() {
			alert("실패");
		})
	};
	
	$(document).on('click', 'input[name="checkField"]', function() {
		var checkName = $('input[name="checkField"]');
	    checkName.filter(function(index, row) {
	    	$(row).prop('checked', false);
	    });
	    $(this).prop('checked', true);
	    console.log($(this).data());
	    console.log($(this).data('mb_name'));
	    console.log($(this).data('mb_code'));
	    console.log($(this).data('pj_code'));
	    console.log($(this).data('pj_year'));
	    console.log($(this).data('au_code'));
	    console.log($(this).data('pj_au_id'));
	    $('#dataPjAuId').val($(this).data('pj_au_id'));
	    $('#dataAuCode').val($(this).data('au_code'));
	    $('#dataPjYear').val($(this).data('pj_year'));
	    $('#dataMbName').val($(this).data('mb_name'));
	    $('#dataMbCode').val($(this).data('mb_code'));
	    $('#dataPjCode').val($(this).data('pj_code'));
	    $('#dataGrmName').val($(this).data('gr_m_name'));
	    $('#dataAuName').val($(this).data('au_name'));
	    
	});
	
	$(document).on('click', '.pageClass', function() {
		var page = $(this).data('page');
		var totalPageCnt = $(this).data('total_page_count');
		console.log(totalPageCnt);
		if (page > totalPageCnt) {
			return false;
		}
		if (page == 0) {
			return false;
		}
		$("#page").val(page);
		
		var formSer = $('#searchForm').serialize();
		
		$.ajax({
			url : '/empo/business/eMAU00E01ProjectList.do'
			, type : 'post'
			, data :formSer
		}).done(function(res) { 
			console.log(res);
			$('#resultList').children().remove();
			$('.pagination').children().remove();
			//목록 출력
			res.list.forEach(function(row, index) {
				
				$('#resultList').append(projectListView(row));
				//pjCode = row.pjCode;
			});
			
			$('.pagination').append(paginationView(res.paginationInfo));
			
			$('.' + res.paginationInfo.currentPageNo ).addClass("active");
			$('.pagination > li').css('cursor', 'pointer');
			
		}).fail(function() {
			alert("실패");
		});
		
	});
	
	$(function() {
		$(document).on("click", ".subTr", select);
		$(document).on( 'click', '.createPopup', createPopup );
		$('#commonSearch').click( search );
		
		//권한가져오기
		$('#btn_authBtn').click( search1 );
		$(document).on("click", ".authButton", select1);
		
		// 저장 제이쿼리
		//$(document).on("click", "#btnSave", save);
		$('#btnSave').click(function() {
			if (pjCode == "") {
				alert("사업을 먼저 선택하세요.");
				return false;
			}
			var paramArr = new Array();
			var checkAuCode = $('input[name="projectAuth"]:checked').val();
			console.log(checkAuCode);
			
			var data = {
					"pjCode" : pjCode
					, "auCode" : checkAuCode
				}
			
			paramArr.push(data);
			
			$('.sb_style').each(function(index, row) {
				if ( $(row).hasClass('btn_blue') ) {
					$('.data_list04').each(function(index, row) {
						var data2 = {
							"pjYear" : pjYear
							, "pjCode" : pjCode
							, "auCode" : $(row).find('[type=checkbox]').data('au_code')
							, "mbCode" : $(row).find('[type=checkbox]').data('mb_code')
						}
						
						paramArr.push(data2);
						console.log(paramArr);
					});
				}	
			});
			console.log(paramArr);
			
			if(confirm("사업 권한관리를 저장하시겠습니까?")){
				$.ajax({
					url : '/empo/business/AuthBusinessUpdate.do'
					, type : 'post'
					, data : JSON.stringify(paramArr)
					, contentType : "application/json; charset=utf-8"
				}).done(function() {
					alert("저장되었습니다.");
				}).fail(function() {
					alert("실패");
				});
				
				 
			} else {
				return false;
			}
		})

		
		initList();
	});
	
	var projectListView = function(row) {
		var data = 
			'<tr id="subRow" class="subTr" style="cursor:pointer;" data-grm_code="' + row.grMCode + '" data-pj_code="' + row.pjCode + '" data-pj_title="'+ row.pjTitle + '" data-pj_year="'+ row.pjYear+ '" >' +
			/* '	<td ><input type="checkbox" class="checkRow" ></td>' + */
			/* '	<td class="subRow" data-pj_code=' + row.pjCode +  '>' + row.pjCode + '</td>' +*/
			'	<td class="subRow"> ' + row.pjYear + '</td>' +
			'	<td class="subRow">' + row.pjCateName1 + '</td>' +
			'	<td class="subRow">' + row.pjCateName2 + '</td>' +
			'	<td class="subRow">' + row.pjCateName3 + '</td>' +
			'	<td class="subRow">' + row.pjTitle + '</td>' +
			'	<td class="subRow">' + row.grMname + '</td>' +
			'</tr>' ;
			
			return $(data);
	} 
	
	var paginationView = function(page) {
		 var data = "" ;
		 	
		 	data = 
			'	<li class="first"><a class="pageClass" data-page="' + page.firstPageNo + '" title="첫 페이지 바로가기"><img src="/images/bbs_prev02.gif" alt="첫 페이지" style="margin: 10px;"></a></li>' +
			'	<li class="prev"><a class="pageClass" data-page="' + (page.currentPageNo-1) + '" title="이전 페이지(1page) 바로가기"><img src="/images/bbs_prev01.gif" alt="이전 페이지" style="margin: 10px;"></a></li>' ;
			
			for (var i=page.firstPageNoOnPageList; i <= page.lastPageNoOnPageList; i++) {
				data = data +
					'<li class=' + i + '><a class="pageClass" data-page="' + i + '" title="' + i + '페이지 바로가기">' + i + '</a></li>' ;
			}
			
			data = data +
				'<li class="next"><a class="pageClass" data-total_page_count="' + page.totalPageCount + '" data-page="' + (page.currentPageNo+1) + '" title="다음 페이지(11page) 바로가기"><img src="/images/bbs_next01.gif" alt="다음 페이지" style="margin: 10px;"></a></li>' +
				'<li class="last"><a class="pageClass" data-page="' + page.lastPageNo + '" title="끝 페이지(67page) 바로가기"><img src="/images/bbs_next02.gif" alt="마지막 페이지" style="margin: 10px;"></a></li>' ;
			
		return $(data);
	 } 
	
	var initList = function() {
		var pjCode = ""; 
		var pjYear = "";
 
		var formSer = $('#searchForm').serialize();
		
		$.ajax({
			url : '/empo/business/eMAU00E01ProjectList.do'
			, type : 'post'
			, data :formSer
		}).done(function(res) { 
			console.log(res);
			//목록 출력
			res.list.forEach(function(row, index) {
				
				$('#resultList').append(projectListView(row));
				//pjCode = row.pjCode;
			});
			
			$('.pagination').append(paginationView(res.paginationInfo));
			
			$('.' + res.paginationInfo.currentPageNo ).addClass("active");
			$('.pagination > li').css('cursor', 'pointer');
			
			var timestamp = res.sysUpdate;
			var date = new Date(timestamp);
			console.log(date);
		    $('#sysUpdate').text("최종 업데이트 일시 : "+res.sysUpdate); 
			
		
		}).fail(function() {
			alert("실패");
		});
	};
	
	var createPopup = function() { // ../js/popup.js 참고
		$('#dataMbCode').val("");
	    $('#dataAuCode').val("");
	    $('#dataPjAuId').val(""); 
	    
		$('input[name="checkField"]').filter(function(index, row) {
	    	$(row).prop('checked', false);
	    });
	
		$("#authMode").val("insert");
		$(this).parent('td').prev().click();
		
		fnPopupOpen("/empo/buisness/eMAU00E01BusinessCreatePopup.do", "#formAuthList");
	
	};
	
		
		
	
})();
    
   
</script>

</html>
