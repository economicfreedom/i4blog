<%@ page contentType="text/html; charset=UTF-8" language="java"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/layout/header.jsp"%>
<script src="/js/write.js"></script>
<link rel="stylesheet" href="/css/write.css">

<!-- summernote css/js -->
<script src="/js/summernote/summernote-lite.js"></script>
<script src="/js/summernote/lang/summernote-ko-KR.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.js"></script>

<link rel="stylesheet" href="/css/summernote/summernote-lite.css">

<div class="container">
	<div class="py-5 text-center">
		<h3>블로그 글쓰기</h3>
	</div>


	<form action="/blog/${principal.userId}/board/write" method="post"
		id="write-form">
		<div class="form-group form-option">
			<div class="category">
				<label for="board-category">카테고리</label> <select
					class="board-category" id="board-category" name="board-category">
					<option value="0">전체</option>
					<c:forEach var="category" items="${categoryList}">
						<option value="${category.id}">${category.categoryName}</option>
					</c:forEach>
				</select>
			</div>
			<div class="input-radio">
				<label>공개<input type="radio" id="board-public"
					name="board-public" value="1" checked="checked"></label> <label>비공개<input
					type="radio" id="board-public" name="board-public" value="0"></label>
			</div>
		</div>

		<div class="form-group">
			<label for="boardTitle">제목</label> <input type="text"
				id="board-title" name="board-title" class="form-control"
				placeholder="글 제목을 입력하세요.">
		</div>

		<!-- 섬네일 start -->
		<div class="form-group">
			<input name="uploadFiles" type="file">
		</div>
		<div class="uploadResult"></div>
		<input type="text" name="thumbnail" id="thumbnail" hidden value="">
		<!-- 섬네일 end -->

		<textarea id="summernote" name="board-content"
			placeholder="글 내용을 입력하세요."></textarea>

		<div class="text-center mt-3">
			<button type="button" id="submit-btn" class="btn btn-primary">게시글
				등록</button>
			<button type="button" class="btn btn-secondary"
				onclick="history.back()">취소</button>
		</div>
	</form>

</div>
<!-- Button trigger modal -->
<button type="button" class="btn btn-primary" data-toggle="modal"
	data-target="#exampleModalCenter">Launch demo modal</button>

<!-- Modal -->
<div class="modal fade" id="exampleModalCenter" tabindex="-1"
	role="dialog" aria-labelledby="exampleModalCenterTitle"
	aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLongTitle">
					남은 사용 횟수 : <span id="count">${gptCount}</span>번
				</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<label for="message-text" class="col-form-label">질문:</label>
				<textarea class="form-control" id="message-text"></textarea>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
				<button type="button" class="btn btn-primary" id="answer">질문</button>
			</div>
		</div>
	</div>
</div>
<div class="layer-popup" style="display: none;">
	<div class="spinner"></div>
</div>



<script>
	let lastPress = 0;
	let isEnterKeyDown = false; // 엔터 키를 누르고 있는지 여부

	$('#summernote')
			.summernote(
					{

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
								'72' ],
						callbacks : {
							onKeydown : function(e) {
								if (e.which === 32) {
									const timeNow = new Date().getTime();
									if (timeNow - lastPress < 200) {
										$('#exampleModalCenter').modal('show');
									}
									lastPress = timeNow;
								}
							}
						}
					});
</script>


<%@ include file="/WEB-INF/view/layout/footer.jsp"%>