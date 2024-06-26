	;(function() {
		$(function() {
	
    //초기 호출값
    init();
	
	//날씨
	const weatheData = "";
    $.ajax({
        url: 'https://api.openweathermap.org/data/2.5/weather?lat=36.17249817950348&lon=128.46534933245377&appid=d08e6e828db23d3af1769ee1f059f7e8',
        type: 'GET'
    }).done((data, textStatus, jqXHR) => {   
	    let tempData = "";
        tempData +="  "+data.name; 
        tempData +=", "+data.weather[0].description;
        tempData +=", speed("+data.wind.speed+")";  
        tempData +=", deg("+data.wind.deg+")";  
        tempData +=", gust("+data.wind.gust+")";
        $('#menu1001').text(tempData);  
        console.log(data.weather[0].main);
        console.log(data);
        console.log(textStatus);
        console.log(jqXHR);
    }).fail((jqXHR, textStatus, errorThrown) => {
        console.log('실패');
        console.log(jqXHR);
        console.log(textStatus);
        console.log(errorThrown);
    }).always((param1, param2, param3) => {
        console.log('종료');
        console.log(param1);
        console.log(param2);
        console.log(param3);
    }).then((data, textStatus, jqXHR) => {
        console.log('성공 캐이스')
    }, (jqXHR, textStatus, errorThrown) => {
        console.log('실패 캐이스')
    });
	
	//height , speed 
	$("#dialog2").dialog({
		dialogClass: "no-close",
		autoOpen: false,
		position: {
			my: "right bottom",
			at: "right bottom-40",
			of: window
		},
		width: 580,
		height: 112,
		show: {
			effect: "blind",
			duration: 1000
		},
		hide: {
			effect: "explode",
			duration: 1000
		}
	});

	//$( "#dialog2" ).dialog( "open" );

	var smenutop = 0;
	$('.smenutop').click(function(e) {
		if (smenutop == 0) {
			$("#smenutop").attr('src', "/images/list_icon.jpg");
			smenutop = 1;
			$('#menu0').val('1');
		} else {
			$("#smenutop").attr('src', "/images/list_icon2.jpg");
			smenutop = 0;
			$('#menu0').val('0');
		}

	});
	
 	$('#simulatorSt').click(function(e) {
	    var droneName = "lm1001";
	    $.ajax({
	        type : 'POST',
	        url : '/gcs/dashboard/actionSimulator.do',
	        dataType : 'json',
	        data :{droneName :droneName},
	        success : function(res) {
		      alert(droneName+" 시뮬레이터가 실행되었습니다.");

	        	 
	        },
	        error: function(request, status, error) {
	             // 에러 출력을 활성화 하려면 아래 주석을 해제한다. 
	            console.log(request + "/" + status + "/" + error);
	        }
	    });

	});
	
	$('#simulatorEd').click(function(e) {
		alert(22);

	});

	$("#dialog").dialog({
		dialogClass: "no-close",
		autoOpen: false,
		position: { my: "left+35 top+25", at: "left+35 top+55", of: document }, // 좌측 탑 정렬시
		width: 285,
		height: 460,
		show: {
			effect: "blind",
			duration: 1000
		},
		hide: {
			effect: "explode",
			duration: 1000
		},
		open: function(event, ui) {
			$(".ui-dialog-titlebar-close", $(this).parent()).hide();
		}
	});

	$('#regSS').css('overflow', 'hidden');
	
	



	var smenutop2 = 0;
	$('.smenutop2').click(function(e) {
 
		if (smenutop2 == 0) {
			$("#smenutop2").attr('src', "/images/iconSim.png");
			smenutop2 = 1;
			$('#menu02').val('1');
			$('#leftslide').val('1');
			// 다이알로그 보이기
			//$("#dialog").dialog("open");
			initListRoute("3");

		} else {
			$("#smenutop2").attr('src', "/images/iconSim.png");
			smenutop2 = 0;
			$('#menu02').val('0');
			$('#leftslide').val('1');
			// 다이알로그 감추기
			//$('#dialog').dialog('close')
		}

	});
	
	var smenutop21 = 0;
	$('.smenutop21').click(function(e) {
		if (smenutop21 == 0) { 
			$("#smenutop21").attr('src', "/images/btnUp.png");
			smenutop21 = 1;
			$('#menu02').val('1');
			$('#leftslide').val('2');
			// 다이알로그 보이기
			//$("#dialog").dialog("open");
			initListRoute("2");

		} else {
			$("#smenutop21").attr('src', "/images/btnUp.png");
			smenutop21 = 0;
			$('#menu02').val('0');
			$('#leftslide').val('2');
			// 다이알로그 감추기
			//$('#dialog').dialog('close')
		}

	});
	
	var smenutop22 = 0; 
	$('.smenutop22').click(function(e) {
		if (smenutop22 == 0) {
			$("#smenutop22").attr('src', "/images/btnDw.png");
			smenutop22 = 1;
		} else {
			$("#smenutop22").attr('src', "/images/btnDw.png");
			smenutop22 = 0;	 
		}
	     var droneName = $("#topdevie option:selected").val();
	    if(droneName=='no'){
	         alert("Selected No Device");
	         return false;
	    }
		
		var result = confirm('Would you like to download drone routes?\n ['+droneName+']');
		if (result == false) return false;
		
		droneWaypointDownLoad(droneName);
	});
	
	var smenutop23 = 0;
	$('.smenutop23').click(function(e) {
		if (smenutop23 == 0) {
			$("#smenutop23").attr('src', "/images/btnUpload101.svg");
			smenutop23 = 1;
			$('#menu02').val('1');
			$('#leftslide').val('2'); 
			//라우드 경로정볼르 새로 불러온다
			initListRoute("1");
			// 다이알로그 보이기
			//$("#dialog").dialog("open");

		} else {
			$("#smenutop23").attr('src', "/images/btnUpload101.svg");
			smenutop23 = 0;
			$('#menu02').val('0');
			$('#leftslide').val('2');
			// 다이알로그 감추기
			//$('#dialog').dialog('close')
		}

	});
	
	
	

	var smenutop5 = 0;
	$('.smenutop5').click(function(e) {
		if (smenutop5 == 0) {
			$("#smenutop5").attr('src', "/images/dash2.png");
			smenutop5 = 1;
			$('#smenutop5').val('1');
			// 다이알로그 보이기
			// $( "#dialog" ).dialog( "open" );
			//openWin('/gcs/dashboard/gA01Main3.do', 600, 500);
			window.open( '/gcs/dashboard/gA01Main3_1.do', 'opencamer', 'status=0,toolbar=no,scrollbars=0,resizable=0,top=100, left=100, width=575, height=353');
               
		} else {
			$("#smenutop5").attr('src', "/images/dash1.png");
			smenutop5 = 0;
			$('#smenutop5').val('0');
			closeWin();
			// 다이알로그 감추기
			//$('#dialog').dialog('close')
		}

	});
	
	var d_1_4 = 0;
	$('#d_1_4').click(function(e) {
		if (d_1_4 == 0) { 
			d_1_4 = 1;	  
			window.open( '/gcs/dashboard/gA01Main3_1.do?nameChk=d_1_4', 'd_1_4', 'status=0,toolbar=no,scrollbars=0,resizable=0,top=100, left=100, width=575, height=353');
		} else { 
			d_1_4 = 0; 
			//closeWin();
			// 다이알로그 감추기
			//$('#dialog').dialog('close')
		}
	});
	
	var d_2_4 = 0;
	$('#d_2_4').click(function(e) {
		if (d_2_4 == 0) { 
			d_2_4 = 1;	  
			window.open( '/gcs/dashboard/gA01Main3_2.do?nameChk=d_2_4', 'd_2_4', 'status=0,toolbar=no,scrollbars=0,resizable=0,top=100, left=100, width=575, height=353');
		} else { 
			d_2_4 = 0; 
			//closeWin();
			// 다이알로그 감추기
			//$('#dialog').dialog('close')
		}
	});
	
	var d_3_4 = 0;
	$('#d_3_4').click(function(e) {
		if (d_3_4 == 0) { 
			d_3_4 = 1;	  
			window.open( '/gcs/dashboard/gA01Main3_3.do?nameChk=d_3_4', 'd_3_4', 'status=0,toolbar=no,scrollbars=0,resizable=0,top=100, left=100, width=575, height=353');
		} else { 
			d_3_4 = 0; 
			//closeWin();
			// 다이알로그 감추기
			//$('#dialog').dialog('close')
		}
	});
	
	
	var d_4_4 = 0;
	$('#d_4_4').click(function(e) {
		if (d_4_4 == 0) { 
			d_4_4 = 1;	  
			window.open( '/gcs/dashboard/gA01Main3_4.do?nameChk=d_4_4', 'd_4_4', 'status=0,toolbar=no,scrollbars=0,resizable=0,top=100, left=100, width=575, height=353');
		} else { 
			d_4_4 = 0; 
			//closeWin();
			// 다이알로그 감추기
			//$('#dialog').dialog('close')
		}
	});
	
	
	var d_5_4 = 0;
	$('#d_5_4').click(function(e) {
		if (d_5_4 == 0) { 
			d_5_4 = 1;	  
			window.open( '/gcs/dashboard/gA01Main3_5.do?nameChk=d_5_4', 'd_5_4', 'status=0,toolbar=no,scrollbars=0,resizable=0,top=100, left=100, width=575, height=353');
		} else { 
			d_5_4 = 0; 
			//closeWin();
			// 다이알로그 감추기
			//$('#dialog').dialog('close')
		}
	});

	var smenutop6 = 0;
	$('.smenutop6').click(function(e) {
		if (smenutop6 == 0) {
			$("#smenutop6").attr('src', "/images/dash2.png");
			smenutop6 = 1;
			$('#menu06').val('1');
			// 다이알로그 보이기
			// $( "#dialog" ).dialog( "open" );
			openWin('/gcs/dashboard/gA01Main6.do', 950, 570);

		} else {
			$("#smenutop6").attr('src', "/images/dash1.png");
			smenutop6 = 0;
			$('#menu06').val('0');
			closeWin();
			// 다이알로그 감추기
			//$('#dialog').dialog('close')
		}

	});
	
	var smenutop7 = 0;
	$('.smenutop7').click(function(e) {
		if (smenutop7 == 0) { 
			smenutop7 = 1;
			$('#menu07').val('1');
			// 다이알로그 보이기
			// $( "#dialog" ).dialog( "open" );
			//openWin('/gcs/dashboard/gA03Main.do', 1980, 720);
			open( '/gcs/dashboard/gA03Main.do', 'openwin', 'top=100, left=300, width=1920, height=1080');

		} else { 
			smenutop7 = 0;
			$('#menu07').val('0');
			closeWin();
			// 다이알로그 감추기
			//$('#dialog').dialog('close')
		}

	});
	
	var smenutop8 = 0;
	$('.smenutop8').click(function(e) {
		if (smenutop8 == 0) { 
			smenutop8 = 1;
			$('#menu08').val('1');
			// 다이알로그 보이기
			// $( "#dialog" ).dialog( "open" );
			//openWin('/gcs/dashboard/gA03Main.do', 1980, 720);
			open( '/gcs/dashboard/gA01Main2.do', 'openwin', 'top=0, left=100, width=1920, height=1080');

		} else { 
			smenutop8 = 0;
			$('#menu08').val('0');
			closeWin();
			// 다이알로그 감추기
			//$('#dialog').dialog('close')
		}

	});



	var currentdate = new Date();
	var datetime = "Mission of " + currentdate.getDate() + "/"
		+ (currentdate.getMonth() + 1) + "/"
		+ currentdate.getFullYear() + " @ "
		;
	var datetime2 = " " + currentdate.getHours() + ":"
		+ currentdate.getMinutes() + ":"
		+ currentdate.getSeconds();
	$('#nowtime').text(datetime);

	$('#nowtime2').text(datetime2);


	var smenu1 = 0;
	$('.smenu1').click(function(e) {
		if (smenu1 == 0) {
			$("#smenu1").attr('src', "/images/on.png");
			smenu1 = 1;
			$('#menu1').val('1');
			$("#dialog2").dialog("open");
		} else {
			$("#smenu1").attr('src', "/images/off.png");
			smenu1 = 0;
			$('#menu1').val('0');
			$("#dialog2").dialog("close");
		}

	});

	$('.smenutop9').click(function(e) {
		$(location).attr('href', '/gcs/login/actionLogout.do');
	});
	
     //좌측상단 , topdevie changeenvent
    $("#topdevie").change(function(){
        // 변경된 값으로 비교 후 alert 표출   
         var idx = $("#topdevie option").index( $("#topdevie option:selected") );
         for(var i=0;i<10;i++){
	        if(i==(idx-1)){
	          $("#droneState_"+(i)).css("border","3px solid #FFD700"); 
	        }else{
	          $("#droneState_"+(i)).css("border","3px solid #006400");  
	        }
         }
      
        //$('.droneFix').removeClass('on');
 
	     
    });

	//
	//$( "#dialog" ).dialog();
});

/*
read 종료
*/

var init = function(tmDiv) {
	//드론 Y 사용 정보 호출
	  droneStateNavi();

  

    // 경로
    //initListRoute();
	
};

//드론 좌측 상단 상태 네비게이션
var droneStateNavi = function() {
	    var aiUse = "Y";
	    
	    $.ajax({
	        type : 'POST',
	        url : '/gcs/dashboard/selectDroneList.do',
	        dataType : 'json',
	        data :{aiUse :aiUse},
	        success : function(res) {
		      $('#dronestateList').children().remove();

				 if(res.totalCnt == '0'){
	                  alert("드론 설정 정보가 존재하지 않습니다. 관리자화면에서 사용드론을 추가해 주시기 바랍니다.");
				}else{
					res.list.forEach(function(row, index) {
		 
						$('#dronestateList').append(droneStateNaviView(row,index));
			 
					}); 
				}

	        	 
	        },
	        error: function(request, status, error) {
	             // 에러 출력을 활성화 하려면 아래 주석을 해제한다. 
	            console.log(request + "/" + status + "/" + error);
	        }
	    });
	};
	
//드론 좌측 상단 상태 네비게이션 페이지 출력
var droneStateNaviView = function(row,index) { 
	
		var data =""
				+ "<div class=\"droneFix\" pageTodayClass' id='droneState_"+index+"' >\r\n"
				+ "   <table class=\"topDroneState\"> \r\n"
				+ "	 <tr>\r\n"
				+ "	   <td><img style=\"\" class=\"d_1_1\" id=\"d_1_1\" src=\"/images/drone.png\"  style=\"height:45px\" /></td>\r\n"
				+ "	   <td><img class=\"d_1_2\" id=\"d_1_2\" src=\"/images/iconRecord.png\"  style=\"height:40px;\" /></td>\r\n"
				+ "	   <td><img class=\"d_1_3\" id=\"d_1_3\" src=\"/images/iconAnt.png\"  style=\"height:40px;\" /></td>\r\n"
				+ "	   <td><img class=\"d_1_4\" id=\"d_1_4\" src=\"/images/iconStr.png\" data-page='"+index+"'  style=\"height:40px; \" /></td>\r\n"
				+ "	 </tr>\r\n"
				+ "   </table> \r\n"
				+ "</div>";
 
		return $(data);
};


//카메라
$(document).on('click', '.d_1_4', function() {	 
    var videoNum = $(this).data('page')+1; 
 
	window.open("/gcs/dashboard/gA01Main3_"+videoNum+".do", "video : "+videoNum, 'width=575, height=353, scrollbars=yes, resizable=no')
	   
});

//좌측 계기관 열고 닫기
$(document).on('click', '#checkDroneTogle', function() {	 
 
	if($("#checkDroneDetail").css("display") == "none"){
	    $("#checkDroneDetail").show(); 
        $("#checkDroneTogle").attr("src", "/images/ToggleOpen.svg");
	} else {
	    $("#checkDroneDetail").hide();
        $("#checkDroneTogle").attr("src", "/images/ToggleClose.svg");
	}
	   
});

var initListRoute = function(str) { 
	
     var droneName = $("#topdevie option:selected").val();
    if(droneName=='no'){
         alert("Selected No Device");
         return false;
    }
    var tmUrl =""; //FC 업로드
    if(str=="1"){
	   tmUrl ="/gcs/dashboard/gA01MainFclist.do"; //MC 업로드 방식
    }else{
	   tmUrl ="/gcs/dashboard/gA01Mainlist.do"; // FC 업로드 방식
    }
  
	$.ajax({
		url : tmUrl,
		type : 'post',
		data :{page:'1'},
	}).done(function(res) { 
		$('#resultList').children().remove(); 
	    $('.subTr1').remove(); 
		if(res.totalCnt == '0'){
			var data =  "<div class='subTr1'>자료가 존재하지 않습니다.</div>" ;
			$('#resultList').append(data); 
		}else{
			res.list.forEach(function(row, index) {
				console.log(row)
				$('#resultList').append(projectListView(row,str)); 
			}); 
		}
	}).fail(function() {
		alert("실패");
	});
};

var projectListView = function(row,str) {  
	var data = "<a class=\"dronepath\" id=\"dronepath\" href=\"#\" onclick=\"javascript:fn_dronePathAction(this,"+row.dlPk+","+str+"); return false;\">"+row.dlName+"</a>";

		return $(data);
};



	 
})();
		