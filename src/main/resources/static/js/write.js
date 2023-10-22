$(document).ready(function() {


	$('#submit-btn').click(function(e) {

		let board_category = $('#board-category').val();
		let board_public = $('#board-public').val();
		let board_title = $('#board-title').val();
		let board_content = $('#summernote').val();

		if (board_title.length === 0) {

			alert("제목을 입력해주세요.")
			$("#board-title")
				.focus();
			return;

		}
		if (board_content.length === 0) {

			alert("내용을 입력해주세요.")
			$("#summernote")
				.focus();
			return;

		}

		let json_data = {
			board_category: board_category,
			board_public: board_public,
			board_title: board_title,
			board_content: board_content
		}

		console.log(JSON.stringify({
			board_category: board_category,
			board_public: board_public,
			board_title: board_title,
			board_content: board_content
		}))


		/* 		$("form").preventDefault(); */

		var inputFile = $("input[type = 'file']");

		if (inputFile[0].files.length === 0) {
			$.ajax({
				type: "POST",
				url: "/board/write",
				dataType: "json",
				contentType: "application/json",
				data: JSON.stringify(json_data)
				, success: function(res) {
					let url = res.message;
					location.href = url;
				}
				, error: function(res) {
					console.log(res);
					alert(res.message)
				}
			});
		} else {
			var formData = new FormData();
			var files = inputFile[0].files;

			for (var i = 0; i < files.length; i++) {
				console.log(files[i]);
				formData.append("uploadFiles", files[i]);
			}

			let width = 200;
			let height = 200;
			formData.append("w", width);
			formData.append("h", height);
			formData.append("type", "board");
			console.log(formData)
			//실제 업로드 부분
			//upload ajax
			$.ajax({
				url: '/upload-img',
				processData: false,
				contentType: false,
				data: formData,
				type: 'POST',
				dataType: 'json',
				success: function(result) {

					let thumbnail = result.thumbnailURL;
					let original_img = result.originalURL;
					console.log(result.thumbnailURL);
					console.log(result.originalURL);
					json_data.thumbnail = thumbnail;
					json_data.original_img = original_img;

					$.ajax({
						type: "POST",
						url: "/board/write",
						dataType: "json",
						contentType: "application/json",
						data: JSON.stringify(json_data),
						success: function(res) {
							console.log(res);
							let url = res.message;
							location.href = url;
						}
						, error: function(res) {
							console.log(res);
							alert(res.message)
						}
					});
				},
				error: function(jqXHR, textStatus, errorThrown) {
					console.log(textStatus);
				},

			}); //$.ajax

		}

	}) // end of click

	// 최규하
	const url = window.location.pathname;


	$("#answer").click(function() {

		let path_list = url.split("/");

		let user_id = path_list[2];

		let request = $("#message-text").val();
		let count_html = $("#count");

		let count = Number(count_html.text());
		if (count === 0) {
			alert("사용횟수를 확인해주세요.")
			return;
		}
		if ($("#message-text").val.length <= 0) {
			alert("내용을 입력해주세요")
			return;
		}

		$.ajax({
			beforeSend: function() {
				// AJAX 요청 전에 오버레이 표시
				show_spinner();
				$('#exampleModalCenter').modal('hide');
				$("#message-text").val("");


			},
			url: "/gpt",
			contentType: "application/json",
			dataType: "json",
			type: "POST",
			data: JSON.stringify({
				user_id: user_id,
				request: request
			}),
			success: function(res) {
				alert("성공");
				count_html.text(count - 1);
				console.log(res.response);


				append_to_summernote(res.response);
			},
			error: function() {


			},
			complete: function() {

				hide_spinner();

			}
		});


	})

	function append_to_summernote(content) {
		var currentContent = $('#summernote').summernote('code');  // 현재의 내용 가져오기
		$('#summernote').summernote('code', currentContent + content);  // 현재의 내용 + 추가할 내용 설정
	}

}) // end of ready
function show_spinner() {
	document.getElementsByClassName('layer-popup')[0].style.display = 'block';
}

function hide_spinner() {
	document.getElementsByClassName('layer-popup')[0].style.display = 'none';
}