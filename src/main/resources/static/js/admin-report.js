$(document).ready(function () {
    $('#pagination').on('click', 'a', function (e) {
        e.preventDefault();
        const value = $(this).data('page-num');
        console.log(value);

        document["page-form"]["page-num"].value = value;
        document["page-form"].type.value =$("select[name='type']").val();
        document["page-form"]["order-by"].value =$("input[name=optradio]:checked").val();
        document["page-form"].submit();
    }); // end of #pagination

    $('.form-control').on('change', function (e) {
        e.preventDefault();
        console.log("이거 동작");
        const selectedType = $("select[name='type']").val();
        console.log(selectedType);

        document["page-form"]["page-num"].value = 1;
        document["page-form"].type.value = selectedType;
        document["page-form"]["order-by"].value =$("input[name=optradio]:checked").val();
        document["page-form"].submit();
    });// end of .form-control


        $('.admin-report').on('change', function (e) {
        e.preventDefault();
        console.log("admin-report");
        const selectedType = $("select[name='type']").val();
        console.log(selectedType);

        document["page-form"]["page-num"].value = 1;
        document["page-form"].type.value = selectedType;
        document["page-form"]["order-by"].value =$("input[name=optradio]:checked").val();
        document["page-form"].submit();
    });//end of .form-check-inline

    $(".delete").click(function () {
        console.log("동작함")
        var url;
        var id = $(this).val();
        console.log(id)
        var type =$("select[name='type']").val();

        console.log(type);
        if (type === "board") {
            url = "/board/del";
        }
        if (type === "comment") {
            url = "/comment/del"
        }


        console.log(url);
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


        }); // end of .$ajax


    }) // end of .delete

})// end of $(document).ready