<%@ page contentType="text/html; charset=UTF-8" language="java"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/layout/header.jsp"%>
<link rel="stylesheet" href="/css/write.css">

<!-- summernote css/js -->
<script src="/js/summernote/summernote-lite.js"></script>
<script src="/js/summernote/lang/summernote-ko-KR.js"></script>
<link rel="stylesheet" href="/css/summernote/summernote-lite.css">

<div class="container">
	<div class="py-5 text-center">
		<h3>블로그 글쓰기</h3>
	</div>

	<!-- 테스트 완료 후 주석 해제 -->
	<!-- <form action="/blog/${principal.userId}/board/write" method="post" id="write-form"> -->
	<form action="/blog/1/board/write" method="post" id="write-form">
		<div class="form-group form-option">
			<div class="category">
				<label for="boardCategory">카테고리</label> <select
					class="boardCategory" id="board-category" name="boardCategory">
					<c:choose>
						<c:when test="${empty categoryList}">
							<option value="">---</option>
						</c:when>
						<c:otherwise>
							<c:forEach var="category" items="${categoryList}">
								<option value="${category.categoryName}">${category.categoryName}</option>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</select>
			</div>
			<div class="input-radio">
				<label>공개<input type="radio" id="board-public" name="boardPublic" value="1" checked="checked"></label>
				<label>비공개<input type="radio" id="board-public" name="boardPublic" value="0"></label>
			</div>
		</div>

		<div class="form-group">
		    <label for="boardTitle">제목</label>
		    <input type="text" id="board-title" name="boardTitle" class="form-control" placeholder="글 제목을 입력하세요.">
	  	</div>

		<!-- 섬네일 start -->
		<div class="form-group">
			<input name="uploadFiles" type="file">
		</div>
		<div class="uploadResult"></div>
		<!-- 섬네일 end -->

		<textarea id="summernote" name="boardContent"
			placeholder="글 내용을 입력하세요."></textarea>
		<button type="button" id="submit-btn" class="btn btn-primary">게시글 등록</button>
		<input type="text" name="thumbnail" id="thumbnail" hidden value="">
		<button type="button" class="btn btn-secondary"
			onclick="history.back()">취소</button>
	</form>

</div>

<script>
	$('#summernote').summernote({
		// 에디터 높이
		height : 500,
		// 에디터 한글 설정
		lang : "ko-KR",
		// 에디터 로딩 후 포커스 설정
		focus : true,
		toolbar : [
				// 글꼴 설정
				[ 'fontname', [ 'fontname' ] ],
				// 글자 크기 설정
				[ 'fontsize', [ 'fontsize' ] ],
				// 굵기, 기울임꼴, 밑줄,취소 선, 서식지우기
				[
						'style',
						[ 'bold', 'italic', 'underline',
								'strikethrough', 'clear' ] ],
				// 글자색
				[ 'color', [ 'forecolor', 'color' ] ],
				// 표만들기
				[ 'table', [ 'table' ] ],
				// 글머리 기호, 번호매기기, 문단정렬
				[ 'para', [ 'ul', 'ol', 'paragraph' ] ],
				// 줄간격
				[ 'height', [ 'height' ] ],
				// 그림첨부, 링크만들기, 동영상첨부
				[ 'insert', [ 'picture', 'link', 'video' ] ],
				// 코드보기, 확대해서보기, 도움말
				[ 'view', [ 'codeview', 'fullscreen', 'help' ] ] ],
		// 추가한 글꼴
		fontNames : [ 'Arial', 'Arial Black', 'Comic Sans MS',
				'Courier New', '맑은 고딕', '궁서', '굴림체', '굴림',
				'돋음체', '바탕체' ],
		// 추가한 폰트사이즈
		fontSizes : [ '8', '9', '10', '11', '12', '14', '16',
				'18', '20', '22', '24', '28', '30', '36', '50',
				'72' ]
	});
</script>


<script>
$(document).ready(function(){

	// let json_data = new JSON({
	// 		board_category : board_category,
	// 		board_public : board_public,
	// 		board_title : board_title,
	// 		board_content : board_content

	// 		});

	function writeOk() {
		// $.ajax({
		// 	type: "POST",
		// 	url: "/board/write",
		// 	dataType: "json",
		// 	contentType:"application/json",
		// 	data: JSON.stringify({
		// 	board_category : board_category,
		// 	board_public : board_public,
		// 	board_title : board_title,
		// 	board_content : board_content

		// 	}),
		// 	success: function() {
				
		// 	}

		// });
	}

$('#submit-btn').click(function (e) {
	

	let board_category =$('#board-category').val();
	let board_public =  $('#board-public').val();
	let board_title =   $('#board-title').val();
	let board_content = $('#summernote').val();

	if(board_title.length === 0){
		alert("제목을 입력해주세요")
		$("#board-title")
		.focus();
		return;
	}
	if(board_content.length === 0){
		alert("내용을 입력해주세요")
		$("#summernote")
		.focus();
		return;
	}
	console.log( JSON.stringify({
			board_category : board_category,
			board_public : board_public,
			board_title : board_title,
			board_content : board_content
			}))
/* 		$("form").preventDefault(); */
    var inputFile = $("input[type = 'file']");
    console.log(inputFile[0].files.length);
    if(inputFile[0].files.length === 0){	
    	// inputFile이 없으면 서브밋
		// 메소드 만들어서 코드 줄이기
		$.ajax({
					type: "POST",
					url: "/board/write",
					dataType: "json",
			contentType:"application/json",
			data: JSON.stringify({
			board_category : board_category,
			board_public : board_public,
			board_title : board_title,
			board_content : board_content
			})
			,success:function(res){
				alert("썸네일 없을때");
				
				let url =res.message;
				location.href=url;
				
			}
			,error:function(res){
				console.log(res);
				alert(res.message)

			}
		
			});
	}else{
		
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
	        success: function (result) {
				
			let thumbnail = result.thumbnailURL;
			console.log(result.thumbnailURL);
	        let json_data =	JSON.stringify({
			board_category : board_category,
			board_public : board_public,
			board_title : board_title,
			board_content : board_content,
			thumbnail : thumbnail		
			});
			
	        	// url경로가 result에 나옴
	        	// url 경로 값을 히든으로 숨긴 인풋 태그에 넣어줌
	        	// 서브밋으로 보냄
	        	
	        	//form 데이터를 받는 dto에 thumbnail 이라는 변수 하나 생성
	        	//디비에 저장 시킬때 얘를 넣어주면 됨
				
			
	        	$.ajax({
					type: "POST",
					url: "/board/write",
					dataType: "json",
			contentType:"application/json",
			data: json_data,			
			success: function(res) {
				console.log(res);
				let url =res.message;
				location.href=url;
				

			}
			,error:function(res){
				console.log(res);
				alert(res.message)

			}

		});
	        },
	        error: function (jqXHR, textStatus, errorThrown) {
	            console.log(textStatus);

	        },

	    }); //$.ajax

	}
	

}) // end of click

}) // end of ready
</script>

<%@ include file="/WEB-INF/view/layout/footer.jsp"%>