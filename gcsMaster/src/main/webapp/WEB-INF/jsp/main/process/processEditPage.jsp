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

<script type="text/javascript">
	$(document).ready(function() {

		// 팝업 스크롤바를 정의
		$(".scroll").mCustomScrollbar({
			scrollbarPosition : "outside"
			//theme:"dark"
		});
		

		

		// 대분류 추가 버튼
		$(".btnPopProcessAdd").click(function() {
			$(".popProcessList").append('<li><span class="off"><input type="text" id="popProcessName"  placeholder="대분류 입력"></span></li>');

			// 스크롤 하단으로 이동
			$(".scroll").mCustomScrollbar("scrollTo","bottom",{
				scrollEasing:"easeOut"
			});
		});

		// 하위 프로세스 등록 버튼
		$(".btnPopSubProcessAdd").click(function() {
			var index = $(this).parent().index();
			
			if ($(".popProcessList > li").eq(index).find("input").length < 1) {
				if ($(".popProcessList > li").eq(index).find("ul").length < 1) {
					$(".popProcessList > li").eq(index).find("span").removeClass("off");
					$(".popProcessList > li").eq(index).find("span").addClass("on");
					$(".popProcessList > li").eq(index).append("<ul></ul>");
				} 

				$(".popProcessList > li").eq(index).find("ul").css("display","");
				$(".popProcessList > li").eq(index).find("ul").append(' <li><span><input type="text" id="popSubProcessName"  placeholder="하위분류 입력"></span></li>');
			}
		});


		// 프로세스 삭제를 위한 선택 (클릭)
		$(".popProcessList").find("li > span").click(function() {
			$(".popProcessList").find("li > span").css("background-color", "");
			$(this).css("background-color", "#e6fbf5");
		});


		// 프로세스 삭제버튼
		$(".btnPopProcessDelete").click(function() {
			if (confirm("선택하신 프로세스를 삭제하시겠습니까?")) {
			}
		});
		

	});
</script>

<!-- 드랍 위치 css -->
<style>
	.dropPlace { 
		width: calc(100% - 48px);
		height:40px;
		border:2px dotted #dad55e;
		background:#fffa90;
		color:#777620;
	}
</style>

<!-- 분류이동 편집 -->
<div class="popup_guide popup_w700">	
	<a href="javascript:void(0)" class="closebtn" onclick="fnPopupClose()">닫기</a>
	<h3>
		분류이동 편집
	</h3>
	<div class="popup_content">

		<div class="tree_guide">
			<div class="btn_guide">
			<!-- 
				<button type="button" class="btn_style02 btn_white btnPopProcessAdd">대분류 추가</button>
				<button type="button" class="btn_style02 btn_white btnPopProcessDelete">삭제</button>
			-->
				<button type="button" class="btn_style02 btn_green fr btnPopProcessMoveSave">분류이동 저장</button>
			</div>
			<!-- e :btn_guide -->
			<div class="tree_style01 tree_style02 tree_style03 sbox_h600 scroll">
			</div>
			<!-- 
			<div class="btn_guide">
				<button type="button" class="btn_style02 btn_white btnPopProcessAdd">대분류 추가</button>
				<button type="button" class="btn_style02 btn_white btnPopProcessDelete">삭제</button>
			</div>
			 -->
			<!-- e :btn_guide -->
		</div>
		<!-- e :tree_guide -->


	</div>
