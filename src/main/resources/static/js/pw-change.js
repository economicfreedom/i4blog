$(document).ready(function () {
	let user_password_check = false;
	let user_password2_check = false;
	
	let timeout;
	
	// 비밀번호 입력값 검사
	$("#new_user_password").on('keyup', function (event) {
		clearTimeout(timeout);
        timeout = setTimeout(function () {
			user_password_check = false;
			user_password2_check = false;
			$("#new_user_password2").removeAttr("style");
			if($("#new_user_password2").val() === "") {
				$("#new_user_password2_check").empty();
			} else {
				checked_failed("new_user_password2", "비밀번호가 변경되었습니다. 다시 입력해 주세요.")
			}
            let user_password = event.target.value;
			if (user_password.length < 4 || user_password.length > 16) {
				checked_failed("new_user_password", "영문자, 숫자, 특수문자 4~16글자를 입력해야 합니다.");
            } else {
				user_password_check = true;
				checked_succeed("new_user_password");
			}
        }, 100);
    })

	// 비밀번호 확인 입력값 검사
    $("#new_user_password2").on('keyup', function pw2_check() {
        clearTimeout(timeout);
        timeout = setTimeout(function () {
			user_password2_check = false;
            let user_password = $("#new_user_password").val();
            let user_password2 = $("#new_user_password2").val();
            if (user_password2 === "") {
				checked_failed("new_user_password2", "필수 입력 입니다.");
            } else if (user_password !== user_password2) {
        		checked_failed("new_user_password2", "비밀번호와 일치하지 않습니다.");
        	} else {
	            user_password2_check = true;
				checked_succeed("new_user_password2");
			}
        }, 100);
    })
    
	// 데이터 체크 성공
    function checked_succeed(tag_id) {
			$("#" + tag_id).css("border-color", "blue");
            $("#" + tag_id + "_check").text("사용 가능");
            $("#" + tag_id + "_check").css("color", "skyblue");
    }
    
	// 데이터 체크 실패
    function checked_failed(tag_id, msg) {
			$("#" + tag_id).css("border-color", "red");
            $("#" + tag_id + "_check").text(msg);
            $("#" + tag_id + "_check").css("color", "red");
	}
	
	// 회원가입 기능
	$("#pw-change").click(function (){
		if(valid_check()) {
			let pw_change_dto = {
					user_id : $("#user_id").val(),
					user_password : $("#user_password").val(),
					new_user_password : $("#new_user_password").val(),
			};
			$.ajax({
			    url:"/user/pw-change",
			    type:"PUT",
				data: JSON.stringify(pw_change_dto),
				contentType: "application/json; charset=utf-8",
			    success: function(res) {
			        alert("비밀번호 변경 완료. 확인을 위해 다시 로그인이 필요합니다.");
					location.href = "/user/login";
			    },
			    error: function(res) {
			        alert("비밀번호 변경 오류");
			    }
			});
		}
	})
	
	// 입력값 체크
	function valid_check() {
		if(!(user_password_check && user_password2_check)) {
			alert("비밀번호를 정확히 입력하세요.");
			return false;
		}
		return true;
	}
})
