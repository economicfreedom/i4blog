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
<input name="uploadFiles" type="file" multiple>
<button class="uploadBtn">Upload</button>
</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
    $('.uploadBtn').click(function (){
        var formData = new FormData();
        var inputFile = $("input[type = 'file']");
        var files = inputFile[0].files;

        for(var i = 0; i<files.length; i++){
            console.log(files[i]);
            formData.append("uploadFiles",files[i]);
        }

        //실제 업로드 부분
        //upload ajax
        $.ajax({
            url:'/uploadAjax',
            processData: false,
            contentType:false,
            data:formData,
            type:'POST',
            dataType:'json',
            success: function (result){
                console.log(result);
            },
            error: function (jqXHR,textStatus,errorThrown) {
                console.log(textStatus);

            }

        }); //$.ajax


    })
</script>
</html>
