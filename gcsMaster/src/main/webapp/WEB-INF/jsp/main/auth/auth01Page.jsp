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
<c:import url="/EmpPageLink.do?link=main/include/src" /> 
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
				<h3>권한관리</h3>
                <c:import url="/EmpPageLink.do?link=main/include/top" />  
			</div>
			<!-- 화면 상단 종료 -->
			
			<!-- s :contents_guide -->
			<div class="contents_guide">
				<div class="submenu_guide">
					<ul>
						<!-- 2차메뉴명 -->
						<li><a href="/empo/auth/eMAU00F01Main.do" class="active">담당자별</a></li>
						<li><a href="/empo/auth/eMAU00F02Main.do">사업별</a></li>
						<li style="float: right;">
							<button type="button" class="btn_style01 sb_style btn_white" id="btnTipaDept">INSA_DEPT</button>
							<button type="button" class="btn_style01 sb_style btn_white" id="insaTest1">INSA_EMPL</button>
							<button type="button" class="btn_style01 sb_style btn_white" id="insaTest2">INSA_GNTE</button>
							
							<button type="button" class="btn_style01 sb_style btn_white" id="btnTipaAdmn">SBJT_ADMN</button> 
							<button type="button" class="btn_style01 sb_style btn_white" id="smtec2">SBJT_EVAL</button>
						</li>
						

					</ul> 
				</div>
				
				<!-- s :content_col2 -->
				<div class="content_col2 bg">
					<div>
						<!-- 검색 form 시작 -->
						<form id="searchForm" name="searchForm" method="post">
							<input type="hidden" id="page" name="page" value="" />
							<input type="hidden" id="dept" name="dept" value="0">
							<ul>
								<li class="ac">
									<!-- 부서검색 -->
									<select id="groupPart1" name="groupPart1" class="input_w26">
										<option value="">소속 부서</option>
									</select>
									
									<select id="groupPart2" name="groupPart2" class="input_w26" style="display: none;">
										<option value="">전체</option>
									</select>
	
									<!-- 담당자명 검색 -->
									
									<span class="search_box03 input_w40">
										<input type="text" name="searchName" placeholder="담당자명">
										<button type="button" id="managerSearch" class="btn_search01">검색</button>
									</span>
								</li>
							</ul>
						</form>
						<!-- 검색 form 종료 -->

						<!-- 담당자 목록 시작 -->
						<div class="bbs_list mt30 userList">
							<table>
								<thead>
								  <tr>
									<th scope="col">부서명</th>
									<th scope="col">이름</th>
									<th scope="col">직급</th>
									<th scope="col">사원번호</th>
									<th scope="col">ID</th>
									<th scope="col">권한</th>
								  </tr>
								</thead>
								<tbody id="resultList">
								  
								</tbody>
							</table>
						</div>
						<!-- 담당자 목록 끝 -->
						<div class="bbs_page">
							<ul class="pagination">
								<!-- <li class="first"><a href="#" title="첫 페이지 바로가기"><img src="/images/bbs_prev02.gif" alt="첫 페이지" style="margin: 10px;"></a></li>
								<li class="prev"><a href="#" title="이전 페이지(1page) 바로가기"><img src="/images/bbs_prev01.gif" alt="이전 페이지" style="margin: 10px;"></a></li>
								<li class="active">1</li>
								<li class=""><a href="#" title="2페이지 바로가기">2</a></li>
								<li class=""><a href="#" title="3페이지 바로가기">3</a></li>
								<li class=""><a href="#" title="4페이지 바로가기">4</a></li>
								<li class=""><a href="#" title="5페이지 바로가기">5</a></li>
								<li class="next"><a href="#" title="다음 페이지(11page) 바로가기"><img src="/images/bbs_next01.gif" alt="다음 페이지" style="margin: 10px;"></a></li>
								<li class="last"><a href="#" title="끝 페이지(67page) 바로가기"><img src="/images/bbs_next02.gif" alt="마지막 페이지" style="margin: 10px;"></a></li> -->
							</ul>
						</div>
					</div>
					<!-- e :bbs_write01 -->
					
					
					
					<!-- 담당자 정보 및 권한 시작 : 목록의 첫번째 회원정보가 최초 출력 -->
					<div id="divUserInfoView">
						<h4>회원정보</h4>
						<div class="bbs_list">
							<table class="table_l">
							  <colgroup>
							  	<col width="34%">
							  	<col width="">
							  </colgroup>
							  <tbody>
								<tr>
								  <th scope="row">이름*</th>
								  <td id="mbName">
								  </td>
								</tr>
								<tr>
								  <th scope="row">사원번호 *</th>
								  <td id="mbCode">
								  </td>
								</tr>
								<tr>
								  <th scope="row">부서 * </th>
								  <td id="grmName">
								  </td>
								</tr>
								<tr>
								  <th scope="row">아이디 *</th>
								  <td id="smtechId">
								  </td>
								</tr>
								<tr>
								  <th scope="row">이메일 *</th>
								  <td id="mbEmail"></td>
								</tr>
								<tr>
								  <th scope="row">전화번호</th>
								  <td id="mbHp"></td>
								</tr>
							  </tbody>
							</table>
						</div>
						<form id="formChangePwd">
							<input type="hidden" name="pwdMbCode" id="pwdMbCode" value="" />
						</form>
						
						<h4>권한</h4>

						<div class="btn_guide ar mt-50 mb10">
							<button type="button" class="btn_style02 btn_gray" id="btnAuthEdit">권한수정</button>
							<button type="button" class="btn_style02 btn_green" id="btnAuthAdd">권한추가</button>
							
						</div>

						<form id="formAuthList">
							<input type="hidden" name="dataPageName" id="dataPageName" value="manager"/>
							<input type="hidden" name="authMode" id="authMode" value=""/>
							<input type="hidden" name="dataMbCode" id="dataMbCode" value=""/>
							<input type="hidden" name="dataMbName" id="dataMbName" value=""/>
							<input type="hidden" name="dataGrmName" id="dataGrmName" value=""/>
							<input type="hidden" name="dataPjCode" id="dataPjCode" value=""/>
							<input type="hidden" name="dataPjTitle" id="dataPjTitle" value=""/>
							<input type="hidden" name="dataAuCode" id="dataAuCode" value=""/>
							<input type="hidden" name="dataPjAuId" id="dataPjAuId" value=""/>
							<input type="hidden" name="dataPjYear" id="dataPjYear" value=""/>
						</form>
						
						<div class="bbs_list" id="authResultList">
						</div>
						
                        
                    </div>
					<!-- e : 담당자 정보 및 권한 종료 --> 

				</div>
				<!-- e :content_col2 -->
				
				
				<!-- 팝업 띄울 공간 -->
                <div id="divPopup" class="overlay">
				</div>

			</div>
			<!-- e :contents_guide -->
		</div>
		<!-- e :right_guide -->
	</div>
	<!-- e :wrap -->
	
