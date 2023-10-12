$(document).ready(function () {
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
}) // # end of $(document).ready
