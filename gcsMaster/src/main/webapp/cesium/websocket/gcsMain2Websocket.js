let socket; 
//var wsLink = "ws://13.209.238.3:5010/websocket"; 
var wsLink = "ws://127.0.0.1:5010/websocket";
//var wsLink = "ws://samsungdrone.net:5010/websocket";
var audioElement = document.createElement('audio');

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

		//console.log('Message:', e.data);
		//$('#responseText').val($('#responseText').val()+"\n"+event.data);
		// $('#responseText').val(event.data); 

		//var list = JSON.stringify(event.data);
		var list = JSON.parse(event.data);




		if (list.DATA_GUBUN == 'DRONE_STATE') {
			//console.log('DATA_STATE : ', list.DATA_STATE.length);
			//$("#dialog2").prepend(JSON.stringify(list.DATA_STATE)  ); 


			for (var si = 0; si < list.DATA_STATE.length; si++) {


				//console.log('DATA_STATE : ', list.DATA_STATE[si]); 
				st_mode = nvl(list.DATA_STATE[si].st_mode);
				$('#' + list.DATA_STATE[si].dl_name + '_dl_name').text(list.DATA_STATE[si].dl_name + " [" + st_mode + "]");
				$('#' + list.DATA_STATE[si].dl_name + '_st_satelite_num').text(list.DATA_STATE[si].st_satelite_num);

				//var first_char = list.DATA_STATE[si].st_bat_voltage.substr(0, 6);
				//$('#'+list.DATA_STATE[si].dl_name+'_st_bat_voltage').text(first_char); 
				$('#' + list.DATA_STATE[si].dl_name + '_st_bat_voltage').text(list.DATA_STATE[si].st_bat_voltage);
				$('#' + list.DATA_STATE[si].dl_name + '_st_bat_level').text(list.DATA_STATE[si].st_bat_level);
				$('#' + list.DATA_STATE[si].dl_name + '_st_speed').text(list.DATA_STATE[si].st_speed);
				//$('#' + list.DATA_STATE[si].dl_name + '_st_atitude').text(parseInt(list.DATA_STATE[si].st_atitude));
				$('#' + list.DATA_STATE[si].dl_name + '_st_atitude').text(parseInt(list.DATA_STATE[si].st_z));
				$('#' + list.DATA_STATE[si].dl_name + '_st_state').text(list.DATA_STATE[si].st_state);

 

				st_roll = nvl(list.DATA_STATE[si].st_roll);		
				st_pitch = nvl(list.DATA_STATE[si].st_pitch);
				st_yaw = nvl(list.DATA_STATE[si].st_yaw);				
				st_head = nvl(list.DATA_STATE[si].st_head);
				
				let droneName     = $("#topdevie option:selected").val();  
				if(list.DATA_STATE[si].dl_name==droneName){  
					$("#d_roll").text(Math.round(st_roll * 100)/100);
					$("#d_pitch").text(Math.round(st_pitch * 100)/100);
					$("#d_yaw").text(Math.round(st_yaw * 100)/100);
					$("#droneAltitudeInfo").val(parseInt(list.DATA_STATE[si].st_atitude));
				 
					
					if (list.DATA_STATE[si].dl_name == 'lm_10001') {
						$('#menu11').attr("value", -st_roll)						
						$('#menu12').attr("value", st_pitch)					
						$('#menu14').attr("value", st_yaw) 
					} else if (list.DATA_STATE[si].dl_name == 'lm_10002') {
						$('#menu21').attr("value", st_roll)
						$('#menu22').attr("value", st_pitch)
						$('#menu24').val(st_head);
					} else if (list.DATA_STATE[si].dl_name == 'lm_10003') {
						$('#menu31').attr("value", st_roll)
						$('#menu32').attr("value", st_pitch)
						$('#menu34').val(st_head);
					} else if (list.DATA_STATE[si].dl_name == 'lm_10004') {
						$('#menu41').attr("value", st_roll)
						$('#menu42').attr("value", st_pitch)
						$('#menu44').val(st_head);
					} else if (list.DATA_STATE[si].dl_name == 'lm_10005') {
						$('#menu51').attr("value", st_roll)
						$('#menu52').attr("value", st_pitch)
						$('#menu54').val(st_head);
					}

				}
                console.log(list.DATA_STATE[si]);
				droneState(
					       list.DATA_STATE[si].st_x
				         , list.DATA_STATE[si].st_y
                         , list.DATA_STATE[si].st_atitude
                         , list.DATA_STATE[si].dl_name
                         , list.DATA_STATE[si].st_time
                         );

			}
			ti = ti + 1;
		}

		//$('#responseText').val(event.data+"\n"+$('#responseText').val());
		// $('#sendmessage').val("");
	};

	socket.onclose = function(e) {
		//$("#dialog2").prepend('Web Socket closed');
		//$('#responseText').val('Web Socket closed : ' + e.reason);
		console.log('Socket is closed. Reconnect will be attempted in 1 second.', e.reason);
		setTimeout(function() {
			connect();
		}, 3000);
	};

	socket.onerror = function(err) {
		//console.error('Socket encountered error: ', err.message, 'Closing socket'); 
		setTimeout(function() {
			connect();
		}, 3000);
	};
}
connect();

	function nvl(str) {
	
		if (typeof str == "undefined" || str == null || str == "")
			str = "";
	
		return str;
	}
    
    //FC 업로드
	function selectdrone(dlPk,dlName) {
		 
		
		var result = confirm('Are you sure you want to do this[upload] ?');
 
        if(result == false)return false;
 
	    $.ajax({
	        type : 'POST',
	        url : '/gcs/dashboard/gA03Main3.do', 
	        dataType : 'json',
	        data :{dlPk:dlPk,dlName:dlName},
	        success : function(result) {
	        	if(result.result == 'success'){
                    //기체에 경로 전송
	        		droneWaypointSend(dlName,dlPk,result.waypoints);
	        		 
	        		
	        	}
	        },
	        error: function(request, status, error) {
	             // 에러 출력을 활성화 하려면 아래 주석을 해제한다. 
              alert("변경 실패하였습니다.");
	            //console.log(request + "/" + status + "/" + error);
	        }
	    }); 
	}
	
    //MC 업로드
	function selectdrone2(dlPk,dlName) {
		 
		
		var result = confirm('Are you sure you want to do this[upload] ?');
 
        if(result == false)return false;
 
	    $.ajax({
	        type : 'POST',
	        url : '/gcs/dashboard/gA03Main32.do', 
	        dataType : 'json',
	        data :{dlPk:dlPk,dlName:dlName},
	        success : function(result) {
	        	if(result.result == 'success'){
                    //기체에 경로 전송
	        		droneWaypointSend2(dlName,dlPk,result.waypoints);
	        		 
	        		
	        	}
	        },
	        error: function(request, status, error) {
	             // 에러 출력을 활성화 하려면 아래 주석을 해제한다. 
              alert("변경 실패하였습니다.");
	            //console.log(request + "/" + status + "/" + error);
	        }
	    }); 
	}
	