<script>
;(function() {
	
	// 권한 수정 버튼
	$("#btnAuthEdit").click(function() {
		if ($("input[name=checkField]:checkbox:checked").length == 0) {
			alert("수정할 권한을 선택하세요.");
			return false;
		} else {
			$("#formAuthList").find("#authMode").val("edit");
			fnPopupOpen("/empo/auth/eMAU00F01AuthCreatePopup.do", "#formAuthList");	// ../js/popup.js 참고	
		} 
		
	});
	
	// 조직정보 Dept
	$("#btnTipaDept").click(function() {
		var searchTestVal = "test";
		$.post('/empo/tipa/selectTipaDept.do', {searchTest:searchTestVal} ).done(function(res) {
			console.log(res) 
			alert(res.returnResult + ' 동기화 완료');
		})
	});
	
	// 조직정보 Empl
	$("#insaTest1").click(function() {
		var searchTestVal = "test";
		$.post('/empo/tipa/selectTipaEmpl.do', {searchTest:searchTestVal} ).done(function(res) {
			alert(res.returnResult + ' 동기화 완료');
		})
	});
	
	// 조직정보 Gnte
	$("#insaTest2").click(function() {
		var searchTestVal = "test";
		alert('동기화중이니 확인버튼을 클릭후 잠시만 기다려주세요.')
		$.post('/empo/tipa/selectTipaGnte.do', {searchTest:searchTestVal} ).done(function(res) {
			alert(res.returnResult + ' 동기화 완료'); // 56741개
		})
	});
	
	// 조직정보 SMTEC
	$("#btnTipaAdmn").click(function() {
		var searchTestVal = "test";
		$.post('/empo/tipa/selectSmtec.do', {searchTest:searchTestVal} ).done(function(res) {
			alert(res.returnResult + ' 동기화 완료');
		})
	});
	
	// 조직정보 SMTEC2
	$("#smtec2").click(function() {
		var searchTestVal = "test";
		$.post('/empo/tipa/selectSmtec2.do', {searchTest:searchTestVal} ).done(function(res) {
			console.log(res) 
			alert(res.returnResult + ' 동기화 완료');
		})
	});

	// 권한 추가 버튼
	$("#btnAuthAdd").click(function() {
		$('#dataPjCode').val("");
	    $('#dataPjTitle').val("");
	    $('#dataAuCode').val("");
	    $('#dataPjAuId').val("");
	    $('#dataPjYear').val("");
	    
		$('input[name="checkField"]').filter(function(index, row) {
	    	$(row).prop('checked', false);
	    });
		
		$("#formAuthList").find("#authMode").val("insert");
		fnPopupOpen("/empo/auth/eMAU00F01AuthCreatePopup.do", "#formAuthList");
	});
	
	// 담당자 목록에서 권한 등록 버튼 클릭 이벤트
	var createPopup = function() { // ../js/popup.js 참고
		$('#dataPjCode').val("");
	    $('#dataPjTitle').val("");
	    $('#dataAuCode').val("");
	    $('#dataPjAuId').val("");
	    $('#dataPjYear').val("");
	    
		$('input[name="checkField"]').filter(function(index, row) {
	    	$(row).prop('checked', false);
	    });
	
		$("#authMode").val("insert");
		var mbCode = $(this).parents('tr').data('mbcode');
		$(this).parent('td').prev().click();
		
		fnPopupOpen("/empo/auth/eMAU00F01AuthCreatePopup.do", "#formAuthList");
			
	}
	
	var search = function() {
		var mbCode = "";
		$("#page").val("");
		var formSer = $('#searchForm').serialize();
		
		$.post('/empo/auth/eMAU00F01ManagerList.do', formSer).done(function(res) {
			$("#resultList").children().remove();
			$('.pagination').children().remove();
			res.list.forEach(function(row, index) {
				console.log(row)
				console.log(row.grmCode)
				if (mbCode == row.mbCode) {
					return ;
				} else {
						$('#resultList').append(managerListView(row));
				}
				mbCode = row.mbCode;	
			});
			
			$('.pagination').append(paginationView(res.paginationInfo));
			
			$('.' + res.paginationInfo.currentPageNo ).addClass("active");
			$('.pagination > li').css('cursor', 'pointer');
			
		}).fail(function() {
			alert("실패");
		})
	}
	
	// 서브 그룹
	var groupCode = function() {
		var el = $(this);
		var data = el.val();
		console.log(data);
		var id = el.attr('id');
		
		if (id == 'groupPart1') {
			$('#groupPart2').children('option:not(:first)').remove();
			
			$.get( '/empo/auth/eMAU00F01SearchSubOption.do', { "grpCode" : data } ).done(function(res) {
				if (res.list.length > 0) {
					$("#dept").val("2");
					$('#groupPart2').css("display", "");
					res.list.forEach( function(row, index) {
						var option = $('<option value="'+ row.grmCode +'">'+ row.grmName +'</option>');
						$('#groupPart2').append(option);
					});
				} else {
					if (data == "") {
						$("#dept").val("0");
						$('#groupPart2').css("display", "none");
					} else {
						$("#dept").val("1");
						$('#groupPart2').css("display", "none");	
					}
					
				}
				
			}).fail(function() {
				alert("실패")
			});
		}
		
	}
	
	var authListView = function(row) {
		console.log(row)
		var data = 
			"<table class='table_l mb10 rowList'>" +
			"	<colgroup>" + 
			"		<col width='5%'>" + 
			"		<col width='25%'>" +
			"		<col width=''>" +
			"	</colgroup>" + 
			"	<tbody>" +
			"		<tr>" +
			"			<th scope='row' rowspan='2' class='ac'>" +
			"				<input type='checkbox' name='checkField' data-pj_year='" + row.pjYear + "'data-pj_au_id='" + row.pjAuId + "' data-pj_code='" + row.pjCode + "' data-pj_title='" + row.pjTitle + "' data-au_code='" + row.auCode + "'></th>" +
			"			<th scope='row'>사업명 *</th>" +
			"				<td class='pjTitle'>" + row.pjTitle + "</td>" +
			"		</tr>" +
			"		<tr>" +
			"			<th scope='row' class='th_line'>권한*</th>" +
			"				<td class='auName'>" + row.auName + "</td>" +
			"		</tr>" +
			"	</tbody>" +
			"</table>" ;
			
		return $(data);
	}
	
	var managerDetail = function() {
		var mbCode = $(this).parent('tr').data('mbcode');
		$('.subTr').each(function(index, row) {
			$(row).css("background-color","")
		})
		$(this).parent().css("background-color","rgb(230, 251, 245);");
		
		$.ajax({
			url : '/empo/auth/eMAU00F01ManagerDetail.do'
			, type : 'post' 
			, async : false
			, data : { "mbCode" : mbCode }
		}).done(function(res) {
			if (res.list.smtechId == "NULL") {
				res.list.smtechId = "";
			}
			$('#dataMbCode').val(res.list.mbCode);
			$('#dataMbName').val(res.list.mbName);
			$('#dataGrmName').val(res.list.grmName);
			
			$('#mbName').html("<strong>" + res.list.mbName + "</strong>");
			$('#mbCode').html(res.list.mbCode + '<button type="button" style="margin-left: 7px;" class="btn_style03 btn_gray" id="btnPwdChange">비밀번호 변경</button>');
			$('#grmName').html(res.list.grmName);
			$('#smtechId').html(res.list.smtechId);
			$('#mbEmail').html(res.list.mbEmail);
			$('#mbHp').html(res.list.mbHp);
			$("#pwdMbCode").val(res.list.mbCode);
			
			$.post('/empo/auth/eMAU00F01AuthList.do', { "mbCode" : mbCode }).done(function(res) {
				$('.table_l.mb10').remove();
				if(res.list.length == 0) {
					//$('#authResultList').append($("<table class='table_l mb10 rowList'><tbody><tr><td>권한이 없습니다.</td></tr></tbody></table>"));
				} else {
					res.list.forEach(function(row, index){
						$('#authResultList').append(authListView(row));
					})
				}
				
			}).fail(function() {
				alert("실패");
			});
			
			// 비밀번호 변경 버튼
			$("#btnPwdChange").click(function() {
				fnPopupOpen("/empo/login/eMAU00001ChangePasswordPopup.do", "#formChangePwd");	// ../js/popup.js 참고
			});
			
		}).fail(function() {
			alert("실패");
		});
	}
	
	$(document).on('click', 'input[name="checkField"]', function() {
		var checkName = $('input[name="checkField"]');
	    checkName.filter(function(index, row) {
	    	$(row).prop('checked', false);
	    });
	    $(this).prop('checked', true);
	    
	    $('#dataPjCode').val($(this).data('pj_code'));
	    $('#dataPjTitle').val($(this).data('pj_title'));
	    $('#dataAuCode').val($(this).data('au_code'));
	    $('#dataPjAuId').val($(this).data('pj_au_id'));
	    $('#dataPjYear').val($(this).data('pj_year'));
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
		console.log($("#page").val());
		var formSer = $('#searchForm').serialize();
		//목록
		$.post('/empo/auth/eMAU00F01ManagerList.do', formSer).done(function(res) {
			console.log(res.list);
			$("#resultList").children().remove();
			$('.pagination').children().remove();
			res.list.forEach(function(row, index) {
				if (row.smtechId == "NULL") {
					row.smtechId = "";
				}
				if (mbCode == row.mbCode) {
					return ;
				} else {
					$('#resultList').append(managerListView(row));
				}
				mbCode = row.mbCode;
			});
			
			$('.pagination').append(paginationView(res.paginationInfo));
			
			$('.' + res.paginationInfo.currentPageNo ).addClass("active");
			$('.pagination > li').css('cursor', 'pointer');
			
			// 회원정보 목록 커서
			$(".userList > table > tbody> tr > td").css("cursor","pointer");

			$('.rowTD')[0].click(); 
		}).fail(function() {
			alert("실패");
		});
		
	});
	
	$(function() {
		$(document).on( 'click', '.createPopup', createPopup );	
		$(document).on( 'click', '.rowTD', managerDetail );	
		$('#groupPart1').change( groupCode );
		$('#managerSearch').click( search );
		initList();
		
	});
	
	var managerListView = function(row) {
		var data = "" ;
		
		if(row.pjAuId == null) {
			data = 
				"<tr class='subTr' data-mbcode='" + row.mbCode + "'>" +
				"	<td class='rowTD' style='cursor: pointer;' >" + row.grmName + "</td>" +
	        	"	<td class='rowTD' style='cursor: pointer;' >" + row.mbName + "</td>" +
	        	"	<td class='rowTD' style='cursor: pointer;' >" + row.mbRankName + "</td>" +
	        	"	<td class='rowTD' style='cursor: pointer;' >" + row.mbCode + "</td>" +
	        	"	<td class='rowTD' style='cursor: pointer;' >" + row.smtechId + "</td>" +
	        	"	<td class='insert'><button type='button' class='btn_style03 btn_red createPopup' >등록</button></td>" +
			    "</tr>" ;
		} else {
			data = 
	        	"<tr class='subTr' data-mbcode='" + row.mbCode + "'>" +
	        	"	<td class='rowTD' style='cursor: pointer;' >" + row.grmName + "</td>" +
	        	"	<td class='rowTD' style='cursor: pointer;' >" + row.mbName + "</td>" +
	        	"	<td class='rowTD' style='cursor: pointer;' >" + row.mbRankName + "</td>" +
	        	"	<td class='rowTD' style='cursor: pointer;' >" + row.mbCode + "</td>" +
	        	"	<td class='rowTD' style='cursor: pointer;' >" + row.smtechId + "</td>" +
	        	"	<td class='rowTD isButton'><button type='button' class='btn_style03 btn_white'>관리</button></td>" +
	        	"</tr>" ;
		}
        	
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
		var mbCode = "";
		
		//부서정보 호출
		$.post('/empo/auth/eMAU00F01SearchFirstOption.do').done(function(res) {
			res.list.forEach( function(row, index) {
				var option = $('<option value="'+ row.grmCode +'">'+ row.grmName +'</option>');
				$('#groupPart1').append(option);
			})
		}).fail(function() {
			alert("실패");
		});
		
		//목록
		$.post('/empo/auth/eMAU00F01ManagerList.do', { "page" : $("#page").val(), "dept": $("#dept").val() }).done(function(res) {
			console.log(res.list.length)
			res.list.forEach(function(row, index) {
				if (row.smtechId == "NULL") {
					row.smtechId = "";
				}
				if (mbCode == row.mbCode) {
					return ;
				} else {
					$('#resultList').append(managerListView(row));
				}
				mbCode = row.mbCode;
			});
			
			$('.pagination').append(paginationView(res.paginationInfo));
			
			$('.' + res.paginationInfo.currentPageNo ).addClass("active");
			$('.pagination > li').css('cursor', 'pointer');
			
			// 회원정보 목록 커서
			$(".userList > table > tbody> tr > td").css("cursor","pointer");

			$('.rowTD')[0].click();
		}).fail(function() {
			alert("실패");
		});
	}
})();
	
</script>
</body>
</html>

