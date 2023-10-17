<%@ page contentType="text/html; charset=UTF-8" language="java"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/layout/category-header.jsp"%>
<script src="/js/view.js"></script>
<link rel="stylesheet" href="/css/view.css">


<div class="container">
	<input type="text" hidden name="id" id="id" value="${board.id}">
	<input type="text" hidden name="user-id" id="user-id"
		value="${board.userId}">
	<div class="form-group category">
		<p>${board.boardCategory}</p>
	</div>
	<div class="title">
		<h1>${board.boardTitle}</h1>
	</div>
	<div class="form-group view-container">
		<div class="information">
			<p>${board.userNickname}</p>
			<p>${board.boardCreatedAt}</p>
		</div>
		<div class="function">
			<c:if test="${like == false}">
				<span id="like-heart" class="empty like-heart">🤍</span>
			</c:if>
			<c:if test="${like == true}">
				<span id="like-heart" class="has like-heart">❤</span>
			</c:if>
			<p id="like-count">${board.likeCount}</p>
		</div>
	</div>
	<div class="form-group content">
		<h5>${board.boardContent}</h5>
	</div>

	<!-- report modal -->
	<button type="button" class="btn btn-primary" data-toggle="modal"
		data-target="#exampleModal">신고하기</button>

	<a href="/blog/${board.userId}/board/update/${board.id}"
		class="btn btn-warning">수정하기</a>
	<button type="button" id="delete" class="btn btn-info">삭제</button>
	<button class="btn btn-secondary" onclick="history.back()">돌아가기</button>

	<!-- modal -->
	<div class="modal fade" id="exampleModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">신고하기</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form>
						<div class="form-group">
							<label for="recipient-name" class="col-form-label">신고할 게시글</label>
							${board.boardTitle}
						</div>
						<div class="form-group">
							<label for="message-text" class="col-form-label">신고 사유</label>
							<!-- <select id="report-content">
								<option value="report_content">불건전한 게시물</option>
								<option value="report_content">스팸홍보/도배글</option>
								<option value="report_content">음란물</option>
								<option value="report_content">불법정보 포함</option>
								<option value="report_content">욕설/혐오 표현</option>
								<option value="report_content">개인정보 노출</option>
							</select> -->
							<textarea id="report-content" class="form-control" id="message-text"></textarea>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">닫기</button>
					<button type="button" class="btn btn-primary" id="report-btn">확인</button>
				</div>
			</div>
		</div>
	</div>

	<%-- <%@ include file="/WEB-INF/view/comment/commentList.jsp"%> --%>
</div>


<%@ include file="/WEB-INF/view/layout/category-footer.jsp"%>