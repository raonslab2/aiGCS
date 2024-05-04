		;(function() {

			//${list.dlPk}
			$(function() {
				var aiPk = "${aiPk}";  
				if(aiPk !=""){
					initList(aiPk);					
				}
			});
			
			var initList = function(aiPk) {
 
				$.ajax({
					url : '/gcs/dashboard/gA034MainWriteData.do'
					, type : 'post' 
					, data : { "aiPk" : aiPk }
				}).done(function(res) {
					$('#resultList').children().remove();
					 
					    //
					var tmArr = [ 'QUAD', 'VTOL' ]; 
					var tmpath ="   <select name=\"aiDeviceType\" id=\"aiDeviceType\">\r\n";
					tmpath  += "	 <option value=\"\">--Please choose Device Type--</option>\r\n"
					    
						$.ajax({
							url : '/gcs/ga00main/ga00mainDeviceTypeList.do'
							, type : 'post' 
							, async : false 
						}).done(function(tmres) { 
							tmres.list.forEach(function(row, index) { 
								if(res.list.aiDeviceType == row.codeName){
									selectPath = "selected";
								}else{
									selectPath = "";
								}
								tmpath  += "<option value=\""+row.codeName+"\" "+selectPath+">"+row.codeName+"</option>\r\n" 
								//mbCode = row.mbCode;	
							});
						}).fail(function() {
							alert("실패");
						});
		 
					tmpath  += "   </select>";	 
					
					var data = "<tr>\r\n"
						+ "	<td>\r\n"
						+ "	  <input type=\"text\" id=\"aiPk\" name=\"aiPk\" readonly minlength=\"4\"  size=\"10\" value=\""+res.list.aiPk+"\" ></td>\r\n"
						+ "	<td>\r\n"
						+ "	  <input type=\"text\" id=\"aiDeviceName\" name=\"aiDeviceName\" required m   size=\"10\" value=\""+res.list.aiDeviceName+"\">\r\n"
						+ "	</td>\r\n"
						+ "	<td>\r\n"
						+ "	  <input type=\"text\" id=\"aiDeviceAlias\" name=\"aiDeviceAlias\" required m   size=\"10\" value=\""+res.list.aiDeviceAlias+"\">\r\n"
						+ "	</td>\r\n"
						+ "<td> \r\n"
						+ tmpath
						+ "</td>"						
						+ "	<td>\r\n"
						+ "	  <input type=\"text\" id=\"aiAgency\" name=\"aiAgency\" required   size=\"10\" value=\""+res.list.aiAgency+"\">\r\n"
						+ "	</td>\r\n"
						+ "	<td>\r\n"
						+ "	  <input type=\"text\" id=\"aiRegisterId\" name=\"aiRegisterId\" required   size=\"10\" value=\""+res.list.aiRegisterId+"\">\r\n"
						+ "	</td>\r\n"
						+ "	<td>\r\n"
						+ "	  <input type=\"text\" id=\"aiMemo\" name=\"aiMemo\" required   size=\"10\" value=\""+res.list.aiMemo+"\">\r\n"
						+ "	</td>\r\n"
						+ "</tr>";
					$('#resultList').append(data);
				}).fail(function() {
					alert("실패");
				});
			};
			
 
			

			$('.dataInsert').click(function() {
				// function
				var formSer = $('#insertForm').serialize();

				$.ajax({
					url : '/gcs/dashboard/gA034MainWriteInsert.do',
					type : 'post',
					data : formSer,
					async : false
				}).done(function(res) {
					console.log(res.list);
					alert("Success");
					$("#aiPk").val(res.list.aiPk);
				}).fail(function() {
					alert("실패");
				});
			});

		})();