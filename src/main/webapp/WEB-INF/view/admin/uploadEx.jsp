<%--
  Created by IntelliJ IDEA.
  User: gyuha
  Date: 2023-10-03
  Time: 오전 9:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>


<input name="uploadFiles" type="file">
<button class="uploadBtn">Upload</button>

<div class="uploadResult">

</div>
<input type="file" id="imageInput">
<div id="imagePreview"></div>

</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
    $(document).ready(function () {
        const width = 100;
        const height = 100;

        $("#imageInput").change(function () {
            readURL(this);

        })

        function readURL(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();

                reader.onload = function (e) {
                    $('#image-preview').html('<img src="' + e.target.result + '" width="' + width + '"'
                        + 'height="' + height + '">');
                }

                reader.readAsDataURL(input.files[0]); // convert to base64 string
            }
        }

        function show_uploaded_images(arr) {
            console.log(arr);
            var divArea = $(".uploadResult");
            for (var i = 0; i < arr.length; i++) {
                // console.log(arr[i].thumbnailURL);
                divArea.append("<img src = '/display?fileName=" + arr[i].thumbnailURL + "'>");
            }
        }


        $('.uploadBtn').click(function () {
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
                url: '/uploadAjax',
                processData: false,
                contentType: false,
                data: formData,
                type: 'POST',
                dataType: 'json',
                success: function (result) {
                    show_uploaded_images(result.uploadResultDTOList);

                    console.log(result.originalURL);
                    console.log(result.thumbnailURL);
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    console.log(textStatus);

                }

            }); //$.ajax


        })


    });

</script>
</html>
