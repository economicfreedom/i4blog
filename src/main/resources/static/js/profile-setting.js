$(document).ready(function () {

    console.log($('#nickname').css('border-color'));



    //닉네임 체크 및 변경 관련
    function remove_nick_check() {
        $("#nick-check-succeed").remove();
        $("#nick-check-failed").remove();
        $("#nick-br").remove();
        $("#nickname").css('border-color', 'rgb(206, 212, 218)');
    }


    const width = 80;
    const height = 80;
    const original_nickname = $("#nickname").val();
    let changed_nickname;
    let changed = false;
    let timeout;
    let nick_succeed = get_br_and_small_tag_succeed("nick-br", "nick-check-succeed", "사용 가능")
    let nick_failed = get_br_and_small_tag_failed("nick-br", "nick-check-failed", "사용 불가능")
    let is_change = true;


    console.log(original_nickname);
    $("#image-input").change(function () {
        console.log("동작함");
        readURL(this);

    })
    $("#nick-change").click(function () {
        $("#nick-done").removeAttr("hidden");
        $("#nick-cancel").removeAttr("hidden");
        $("#nick-change").attr("hidden", true);
        $("#nickname").removeAttr("readonly");
        remove_nick_check();

    });

    $("#nick-cancel").click(function () {

        $("#nick-done").attr("hidden", true);
        $("#nick-cancel").attr("hidden", true);
        $("#nick-change").removeAttr("hidden");
        $("#nickname").attr("readonly", true);

        if (changed) {

            $("#nickname").val(changed_nickname);
        } else {
            $("#nickname").val(original_nickname);
        }


        remove_nick_check();
    });
    $("#nick-done").click(function () {
        const nickname = $("#nickname").val();
        if (!is_change) {
            $("#nickname").focus();
            return;
        }
        $.ajax({

            url: "/user/change-nickname",
            type: "put",
            contentType: "application/json",
            data: JSON.stringify({
                nickname: nickname
            }),
            success: function () {
                alert("성공")
                $("#nick-done").attr("hidden", true);
                $("#nick-cancel").attr("hidden", true);
                $("#nick-change").removeAttr("hidden");
                $("#nickname").attr("readonly", true);
                changed = true;
                remove_nick_check();
                changed_nickname = $("#nickname").val();
            },
            error: function (res) {


                alert("사용 할 수 없는 닉네임입니다.");
                remove_nick_check();

                return;


            }

        })
    })


    $("#nickname").on('keyup', function () {

        if ($('#nickname').prop('readonly')) {
            return;
        }

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
                    remove_nick_check();
                    $("#nickname")
                        .css("border-color", "skyblue")
                        .before(nick_succeed)
                        .focus();
                    is_change = true;
                },
                error: function (res) {
                    remove_nick_check();
                    console.log()
                    $("#nickname")
                        .css("border-color", "red")
                        .before(nick_failed)
                        .focus();
                    $("#nick-check-failed").text(res.responseText);
                    is_change = false;


                }
            })

        }, 200);
    });


    // 이미지 업로드 관련

    function readURL(input) {
        if (input.files && input.files[0]) {
            var file = input.files[0];

            // 파일 확장자 확인
            var file_type = file["type"];
            var valid_image_types = ["image/jpeg", "image/png"];
            if ($.inArray(file_type, valid_image_types) < 0) {
                alert("이미지 형식은 jpeg 또는 png만 가능합니다.");
                return;
            }

            // 파일 크기 확인 (800K = 800 * 1024)
            var max_size = 800 * 1024;
            if (file.size > max_size) {
                alert("최대 크기는 800K 입니다.");
                return;
            }

            var reader = new FileReader();
            reader.onload = function (e) {
                $('#image-preview').attr('src', e.target.result)
                    .css('height', height + 'px')
                    .css('width', width + 'px');
            }

            reader.readAsDataURL(file); // convert to base64 string
        }
    }

    $('#uploadBtn').click(function () {
        var formData = new FormData();
        var inputFile = $("input[type = 'file']");
        var files = inputFile[0].files;


        for (var i = 0; i < files.length; i++) {
            console.log(files[i]);
            formData.append("uploadFiles", files[i]);
        }

        formData.append("w", width);
        formData.append("h", height);
        formData.append("type", "board");
        console.log(formData)
        //실제 업로드 부분
        //upload ajax
        $.ajax({
            url: '/upload-img',
            processData: false,
            contentType: false,
            data: formData,
            type: 'POST',
            dataType: 'json',
            success: function (result) {

                console.log(result.originalURL);
                console.log(result.thumbnailURL);


                $.ajax({
                    url: '/user/profile-img-save',
                    contentType: "application/json",
                    type: 'PUT',
                    data: JSON.stringify({
                        original_img: result.originalURL,
                        thumb_nail: result.thumbnailURL
                    }),
                    success: function () {

                    }

                })

            },
            error: function (jqXHR, textStatus, errorThrown) {
                console.log(textStatus);

            },

        }); //$.ajax


    })

    // 비밀번호 변경

    $("#new-pw").on('keyup', function () {
        let pw_succeed = get_br_and_small_tag_succeed(
            "pw-br", "pw-check-succeed", "사용 가능");

        let pw_failed = get_br_and_small_tag_failed(
            "pw-br", "pw-check-failed", "비밀번호는 4~16글자만 가능합니다.");


        timeout = setTimeout(function () {
            let new_pw = $("#new-pw").val();
            if (new_pw.length > 3 && new_pw.length < 17) {

                remove_pw_tag("pw-check-succeed"
                    , "pw-check-failed"
                    , "pw-br",
                );

                $("#new-pw")
                    .css("border-color", "blue")
                    .before(pw_succeed)
                    .focus();
                pw_check = true;
            } else {

                remove_pw_tag("pw-check-succeed"
                    , "pw-check-failed"
                    , "pw-br",
                );
                $("#new-pw")
                    .css("border-color", "red")
                    .before(pw_failed)
                    .focus();
                pw_check = false;
            }

            clearTimeout(timeout);

        }, 100);
    })
    let pw_check = false;
    let pw_check2 = false;
    $("#new-pw2").on('keyup', function () {
        let pw_succeed = get_br_and_small_tag_succeed(
            "pw2-br", "pw2-check-succeed", "사용 가능");

        let pw_failed = get_br_and_small_tag_failed(
            "pw2-br", "pw2-check-failed", "비밀번호를 확인해주세요");


        timeout = setTimeout(function () {
            let new_pw = $("#new-pw").val();
            let new_pw2 = $("#new-pw2").val()
            if (new_pw === new_pw2) {
                remove_pw_tag(
                    "pw2-check-succeed"
                    , "pw2-check-failed"
                    , "pw2-br",);
                pw_check2 = true

                $("#new-pw2")
                    .css("border-color", "blue")
                    .before(pw_succeed)
                    .focus();

            } else if (new_pw2 === null) {

                pw_check2 = false;

            } else {
                remove_pw_tag(
                    "pw2-check-succeed"
                    , "pw2-check-failed"
                    , "pw2-br",);
                $("#new-pw2")
                    .css("border-color", "red")
                    .before(pw_failed)
                    .focus();
                pw_check2 = false;

            }


            clearTimeout(timeout);

        }, 100);
    })
    $("#pw-change").click(function () {
        if (!(pw_check && pw_check2)) {
            alert("비밀번호를 확인해주세요")
            return;
        }
        let new_pw = $("#new-pw").val();
        let new_pw2 = $("#new-pw2").val();
        let original_pw =$("#original-pw").val();

        $.ajax({
            url: "/user/pw-change",
            contentType: "application/json",
            type: "put",
            data: JSON.stringify({

                new_pw: new_pw,
                new_pw2: new_pw2,
                original_pw:original_pw

            }),
            success:function (res){
                alert("변경되었습니다.")
                location.reload();


            },

            error:function (res){
                console.log(res);
                if (res == "비밀번호가 서로 다릅니다."){
                    $("#new-pw").focus();
                }

            }
        })

    })

    function remove_pw_tag(succeed_id, failed_id, br_id) {
        $("#" + succeed_id).remove();
        $("#" + failed_id).remove();
        $("#" + br_id).remove();
    }

    function get_br_and_small_tag_succeed(br_id, small_id, succeed_msg, failed_msg) {
        return '<br id="' + br_id + '">' + '<small id="' + small_id + '" style="color: skyblue">' + succeed_msg + '</small>'

    }

    function get_br_and_small_tag_failed(br_id, small_id, failed_msg) {
        return '<br id="' + br_id + '">' + '<small id="' + small_id + '" style="color: red">' + failed_msg + '</small>'

    }

    // 소개글 및 타이틀

    $("#save-info-title").click(function () {
        let info = $("#info").val();
        let title = $("#title").val();
        console.log(info);
        console.log(title);
        if (info.length <1){
            alert("소개글을 입력해주세요")
            return ;
        }
        if (title.length <1){
            alert("제목을 입력해주세요")
            return ;
        }
        if (title.length>31){

            alert("최대 30글자 까지만 가능합니다.")
            return;

        }

        $.ajax({
            url:"/user/title-and-info-change",
            type:"put",
            contentType:"application/json",
            data: JSON.stringify({
                info:info,
                title:title
            }),
            success:function (res) {
                alert("성공적으로 저장 되었습니다.")
                $("#title").val(title);
                $("#info").val(info);
            },
            error:function (res){

                alert(res.responseText)
                console.log(res)
            }

        })



    })

    $("#resign-btn").click(function () {

        let res_pwd = $("#resign-pwd").val();

        if (res_pwd ===null || res_pwd===""){
            alert("비밀번호를 입력해주세요")
            return;
        }

        let confirm1 = confirm("탈퇴하시겠습니까?");
        if (confirm1){
            $.ajax({
                url:"/user/resign",
                type:"put",
                contentType:"application/json",
                data:JSON.stringify({
                    pwd:res_pwd
                })
                ,success:function () {
                    alert("탈퇴 되었습니다.");
                    location.href="/user/login?logout"
                }

                ,error:function (res){
                    alert(res.responseJSON.message);
                }
            })
        }
    })
    
    $("#category-add").click(function () {
		console.log("추가 버튼 클릭");
		let html = "";
    	html += '<li class="list-group-item category-item">';
		html += '새 카테고리';
		html += '</li>';
		$("#category-list").append(html);
	})
	
	$("#category-list").sortable();
});