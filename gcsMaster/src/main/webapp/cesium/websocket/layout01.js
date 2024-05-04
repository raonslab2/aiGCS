

$(document).ready(function() {
	
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
			$("#smenutop2").attr('src', "/images/top_data.png");
			smenutop2 = 1;
			$('#menu02').val('1');
			$('#leftslide').val('1');
			// 다이알로그 보이기
			$("#dialog").dialog("open");

		} else {
			$("#smenutop2").attr('src', "/images/top_data.png");
			smenutop2 = 0;
			$('#menu02').val('0');
			$('#leftslide').val('1');
			// 다이알로그 감추기
			$('#dialog').dialog('close')
		}

	});
	
	var smenutop21 = 0;
	$('.smenutop21').click(function(e) {
		if (smenutop2 == 0) {
			$("#smenutop21").attr('src', "/images/pathdown.jpg");
			smenutop21 = 1;
			$('#menu02').val('1');
			$('#leftslide').val('2');
			// 다이알로그 보이기
			//$("#dialog").dialog("open");

		} else {
			$("#smenutop21").attr('src', "/images/pathdown.jpg");
			smenutop21 = 0;
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

	//
	//$( "#dialog" ).dialog();
});
