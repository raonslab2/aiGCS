let socket;
//var wsLink = "ws://13.209.238.3:5010/websocket"; 
var wsLink = "ws://127.0.0.1:5010/websocket";
var audioElement = document.createElement('audio');

const tmLat = 37.20768619;
const tmLon = 127.75095132;
const tmZom = 16;
var map = L.map('map').setView([tmLat, tmLon], tmZom);

//offline tile load
var tiles = L.tileLayer('/images/test/{z}/{x}/{y}.png', {
	maxZoom: 17,
	minZoom: 5,
	attribution: '&copy; <a href="http://www.openstreetmap.org/copyright">OpenStreetMap</a>'
}).addTo(map);

//비행 경계구역 설정
var circle = L.circle([tmLat, tmLon], {
    color: '#A9D0F5',
    fillColor: '#f03',
    fillOpacity: 0.1,
    radius: 5000
}).addTo(map);

//폴리건
var polygon = L.polygon([
    [tmLat+0.01, tmLon+0.03],
    [tmLat+0.03, tmLon+0.06],
    [tmLat-0.07, tmLon+0.09]
]).addTo(map);



/*
* left click
*/

var popup = L.popup();

function onMapClick(e) {
    popup
        .setLatLng(e.latlng)
        .setContent("map at " + e.latlng.toString())
        .openOn(map);
}

//map.on('click', onMapClick);

map.on('contextmenu',(e) => {
  popup
  .setLatLng(e.latlng)
  .setContent('<pre>MOVE:'+ e.latlng.toString()+'</pre>')
  .addTo(map)
  .openOn(map);
  //이벤트 처리  
	$("#menu91").val(e.latlng.lng);
	$("#menu92").val(e.latlng.lat);
	$("#menu93").val($("#lm_10001_st_atitude").text()); //
	fn_droneAction('test','goto');
});


/*
 폴리곤
*/ 

var samPleIcon = L.icon({
    iconUrl: '/images/drondquad.png',
    iconSize: [65, 65],
    iconAnchor: [65, 65],
    popupAnchor: [-3, -76],
    shadowUrl: '/images/leaf-shadow.png',
    shadowSize: [68, 95],
    shadowAnchor: [22, 94]
});

/* 
*drone list
*/
 
/*
$.ajax({
	url : '/gcs/dashboard/getDroneList.do'
	, type : 'post' 
	, data : { "aiUse" : 'Y' }
	, async : false
}).done(function(res) { 
	console.log(res.list);  
	eval(res.aiDevicename)  = new L.marker([0, 0], {icon: samPleIcon}).addTo(map); 

}).fail(function() {
	alert("실패");
});
*/				
					
					
var drone101 = new L.marker([0, 0], {icon: samPleIcon}).addTo(map);
var drone102 = new L.marker([0, 0], {icon: samPleIcon}).addTo(map);
var drone103 = new L.marker([0, 0], {icon: samPleIcon}).addTo(map);
var drone104 = new L.marker([0, 0], {icon: samPleIcon}).addTo(map);
var drone105 = new L.marker([0, 0], {icon: samPleIcon}).addTo(map)
drone101.addTo(map);
drone102.addTo(map);
drone103.addTo(map);
drone104.addTo(map);
drone105.addTo(map);


