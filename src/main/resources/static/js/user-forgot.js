$(document).ready(function (){
	
	const exp_email = /[a-z0-9]+@[a-z]+\.[a-z]{2,3}/gi;
	
	// 이메일 입력값 검사
	$("#user_email").on('keyup', function (event) {
        clearTimeout(timeout);
        timeout = setTimeout(function () {
	        user_email_check = false;
	        let user_email = event.target.value;
	        // 인증 검사 다시 진행
			$("#user_email_auth").attr("disabled","disabled");
			$("#user_email_auth_btn").attr("disabled","disabled");
	        user_email_auth_check = false;
			if(!user_email.match(exp_email)){
				checked_failed("user_email", "이메일 주소를 정확히 입력해주세요.");
			} else {
		        user_email_check = true;
				$("#user_email").removeAttr("style");
				$("#user_email_check").empty();
				$("#user_email_check").removeAttr("style");
			}
        }, 100)
	})

	// 이메일 인증 번호 전송
	// 아이디 찾기
	$("#forgot-id").click(function (){
		let user_email = $("user_email_id").val();
		if(!user_email.match(exp_email)){
			checked_failed("user_email_id", "이메일 주소를 정확히 입력해주세요.");
		}
		
        $.ajax({
            url: "/user/email-forgot-send",
            type: "post",
            data: 'email=' + $("#user_email").val(),
            success: function (res) {
				checked_succeed("user_email");
				$("#user_email_check").text("인증 메일이 전송되었습니다.");
				console.log("통신 성공");
            },
            error: function (res) {
				console.log("통신 실패");
            }
        })
	})
	
	// 이메일 인증 확인
	$("#user_email_auth_btn").click(function (){
		
        $.ajax({
            url: "/user/email-auth",
            type: "post",
            contentType: "application/json",
            data: JSON.stringify({
				email: $("#user_email").val(),
				auth: $("#user_email_auth").val(),
			}),
            success: function (res) {
				console.log("인증 성공");
				alert("인증이 완료되었습니다.");
				$("#user_email_auth").attr("hidden","true");
				$("#user_email_auth_btn").attr("hidden","true");
				$("#user_email").attr("disabled","disabled");
				$("#user_email_send_btn").attr("disabled","disabled");
				user_email_auth_check = true;
            },
            error: function (res) {
				console.log("통신 실패");
            }
        })
	})
	
	// 데이터 체크 실패
    function checked_failed(tag_id, msg) {
			$("#" + tag_id).css("border-color", "red");
            $("#" + tag_id + "_check").text(msg);
            $("#" + tag_id + "_check").css("color", "red");
	}
	// 데이터 체크 성공
    function checked_succeed(tag_id, msg) {
			$("#" + tag_id).css("border-color", "blue");
            $("#" + tag_id + "_check").text(msg);
            $("#" + tag_id + "_check").css("color", "skyblue");
    }
})