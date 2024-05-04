$(function(){
    /*window*/
    let size = {
        width : window.innerWidth || document.body.clientWidth,
        height : window.innerHeight || document.body.clientHeight 
    }
    console.log(size);



    let window_w = $(window).width(),
        gnb_w = $('#gnb').outerWidth(true),
        contarea_w = window_w - gnb_w,
        contarea_p_h = contarea_w*0.042,

        window_w_info = '현재 모니터의 width는 ' + window_w +'px',
        gnb_w_info = '현재 사이트바의 width는 ' + gnb_w  +'px',
        contarea_w_info = 'contarea의 width는 ' + contarea_w +'px',
        contarea_p_h_info = 'contarea의 좌우 padding은 ' + contarea_p_h +'px';



    console.log(window_w_info);
    console.log(gnb_w_info);
    console.log(contarea_w_info);
    console.log(contarea_p_h_info);

     //달력
    //  let $today = new Date(),
    //     $Year = $today.getFullYear(),
    //     $text_year = $Year.toString(),
    //     $todayYear = $text_year.slice(2,4),
    //     $month = $today.getMonth() + 1,
    //     $todayMonth = $today.getMonth() + 1,
    //     $calMonth = $today.getMonth(),
    //     $todayDate = $today.getDate(),
    //     week_code = [0, 1, 2, 3, 4, 5, 6],
    //     week = ['일', '월', '화', '수', '목', '금', '토'],
    //     $DayOfWeek = $today.getDay(),//[일=0, 월=1, '화', '수', 목=4, '금', '토'],
    //     dayofWeek = week[$DayOfWeek],
    //     lastDate = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31],
    //     $todayhour = $today.getHours(),
    //     $todayminute = $today.getMinutes();


    // let $DateInfo = new Date(),
    //     $year = $DateInfo.getFullYear(),
    //     $month = $DateInfo.getMonth() + 1,
    //     $hour = $DateInfo.getHours(),
    //     $date = $DateInfo.getDate(),
    //     $day = $DateInfo.getDay(), //요일 숫자 일=0, 월=1
    //     day_code = [0, 1, 2, 3, 4, 5, 6],
    //     day_ver_A= ['일', '월', '화', '수', '목', '금', '토'],
    //     each_mon_last = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31],
    //     $min = $DateInfo.getMinutes(),
    //     $sec = $DateInfo.getSeconds();

    // let y_m = $year +"년 "+ $month +"월";
    // let comment_month = "이번 달은 "+ $month +"월";

    // console.log($DateInfo);
    // console.log(y_m);
    // console.log(comment_month);
    // $('.year_month').text(y_m);

     



    // if($todayMonth<10){
    //     $todayMonth = "0" + $todayMonth;
    // }
    // if($todayDate<10){
    //     $todayDate = "0" + $todayDate;
    // }
    // if($todayhour<10){
    //     $todayhour = "0" + $todayhour;
    // }
    // if($todayminute<10){
    //     $todayminute = "0" + $todayminute;
    // }

    
    // console.log($Year);

    // date
    // let menu3_date_text = $Year + "." +  $todayMonth  + "." + $todayDate ;
    // console.log(menu3_date_text);
    // $('.menu3_lnb_date .text').text(menu3_date_text);
    


    /*사이드바*/
    // let gnb = $('#gnb');
    if(window_w < 1540){
        $('.container').addClass('min_moni');
        $('.btn_gnb').on('click', function(){
            e.preventDefault();
            e.stopPropagation();
        });
    }else{
        $('.container').removeClass('min_moni')
    }

    $('.btn_gnb').on('click', function(){
        if($('#gnb').hasClass('on')){
            $('#gnb').removeClass('on');

            $('.contarea').css(
                'margin-left' , 240
            );

        }else{
            $('#gnb').addClass('on');
            $('.contarea').css(
                'margin-left' , 70
            );
        };
    });

    /*사용량통계관리*/
    $('#btn_logout').click(function(){
        $(location).attr("href", 'login.html')
    });

    let am_m3_tab_data = $('.menu3_table_data').length;
    console.log(am_m3_tab_data);
    $('.menu3_data_amount_text').text(am_m3_tab_data);

    if(am_m3_tab_data == 0){
        $('.menu3_tbody').html('<span class="text_no_data">조건에 맞는 데이터가 없습니다.</span>');
    }



    /*select 박스*/


    $('.select_box_cell').on('click', function(){
        // $(this).children('.select_ul').a({
        //     'display': 'block'
        // });
        if($(this).children('.select_ul').hasClass('on')){
            $(this).children('.select_ul').removeClass('on');
        }else{
            $(this).children('.select_ul').addClass('on');
        }

    });


    $('.select_box_cell .select_li').on('click', function(){
        let select_txt = $(this).attr("value");
        console.log(select_txt);

        let game = $(this).closest('.select_ul'),
            box = $(game).prev('.select_box'),
            text = $(box).children('.select_text');
        $(text).text(select_txt);

    });


    /*날짜*/
    $('.menu3_lnb_date').on('click', function(){
        if($(this).next('.popup_calender').hasClass('on')){
            $(this).next('.popup_calender').removeClass('on');
        }else{
            $(this).next('.popup_calender').addClass('on');
        }
    });


    $('#btn_popup_close').on('click', function(){
        if($(this).next('.popup_calender').hasClass('on')){
            $(this).next('.popup_calender').removeClass('on');
        }else{
            $(this).next('.popup_calender').addClass('on');
        }
    });

    /*login*/
    $('#reset_pw').on('click', function(){
        $('.login_popup').show();
    });
    $('#login_popup_close').on('click', function(){
        $('.login_popup').hide();
    });


    //로그인(이전버전)
    // $('#btn_login').on("click", function(){
    //     let log_id = $('.login_c_num').val(),
    //         log_pw = $('.login_pw').val();

    //     if(log_id == "innoceo"){
    //         if(log_pw == "3714"){
    //             location.href = 'target_company_A.html';
    //         }else if(log_pw == ""){
    //             $('#login_pw_m').show();
    //         }else{
    //             alert('잘못된 비밀번호입니다.');
    //             location.reload();
    //         };
    //     }else if(log_id == ""){
    //         $('#login_c_num_m').show();
    //     }else{
    //         alert('잘못된 아이디입니다.');
    //         location.reload();
    //     }
    // });

    //로그인 
    $('#btn_login').on("click", function(){
        let log_id = $('.login_c_num').val(),
            log_pw = $('.login_pw').val(),
            log_arr = [];

        if(log_id == "innoceo"){
            if(log_pw == "3714"){
                location.href = 'target_company_A.html';
            }else if(log_pw == ""){
                $('#login_pw_m').show();
            }else{
                alert('잘못된 비밀번호입니다.');
                location.reload();
            };
        }else if(log_id == ""){
            $('#login_c_num_m').show();
        }else{
            alert('잘못된 아이디입니다.');
            location.reload();
        }
    });

    //스케줄 이번달

});