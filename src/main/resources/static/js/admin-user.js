$(document).ready(function () {


    $('#pagination').on('click', 'a', function (e) {
        const value = $(this).data('page-num');

        document["page-form"]["page-num"].value = value;
        document["page-form"]["order-by"].value = $("input[name=optradio]:checked").val();
        document["page-form"]["keyword"].value = $("#user-search").val();
        document["page-form"].submit();
    }); // end of #pagination

    $('.page').on('change', function (e) {
        e.preventDefault();

        document["page-form"]["page-num"].value = 1;
        document["page-form"]["order-by"].value = $("input[name=optradio]:checked").val();
        document["page-form"]["keyword"].value = $("#user-search").val();
        document["page-form"].submit();
    });// end of .form-control


    $('.admin-user').on('change', function (e) {
        e.preventDefault();
        console.log("ㅗ")
        document["page-form"]["page-num"].value = 1;
        document["page-form"]["order-by"].value = $("input[name=optradio]:checked").val();
        document["page-form"]["keyword"].value = $("#user-search").val();
        document["page-form"].submit();
    });
    $('#user-search-icon').css("cursor", "pointer")
        .click(function (e) {
            e.preventDefault();
            document["page-form"]["page-num"].value = 1;
            document["page-form"]["order-by"].value = $("input[name=optradio]:checked").val();
            document["page-form"]["keyword"].value = $("#user-search").val();
            document["page-form"].submit();
        })


})

function role_up(id) {

    $.ajax({
        url: "/admin/role-up",
        type: "put",
        data: {id: id},
        success: function () {
            
            alert("회원 등급이 업데이트 되었습니다.");
            location.reload();

        },
        error: function () {
            alert("서버에 문제가 있나봐요");
        }

    })

}