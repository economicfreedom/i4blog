$(document).ready(function () {

    let page_num = 1;
    let end_page = 2;
    let next;
    let selected = $("#order-by").val();
    $(window).scroll(function () {
        var scrT = $(window).scrollTop();

        if (scrT >= $(document).height() - $(window).height() - 100) {  // 10픽셀 근처에 왔을 때 동작
            if (page_num === 1 || end_page > page_num || next) {
                page_num++;
                page_ajax();

            } else {

            }
        } else {
            //아닐때 이벤트
        }
    });

    function make(res) {


        end_page = res.pageDTO.endPage;
        next = res.pageDTO.next;

        let main_dto_list = res.mainDTOList;

        for (let i = 0; i < main_dto_list.length; i++) {
            let dto = main_dto_list[i];
            const user_nickname = dto.userNickname;
            const user_id = dto.userId
            const uid = dto.uId;
            const board_id = dto.boardId;
            const board_title = dto.boardTitle;
            const board_content = dto.boardContent;
            const board_thumbnail = dto.boardThumbnail;
            const board_created_at = dto.boardCreatedAt;
            const like_count = dto.likeCount;
            const like_user_id = dto.likeUserId;
            const img_thumbnail = dto.imgThumbnail;
            const comment_count = dto.commentCount;

            page(board_id
                , board_thumbnail
                , board_title
                , board_content
                , board_created_at
                , comment_count
                , img_thumbnail
                , user_nickname
                , uid
                , user_id
                , like_user_id
                , like_count
            );


        } // end of for
    }

    function page_ajax(type) {
        $.ajax({
            url: "/default-pagedto?pageNum=" + page_num+"&type="+type,
            contentType: "application/json",
            type: "get",
            success: function (res) {
                console.log(res)
                make(res);

            }

        })
    }

    function page(
          board_id
        , board_thumbnail
        , board_title
        , board_content
        , board_created_at
        , comment_count
        , img_thumbnail
        , user_nickname
        , uid
        , user_id
        , like_user_id
        , like_count
    ) {

        let heart = "♡"

        let b_thumbnail = "/img/default-board.jpg";
        let p_thumbnail = "/img/default-profile.png";

        console.log(board_thumbnail)
        console.log(img_thumbnail)

        if (board_thumbnail != null) {


            b_thumbnail = board_thumbnail;

        }
        if (img_thumbnail != null) {

            p_thumbnail = img_thumbnail;

        }

        if (like_user_id == 100) {

            heart = "♥";

        }
        let create = '<a href="/blog/' + user_id + '/board/view/' + board_id + '">'
            + '<div class="col-lg-4 mb-3">'
            + '<div class="card">'
            + '<img src = "' + b_thumbnail + '" class= "card-img-top" >'
            + '<div class="card-body">'
            + '<h5 class="card-title">' + board_title + '</h5>'
            + ' <p class="card-text">' + board_content + '</p>'
            + '  <small style="font-size: 11px; color: #42515f">'
            + board_created_at + ' · ' + comment_count + '개의 댓글'
            + '</small>'
            + '<a href=""></a>'
            + '<hr>'
            + '<a href="#">'
            + '<img src="' + p_thumbnail + '"'
            + ' style="border-radius: 70%;"'
            + ' width="30px"'
            + 'height="30px">'
            + '<span class="small" style="color:gray"> by</span>'
            + '<span style="font-size: 14px"> ' + user_nickname + ' </span>'
            + '</a>'
            + '<div style="float:right">'
            + '<small style="border: none;background-color: white; font-size: 22px;color: red;">'
            + heart
            + '</small> '
            + '<small style="vertical-align: 3px; font-weight: bold">' + like_count + '</small>'
            + '</div>'
            + "</div>"
            + '</div>'
            + "</div>"
            + '</a>';


        $("#main-page").append(create);

    }

    $("#order-by").on('change',function () {
        let select = $("#order-by option:selected").val();
        console.log(select);
        page_num = 1;
        $("#main-page").children().remove();
        page_ajax(select);



    })
});