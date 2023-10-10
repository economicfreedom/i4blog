        $(document).ready(function() {
	
	$('#submit-btn').click(function(e) {
		let board_category = $('#board-category').val();
		let board_public = $('#board-public').val();
		let board_title = $('#board-title').val();
		let board_content = $('#summernote').val();

		if (board_title.length === 0) {
			alert("제목을 입력해주세요")
			$("#board-title")
				.focus();
			return;
		}
		if (board_content.length === 0) {
			alert("내용을 입력해주세요")
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
		console.log(inputFile[0].files.length);
		
		if (inputFile[0].files.length === 0) {
			// inputFile이 없으면 서브밋
			// 메소드 만들어서 코드 줄이기
			$.ajax({
				type: "POST",
				url: "/board/write",
				dataType: "json",
				contentType: "application/json",
				data: JSON.stringify(json_data)
				, success: function(res) {
					alert("썸네일 없을때");

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
					console.log(result.thumbnailURL);
                    json_data.thumbnail = thumbnail;

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

}) // end of ready