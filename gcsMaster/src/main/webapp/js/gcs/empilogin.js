$(document).ready(function() {
    $(document).on('keypress', function(e) {
        if (e.keyCode == 13) {
            // 엔터키가 눌렸을 때
            actionLogin();
        }
    });

    $('#loginForm').submit(function(e) {
        e.preventDefault();
        var id = $('#id').val();
        var password = $('#password').val();

        if (id == "") {
            alert("아이디를 입력하세요");
            return false;
        } else if (password == "") {
            alert("비밀번호를 입력하세요");
            $('#password').focus();
            return false;
        } else {
            var expdate = new Date();
            if ($('#checkId').prop('checked'))
                expdate.setTime(expdate.getTime() + 1000 * 3600 * 24 * 30); // 30일
            else
                expdate.setTime(expdate.getTime() - 1); // 쿠키 삭제
            setCookie("saveid", $('#id').val(), expdate);

            $.ajax({
                url: "/gcs/login/actionLogin.do",
                type: "POST",
                data: $(this).serialize(),
                success: function(response) {
                    // 로그인 성공 시의 처리
                    // 예를 들어, 리다이렉트 등을 수행할 수 있습니다.
                    console.log("로그인 성공");
                },
                error: function(xhr, status, error) {
                    // 로그인 실패 시의 처리
                    console.error("로그인 실패:", error);
                }
            });
        }
    });

    $('#id').change(function() {
        $.post("/empo/login/seeSmtechId.do", {"id" : $(this).val()} ).done(function(res) {
            console.log(res.list);
            if (res.list == null || res.list.smtechId == "NULL") {
                $("#smtechId").val("");
            } else {
                $("#smtechId").val(res.list.smtechId);    
            }
        });
    });

   
});

function setCookie (name, value, expires) {
    document.cookie = name + "=" + escape (value) + "; path=/; expires=" + expires.toGMTString();
}

function getCookie(Name) {
    var search = Name + "="
    if (document.cookie.length > 0) { // 쿠키가 설정되어 있다면
        offset = document.cookie.indexOf(search)
        if (offset != -1) { // 쿠키가 존재하면
            offset += search.length
            // set index of beginning of value
            end = document.cookie.indexOf(";", offset)
            // 쿠키 값의 마지막 위치 인덱스 번호 설정
            if (end == -1)
                end = document.cookie.length
            return unescape(document.cookie.substring(offset, end))
        }
    }
    return "";
}

function actionLogin() {
 
    if (document.loginForm.id.value =="") {
        alert("아이디를 입력하세요");
        return false;
    } else if (document.loginForm.password.value =="") {
        alert("비밀번호를 입력하세요");
        document.loginForm.password.focus();
        return false;
    } else {
        // 동적으로 URL 생성
        var actionUrl = "/gcs/login/actionLogin.do";
        document.loginForm.action = actionUrl;
        document.loginForm.submit();
    }
}

