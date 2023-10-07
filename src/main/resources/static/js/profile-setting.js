

    $(document).ready(function () {

        console.log($('#nickname').css('border-color'));

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
        let nick_succeed = '<br id="nick-br">' + '<small id="nick-check-succeed" style="color: skyblue">성공</small>'
        let nick_failed = '<br id="nick-br">' + '<small id="nick-check-failed" style="color: red">실패</small>'
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


        function readURL(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();

                reader.onload = function (e) {
                    $('#image-preview').attr('src', e.target.result)
                        .css('height', height + 'px')
                        .css('width', width + 'px')
                }

                reader.readAsDataURL(input.files[0]); // convert to base64 string
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
                           thumb_nail:result.thumbnailURL
                        }),
                        success:function (){
                        }

                    })

                },
                error: function (jqXHR, textStatus, errorThrown) {
                    console.log(textStatus);

                },

            }); //$.ajax


        })
    });