</div>
<script>
;(function() {
	$('.btnPopProcessMoveSave').click(function() {
		if(confirm("분류이동 정보를 저장하시겠습니까?")) {
			// 드래그 종료 시 호출
			var paramArr = new Array();
			var arrayPcCode = new Array();
			var arrayPcOrderBy = new Array();
			
			$("#popProcessList").children('li').each(function(index, row) {
				/* if($(row) == ui.item) {
					console.log("a");
				}
				console.log($(row).children('.popSubRow').data()); */
				var pcCode = $(row).children('.popSubRow').data('pc_code');
				var orderBy = $(row).children('.popSubRow').data('pc_order_by');
				
				arrayPcCode.push(pcCode);
				arrayPcOrderBy.push(orderBy);
			});
			
			arrayPcOrderBy.sort(function(a, b) {
				if(a > b) return 1;
				if(a === b) return 0;
				if(a < b) return -1;
			});
			
			console.log(arrayPcCode)
			console.log(arrayPcOrderBy);
			
			arrayPcCode.forEach(function(row, index) {
				console.log(row);
				console.log(arrayPcOrderBy[index]);
				var data = {
					pcCode : row
					, pcOrderBy : arrayPcOrderBy[index]
					, subPcCode : ""
					, subPcPCode : ""
					, subPcOrderBy : ""
				}
				
				paramArr.push(data);
				
			});
			
			var subArrayPcCode = new Array();
			var subArrayPcPCode = new Array();
			var subArrayPcOrderBy = new Array();
			
			$("#popProcessList > li > ul").children('li').each(function(index, row) {
				var pcCode = $(row).children('span').data('pc_code');
				var pcPCode= $(row).parents('li').children('span').data('pc_code');
				var pcOrderBy = $(row).children('span').data('pc_order_by'); 
				
				subArrayPcCode.push(pcCode);
				subArrayPcPCode.push(pcPCode);
				subArrayPcOrderBy.push(pcOrderBy);
				
			});
			
			subArrayPcOrderBy.sort(function(a, b) {
				if(a > b) return 1;
				if(a === b) return 0;
				if(a < b) return -1;
			});
			
			subArrayPcCode.forEach(function(row, index) {
				console.log(row);
				console.log(arrayPcOrderBy[index]);
				var data = {
					pcCode : ""
					, pcOrderBy : ""
					, subPcCode : row
					, subPcPCode : subArrayPcPCode[index]
					, subPcOrderBy : subArrayPcOrderBy[index]
				}
				
				paramArr.push(data);
				
			});
			
			console.log(paramArr)
			
			
			$.ajax({
				url : '/empo/process/processMoveSave.do'
				, type : 'post'
				, data : JSON.stringify(paramArr)
				, contentType : "application/json; charset=utf-8"
			}).done(function(res) {
				fnPopupClose();
				location.reload();	
				
			}).fail(function() {
				alert("실패");
			});
			
		}
	});
	
	var processListView = function(row) {
		var data ;

		
		if (row.subLength == undefined) {
			row.subLength = 0;	
		}
		
		if (row.pcPCode == 0) {
			data = '<li class="this"><span class="off popSubRow" data-pc_order_by=' + row.pcOrderBy + ' data-pc_code=' + row.pcCode + ' data-pc_name=' + row.pcName + '>' + row.pcName + ' <em data-sub_length=' + row.subLength + ' >' + row.subLength + '</em></span><a type="button" class="move">이동</a>' ;	
		} else {
			data = '<li><span class="popSubRow sub" data-pc_order_by=' + row.pcOrderBy + ' data-pc_code=' + row.pcCode + ' data-pc_name=' + row.pcName + '>' + row.pcName + '</span></li>'
		}
		
		if (row.pcPCode == 0 && row.subs.length == 0) {
			data = '<li class="this"><span class="off popSubRow" data-pc_order_by=' + row.pcOrderBy + ' data-pc_code=' + row.pcCode + ' data-pc_name=' + row.pcName + '>' + row.pcName + ' <em data-sub_length=' + row.subLength + ' >' + row.subLength + '</em></span><a type="button" class="move">이동</a><ul style="display: none;"></ul>' ;
		} 
		
		return $(data);
	}
	
	var getTree = function(popProcess) {
		popProcess.forEach(function(row, index) {
			console.log(row)
			row.subs = [];
		    if (row.pcPCode != "0") {
		    	console.log(index);
		    	popProcess.forEach(function(obj) {
		    		if (obj.pcCode == row.pcPCode) {
		    			parentRow = obj;
		    			parentRow.subs.push(row);
		    		}
		    	});
		    	//var parentRow = process.find(obj => obj.pcCode == row.pcPCode);
		    	console.log(parentRow);
		    	//parentRow.subs.push(row);
		    }
		});
		parentProcess = [];
		popProcess.filter(function(row, index) {
			if (row.pcPCode == 0) {
				parentProcess.push(row);
			}
		});
		//console.log(parentProcess);
		return parentProcess;
		//return process.filter(obj => obj.pcPCode == '0');
	}
	
	var addSubs = function(parentDiv, subs) {
		var ul = $("<ul>");
		if( parentDiv.hasClass('popProcessTree') ) {
            ul.attr('id', 'popProcessList');
        }
		
		subs.forEach( function(row) {
			if (row.pcPCode != 0) {
				ul.css('display', 'none');
			}
			if(row.subs.length > 0) {
				row.subLength = row.subs.length;	
			}
			
            var li = processListView(row);
            ul.append(li);
            if ( row.subs.length > 0 ) {
                addSubs( li, row.subs );
            } 
        });
		
		parentDiv.append(ul);
	}
	
	$.post('/empo/process/eMAU00D02ProcessList.do').done(function(res) {
		var i = parseInt($('#i').val());
		$('#mCSB_' + i + '_container').addClass('popProcessTree');
		$('#i').val(i+1);
		/* 
		i = $('#i').val((i+1));
		console.log(i) */
		var subs = getTree(res.list);
		addSubs( $('.popProcessTree'), subs );
		
		// 대분류 펼치고 닫기
		$("#popProcessList > li > span").click(function() {
			var index = $(this).parent().index();

			if ($("#popProcessList > li").eq(index).find("ul").css("display") == "none") {
				$("#popProcessList > li").eq(index).find("ul").css("display","");
				
				$(this).removeClass("off");
				$(this).addClass("on");
			} 
			else {
				$("#popProcessList > li").eq(index).find("ul").css("display","none");

				$(this).removeClass("on");
				$(this).addClass("off");
			}
			
		});
		
		$("#popProcessList").find("li > span").css("cursor","pointer");
		
		$("#popProcessList").sortable({
			placeholder: "dropPlace",	// 드랍 위치 css class

			start:function(event,ui){
				
			},
				
			stop:function(event,ui){
				
			}
		}).disableSelection();
		
		// 하위분류 이동
		$("#popProcessList > li > ul").sortable({
			connectWith: "#popProcessList > li > ul", // 다른 대분류 하위로 이동할 수 있게 해주는 옵션
			placeholder: "dropPlace",	// 드랍 위치 css class

			start:function(event,ui){
				// 드래그 시작 시 호출
				console.log(ui.item);
			},
				
			stop:function(event,ui){
				// 드래그 종료 시 호출
				console.log(ui.item);
			}
		}).disableSelection();
		
	}).fail(function() {
		
	});
	
})();
</script>