/*
* main event
*/
	 $('#a10001').click(function(e){
		 $("#menu999").val("lm_10001").prop("selected", true);
		 $("#topdevie").val("lm_10001").prop("selected", true); 
		 $("#drone_select").val("lm_10001"); 
	     $("#checkDrone1").css("border","3px solid #FFD700"); 
         $("#checkDrone2").css("border","3px solid #006400"); 
         $("#checkDrone3").css("border","3px solid #006400"); 
         $("#checkDrone4").css("border","3px solid #006400"); 
         $("#checkDrone5").css("border","3px solid #006400"); 
         //drone focus
		 //let drone = eval("lm_10001"); 
		 //viewer.trackedEntity = drone;  
	 });
	 
	 $('#a10002').click(function(e){
		 $("#menu999").val("lm_10002").prop("selected", true);
		 $("#topdevie").val("lm_10002").prop("selected", true);
	     $("#drone_select").val("lm_10002"); 
	     $("#checkDrone1").css("border","3px solid #006400"); 
         $("#checkDrone2").css("border","3px solid #FFD700"); 
         $("#checkDrone3").css("border","3px solid #006400"); 
         $("#checkDrone4").css("border","3px solid #006400"); 
         $("#checkDrone5").css("border","3px solid #006400"); 
 
	 });
	 
	 $('#a10003').click(function(e){
		 $("#menu999").val("lm_10003").prop("selected", true);
		 $("#topdevie").val("lm_10003").prop("selected", true);
	     $("#drone_select").val("lm_10003");
	     $("#checkDrone1").css("border","3px solid #006400"); 
         $("#checkDrone2").css("border","3px solid #006400"); 
         $("#checkDrone3").css("border","3px solid #FFD700"); 
         $("#checkDrone4").css("border","3px solid #006400"); 
         $("#checkDrone5").css("border","3px solid #006400"); 
 
	 });
	 
	 $('#a10004').click(function(e){
		 $("#menu999").val("lm_10004").prop("selected", true);
		 $("#topdevie").val("lm_10004").prop("selected", true);
	     $("#drone_select").val("lm_10004");
	     $("#checkDrone1").css("border","3px solid #006400"); 
         $("#checkDrone2").css("border","3px solid #006400"); 
         $("#checkDrone3").css("border","3px solid #006400"); 
         $("#checkDrone4").css("border","3px solid #FFD700"); 
         $("#checkDrone5").css("border","3px solid #006400"); 
   
	 });

	 $('#a10005').click(function(e){
		 $("#menu999").val("lm_10005").prop("selected", true);
		 $("#topdevie").val("lm_10005").prop("selected", true);
	     $("#drone_select").val("lm_10005");
	     $("#checkDrone1").css("border","3px solid #006400"); 
         $("#checkDrone2").css("border","3px solid #006400"); 
         $("#checkDrone3").css("border","3px solid #006400"); 
         $("#checkDrone4").css("border","3px solid #006400"); 
         $("#checkDrone5").css("border","3px solid #FFD700"); 
  
	 });





connect();

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

		//console.log('socket.onmessage:', e.data);
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
				$('#' + list.DATA_STATE[si].dl_name + '_st_atitude').text(parseInt(list.DATA_STATE[si].st_atitude));
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
						$('#menu11').attr("value", st_roll)						
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

				droneState(list.DATA_STATE[si].st_x, list.DATA_STATE[si].st_y, list.DATA_STATE[si].st_z, list.DATA_STATE[si].dl_name);

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
		}, 1000);
	};

	socket.onerror = function(err) {
		//console.error('Socket encountered error: ', err.message, 'Closing socket'); 
		setTimeout(function() {
			connect();
		}, 1000);
	};
}

    function droneState (x,y,z,vDrone) {
      if(typeof count == "undefined" || count == "" || count == null){
    	  var count = 0; 
        }
      
       
    	if(typeof x == "undefined" || x == "" || x == null){
        	
        }else{
	
		   // var position = Cesium.Cartesian3.fromDegrees( y, x, z);
	        let tmHead;
		    var heading;  
		    var pitch;
		    var roll;

           // console.log('vDrone : ', x);

   
           // L.marker([x, y], {icon: samPleIcon}).addTo(map);
				var tArea = $("#dronelog")[0];
				var tAreaLine = tArea.value.substr(0, tArea.selectionStart).split("\n").length;
				if(tAreaLine>1000){
					$("#dronelog").val('');
				}
				
				var today = new Date();   
				
				var hours = ('0' + today.getHours()).slice(-2); 
				var minutes = ('0' + today.getMinutes()).slice(-2);
				var seconds = ('0' + today.getSeconds()).slice(-2); 
				
				var timeString = hours + ':' + minutes  + ':' + seconds;
				
            if(vDrone=='lm_10001'){
	            drone101.setLatLng([x, y]).update(); 
		         $("#dronelog").val(timeString+": [Drone=>]"+vDrone+" "+x+"/"+y+"\n"+$("#dronelog").val());
             }else if(vDrone=='lm_10002'){
	            drone102.setLatLng([x, y]).update();  
		         $("#dronelog").val(timeString+": [Drone=>]"+vDrone+" "+x+"/"+y+"\n"+$("#dronelog").val());
             }else if(vDrone=='lm_10003'){
	            drone103.setLatLng([x, y]).update(); 
		         $("#dronelog").val(timeString+": [Drone=>]"+vDrone+" "+x+"/"+y+"\n"+$("#dronelog").val());
             }else if(vDrone=='lm_10004'){
	            drone104.setLatLng([x, y]).update();  
		         $("#dronelog").val(timeString+": [Drone=>]"+vDrone+" "+x+"/"+y+"\n"+$("#dronelog").val());
             }else if(vDrone=='lm_10005'){
	            drone105.setLatLng([x, y]).update(); 
		         $("#dronelog").val(timeString+": [Drone=>]"+vDrone+" "+x+"/"+y+"\n"+$("#dronelog").val());
             }
            


            /*
			let drone = eval(vDrone); 
			
            if(vDrone=='lm_10001'){
                 //roll = parseFloat($('#menu11').val());	 
	             //pitch = parseFloat($('#menu12').val());
                 roll = parseFloat(0);	 
	             pitch = parseFloat(0);
	             tmHead = parseInt($('#menu14').val());
             }else if(vDrone=='lm_10002'){
                 //roll = parseFloat($('#menu21').val());	 
	             //pitch = parseFloat($('#menu22').val());
                 roll = parseFloat(0);	 
	             pitch = parseFloat(0);
	             tmHead = parseInt($('#menu24').val());	
			 }else if(vDrone=='lm_10003'){
                 //roll = parseFloat($('#menu31').val());	 
	             //pitch = parseFloat($('#menu32').val());
                 roll = parseFloat(0);	 
	             pitch = parseFloat(0);
	             tmHead = parseInt($('#menu34').val());	
			 }else if(vDrone=='lm_10004'){
                 //roll = parseFloat($('#menu41').val());	 
	             //pitch = parseFloat($('#menu42').val());
                 roll = parseFloat(0);	 
	             pitch = parseFloat(0);
	             tmHead = parseInt($('#menu44').val());	
			 }else if(vDrone=='lm_10005'){
                 //roll = parseFloat($('#menu51').val());	 
	             //pitch = parseFloat($('#menu52').val());
                 roll = parseFloat(0);	 
	             pitch = parseFloat(0);
	             tmHead = parseInt($('#menu54').val());	
			 } 
		    //console.log('drone heading: ',heading); 
		    //console.log('drone pitch: ',pitch); 
		    //console.log('drone roll: ',roll); 
 
		    var result=Number(heading);
		
		    if(isNaN(result)==true){
		        heading = 90
		    } 
 */
    
        }
 
      //viewer.trackedEntity = drone; 
      //console.log('vDrone : ', x);
    }


