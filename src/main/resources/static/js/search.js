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
        document["page-form"].submit();
    }); // end of #pagination


});
