$(document).ready(function (){
	
	const exp_user_id = /[^0-9a-zA-Z]/gi;
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

	// 아이디 찾기
	$("#forgot-id").click(function (){
		let user_email = $("user_email_id").val();
		if(!user_email.match(exp_email)){
			checked_failed("user_email_id", "이메일 주소를 정확히 입력해주세요.");
		}
        $.ajax({
            url: "/email/forgot-id",
            type: "post",
            data: 'email=' + $("#user_email_id").val(),
            success: function (res) {
				checked_succeed("user_email_id");
				$("#user_email_check").text("해당 메일로 아이디를 전송하였습니다.");
            },
            error: function (res) {
				console.log("메일 전송 실패");
            }
        })
	})
	
	// 비밀번호 찾기 - 메일 전송
	$("#email_auth_send_btn").click(function (){
		let user_id = $("user_id").val();
		let user_email = $("user_email_pw").val();
		if(user_id.length < 4 || user_id.length > 16 || user_id.match(exp_user_id)){
			checked_failed("user_id", "아이디를 정확히 입력해주세요.");
		}
		if(!user_email.match(exp_email)){
			checked_failed("user_email_pw", "이메일 주소를 정확히 입력해주세요.");
		}
        $.ajax({
            url: "/email/forgot-auth-send",
            type: "post",
            data: JSON.stringify({
				userId: user_id,
				email: user_email
			}),
            success: function (res) {
				checked_succeed("user_email_id");
				$("#user_email_check").text("해당 메일로 아이디를 전송하였습니다.");
            },
            error: function (res) {
				console.log("메일 전송 실패");
            }
        })
	})
	
	// 비밀번호 찾기 - 인증 확인
	$("#forgot-pw").click(function (){
		let user_id = $("user_id").val();
		let user_email = $("user_email_pw").val();
		let auth = $("user_email_auth").val();
        $.ajax({
            url: "/email/forgot-auth-check",
            type: "post",
            contentType: "application/json",
            data: JSON.stringify({
				userId: user_id,
				email: user_email,
				auth: auth
			}),
            error: function (res) {
				console.log("통신 실패");
            }
        })
	})
	
	// 데이터 체크 성공
    function checked_succeed(tag_id, msg) {
			$("#" + tag_id).css("border-color", "blue");
            $("#" + tag_id + "_check").text(msg);
            $("#" + tag_id + "_check").css("color", "skyblue");
    }
    
	// 데이터 체크 실패
    function checked_failed(tag_id, msg) {
			$("#" + tag_id).css("border-color", "red");
            $("#" + tag_id + "_check").text(msg);
            $("#" + tag_id + "_check").css("color", "red");
	}
})