function nvl(str) {

	if (typeof str == "undefined" || str == null || str == "")
		str = "";

	return str;
}

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
		 
          console.log("waypoints::"+waypoints);
		
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

function fn_dronePathAction(obj, pk ) {
	  //drone waypoint  
     var droneName = $("#topdevie option:selected").val();
    if(droneName=='no'){
         alert("Selected No Device");
         return false;
    }
	
	var result = confirm('Would you like to apply the selected route?\n ['+droneName+']');
	if (result == false) return false;
	
	
	initList(pk,droneName);
}
 

var initList = function(pk,droneName) {
  
	    $.ajax({
	        type : 'POST',
	        url : '/gcs/dashboard/gA01MainPath.do',
	        dataType : 'json',
	        data :{dlPk:pk},
	        success : function(result) {
	        	if(result.result == 'success'){  
					$('#path_1001').val(result.waypoints); 
					if($('#leftslide').val()== 1){ 
						alert("simulation start");
						dronePathSetting(result.waypoints,droneName);  
					}else if($('#leftslide').val()== 2){
						alert("drone waypoint upload");
						dronePathWaypoint(result.waypoints,pk);  
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
	
 	/*
	* SWARM
	*/ 
	var swarm = document.swarm;
	var idx_chk = $('.idx'); 
	if(idx_chk.is(':checked')==false){
		//swarm 체크가 없으면 기존 방식으로 처리
		if (str == "goto") {
			tmOption = $("#menu91").val() + "|" + $("#menu92").val() + "|" + $("#slider1").val() + "|" + $("#slider2").val();
		}
	
		fn_sockSend(dlName, dlPk,str,tmOption);
    }else{
	    //var checked_cnt = $('input[name="chk[]"]:checked').length;
        let chk_arr = [];
		$('input[name="chk[]"]:checked').each(function(){
			chk_arr.push($(this).val()); // push: 배열에 값 삽입
		});
 
		for(var i=0; i<chk_arr.length; i++){ 
			dlName = chk_arr[i];
			
			if(i==0){
				if (str == "goto") {
					tmOption = $("#menu91").val() + "|" + $("#menu92").val() + "|" + $("#slider1").val() + "|" + $("#slider2").val();
				}
				fn_sockSend(dlName, dlPk,str,tmOption);
			}else{
				if (str == "goto") { 
					//alert('swarm config'); 

					tmOption = (parseFloat($("#menu91").val())+0.0005*i) + "|" + (parseFloat($("#menu92").val())+0.0005*i) + "|" + (Number($("#slider1").val())+i+3) + "|" + $("#slider2").val();
				}
				fn_sockSend(dlName, dlPk,str,tmOption);
			}


		
			
		}
	
    }
	

}

function fn_sockSend(dlName, dlPk,str,tmOption) {
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

