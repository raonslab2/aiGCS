	;(function() {
	 
		$(function() {
			//js first start
			initList(); 
		});
	  
		var initList = function() {
			
			var formSer = $('#searchForm').serialize();
			
			$.ajax({
				url : '/gcs/dashboard/gA034MainList.do'
				, type : 'post'
				, data :formSer
			}).done(function(res) { 
				$('#resultList').children().remove();
				$('.pagination').children().remove();
				$('.subTr').remove();
				if(res.totalCnt == '0'){
					var data =  "<tr class='subTr'><td colspan='9' style='height:100px;text-align:center;'>자료가 존재하지 않습니다.</td></tr>" ;
					$('#resultList').append(data);
					$('.pagination').append(paginationView(res.paginationInfo));
					
					$('.' + res.paginationInfo.currentPageNo ).addClass("active");
					$('.pagination > li').css('cursor', 'pointer');
				}else{
					res.list.forEach(function(row, index) {
						console.log(row)
						$('#resultList').append(projectListView(row));
						//mbCode = row.mbCode;	
					});
					$('.pagination').children().remove();
					$('.pagination').append(paginationView(res.paginationInfo));
					$('.' + res.paginationInfo.currentPageNo ).addClass("active");
					$('.pagination > li').css('cursor', 'pointer');
				}
			}).fail(function() {
				alert("실패");
			});
			
		};
		
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
			$.post('/gcs/dashboard/gA034MainList.do', formSer).done(function(res) {
				console.log(res.list);
				$("#resultList").children().remove();
				$('.pagination').children().remove();
				res.list.forEach(function(row, index) {
					if (row.smtechId == "NULL") {
						row.smtechId = "";
					}
					$('#resultList').append(projectListView(row));
				});
				
				$('.pagination').append(paginationView(res.paginationInfo));
				
				$('.' + res.paginationInfo.currentPageNo ).addClass("active");
				$('.pagination > li').css('cursor', 'pointer');
				
				// 회원정보 목록 커서
				//$(".userList > table > tbody> tr > td").css("cursor","pointer");
	
				//$('.rowTD')[0].click(); 
			}).fail(function() {
				alert("실패");
			});
			
		});
		
	
	    
		var projectListView = function(row) { 
		  
			var tmArr = ["Y","N"];
			var arrayLength = tmArr.length;
			var tmUse ="<select name=\"deviceUse\" id=\"deviceUse\" onchange=\"chageLangSelect(this,"+ row.aiPk +")\">\r\n";		
			
			for (var si = 0; si < arrayLength; si++) {
				if(row.aiUse==tmArr[si]){
					tmSelected = "selected";
				}else{
					tmSelected = "";
				}
				tmUse += "    <option value=\""+tmArr[si]+"\" "+tmSelected+">"+tmArr[si]+"</option>";
			    //Do something
			}
			tmUse +=  "</select>";  
	
		// 버튼 스타일 적용
		var data = "<tr>\r\n"
		  + "	<th scope=\"row\">" + row.aiPk + "</th>\r\n"
		  + "	<th>" + tmUse + "</th>\r\n"
		  + "	<td>" + row.aiDevicename + "</td>\r\n"
		  + "	<td>" + row.aiDevicealias + "</td>\r\n"
		  + "	<td>" + row.aiDevicetype + "</td>\r\n"
		  + "	<td>" + row.aiAgency + "</td>\r\n"
		  + "	<td>" + row.aiRegistername + "</td>\r\n"
		  + "	<td>" + row.aiMemo + "</td>\r\n"
		  + " <td>"
		  + " <button type=\"button\" onclick=\"javascript:fn_waypoint(" + row.aiPk + "); return false;\" class=\"btn_style03 btn_green btnMoveReg\">Edit</button>"
		  + " <button type=\"button\" onclick=\"javascript:fn_del(" + row.aiPk + "); return false;\" class=\"btn_style03 btn_red btnMoveReg\">DEL</button>"
		  + "</td> \r\n"
		  + "</tr>";

			
	 
				
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
	 
	})();

function chageLangSelect(str,aiPk){  
	
	
	 var sleTex = str.options[str.selectedIndex].innerHTML;
	  var aiUse = str.value;


		$.ajax({
			url : '/gcs/dashboard/gA034MainYNUpdate.do'
			, type : 'post' 
			, data : { "aiPk" : aiPk, "aiUse" : aiUse}
			, async : false 
		}).done(function(res) { 
			alert("Success");
		}).fail(function() {
			alert("Fail");
		});
	 
	}  