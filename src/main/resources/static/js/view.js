$(document).ready(function() {

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
			success: function(res) {
				alert(res);
				location.href = "/blog/" + user_id + "/board/list";
			},
			error: function(res) {
				alert("실패");
			}
		}); // end of .$ajax
	}); // end of #delete


	// 좋아요 기능 
	$("#like-heart").click(function() {
		let board_id = $('#id').val();
		let like_icon = $('#like-heart');
		let like_count = Number($("#like-count").text());

		console.log(like_icon);

		if (like_icon.hasClass("empty")) { // 좋아요 하지 않은 상태 => 좋아요 추가
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
				alert(error.responseText);
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
				alert(error.responseText);
				console.log("오류", error);
			});
		}
	}) // end of $("#like-heart").click
	
	// 신고하기 modal
	$('#exampleModal').on('show.bs.modal', function(event) {
		var button = $(event.relatedTarget) // Button that triggered the modal
		var recipient = button.data('whatever') // Extract info from data-* attributes
		// If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
		// Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
		var modal = $(this)
		modal.find('.modal-title').text('신고하기')
		modal.find('.modal-body input').val(recipient)
	})
	
	$('#report-btn').click(function() {
		let board_id = $('#id').val();
		let report_content = $('#report-content').val();
		
		
		if(report_content.length === 0) {
			alert("신고 사유를 입력해주세요.")
            $("#report-content").focus();
            return;
		}
		
		let report_create_dto = {
			board_id : board_id,
			report_content : report_content,
		};
		
		$.ajax({
			url: "/report",
			type: "POST",
			data: JSON.stringify(report_create_dto),
			contentType: "application/json; charset=utf-8",
			success: function(res) {
				alert("신고 성공");
				$('#exampleModal').modal('hide');
		    },
		    error: function(res) {
		        alert("신고 실패");
		    } 
		}); // end of .$ajax
		
		
	}); // end of $('#report-btn').click
	
}) // # end of $(document).ready