//FC 기체 경로 등록
function droneWaypointSend(dlName,dlPk,waypoints){
	  
  
	
	  let str = "waypoint"; // arm , disarm , takeoff etc...
 	  let tmData ="{\r\n" + 
		"	\"DATA_STATE\": {\r\n" + 
		"		\"dlName\": \""+dlName+"\",\r\n" + 
		"		\"dlPk\": \""+dlPk+"\",\r\n" +  
		"		\"dlAction\": \""+str+"\",\r\n" +  // arm , disarm , takeoff etc...
		"		\"dlWayPoint\": "+waypoints+",\r\n" +  // 세부 전달 내용
		"	}\r\n" + 
		"	\"DATA_GUBUN\": \"GCS\",\r\n" + 
		"	\"DATA_REQUEST\": \"DRONE_PATH\"\r\n" + 
		"}";
 	  
  
 	   //socket.onopen = () => conn.send(tmData);
 	   socket.send(tmData); 
	   //실시간 drone 경로 전송  
}


//MC 기체 경로 등록
function droneWaypointSend2(dlName,dlPk,waypoints){
	   
	  let str = "waypointMc"; // arm , disarm , takeoff etc...
 	  let tmData ="{\r\n" + 
		"	\"DATA_STATE\": {\r\n" + 
		"		\"dlName\": \""+dlName+"\",\r\n" + 
		"		\"dlPk\": \""+dlPk+"\",\r\n" +  
		"		\"dlAction\": \""+str+"\",\r\n" +  // arm , disarm , takeoff etc...
		"		\"dlWayPoint\": "+waypoints+",\r\n" +  // 세부 전달 내용
		"	}\r\n" + 
		"	\"DATA_GUBUN\": \"GCS\",\r\n" + 
		"	\"DATA_REQUEST\": \"DRONE_PATH\"\r\n" + 
		"}";
 	  
  
 	   //socket.onopen = () => conn.send(tmData);
 	   socket.send(tmData); 
	   //실시간 drone 경로 전송  
}


