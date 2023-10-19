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

            reader.readAsDataURL(file);
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

                alert("이미지 업로드에 성공하였습니다.");


                $.ajax({
                    url: '/user/profile-img-save',
                    contentType: "application/json",
                    type: 'PUT',
                    data: JSON.stringify({
                        original_img: result.originalURL,
                        thumb_nail: result.thumbnailURL
                    }),
                    success: function () {
                        alert("저장에 성공하였습니다.");
                    },
                    error: function () {
                        alert("저장에 실패하였습니다.");


                    }

                })

            },
            error: function (jqXHR, textStatus, errorThrown) {
                alert("이미지 업로드에 실패하였습니다.");

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
                    , "pw-br"
                );

                $("#new-pw")
                    .css("border-color", "blue")
                    .before(pw_succeed)
                    .focus();
                pw_check = true;
            } else {

                remove_pw_tag("pw-check-succeed"
                    , "pw-check-failed"
                    , "pw-br"
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
                    , "pw2-br");
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
                    , "pw2-br");
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
        let original_pw = $("#original-pw").val();

        $.ajax({
            url: "/user/pw-change",
            contentType: "application/json",
            type: "put",
            data: JSON.stringify({

                new_pw: new_pw,
                new_pw2: new_pw2,
                original_pw: original_pw

            }),
            success: function (res) {
                alert("변경되었습니다.")
                location.reload();


            },

            error: function (res) {
                console.log(res);
                if (res == "비밀번호가 서로 다릅니다.") {
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

    function get_br_and_small_tag_succeed(br_id, small_id, succeed_msg) {
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
        if (info.length < 1) {
            alert("소개글을 입력해주세요")
            return;
        }
        if (title.length < 1) {
            alert("제목을 입력해주세요")
            return;
        }
        if (title.length > 31) {

            alert("최대 30글자 까지만 가능합니다.")
            return;

        }

        $.ajax({
            url: "/user/title-and-info-change",
            type: "put",
            contentType: "application/json",
            data: JSON.stringify({
                info: info,
                title: title
            }),
            success: function (res) {
                alert("성공적으로 저장 되었습니다.")
                $("#title").val(title);
                $("#info").val(info);
            },
            error: function (res) {

                alert(res.responseText)
                console.log(res)
            }

        })


    })

    $("#resign-btn").click(function () {
        let res_pwd = $("#resign-pwd").val();

        if (res_pwd === null || res_pwd === "") {
            alert("비밀번호를 입력해주세요")
            return;
        }

        let confirm1 = confirm("탈퇴하시겠습니까?");
        if (confirm1) {
            $.ajax({
                url: "/user/resign",
                type: "put",
                contentType: "application/json",
                data: JSON.stringify({
                    pwd: res_pwd
                })
                , success: function () {
                    alert("탈퇴 되었습니다.");
                    location.href = "/user/login?logout"
                }

                , error: function (res) {
                    alert(res.responseJSON.message);
                }
            })
        }
    })


    // 카테고리 관리
    /**
     * 카테고리 추가
     * state : C
     * li value : 고유번호
     */
    $("#category_add").click(function () {
        console.log("추가 버튼 클릭");
        let html = "";
        html += '<li class="list-group-item card category-item ui-sortable-handle" id="category_item" onclick="category_item(this)" value="' + ca_count + '" style="border-top-width: 1px">';
        html += '<input type="hidden" id="category_id">'
        html += '<input type="hidden" id="category_state" value="C">'
        html += '<span id="category_name">새 카테고리</span>';
        html += '<span class="float-right" id="category_delete_span">';
        html += '<span id="category_state_text" style="color: green">추가</span>'
        html += '<button type="button" class="btn btn-outline-danger btn-sm" onclick="category_delete(this)" id="category_delete_btn" value="N">삭제</button>';
        html += '</span>';
        html += '</li>';
        $("#category_list").append(html);
        ca_count++;
    })


    // 카테고리 드래그 가능하게 하는 함수.
    $("#category_list").sortable();


    // 로딩 후 카테고리 리스트에 idx 입력
    $("#category_list li").each(function (i, item) {
        $(item).val(ca_count);
        ca_count++;
    });


    // 수정한 카테고리 이름 리스트에 적용
    $("#category_update_save").click(function (event) {
        event.preventDefault();
        let idx = $("#category_update_idx").val();
        if (idx == "") {
            return;
        }
        ;
        let new_name = $("#category_update_name").val();
        let item = $("#category_item[value='" + idx + "']")[0];
        let name = item.children['category_name'];
        let state = item.children['category_state'];
        let state_text = item.children['category_delete_span'].children['category_state_text'];
        name.textContent = new_name;
        if (state.value === 'R') {
            state.value = 'U';
            category_state_text_change(state_text, "U");
        }
    })

    // 카테고리 리스트 DB에 저장
    $("#category_list_save").click(function () {
        let category_List = [];
        $("#category_list li").each(function (i, item) {
            let id = item.children['category_id'].value;
            let category_name = item.children['category_name'].textContent;
            let state = item.children['category_state'].value;
            if (item.children['category_delete_span'].children['category_delete_btn'].value === "D") {
                state = "D";
            } else if ((i + 1 != item.value) && state === "R") {
                state = "U";
            }
            // 삭제 관련 조건 추가 필요
            category_List.push({
                id: id,
                category_name: category_name,
                state: state,
                order: i + 1
            });
        });
        $.ajax({
            url: "/category/list-save",
            type: "put",
            contentType: "application/json",
            data: JSON.stringify(category_List),
            success: function () {
                alert('저장 성공');
                location.reload();
            },
            error: function (res) {
                console.log('저장 실패');
            }
        })
    })
});


// 카테고리 리스트의 클릭 이벤트 (카테고리 아이템 선택)
let ca_count = 1;

function category_item(item) {
    let name = item.children['category_name'];
    $("#category_update_idx").val(item.value);
    $("#category_update_name").val(name.textContent);

    // 다른 요소에 해당 css 삭제
    $("#category_list li").each(function (i, item) {
        $(item).css("border-color", "")
    });
    $(item).css("border-color", "black")
};

// 삭제 버튼
function category_delete(item) {
    console.log(item);
    let category_item = item.parentElement.parentElement;
    let state = category_item.children['category_state'].value;
    let state_text = item.parentElement.children['category_state_text'];
    if (state === "C") {
        category_item.remove();
    } else if (item.value === "N") {
        item.textContent = "취소";
        item.className = "btn btn-danger btn-sm";
        item.value = "D";
        category_state_text_change(state_text, "D");
    } else if (state === "R") {
        item.textContent = "삭제";
        item.className = "btn btn-outline-danger btn-sm";
        item.value = "N";
        category_state_text_change(state_text, "R");
    } else if (state === "U") {
        item.textContent = "삭제";
        item.className = "btn btn-outline-danger btn-sm";
        item.value = "N";
        category_state_text_change(state_text, "U");
    }
}

// 상태를 보여주는 문자 변경 함수
function category_state_text_change(tag, state) {
    if (state === "C") {
        tag.textContent = "추가";
        tag.style.color = "green";
    } else if (state === "U") {
        tag.textContent = "수정";
        tag.style.color = "blue";
    } else if (state === "D") {
        tag.textContent = "삭제";
        tag.style.color = "red";
    } else {
        tag.textContent = "";
        tag.style.color = "white";
    }
}
