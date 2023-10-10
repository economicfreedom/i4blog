$(document).ready(function () {
	let user_id_check = false;
	let user_password_check = false;
	let user_password2_check = false;
	let user_nickname_check = false;	
	let user_phone_check = false;
	let user_email_check = false;
	
	let timeout;
	
	const exp_user_id = /[^0-9a-zA-Z]/gi;
	const exp_user_name = /[^가-힣a-zA-Z]/gi;
	const exp_nickname = /[^가-힣a-zA-Z0-9]/gi;
	const exp_phone = /[^0-9]/gi;
	const exp_email = /[a-z0-9]+@[a-z]+\.[a-z]{2,3}/gi;
	// 아이디 입력값 검사
    $("#user_id").on('keyup', function (event) {
    	clearTimeout(timeout);
        timeout = setTimeout(function () {
            user_id_check = false;
            let user_id = event.target.value;
			if(user_id.length < 4 || user_id.length > 20 || user_id.match(exp_user_id)){
				checked_failed("user_id", "영문자, 숫자 4~20글자를 입력해야 합니다.")
				return;
			}
            $.ajax({
                url: "/user/user-id-check?&userId=" + user_id,
                type: "get",
                contentType: "json",
                success: function (res) {
					checked_succeed("user_id");
                    user_id_check = true;
                },
                error: function (res) {
					checked_failed("user_id", "중복된 아이디 입니다.");
                }
            })
        }, 200)
    })

	// 비밀번호 입력값 검사
	$("#user_password").on('keyup', function (event) {
		clearTimeout(timeout);
        timeout = setTimeout(function () {
			user_password_check = false;
			user_password2_check = false;
			$("#user_password2").removeAttr("style");
			if($("#user_password2").val() === "") {
				$("#user_password2_check").empty();
			} else {
				checked_failed("user_password2", "비밀번호가 변경되었습니다. 다시 입력해 주세요.")
			}
            let user_password = event.target.value;
			if (user_password.length < 4 || user_password.length > 16) {
				checked_failed("user_password", "영문자, 숫자, 특수문자 4~16글자를 입력해야 합니다.");
            } else {
				user_password_check = true;
				checked_succeed("user_password");
			}
        }, 100);
    })

	// 비밀번호 확인 입력값 검사
    $("#user_password2").on('keyup', function pw2_check() {
        clearTimeout(timeout);
        timeout = setTimeout(function () {
			user_password2_check = false;
            let user_password = $("#user_password").val();
            let user_password2 = $("#user_password2").val();
            if (user_password2 === "") {
				checked_failed("user_password2", "필수 입력 입니다.");
            } else if (user_password !== user_password2) {
        		checked_failed("user_password2", "비밀번호와 일치하지 않습니다.");
        	} else {
	            user_password2_check = true;
				checked_succeed("user_password2");
			}
        }, 100);
    })
    
	// 이름 입력값 검사
	$("#user_name").on('keyup', function (event) {
		clearTimeout(timeout);
        timeout = setTimeout(function () {
			user_name_check = false;
            let user_name = event.target.value;

            if (user_name.length < 2 || user_name.length > 15 || user_name.match(exp_user_name)) {
				checked_failed("user_name", "한글, 영문자 2~15글자를 입력해야 합니다");
            } else {
				user_name_check = true;
				checked_succeed("user_name");
			}
        }, 100);
    })
    
	// 닉네임 입력값 검사
    $("#user_nickname").on('keyup', function (event) {
        clearTimeout(timeout);
        timeout = setTimeout(function () {
			user_nickname_check = false;
            let nickname = event.target.value;
            if(nickname.length < 2 || nickname.length > 16 || nickname.match(exp_nickname)) {
				checked_failed("user_nickname", "한글, 영문자, 숫자 2~16글자를 입력해야 합니다.");
				return;
			}
            $.ajax({
                url: "/user/nick-check?&nickname=" + nickname,
                type: "get",
                contentType: "json",
                success: function (res) {
					checked_succeed("user_nickname");
                    user_nickname_check = true;
                },
                error: function (res) {
					checked_failed("user_nickname", "중복된 닉네임입니다.")
                }
            })
        }, 200)
    })
    
	// 휴대전화 입력값 포멧 및 검사
	$("#user_phone").on('keyup', function (event) {
        clearTimeout(timeout);
        timeout = setTimeout(function () {
	        user_phone_check = false;
	        let user_phone = event.target.value;
			user_phone = user_phone.replace(exp_phone,'')
						.substr(0,11)
						.replace(/^(\d{0,3})(\d{0,4})(\d{0,4})$/g, "$1-$2-$3")
						.replace(/\-{1,2}$/g, "");
			event.target.value = user_phone;
			if(user_phone.length < 12 || user_phone.substr(0,2) !== "01"){
				checked_failed("user_phone", "휴대전화를 정확히 입력해 주세요.");
			} else {
		        user_phone_check = true;
		        checked_succeed("user_phone");
			}
        }, 100)
	})
	
	// 이메일 입력값 검사
	$("#user_email").on('keyup', function (event) {
        clearTimeout(timeout);
        timeout = setTimeout(function () {
	        user_email_check = false;
	        let user_email = event.target.value;
			if(!user_email.match(exp_email)){
				checked_failed("user_email", "이메일 주소를 정확히 입력해 주세요.");
			} else {
		        user_email_check = true;
		        checked_succeed("user_email");
			}
        }, 100)
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
	$("#join").click(function (){
		debugger;
		if(valid_check()) {
			let user_join_form_dto = {
					user_id : $("#user_id").val(),
					user_password : $("#user_password").val(),
					user_name : $("#user_name").val(),
					user_nickname : $("#user_nickname").val(),
					user_phone : $("#user_phone").val(),
					user_email : $("#user_email").val()
			};
			
			$.ajax({
			    url:"/user/join",
			    type:"POST",
				data: JSON.stringify(user_join_form_dto),
				contentType: "application/json; charset=utf-8",
			    success: function(res) {
					location.href = "/user/login";
					/*
			    	if(res) {
						location.href = "/user/login";
			    	} else {
			    		alert("회원가입 실패");
			    	}*/
			    },
			    error: function(res) {
			        alert("회원가입 오류");
			    }
			});
		} else {
			console.log("회원가입 입력값 확인");
		}
	})
	
	// 입력값 체크
	function valid_check() {
		if(!user_id_check) {
			alert("아이디를 정확히 입력하세요.");
			return false;
		}
		if(!user_password_check && !user_password2_check) {
			alert("비밀번호를 정확히 입력하세요.");
			return false;
		}
		if(!user_name_check) {
			alert("이름을 정확히 입력하세요.");
			return false;
		}
		if(!user_nickname_check) {
			alert("닉네임을 정확히 입력하세요.");
			return false;
		}
		if(!user_phone_check) {
			alert("전화번호를 정확히 입력하세요.");
			return false;
		}
		if(!user_email_check) {
			alert("이메일을 정확히 입력하세요.");
			return false;
		}
		return true;
	}
})
