$(function () {
	//lnb 메뉴 펼쳐짐
	$('.lnb-container .menu-type').on('click', function(e){
		e.preventDefault();
		
		$(this).toggleClass('open');
	});

	//디자인 체크박스
	$('.com-check-select .open-btn').on('click', function(){
		$(this).toggleClass('on');
	});

	//디자인 라디오박스
	$('.com-radio-select .open-btn').on('click', function(){
		$(this).toggleClass('on');
	});
	$('.com-radio-select input').on('change', function(){
		var inputText = $(this).next().text();
		var openBtn = $(this).closest('.com-radio-select').find('.open-btn');

		openBtn.text(inputText);
		openBtn.removeClass('on');
		
	});

	//달력
	$.datepicker.setDefaults({
		dateFormat: 'mm.dd D',
		prevText: '이전 달',
		nextText: '다음 달',
		monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
		monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
		dayNames: ['일', '월', '화', '수', '목', '금', '토'],
		dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
		dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
		showMonthAfterYear: true,
		yearSuffix: '년'
	});

	$( ".com-calendar" ).datepicker();
	

	//slick banner
	$('.slick-banner').slick();


	//변경사항
	let user_name = $('.location-content .menu-area .user-box .info .name'),
		ggg = $('.com-list-info > .list > li .txt-info .title .company');
		// $li6 = $('.sub-menu-list li:nth-child(6)'),
		// $li7 = $('.sub-menu-list li:nth-child(7)'),
		// $li8 = $('.sub-menu-list li:nth-child(8)');


	
	$(user_name).replaceWith('<strong>김상민</strong>');
	$(ggg).text('이노비즈버드');
	// $($li6).hide();
	// $($li7).hide();
	// $($li8).hide();


	//날짜
	let today = new Date(),
		t_year = today.getFullYear(),
		//t_year = 2021,
		p_year = today.getFullYear() - 1,
		n_year = today.getFullYear() + 1,
		n_month = today.getMonth(),
		//n_month = 5,
		n_date = today.getDate(),
		t_month = ('0' + (n_month + 1)).slice(-2),
		t_date = ('0' + today.getDate()).slice(-2),
		t_day = today.getDay(),
		day_kor = ['일', '월', '화', '수', '목', '금', '토'],
		day_kan = ['日', '月', '火', '水', '木', '金', '土'],
		day_eng = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'],
		t_day_kor = day_kor[t_day],
		$date_box_info = t_month + "." + t_date + " " + t_day_kor,
		$lastDate = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31],
		$schedule_box_info = t_year + "-" + t_month;

	//윤년계산
	if(t_year % 400 == 0){
		$lastDate[1] = 29;
	}else if(t_year % 100 == 0){
		$lastDate[1] = 28;
	}else if(t_year % 4 == 0){
		$lastDate[1] = 29;
	}
	

	//지날달, 다음달
	let prev_month,
		next_month;
	if(n_month==0){
		prev_month = 11,
		next_month = n_month +1
	}else if(n_month==11){
		prev_month = n_month -1,
		next_month = 0
	}else{
		prev_month = n_month -1,
		next_month = n_month +1
	}


	console.log(today);
	console.log(t_year);
	console.log(p_year);
	console.log(n_year);
	console.log(n_month);
	console.log(t_month);
	
	console.log(prev_month);
	console.log(next_month);
	console.log(t_date);
	console.log(t_day);
	console.log(n_date);
	console.log($lastDate);
	console.log(t_day_kor);
	console.log($date_box_info);
	console.log($schedule_box_info);

	console.log($lastDate[n_month]);
	console.log($lastDate[n_month-1]);
	console.log($lastDate[n_month+1]);

	$("#date_box_info").text($date_box_info);
	$("#schedule-month-info").text($schedule_box_info);

	let	$now_calendar = [],
		$prev_calendar = [],
		$next_calendar = [];
		
		// $now_calendar_l_day = $now_calendar[$lastDate[n_month]].day;
		

	

//
		for(let i = 0; i < $lastDate[n_month]; i++){
			let year_info = t_year,
				month_info = n_month,
				date_info = i+1,
				day_info = new Date(year_info, month_info, i+1).getDay(),
				color_info,
				value_info,
				opacity_info = 1,
				today_info;

			

			if(day_info == 6){
				color_info = '#00f'
				value_info = ''
				
				if(month_info== 0 && date_info == 1 ){
					color_info = '#f00'
					value_info = '신정'
				}else if(month_info==2 && date_info==1){
					color_info = '#f00'
					value_info = '삼일절'
				}else if(month_info==4 && date_info==5){
					color_info = '#f00'
					value_info = '어린이날'
				}else if(month_info==5 && date_info==6){
					color_info = '#f00'
					value_info = '현충일'
				}else if(month_info==7 && date_info==15){
					color_info = '#f00'
					value_info = '광복절'
				}else if(month_info==9 && date_info==3){
					color_info = '#f00'
					value_info = '개천절'
				}else if(month_info==9 && date_info==9){
					color_info = '#f00'
					value_info = '한글날'
				}else if(month_info==11 && date_info==25){
					color_info = '#f00'
					value_info = '성탄절'
				}
			}else if(day_info == 0){
				color_info = '#f00'
				value_info = ''
				if(month_info== 0 && date_info == 1 ){
					value_info = '신정'
				}else if(month_info==2 && date_info==1){
					value_info = '삼일절'
				}else if(month_info==4 && date_info==5){
					value_info = '어린이날'
				}else if(month_info==5 && date_info==6){
					value_info = '현충일'
				}else if(month_info==7 && date_info==15){
					value_info = '광복절'
				}else if(month_info==9 && date_info==3){
					value_info = '개천절'
				}else if(month_info==9 && date_info==9){
					value_info = '한글날'
				}else if(month_info==11 && date_info==25){
					value_info = '성탄절'
				}

			}else if(month_info== 0 && date_info == 1 ){
				color_info = '#f00'
				value_info = '신정'
			}else if(month_info==2 && date_info==1){
				color_info = '#f00'
				value_info = '삼일절'
			}else if(month_info==4 && date_info==5){
				color_info = '#f00'
				value_info = '어린이날'
			}else if(month_info==5 && date_info==6){
				color_info = '#f00'
				value_info = '현충일'
			}else if(month_info==7 && date_info==15){
				color_info = '#f00'
				value_info = '광복절'
			}else if(month_info==9 && date_info==3){
				color_info = '#f00'
				value_info = '개천절'
			}else if(month_info==9 && date_info==9){
				color_info = '#f00'
				value_info = '한글날'
			}else if(month_info==11 && date_info==25){
				color_info = '#f00'
				value_info = '성탄절'
			}else{
				color_info = '#000'
				value_info = ''
			}

			//24절기
			// if(month_info==1 && date_info==4){
			// 	value_info = '입춘(立春)'
			// }else if(month_info==1 && date_info==18){
			// 	value_info = '우수(雨水)'
			// }else if(month_info==2 && date_info==5){
			// 	value_info = '경칩(驚蟄)'
			// }else if(month_info==2 && date_info==20){
			// 	value_info = '춘분(春分)'
			// }else if(month_info==3 && date_info==5){
			// 	value_info = '청명(淸明)'
			// }else if(month_info==3 && date_info==20){
			// 	value_info = '곡우(穀雨)'
			// }else if(month_info==4 && date_info==5){
			// 	value_info = '입하(立夏)'
			// }else if(month_info==4 && date_info==21){
			// 	value_info = '소만(小滿)'
			// }else if(month_info==5 && date_info==6){
			// 	value_info = '망종(芒種)'
			// }else if(month_info==5 && date_info==21){
			// 	value_info = '하지(夏至)'
			// }else if(month_info==6 && date_info==7){
			// 	value_info = '소서(小暑)'
			// }else if(month_info==6 && date_info==22){
			// 	value_info = '대서(大暑)'
			// }else if(month_info==7 && date_info==7){
			// 	value_info = '입추(立秋)'
			// }else if(month_info==7 && date_info==23){
			// 	value_info = '처서(處暑)'
			// }else if(month_info==8 && date_info==7){
			// 	value_info = '백로(白露)'
			// }else if(month_info==8 && date_info==22){
			// 	value_info = '추분(秋分)'
			// }else if(month_info==9 && date_info==8){
			// 	value_info = '한로(寒露)'
			// }else if(month_info==9 && date_info==23){
			// 	value_info = '상강(霜降)'
			// }else if(month_info==10 && date_info==7){
			// 	value_info = '입동(立冬)'
			// }else if(month_info==10 && date_info==22){
			// 	value_info = '소설(小雪)'
			// }else if(month_info==11 && date_info==7){
			// 	value_info = '대설(大雪)'
			// }else if(month_info==11 && date_info==21){
			// 	value_info = '동지(冬至)'
			// }else if(month_info==0 && date_info==5){
			// 	value_info = '소한(小寒)'
			// }else if(month_info==0 && date_info==20){
			// 	value_info = '대한(大寒)'
			// }

			//대체휴일
			// let date_1009_day = new Date(year_info, 9, 9).getDay(),
			// 	date_1010_val = ;//한글날

			// console.log(date_1009_day);
			// if(let date_1009_day = 0){
			// 	//$now_calendar[9].value = "대체 휴일";
			// 	//let $now_calendar[9].color = "#f00";
			// }

			console.log($now_calendar[n_date - 1]);
			if(month_info == n_month && date_info == n_date){
				today_info = "today_yes";
			
			}else{
				today_info = "today_no";
			}

			
			
			// 


			$now_calendar[i] =  {year: year_info, month: month_info, date: date_info, day: day_info, color: color_info, value: value_info, opacity: opacity_info, today: today_info };
			
		}
		

		//지난달
		for(let i = 0; i < $lastDate[prev_month]; i++){

			let month_info = prev_month,
				date_info = i+1,
				year_info,
				color_info,
				value_info,
				opacity_info = 0.5;

				
			if(n_month == 0){
				year_info = t_year - 1;

			}
			console.log(month_info);
			console.log(year_info);

			let day_info = new Date(year_info, month_info, date_info).getDay();

			if(day_info == 6){
				color_info = '#00f'
				value_info = ''
			}else if(day_info == 0){
				color_info = '#f00'
				value_info = ''
			}else{
				color_info = '#000'
				value_info = ''
			}

			

			


			$prev_calendar[i] =  {year: year_info, month: month_info, date: date_info, day: day_info, color: color_info, value: value_info, opacity: opacity_info, today: "today_no"};
			
		}



		//다음달
		for(let i = 0; i < $lastDate[next_month]; i++){
			let year_info = t_year,
				month_info = next_month,
				date_info = i+1,
				day_info = new Date(t_year, n_month+1, i+1).getDay(),
				color_info,
				value_info,
				opacity_info = 0.5;
				if(day_info == 6){
					color_info = '#00f'
					value_info = ''
				}else if(day_info == 0){
					color_info = '#f00'
					value_info = ''
				}else{
					color_info = '#000'
					value_info = ''
				}

			

			if(n_month == 11){
				year_info = t_year + 1;
			}
			$next_calendar[i] = {year: year_info, month: month_info, date: date_info, day: day_info, color: color_info, value: value_info, opacity: opacity_info, today: "today_no"};
		}


		console.log($now_calendar);//이번달
		console.log($prev_calendar);//지난달
		console.log($next_calendar);//다음달

		let now_lastDate = $lastDate[n_month] - 2;
		console.log(now_lastDate); 

		let $now_calendar_f_day = $now_calendar[0].day,
			$now_calendar_l_day = $now_calendar[now_lastDate].day;
		console.log($now_calendar_f_day);//이번달 1일 요일
		console.log($now_calendar_l_day);//이번달 마지막날 요일

		let $prev_calendar_part,
			$next_calendar_part;

		if($now_calendar_f_day == 0){
			$prev_calendar_part = $prev_calendar.slice(-6)
		}else{
			$prev_calendar_part = $prev_calendar.slice(-$now_calendar_f_day + 1)
		}
		if($now_calendar_l_day == 6){
			$next_calendar_part = $next_calendar.slice(0, 0)
		}else{
			$next_calendar_part = $next_calendar.slice(0, 6 - $now_calendar_l_day)
		}


		console.log($prev_calendar_part);
		console.log($next_calendar_part);

		let $calendar_data_pre = $prev_calendar_part.concat($now_calendar),
			$calendar_data = $calendar_data_pre.concat($next_calendar_part),
			$calendar_data_l = $calendar_data.length;  
		
		console.log($calendar_data);
		console.log($calendar_data_l);

		let $calendar_li01 = $calendar_data.slice(0, 7),
			$calendar_li02 = $calendar_data.slice(7, 14),
			$calendar_li03 = $calendar_data.slice(14, 21),
			$calendar_li04 = $calendar_data.slice(21, 28),
			$calendar_li05 = $calendar_data.slice(28, 35),
			$calendar_li06 = $calendar_data.slice(35, 42),
			$calendar_li06_l = $calendar_li06.length;

		console.log($calendar_li01);
		console.log($calendar_li02);
		console.log($calendar_li03);
		console.log($calendar_li04);
		console.log($calendar_li05);
		console.log($calendar_li06);
		console.log($calendar_li06_l);

		let $tpw1_td = $('#table_plan_week1 .date_space'),
			$tpw2_td = $('#table_plan_week2 .date_space'),
			$tpw3_td = $('#table_plan_week3 .date_space'),
			$tpw4_td = $('#table_plan_week4 .date_space'),
			$tpw5_td = $('#table_plan_week5 .date_space'),
			$tpw6 = $('#table_plan_week6'),
			$tpw6_td = $('#table_plan_week6 .date_space');
		


		// for(let i=0; i<7; i++){
		// 	$tpw1_td.eq(i).prepend("<span class='date_num " + $calendar_li01[i].today + "' style='color: " + $calendar_li01[i].color + "; opacity: " + $calendar_li01[i].opacity + ";'>" + $calendar_li01[i].date + "</span><span class='date_val_box'><span class='date_val'>"+ $calendar_li01[i].value +"</span><span class='date_val2'>"+ $calendar_li01[i].value2 +"</span></span>");
		// 	$tpw2_td.eq(i).prepend("<span class='date_num " + $calendar_li02[i].today + "' style='color: " + $calendar_li02[i].color + "; opacity: " + $calendar_li02[i].opacity + ";'>" + $calendar_li02[i].date + "</span><span class='date_val_box'><span class='date_val'>"+ $calendar_li02[i].value +"</span><span class='date_val2'>"+ $calendar_li02[i].value2 +"</span></span>");
		// 	$tpw3_td.eq(i).prepend("<span class='date_num " + $calendar_li03[i].today + "' style='color: " + $calendar_li03[i].color + "; opacity: " + $calendar_li03[i].opacity + ";'>" + $calendar_li03[i].date + "</span><span class='date_val_box'><span class='date_val'>"+ $calendar_li03[i].value +"</span><span class='date_val2'>"+ $calendar_li03[i].value2 +"</span></span>");
		// 	$tpw4_td.eq(i).prepend("<span class='date_num " + $calendar_li04[i].today + "' style='color: " + $calendar_li04[i].color + "; opacity: " + $calendar_li04[i].opacity + ";'>" + $calendar_li04[i].date + "</span><span class='date_val_box'><span class='date_val'>"+ $calendar_li04[i].value +"</span><span class='date_val2'>"+ $calendar_li04[i].value2 +"</span></span>");
		// 	$tpw5_td.eq(i).prepend("<span class='date_num " + $calendar_li05[i].today + "' style='color: " + $calendar_li05[i].color + "; opacity: " + $calendar_li05[i].opacity + ";'>" + $calendar_li05[i].date + "</span><span class='date_val_box'><span class='date_val'>"+ $calendar_li05[i].value +"</span><span class='date_val2'>"+ $calendar_li05[i].value2 +"</span></span>");
			
			

		// 	if($calendar_li06_l>0){
		// 		$tpw6_td.eq(i).prepend("<span class='date_num " + $calendar_li06[i].today + "' style='color: " + $calendar_li06[i].color + "; opacity: " + $calendar_li06[i].opacity + ";'>" + $calendar_li06[i].date + "</span><span class='date_val_box'><span class='date_val'>"+ $calendar_li06[i].value +"</span><span class='date_val2'>"+ $calendar_li06[i].value2 +"</span></span>");
				
		// 	}else{
		// 		$tpw6.remove();
		// 	}

		// 	let $date_val = $('.date_val')
		// 	if($calendar_li01[i].value == undefined){
		// 		$date_val.hide();
		// 	}
			
		
		

			
		// }
		for(let i=0; i<7; i++){
			$tpw1_td.eq(i).prepend("<span class='date_num " + $calendar_li01[i].today + "' style='color: " + $calendar_li01[i].color + "; opacity: " + $calendar_li01[i].opacity + ";'>" + $calendar_li01[i].date + "</span><span class='date_val'>"+ $calendar_li01[i].value +"</span>");
			$tpw2_td.eq(i).prepend("<span class='date_num " + $calendar_li02[i].today + "' style='color: " + $calendar_li02[i].color + "; opacity: " + $calendar_li02[i].opacity + ";'>" + $calendar_li02[i].date + "</span><span class='date_val'>"+ $calendar_li02[i].value +"</span>");
			$tpw3_td.eq(i).prepend("<span class='date_num " + $calendar_li03[i].today + "' style='color: " + $calendar_li03[i].color + "; opacity: " + $calendar_li03[i].opacity + ";'>" + $calendar_li03[i].date + "</span><span class='date_val'>"+ $calendar_li03[i].value +"</span>");
			$tpw4_td.eq(i).prepend("<span class='date_num " + $calendar_li04[i].today + "' style='color: " + $calendar_li04[i].color + "; opacity: " + $calendar_li04[i].opacity + ";'>" + $calendar_li04[i].date + "</span><span class='date_val'>"+ $calendar_li04[i].value +"</span>");
			$tpw5_td.eq(i).prepend("<span class='date_num " + $calendar_li05[i].today + "' style='color: " + $calendar_li05[i].color + "; opacity: " + $calendar_li05[i].opacity + ";'>" + $calendar_li05[i].date + "</span><span class='date_val'>"+ $calendar_li05[i].value +"</span>");
			
			

			if($calendar_li06_l>0){
				$tpw6_td.eq(i).prepend("<span class='date_num " + $calendar_li06[i].today + "' style='color: " + $calendar_li06[i].color + "; opacity: " + $calendar_li06[i].opacity + ";'>" + $calendar_li06[i].date + "</span><span class='date_val'>"+ $calendar_li06[i].value +"</span>");
				
			}else{
				$tpw6.remove();
			}

			let $date_val = $('.date_val')
			if($calendar_li01[i].value == undefined){
				$date_val.hide();
			}
			
		
		

			
		}

		let $today_yes = $('.today_yes').parent();
		$($today_yes).css('background-color', '#f8dee0');

	
	//let ex_luna = solarToLunar('2023','2','15');
	// console.log(ex_luna);
		

		

		


	//움직이는 사이드바
	let loc_area = $('.location-area'),
		$wrap = $('#wrap');

	$(loc_area).click(function(){
		$($wrap).toggleClass('on');
		if($($wrap).hasClass('on')){
			$($wrap).removeclass('on');
		}else{
			$($wrap).addclass('on');
		}
	})


	//언어
	// let lang_on = $('.language').val();
	// console.log(lang_on);


	$(".language").change(function(){
		let lang_on = $(this).val(),
			lang_txt = $(".language option:selected").text(),
			$flag_box = $('#lang_now img'),
			sel_flag_road = "/inno/assets/images/flags/4x3/"+ lang_on + ".svg" ;

		console.log(lang_on);
		console.log(lang_txt);
		console.log(sel_flag_road);

		$flag_box.attr("src", sel_flag_road );

	});

	$(".nation").change(function(){
		let nat_on = $(this).val(),
			nat_txt = $(".nation option:selected").text(),
			$flag_box = $('#nation_now img'),
			sel_flag_road = "/inno/assets/images/flags/4x3/"+ nat_on + ".svg" ;

		console.log(nat_on);
		console.log(nat_txt);
		console.log(sel_flag_road);

		$flag_box.attr("src", sel_flag_road );

	});

	//table_plan
	$table_plan_w = $('#table_plan').outerWidth(true),
	$table_plan_th = $('.table_plan_th'),
	$table_plan_th_w = $table_plan_w / 8;

	console.log($table_plan_w);
	console.log($table_plan_th_w);

	$table_plan_th.css('width', $table_plan_th_w);

	
	


});