function droneWaypointDownLoad(dlName){
	 
      console.log("droneWaypointDownLoad::"+droneWaypointDownLoad);
	
    let dlPk = "0";
    let str = "missiondown"; // arm , disarm , takeoff etc...
    let tmOption = "-";
	let tmData = "{\r\n" +
		"	\"DATA_STATE\": {\r\n" +
		"		\"dlName\": \"" + dlName + "\",\r\n" +
		"		\"dlPk\": \"" + dlPk + "\",\r\n" +
		"		\"dlAction\": \"" + str + "\",\r\n" +
		"		\"dlOption\": \"" + tmOption + "\",\r\n" +
		"	}\r\n" +
		"	\"DATA_GUBUN\": \"GCS\",\r\n" +
		"	\"DATA_REQUEST\": \"DRONE_PATH\"\r\n" +
		"}";
  
 	   //socket.onopen = () => conn.send(tmData);
 	   socket.send(tmData); 
	   //실시간 drone 경로 전송  
}

function send(message) {
	if (!window.WebSocket) { return; }
	if (socket.readyState == WebSocket.OPEN) {
		//socket.send(message); 
		socket.send('{ "DATA_GUBUN" :"GCS", "DATA_REQUEST" :"' + message + '" }');
	} else {
		alert("The socket is not open.");
		console.error('The socket is not open.');
		connect();
	}
}

function fn_dronePathAction(obj, pk,str ) {
	  //drone waypoint  
     var droneName = $("#topdevie option:selected").val();
    if(droneName=='no'){
         alert("Selected No Device");
         return false;
    }
	
	var result = confirm('Would you like to apply the selected route?\n ['+droneName+']');
	if (result == false) return false;
	
	
	initList(pk,droneName,str);
}
 

var initList = function(pk,droneName,str) {
	var tmUrl = "";
	if(str=="1"){
		tmUrl = "/gcs/dashboard/gA01MainPath2.do";
	}else if(str=="2"){
		tmUrl = "/gcs/dashboard/gA01MainPath.do";
	}else if(str=="3"){
		tmUrl = "/gcs/dashboard/gA01MainPath.do";
	}
  
	    $.ajax({
	        type : 'POST',
	        url : tmUrl, 
	        dataType : 'json',
	        data :{dlPk:pk},
	        success : function(result) {
	        	if(result.result == 'success'){   
					$('#path_1001').val(result.waypoints); 
					if(str== "3"){ 
						//alert("simulation start");
						// 시뮬레이션
						dronePathSetting(result.waypoints,droneName,result.dlWaypointDetail);  
					}else if(str== "2"){ 
						//경로 FC 업로드
						dronePathWaypoint(result.waypoints,pk,result.dlWaypointDetail);  
					}else if(str== "1"){ 
						//경로 MC 업로드
						dronePathWaypoint2(result.waypoints,pk,result.dlWaypointDetail);  
					}   
					
					//$("#drone_select").val("lm_10005");
	        		
	        	}
	        },
	        error: function(request, status, error) { 
	            //console.log(request + "/" + status + "/" + error);
	        }
	    });
	
};
 

function fn_droneAction(obj, str) {
	var dlName = "lm_10001";
	//dlName = $("#menu999").val();
	dlName = $("#menu999 option:selected").val();
	var dlPk = "10";
	if (dlName == "드론선택") {
		audioElement.setAttribute('src', '/sound/drone_no.mp4');
		audioElement.play(); 
		return false;
	}

	var result = confirm('Are you sure you want to do this [' + str + '] ?');

	if (result == false){
		audioElement.setAttribute('src', '/sound/drone_cancel.mp4');
		audioElement.play();
		return false;
	} 
	
	if(str == 'arm'){
		audioElement.setAttribute('src', '/sound/drone_arm.mp4');
	}else if(str == 'takeoff'){
		audioElement.setAttribute('src', '/sound/drone_takeoff.mp4');
	}else if(str == 'auto'){
		audioElement.setAttribute('src', '/sound/drone_auto.mp4');		
	}else if(str == 'rtl'){
		audioElement.setAttribute('src', '/sound/drone_rtl.mp4');		
	}else if(str == 'goto'){
		audioElement.setAttribute('src', '/sound/drone_goto.mp4');		
	}else{
		audioElement.setAttribute('src', '/sound/drone_etc.mp4');			
	}
	
		audioElement.play();

	tmOption = "";
	if (str == "goto") {
		tmOption = $("#menu91").val() + "|" + $("#menu92").val() + "|" + $("#slider1").val() + "|" + $("#slider2").val();
	}

	let tmData = "{\r\n" +
		"	\"DATA_STATE\": {\r\n" +
		"		\"dlName\": \"" + dlName + "\",\r\n" +
		"		\"dlPk\": \"" + dlPk + "\",\r\n" +
		"		\"dlAction\": \"" + str + "\",\r\n" +
		"		\"dlOption\": \"" + tmOption + "\",\r\n" +
		"	}\r\n" +
		"	\"DATA_GUBUN\": \"GCS\",\r\n" +
		"	\"DATA_REQUEST\": \"DRONE_PATH\"\r\n" +
		"}";
 

	//socket.onopen = () => conn.send(tmData);
	socket.send(tmData);
}

