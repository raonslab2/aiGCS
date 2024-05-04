$(function(){
    let window_w = $(window).outerWidth(),
        window_h = $(window).outerHeight(),
        window_info = '이 윈도우의 width: ' + window_w +'px / height: ' + window_h + 'px',

        $lnb = $('.lnb-container'),
        lnb_w = $lnb.outerWidth(),
        lnb_h = $lnb.outerHeight(),
        lnb_info = '이 lnb의 width: ' + lnb_w +'px / height: ' + lnb_h + 'px',
        
        $wrap = $('#wrap');

``

        console.log(window_info);
        console.log(lnb_info);


        //$container = $('.container');
        // contain_w = window_w - lnb_w,
        // contain_h = $container.outerHeight();
        // window_info= '이 윈도우의 너비: ' + window_w +'px / 높이: ' + window_h + 'px',
        // wrap_info = '이 wrap의 너비: ' + wrap_w +'px / 높이: ' + wrap_h + 'px',
        // lnb_info = '이 lnb의 너비: ' + lnb_w +'px / 높이: ' + lnb_h + 'px';
        //contain_info =  '이 container의 너비: ' + contain_w +'px / 높이: ' + contain_h + 'px'; 
        
        

 
    // console.log(wrap_info);
    // 
    // console.log(contain_info);

    // $container.outerWidth(contain_w);

    // if(window_w < 1400){
    //     $lnb.css({
    //         width: 62
    //     })
    // }else{
    //     $lnb.css({
    //         width: 230
    //     })
    // };

    //임시
    if(window_w < 1550){
        $wrap.addClass('on')

    }else{
        $wrap.removeClass('on')
    };

    // if(window_w < 1550){
    //     $lnb.addClass('on')
    // }else{
    //     $lnb.removeClass('on')
    // };

    // if(window_w < 1550){

    //     $lnb.css({
    //         width: '62px',
    //         padding: '0px',
    //         margin_left: '-62px'
    //     });
    //     $lnb.hover(function(){
    //         $(this).css({
    //             width: '230px',
    //             margin_right: '-168px',
    //             padding: '0 20px'
                
    //         })
    //     }, function(){
    //         $(this).css({
    //             width: '62px',
    //             margin_right: '0px'
    //             padding: '0px'
                
    //         })
    //     });

    // }else{
    //     $lnb.css({
    //         width: '230px',
    //         padding: '0 20px'
    //     })
    // };


});

var doc = document.documentElement;
// 전체화면 설정
function openFullScreenMode() {
    if (doc.requestFullscreen)
        doc.requestFullscreen();
    else if (doc.webkitRequestFullscreen) // Chrome, Safari (webkit)
        doc.webkitRequestFullscreen();
    else if (doc.mozRequestFullScreen) // Firefox
        doc.mozRequestFullScreen();
    else if (doc.msRequestFullscreen) // IE or Edge
        doc.msRequestFullscreen();
    $('.icon-out').hide();
    $('.icon-out2').show();
}
// 전체화면 해제
function closeFullScreenMode() {
    if (document.exitFullscreen)
        document.exitFullscreen();
    else if (document.webkitExitFullscreen) // Chrome, Safari (webkit)
        document.webkitExitFullscreen();
    else if (document.mozCancelFullScreen) // Firefox
        document.mozCancelFullScreen();
    else if (document.msExitFullscreen) // IE or Edge
        document.msExitFullscreen();
    $('.icon-out').show();
    $('.icon-out2').hide();
}

function launchFullScreen(element) {
    if(element.requestFullScreen) {
        element.requestFullScreen();
    } else if(element.mozRequestFullScreen) {
        element.mozRequestFullScreen();
    } else if(element.webkitRequestFullScreen) {
        element.webkitRequestFullScreen();
    };
}
window.onload = function () {
    launchFullScreen(document.documentElement);
}
