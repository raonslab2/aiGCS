<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
	// 업무영역의 class와 게시글 index
	String choice = request.getParameter("choice");
%>

<script type="text/javascript">

	var tlWork = "";
	var tlWork2 = "";
	var tlWork3 = "";
	
	// 서브 그룹
	var groupCode = function() {
		var el = $(this);
		var data = el.val();
		var id = el.attr('id');
		
		if (id == 'groupPart1') {
			$('#groupPart2').children('option:not(:first)').remove();
			
			$.get( '/empo/auth/eMAU00F01SearchSubOption.do', { "grpCode" : data } ).done(function(res) {
				res.list.forEach( function(row, index) {
					var option = $('<option value="'+ row.grmCode +'">'+ row.grmName +'</option>');
					$('#groupPart2').append(option);
				})
			}).fail(function() {
				alert("실패")
			});
		}
	}
	
	var Name = function() {
		var el = $(this);
		var data = el.val();
		var id = el.attr('id');
		var data2 = $('#groupPart1').val();
		
		if (id == 'groupPart2') {
			$('#groupPart3').children('option:not(:first)').remove();
			
			$.get( '/empo/tplink/eMAU00H1SearchSubOption2.do', { "grmCode" : data, "grpCode" : data2} ).done(function(res) {
				res.list.forEach( function(row, index) {
					var option = $('<option value="'+ row.mbCode +'">'+ row.mbName +'</option>');
					$('#groupPart3').append(option);
				})
			}).fail(function() {
				alert("실패")
			});
		}
	}
	
	$("#btnPopSave").click(function() {
		console.log($('#choiceData').val());
		if($('#choiceData').val()== 'Edit') {
			tlWork = $('#groupPart3').val(); // mbCode
		  	tlWork3 = $('#groupPart2 option:checked').val();
		 	tlWork2 = $("#groupPart3 option:checked").text(); // 변경된 담당자 사원명
			tlWork4 = $('#groupPart2 option:checked').text(); // 변경된 담당자 부서
			$("#chargeName").val(tlWork2);
			changeTlMbCode = $("#hdName").val();
			changeTlGrmCode = $("#hdName2").val(); 
			console.log(tlWork2);
			
			if(tlWork2 == '선택'){
				alert('변경하실 담당자를 선택해주세요.');
				return false;
			}else{
				$('.changeManager').empty();
				$('.changeManager').append(dataListView());
				$.ajax({
					type : "POST"
					,url : "/empo/tplink.tlWorkOld.do"
					,data : {'tlWork' : tlWork, 'tlWork3' : tlWork3, 'tlWorkMbCode' : tlWorkMbCode, 'tlWorkGrmCode' : tlWorkGrmCode, 'tlPk' : tlPk}
				}).done(function(){
					alert('담당자가 변경되었습니다.');
					fnPopupAddClose();
				}).fail(function(){
					alert('실패');
				});
			} 
		} else {
			tlWork5 = $("#groupPart3 option:checked").text();
			tlWork = $("#groupPart3 option:checked").val();
		  	tlWork3 = $('#groupPart2 option:checked').val();
		  	$("#hdName").val(tlWork);
			$("#hdName2").val(tlWork3);
			console.log(tlWork5)
			// var tlMbCode2 = $("#hdName").val(); // 담당자(업무요청)
			// var tlGrmCode2 = $("#hdName2").val(); // 담당기관(업무요청)
		  	if(tlWork5 == '선택'){
				alert('담당자를 선택해주세요.');
				return false;
			}else{
				$("#chargeName").empty();
				$("#chargeName").val(tlWork5);
				fnPopupAddClose();
			}
		}
	})
	//선택버튼 클릭
	/*$(document).on('click', '#btnPopSave', function() {
		console.log($('#choiceData').val());
		 if($('#choiceData').val()== 'Edit'){
		  	tlWork = $('#groupPart3').val(); // mbCode
		  	tlWork3 = $('#groupPart2 option:checked').val();
		 	tlWork2 = $("#groupPart3 option:checked").text(); // 변경된 담당자 사원명
			tlWork4 = $('#groupPart2 option:checked').text(); // 변경된 담당자 부서
			$("#chargeName").val(tlWork2);
			changeTlMbCode = $("#hdName").val();
			changeTlGrmCode = $("#hdName2").val(); 
			console.log(tlWork2);
			if(tlWork2 == '선택'){
				alert('변경하실 담당자를 선택해주세요.');
				fnPopupAddClose();
				return false;
				}else{
					$('.changeManager').empty();
					$('.changeManager').append(dataListView());
					$.ajax({
						type : "POST"
						,url : "/empo/tplink.tlWorkOld.do"
						,data : {'tlWork' : tlWork, 'tlWork3' : tlWork3, 'tlWorkMbCode' : tlWorkMbCode, 'tlWorkGrmCode' : tlWorkGrmCode, 'tlPk' : tlPk}
					}).done(function(){
						alert('담당자가 변경되었습니다.')
						fnPopupAddClose();
					}).fail(function(){
						alert('실패');
					});
				} 
		}else{
			tlWork5 = $("#groupPart3 option:checked").text();
			tlWork = $("#groupPart3 option:checked").val();
		  	tlWork3 = $('#groupPart2 option:checked').val();
		  	$("#hdName").val(tlWork);
			$("#hdName2").val(tlWork3);
			console.log(tlWork5)
			// var tlMbCode2 = $("#hdName").val(); // 담당자(업무요청)
			// var tlGrmCode2 = $("#hdName2").val(); // 담당기관(업무요청)
		  	if(tlWork5 == '선택'){
				alert('담당자를 선택해주세요.');
				return false;
			}else{
				$("#chargeName").empty();
				$("#chargeName").val(tlWork5);
				fnPopupAddClose();
			}
		} 
	}); */
	
	var dataListView = function() {
		var data = 
			'<li class="tlink_info_tit">'+tlWorkGrmName+' '+tlWorkMbName+'<span></span>'+tlWork4+' '+tlWork2+'</li>'
		return $(data);
	} 
	
	$(function() {
		$.post('/empo/auth/eMAU00F01SearchFirstOption.do').done(function(res) {
			res.list.forEach( function(row, index) {
				var option = $('<option value="'+ row.grmCode +'">'+ row.grmName +'</option>');
				$('#groupPart1').append(option);
			});
		}).fail(function() {
			alert("실패");
		});
		
		$('#groupPart1').change(groupCode);
		$('#groupPart2').change(Name);
	});
	
	
	
	
	
	/* $(document).ready(function() {
		//부서정보 호출
		$.post('/empo/auth/eMAU00F01SearchFirstOption.do').done(function(res) {
			res.list.forEach( function(row, index) {
				var option = $('<option value="'+ row.grmCode +'">'+ row.grmName +'</option>');
				$('#groupPart1').append(option)
			})
		}).fail(function() {
			alert("실패");
		});
		
		$(function() {
			$('#groupPart1').change(groupCode);
		});
		
		// 서브 그룹
		var groupCode = function() {
			var el = $(this);
			var data = el.val();
			var id = el.attr('id');
			
			if (id == 'groupPart1') {
				$('#groupPart2').children('option:not(:first)').remove();
				
				$.get( '/empo/auth/eMAU00F01SearchSubOption.do', { "grpCode" : data } ).done(function(res) {
					res.list.forEach( function(row, index) {
						var option = $('<option value="'+ row.grmCode +'">'+ row.grmName +'</option>');
						$('#groupPart2').append(option);
					})
				}).fail(function() {
					alert("실패")
				});
			}
		}
		
		// 서브서브 그룹
		$(function() {
			$('#groupPart2').change(Name);
		});
		
		var Name = function() {
			var el = $(this);
			var data = el.val();
			var id = el.attr('id');
			var data2 = $('#groupPart1').val();
			
			if (id == 'groupPart2') {
				$('#groupPart3').children('option:not(:first)').remove();
				
				$.get( '/empo/tplink/eMAU00H1SearchSubOption2.do', { "grmCode" : data, "grpCode" : data2} ).done(function(res) {
					res.list.forEach( function(row, index) {
						var option = $('<option value="'+ row.mbCode +'">'+ row.mbName +'</option>');
						$('#groupPart3').append(option);
					})
				}).fail(function() {
					alert("실패")
				});
			}
		}
		//선택버튼 클릭
		$(document).on('click', '#btnPopSave', function() {
			if($('#choiceData').val()== 'Edit'){
			  	tlWork = $('#groupPart3').val(); // mbCode
			  	tlWork3 = $('#groupPart2 option:checked').val();
			 	tlWork2 = $("#groupPart3 option:checked").text(); // 변경된 담당자 사원명
				tlWork4 = $('#groupPart2 option:checked').text(); // 변경된 담당자 부서
				$("#chargeName").val(tlWork2);
				changeTlMbCode = $("#hdName").val();
				changeTlGrmCode = $("#hdName2").val(); 
				console.log(tlWork2);
				if(tlWork2 == '선택'){
					alert('변경하실 담당자를 선택해주세요.');
					fnPopupAddClose();
					return false;
					}else{
						$('.changeManager').empty();
						$('.changeManager').append(dataListView());
						$.ajax({
							type : "POST"
							,url : "/empo/tplink.tlWorkOld.do"
							,data : {'tlWork' : tlWork, 'tlWork3' : tlWork3, 'tlWorkMbCode' : tlWorkMbCode, 'tlWorkGrmCode' : tlWorkGrmCode, 'tlPk' : tlPk}
						}).done(function(){
							alert('담당자가 변경되었습니다.')
							fnPopupAddClose();
						}).fail(function(){
							alert('실패');
						});
					} 
			}else{
				tlWork5 = $("#groupPart3 option:checked").text();
				tlWork = $("#groupPart3 option:checked").val();
			  	tlWork3 = $('#groupPart2 option:checked').val();
			  	$("#hdName").val(tlWork);
				$("#hdName2").val(tlWork3);
				console.log(tlWork5)
				// var tlMbCode2 = $("#hdName").val(); // 담당자(업무요청)
				// var tlGrmCode2 = $("#hdName2").val(); // 담당기관(업무요청)
			  	if(tlWork5 == '선택'){
					alert('담당자를 선택해주세요.');
					return false;
				}else{
					$("#chargeName").empty();
					$("#chargeName").val(tlWork5);
					fnPopupAddClose();
				}
			}
		}); 
		
		var dataListView = function() {
			var data = 
			'<li class="tlink_info_tit">'+tlWorkGrmName+' '+tlWorkMbName+'<span></span>'+tlWork4+' '+tlWork2+'</li>'
				return $(data);
		} 
		
	});*/
		/*
		$('#btnPopSave').click(function() {
			var tlWork = $('#groupPart3').val();
			if ($.trim(tlWork).length < 1) {
				alert("담당자를 선택하세요.");
				$(this).focus();
				return false;
			}
			else {
				$("#chargeName").val(tlWork);
				fnPopupAddClose();
			} 
		});
		*/

	

</script>

<!-- 담당자 선택 -->
<div class="popup_guide popup_w500">	
	<input type="hidden" id="choiceData" value="<%=choice %>"/>
	<a href="javascript:void(0)" class="closebtn" onclick="fnPopupAddClose()">닫기</a>
	<h3>
		담당자 선택
	</h3>

	<div class="popup_content">

		<div class="bbs_write01">
			<ul>
				<li><span>사업부서</span>					
					<select id="groupPart1" name="groupPart1" class="input_w40" style="width:150px">
						<option value="">선택</option>
					</select>
					<select id="groupPart2" name="groupPart2" class="input_w40" style="width:150px">
						<option value="">선택</option>
					</select>
				</li>

				<li><span>이름</span>				
					<select id="groupPart3" name="groupPart3" class="input_w50" style="width:200px">
						<option value="">선택</option>
					</select>
				</li>
				<div class="btn_guide ac mt20">
				<button type="button" class="btn_style03 btn_grey" id="btnPopSave">선택</button>
				</div>
				
			</ul>
			<!-- e :btn_guide -->
		
		</div>
		<!-- e :bbs_write01 -->
		
	</div>
	<!-- e :popup_content -->

</div>
