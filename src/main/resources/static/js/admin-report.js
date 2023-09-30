    $(document).ready(function () {
        $('#pagination').on('click', 'a', function (e) {
            e.preventDefault();
            console.log($(this));
            console.log($("input[name=optradio]").val());
            const value = $(this).data('pagenum');
            console.log(value);
            document.pageForm.pageNum.value = value;
            document.pageForm.type.value = $("input[name=optradio]:checked").val();
            document.pageForm.submit();
        });

        $('.form-check-input').on('change', function (e) {
            e.preventDefault();
            console.log($(this));
            console.log($("input[name=optradio]").val());
            const value = $("input[name=pageNum]").val();
            console.log(value);
            document.pageForm.pageNum.value = 1;
            document.pageForm.type.value = $("input[name=optradio]:checked").val();
            document.pageForm.submit();
        });

        $(".delete").click(function () {
            console.log("동작함")
            var id = $(this).val();
            console.log(id)
            var type = $("input[name=optradio]:checked").val();
            if (type === "board") {
                url = "/board/del";
            }
            if (type === "comment") {
                url = "/comment/del"
            }

            var url;


            $.ajax({
                type: "PUT",
                url: url,
                contentType: "application/json",
                data: id
                ,
                success: function (res) {
                    alert(res);
                    location.reload();
                },
                error: function () {
                    alert("실패");
                }


            });


        })
    })