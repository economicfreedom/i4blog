$(document).ready(function () {
	$("#delete").click(function() {
		let id = $('#id').val();
		console.log(id);
		console.log(userId);
		$.ajax({
			type: "PUT",
			url: "board/del",
			contentType: "application/json",
			data: id,
			success: function (res) {
				alert(res);
				location.href = "/blog/" + principal.getName() + "/board/list";
				// "/blog/" + principal.getName() + "/board/list" 여기로 이동되어야 한다.
			},
			error: function (res) {
				alert("실패");
			}
		}); // end of .$ajax
	}); // end of #delete
}) // # end of $(document).ready
