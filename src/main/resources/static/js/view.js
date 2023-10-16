$(document).ready(function () {
	
	// 게시글 삭제
	$("#delete").click(function() {
		let id = $('#id').val();
		let user_id = $('#user-id').val(); 
		
		console.log(id);
		console.log(user_id);
		
		$.ajax({
			type: "PUT",
			url: "/board/del",
			contentType: "application/json",
			data: id,
			success: function (res) {
				alert(res);
				location.href = "/blog/" + user_id + "/board/list";
			},
			error: function (res) {
				alert("실패");
			}
		}); // end of .$ajax
	}); // end of #delete
	
	
	$("#like-heart").click(function() {
		let board_id = $('#id').val();
		let user_id = $('#user-id').val();
		let like_icon = $('#like-heart');
		let like_count = Number($("#like-count").text());
		
		console.log(like_icon);

		if(like_icon.hasClass("empty")) { // 좋아요 하지 않은 상태 => 좋아요 추가
			$.ajax({
				type: "POST",
				url: "/like/add-like",
				contentType: "application/json; charset=utf-8",
				data: JSON.stringify({ boardId: board_id }),
			}).done(res => {  // end of .$ajax
				like_icon.addClass("has");
				like_icon.removeClass("empty");
				$("#like-heart").text("❤");
				$("#like-count").text(like_count + 1);
				
			}).fail(error => {
				console.log("오류", error);
			});
		} else { // 좋아요 한 상태 => 좋아요 삭제
			$.ajax({
				type: "DELETE",
				url: "/like/delete-like",
				contentType: "application/json; charset=utf-8",
				data: JSON.stringify({ boardId: board_id }),
			}).done(res => {  // end of .$ajax
				like_icon.addClass("empty");
				like_icon.removeClass("has");
				$("#like-heart").text("🤍");
				$("#like-count").text(like_count - 1);
			}).fail(error => {
				console.log("오류", error);
			}); // end of #like
		}		
	}) 
}) // # end of $(document).ready
