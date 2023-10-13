<%@ page contentType="text/html; charset=UTF-8" language="java"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/layout/header.jsp"%>
<script src="/js/update.js"></script>
<link rel="stylesheet" href="/css/write.css">

<!-- summernote css/js -->
<script src="/js/summernote/summernote-lite.js"></script>
<script src="/js/summernote/lang/summernote-ko-KR.js"></script>
<link rel="stylesheet" href="/css/summernote/summernote-lite.css">

<div class="container">
	<div class="py-5 text-center">
		<h3>글 수정하기</h3>
	</div>

	<form action="/blog/${principal.userId}/board/update" method="post">
		<input type="hidden" id="id" name="id" value="${board.id}"> <input
			type="hidden" name="userId" value="${principal.id}">
		<div class="form-group form-option">
			<div class="category">
				<label for="board-category">카테고리</label> <select
					class="boardCategory" id="board-category" name="board-category">
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
				<label>공개<input type="radio" id="board-public" name="board-public" value="1" checked="checked"></label>
				<label>비공개<input	type="radio" id="board-public" name="board-public" value="0"></label>
			</div>
		</div>

		<div class="form-group">
			<label for="board-title">제목</label> <input
				value="${board.boardTitle}" type="text" id="board-title" name="board-title" class="form-control" placeholder="글 제목을 입력하세요.">
		</div>

		<!-- 섬네일 start -->
		<div class="container" style="width: 200px; height: 200px">
			<div class="row">
				<div class="form-group">
					<c:if
						test="${board.boardThumbnail == null || board.boardThumbnail == ''}">
						<img src="/img/default-board.jpg" alt="..." width="200px" height="200px">
					</c:if>
					<c:if test="${board.boardThumbnail != null }">
						<img src="${board.boardThumbnail}" class="card-img-top" alt="..."
							width="200px" height="200px">
						<input type="hidden" value="${board.boardThumbnail}" id="old_thumbnail">
						<input type="hidden" value="${board.boardImgOriginal}" id="old_img_original">
						<button type="button" id="delete-thumbnail" class="btn btn-info">삭제</button>
					</c:if>
				</div>
			</div>
			<div class="uploadResult"></div>
		</div>
		<div class="container">
			<input name="uploadFiles" type="file" multiple>
		</div>

		<!-- 섬네일 end -->

		<textarea id="summernote" name="board-content" placeholder="글 내용을 입력하세요.">${board.boardContent}</textarea>
		<div class="text-center mt-3">
			<button type="button" id="submit-btn" class="btn btn-primary">수정 완료</button>
			<button type="button" class="btn btn-secondary"	onclick="history.back()">취소</button>
		</div>
	</form>

</div>

<script>
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
								'72' ]
					});
</script>

<%@ include file="/WEB-INF/view/layout/footer.jsp"%>