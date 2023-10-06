	
	function keyupPhone(event, target) {
		let expInt = /[^0-9]/gi;
		target.value = target.value.replace(expInt,'')
					.substr(0,11)
					.replace(/^(\d{0,3})(\d{0,4})(\d{0,4})$/g, "$1-$2-$3")
					.replace(/\-{1,2}$/g, "");
	};
	
	function join(){
		let userJoinFormDto = {
				userId : document.querySelector("#userId").value,
				userPassword : document.querySelector("#userPassword").value,
				userName : document.querySelector("#userName").value,
				userNickname : document.querySelector("#userNickname").value,
				userPhone : document.querySelector("#userPhone").value,
				userEmail : document.querySelector("#userEmail").value
		};
		console.log(userJoinFormDto);
		
		if(validCheck(userJoinFormDto)) {
			$.ajax({
			    url:"/user/join",
			    type:"POST",
				data: JSON.stringify(userJoinFormDto),
				contentType: "application/json; charset=utf-8",
			    success: function(result) {
			    	if(result) {
						location.href = "/user/login";
			    	} else {
			    		alert("회원가입 실패");
			    	}
			    },
			    error: function(error) { // 결과 에러 콜백함수
			        console.log(error);
			    }
			});
		} else {
			console.log("회원가입 입력값 확인");
		}
	}
	const expNotInt = /[0-9]/gi;
	
	function validCheck(data) {
		
		let expUserId = /[^0-9a-zA-Z]/gi;
		if(data.userId.length < 4 || data.userId.length > 20 || expUserId.test(data.userId)) {
			alert("아이디를 정확히 입력하세요.");
			return false;
		}
		if(data.userPassword.length < 4 || data.userPassword.length > 16) {
			alert("비밀번호를 정확히 입력하세요.");
			return false;
		}
		let expUserName = /[^가-힣a-zA-Z]/gi;
		if(data.userName.length < 2 || data.userName.length > 30 || expUserName.test(data.userName)) {
			alert("이름을 정확히 입력하세요.");
			return false;
		}
		if(data.userNickname.length < 4 || data.userNickname.length > 30) {
			alert("닉네임을 정확히 입력하세요.");
			return false;
		}
		if(data.userPhone.length != 13) {
			alert("전화번호를 정확히 입력하세요.");
			return false;
		}
		let expEmail = /[a-z0-9]+@[a-z]+\.[a-z]{2,3}/;
		if(!expEmail.test(data.userEmail)) {
			alert("이메일을 정확히 입력하세요.");
			return false;
		}
		
		return true;
	}