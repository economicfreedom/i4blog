$(document).ready(function () {

    $("#keyword").keypress(function (event) {

        if (event.which === 13) {
            let type = $("#type").val();
            let keyword = $("#keyword").val();
            location.href = "/search?keyword=" + keyword + "&type=" + type;

        }
    });
    $('#pagination').on('click', 'a', function (e) {
        e.preventDefault();
        const value = $(this).data('page-num');
        console.log(value);

        document["page-form"]["page-num"].value = value;
        document["page-form"].type.value = $("#type").val();
        // document["page-form"]["order-by"].value = $("input[name=optradio]:checked").val();
        document["page-form"].submit();
    }); // end of #pagination

    // $('.page').on('change', function (e) {
    //     e.preventDefault();
    //     console.log("이거 동작");
    //     const selected_type = $("#type").val();
    //     console.log(selected_type);
    //
    //     document["page-form"]["page-num"].value = 1;
    //     document["page-form"].type.value = selected_type;
    //     // document["page-form"]["order-by"].value = $("input[name=optradio]:checked").val();
    //     document["page-form"].submit();
    // });// end of .form-control


    $('.form-check-inline').on('change', function (e) {
        e.preventDefault();
        console.log("이거 동작");
        const selectedType = $("select[name='type']").val();
        console.log(selectedType);

        document["page-form"]["page-num"].value = 1;
        document["page-form"].type.value = selectedType;
        // document["page-form"]["order-by"].value = $("input[name=optradio]:checked").val();
        document["page-form"].submit();
    });//end of .form-check-inline


});
