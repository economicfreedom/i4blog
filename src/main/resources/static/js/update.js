$(document).ready(function () {

    // 섬네일 삭제
    $('#delete-thumbnail').click(function (e) {
        let img_delete_dto = {
            id: $('#id').val(),
            old_thumbnail: $('#old_thumbnail').val(),
            old_img_original: $('#old_img_original').val()
        };

        $.ajax({
            type: "PUT",
            url: "/board/img-delete",
            /*dataType:"json",*/
            contentType: "application/json",
            data: JSON.stringify(img_delete_dto),
            success: function () {
                alert("삭제되었습니다.");
                location.reload();
            },
            error: function (res) {
                alert("삭제에 실패하였습니다. \n 잠시 후 다시 시도해주세요.");
            }

        }); // end of .$ajax

    }) // end of click


    $('#submit-btn').click(function (e) {
        let id = $('#id').val();
        let board_category = $('#board-category').val();
        let board_public = $('#board-public').val();
        let board_title = $('#board-title').val();
        let board_content = $('#summernote').val();
        let old_thumbnail = $("#old_thumbnail").val();
        let old_img_original = $("#old_img_original").val();

        if (board_title.length === 0) {
            alert("제목을 입력해주세요.")
            $("#board-title").focus();
            return;
        }
        if (board_content.length === 0) {
            alert("내용을 입력해주세요.")
            $("#summernote").focus();
            return;
        }

        let json_data = {
            id: id,
            board_category: board_category,
            board_public: board_public,
            board_title: board_title,
            board_content: board_content,
            old_thumbnail: old_thumbnail,
            old_img_original: old_img_original
        }

        // console.log("제이슨 : 데이터 ", JSON.stringify({
        //     board_category: board_category,
        //     board_public: board_public,
        //     board_title: board_title,
        //     board_content: board_content
        // }))
        // console.log("json_data", json_data)



        var inputFile = $("input[type = 'file']");
        console.log(inputFile[0].files.length);

        if (inputFile[0].files.length === 0) {

            // inputFile이 없으면 서브밋
            // 메소드 만들어서 코드 줄이기

            $.ajax({
                type: "put",
                url: "/board/update",
                dataType: "json",
                contentType: "application/json",
                data: JSON.stringify(json_data),
                success: function (res) {

                    let url = res.message;
                    location.href = url;
                },
                error: function (res) {

                }
            });
        } else {
            var formData = new FormData();
            var files = inputFile[0].files;

            for (var i = 0; i < files.length; i++) {
                console.log(files[i]);
                formData.append("uploadFiles", files[i]);
            }

            let width = 200;
            let height = 200;
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
                    let thumbnail = result.thumbnailURL;
                    let original_img = result.originalURL;

                    json_data.thumbnail = thumbnail;
                    json_data.original_img = original_img;

                    $.ajax({
                        type: "PUT",
                        url: "/board/update",
                        dataType: "json",
                        contentType: "application/json",
                        data: JSON.stringify(json_data),
                        success: function (res) {

                            let url = res.message;
                            location.href = url;

                        },
                        error: function (res) {

                        }
                    });
                },
                error: function (jqXHR, textStatus, errorThrown) {

                },

            }); //$.ajax

        }

    }) // end of click

}) // end of ready