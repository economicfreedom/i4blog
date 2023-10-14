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
		
		console.log(board_id);
		
		$.ajax({
			type: "POST",
			url: "/like/add-like",
			dataType: "json",
			contentType: "application/json",
			data: JSON.stringify({ boardId: board_id }),
			success: function (res) {
				alert("좋아요 성공");
				let url = res.message
				location.href = url;
			},
			error: function (res) {
				alert("실패");
			}
		}); // end of .$ajax
		
	}) // end of #like
}) // # end of $(document).ready
