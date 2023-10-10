
$(document).ready(function () {
	let userId_check = false;
	let password_check = false;
	let password2_check = false;
	let nickname_check = false;
	let phone_check = false;

	let expUserId = /[^0-9a-zA-Z]/gi;
	let expEmail = /[a-z0-9]+@[a-z]+\.[a-z]{2,3}/;
	let expUserName = /[^가-힣a-zA-Z]/gi;
	// 아이디 중복 검사
    $("#userId").on('keyup', function () {
        clearTimeout(timeout);
        timeout = setTimeout(function () {
			if(expUserId.test(data.userId)){

			}
            let userId = $("#userId").val();
            $.ajax({
                url: "/user/userId-check?&userId=" + userId,
                type: "get",
                contentType: "json",
                success: function (res) {
                    $("#userId")
                        .css("border-color", "skyblue")
                        .before(userId_succeed)
                        .focus();
                    userId_check = true;
                },
                error: function (res) {
                    $("#userId")
                        .css("border-color", "red")
                        .before(userId_failed)
                        .focus();
                    $("#nick-check-failed").text(res.responseText);
                    userId_check = false;
                }
            })
        }, 200)
    })

	// 비밀번호 자동 체크
	$("#userPassword").on('keyup', function () {
        timeout = setTimeout(function () {
            let userPassword = $("#userPassword").val();
            if (userPassword.length > 3 && userPassword.length < 17) {
        		$("#pw-check").remove();
                $("#userPassword")
                    .css("border-color", "blue")
                    .before(get_br_and_small_tag(
            				"pw-check", ture, "사용 가능"))
                    .focus();
                password_check = true;

        		$("#pw-check2").remove();
                password2_check = false;
            } else {
        		$("#pw-check").remove();
                $("#userPassword")
                    .css("border-color", "red")
                    .before(get_br_and_small_tag(
            				"pw-check", false, "비밀번호는 4~16글자만 가능합니다."))
                    .focus();
                password_check = false;

        		$("#pw-check2").remove();
                password2_check = false;
            }

            clearTimeout(timeout);
        }, 100);
    })

	// 비밀번호 확인
    $("#userPassword2").on('keyup', function () {
        let pw_succeed = get_br_and_small_tag_succeed(
            "pw2-br", "pw2-check-succeed", "사용 가능");
        let pw_failed = get_br_and_small_tag_failed(
            "pw2-br", "pw2-check-failed", "비밀번호를 확인해주세요");

        timeout = setTimeout(function () {
            let userPassword = $("#userPassword").val();
            let userPassword2 = $("#userPassword2").val()
            if (userPassword === userPassword2) {
        		$("#pw-check2").remove();
                pw_check2 = true
                $("#userPassword2")
                    .css("border-color", "blue")
                    .before(pw_succeed)
                    .focus();
            } else if (userPassword2 === null) {
                password_check2 = false;
            } else {
        		$("#pw-check2").remove();
                $("#userPassword2")
                    .css("border-color", "red")
                    .before(pw_failed)
                    .focus();
                password_check2 = false;
            }
            clearTimeout(timeout);
        }, 100);
    })

	// 닉네임 중복 검사
    $("#nickname").on('keyup', function () {
        clearTimeout(timeout);
        timeout = setTimeout(function () {
            let nickname = $("#nickname").val();
            let formData = new FormData();
            formData.append("nickname", nickname);
            $.ajax({
                url: "/user/nick-check?&nickname=" + nickname,
                type: "get",
                contentType: "json",
                success: function (res) {
                    $("#nickname")
                        .css("border-color", "skyblue")
                        .before(nick_succeed)
                        .focus();
                    nickname_check = true;
                },
                error: function (res) {
                    $("#nickname")
                        .css("border-color", "red")
                        .before(nick_failed)
                        .focus();
                    $("#nick-check-failed").text(res.responseText);
                    nickname_check = false;
                }
            })
        }, 200)
    })

	// 휴대전화 값 자동 변환 '000-0000-0000' 및 체크
	$("#userPhone").on('keyup', function (event, target) {
        let pw_succeed = get_br_and_small_tag_succeed(
            "pw-br", "pw-check-succeed", "사용 가능");
        let pw_failed = get_br_and_small_tag_failed(
            "pw-br", "pw-check-failed", "전화번호 11자리를 정확히 입력 해 주세요")
		let expInt = /[^0-9]/gi;
		target.value = target.value.replace(expInt,'')
					.substr(0,11)
					.replace(/^(\d{0,3})(\d{0,4})(\d{0,4})$/g, "$1-$2-$3")
					.replace(/\-{1,2}$/g, "");
		if(target.value.length == 13){
            $("#userPhone")
                .css("border-color", "skyblue")
                .before(nick_succeed)
                .focus();
            phone_check = true;
		} else {
	        $("#userPhone")
	            .css("border-color", "red")
	            .before(nick_failed)
	            .focus();
	        phone_check = false;
		}
	})

	// 데이터 체크 성공
    function get_br_and_small_tag(tag_id, is_true, msg) {
		if(is_true == true)
        	return '<br id="' + tag_id + '">' + '<small id="' + tag_id + '" style="color: skyblue">' + msg + '</small>'
        else
	        return '<br id="' + tag_id + '">' + '<small id="' + tag_id + '" style="color: red">' + msg + '</small>'
    }

	// 회원가입 기능
	function join(){
		let userJoinFormDto = {
				userId : document.querySelector("#userId").value,
				userPassword : document.querySelector("#userPassword").value,
				userName : document.querySelector("#userName").value,
				userNickname : document.querySelector("#userNickname").value,
				userPhone : document.querySelector("#userPhone").value,
				userEmail : document.querySelector("#userEmail").value
		};

		if(validCheck(userJoinFormDto)) {
			$.ajax({
			    url:"/user/join",
			    type:"POST",
				data: JSON.stringify(userJoinFormDto),
				contentType: "application/json; charset=utf-8",
			    success: function(res) {
			    	if(result) {
						location.href = "/user/login";
			    	} else {
			    		alert("회원가입 실패");
			    	}
			    },
			    error: function(res) {
			        console.log(res.responseText);
			    }
			});
		} else {
			console.log("회원가입 입력값 확인");
		}
	}

	// 입력값 체크
	function validCheck(data) {
		if(userId_check) {
			alert("아이디를 정확히 입력하세요.");
			return false;
		}
		if(password_check && password2_check) {
			alert("비밀번호를 정확히 입력하세요.");
			return false;
		}
		if(data.userName.length < 2 || data.userName.length > 30 || expUserName.test(data.userName)) {
			alert("이름을 정확히 입력하세요.");
			return false;
		}
		if(nickname_check) {
			alert("닉네임을 정확히 입력하세요.");
			return false;
		}
		if(phone_check) {
			alert("전화번호를 정확히 입력하세요.");
			return false;
		}
		if(!expEmail.test(data.userEmail)) {
			alert("이메일을 정확히 입력하세요.");
			return false;
		}
		return true;
	}
})
