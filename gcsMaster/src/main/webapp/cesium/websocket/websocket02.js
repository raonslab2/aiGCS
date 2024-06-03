let socket;  
var wsLink = "ws://192.168.0.29:5010/websocket"; 
   
	function connect() { 
		  socket = new WebSocket(wsLink); 
		  socket.onopen = function() { 
			 
			  //$("#dialog2").prepend('connect');
			  //$('#responseText').val('connect');
			  //socket.send("{\"DATA_GUBUN\":\"GCS\"}"); 
			  socket.send("{\"DATA_GUBUN\":\"GCS\",\"DATA_REQUEST\":\"OPEN\"}"); 
		  };
		   
          let ti = 0;
		  socket.onmessage = function(e) {
			var list = JSON.parse(event.data);
			//console.log('list rev.', list);
			
			if(list.DATA_GUBUN == 'DRONE_STATE'){
				for(var si=0;si<list.DATA_STATE.length;si++){
					st_mode  = nvl(list.DATA_STATE[si].st_mode); 
					//console.log('list st_mode.', si+'/'+st_mode); 
					if(st_mode!=""){
			   		    $('#'+list.DATA_STATE[si].dl_name+'_mode').text(st_mode); 
			   		    $('#'+list.DATA_STATE[si].dl_name+'_state').text(list.DATA_STATE[si].st_state+""); 
                        // tm_atitude
                        $('#'+list.DATA_STATE[si].dl_name+'_atitude').text(list.DATA_STATE[si].st_atitude);




                        tm_voltage = parseFloat(list.DATA_STATE[si].st_bat_voltage)*100;
                        tm_voltage2 = (tm_voltage/16.8).toFixed(0); 
                        $('#'+list.DATA_STATE[si].dl_name+'_voltage2').text(tm_voltage2+"%");
					    $('#'+list.DATA_STATE[si].dl_name+'_voltage').text("("+list.DATA_STATE[si].st_bat_voltage+"v)");
	                    $('#'+list.DATA_STATE[si].dl_name+'_arm').text(list.DATA_STATE[si].st_arm);
                        if(list.DATA_STATE[si].st_arm=='True'){
                        	$('#'+list.DATA_STATE[si].dl_name+'_arm_color').css("background-color","");
						}else{
			                $('#'+list.DATA_STATE[si].dl_name+'_arm_color').css("background-color","red");
						} 
	                    $('#'+list.DATA_STATE[si].dl_name+'_satelite_num').text(list.DATA_STATE[si].st_satelite_num);
						
					  }
 
					
					}
				
				
				}
		   
		  };

		  socket.onclose = function(e) {
			  //$("#dialog2").prepend('Web Socket closed');
			  //$('#responseText').val('Web Socket closed : ' + e.reason);
		      console.log('Socket is closed. Reconnect will be attempted in 1 second.', e.reason);
		    setTimeout(function() {
		      connect();
		    }, 1000);
		  };

		  socket.onerror = function(err) {
		    //console.error('Socket encountered error: ', err.message, 'Closing socket'); 
			    setTimeout(function() {
				      connect();
				    }, 1000);
		  };
		}
	connect();
	
	function nvl(str){
		
		if(typeof str == "undefined" || str == null || str == "")
			str = "" ;
		
		return str ;
	}
	
	function check_check_checkbox() {
			$('input[name="dronelist"]').each(function() { 
				this.checked = true; 
			});
			/*
		if(isChecked) {
			$('input[name="dronelist"]').each(function() { 
				this.checked = true; 
			});
		} else {
			$('input[name="dronelist"]').each(function() {
				this.checked = false;
			});
		}
		*/
	}
	
	function check_check_uncheckbox() {
			$('input[name="dronelist"]').each(function() {
				this.checked = false;
			});
			/*
		if(isChecked) {
			$('input[name="dronelist"]').each(function() { 
				this.checked = true; 
			});
		} else {
			$('input[name="dronelist"]').each(function() {
				this.checked = false;
			});
		}
		*/
	}
	
	
	function fn_droneAction(str) { 
		
		 
           //체크박스 검증
             var selected = new Array();
             var droneId = new Array();
            $("input[type=checkbox]:checked").each(function () {
	            var drone_id = $(this).attr("id");
                selected.push(this.value);
                droneId.push(drone_id);
            });
          
            if (selected.length == 0) {
                alert("not checkbox");
                return false;

            } 
		   
			var result = confirm('Are you sure you want to do this ['+str+'] ?');
			 
	        if(result == false)return false;
		   
		  /*
	 	  let tmData ="{\r\n" + 
			"	\"DATA_STATE\": {\r\n" + 
			"		\"dlName\": \""+dlName+"\",\r\n" + 
			"		\"dlPk\": \""+dlPk+"\",\r\n" +  
			"		\"dlAction\": \""+str+"\",\r\n" +  
			"	}\r\n" + 
			"	\"DATA_GUBUN\": \"GCS\",\r\n" + 
			"	\"DATA_REQUEST\": \"DRONE_PATH\"\r\n" + 
			"}";
			*/
 
			
	        let dlName = droneId.join(",");
            console.log("dlName::",dlName);
	        let dlPk = "1";
		 	  let tmData ="{\r\n" + 
				"	\"DATA_STATE\": {\r\n" + 
				"		\"dlName\": \""+dlName+"\",\r\n" + 
				"		\"dlPk\": \""+dlPk+"\",\r\n" +  
				"		\"dlAction\": \""+str+"\",\r\n" +  
				"	}\r\n" + 
				"	\"DATA_GUBUN\": \"GCS\",\r\n" + 
				"	\"DATA_REQUEST\": \"DRONE_PATH\"\r\n" + 
				"}";
	 	  
	  
	 	   //socket.onopen = () => conn.send(tmData);
	 	   socket.send(tmData); 
		 	  
		  
	}
 
 
 
	function selectdrone(obj) { 
		
		var dlName = $(obj).parents('tr').find('td:eq(4) option:selected').text(); 
		var dlPk = $(obj).parents('tr').find('td:eq(0)').text();
	    if(dlName == "드론선택"){
		   alert("드론을 선택하세요."); 
		   return false;
	    } 
		
		var result = confirm('Are you sure you want to do this[upload] ?');
 
        if(result == false)return false;
 
	    $.ajax({
	        type : 'POST',
	        url : '/gcs/dashboard/gA03Main3.do',
	        dataType : 'json',
	        data :{dlPk:dlPk,dlName:dlName},
	        success : function(result) {
	        	if(result.result == 'success'){
	        		droneWaypointSend(dlName,dlPk,result.waypoints);
	        		alert("["+dlName+"] 적용 되었습니다.");
	        		
	        	}
	        },
	        error: function(request, status, error) {
	             // 에러 출력을 활성화 하려면 아래 주석을 해제한다. 
              alert("변경 실패하였습니다.");
	            //console.log(request + "/" + status + "/" + error);
	        }
	    }); 
	} 
	
	function droneWaypointSend(dlName,dlPk,waypoints){
		  let str = "waypoint";
	 	  let tmData ="{\r\n" + 
			"	\"DATA_STATE\": {\r\n" + 
			"		\"dlName\": \""+dlName+"\",\r\n" + 
			"		\"dlPk\": \""+dlPk+"\",\r\n" +  
			"		\"dlAction\": \""+str+"\",\r\n" +  
			"		\"dlWayPoint\": "+waypoints+",\r\n" +  
			"	}\r\n" + 
			"	\"DATA_GUBUN\": \"GCS\",\r\n" + 
			"	\"DATA_REQUEST\": \"DRONE_PATH\"\r\n" + 
			"}";
	 	  
	  
	 	   //socket.onopen = () => conn.send(tmData);
	 	   socket.send(tmData); 
		   //실시간 drone 경로 전송  
	}
	 