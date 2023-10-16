<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/view/layout/category-header.jsp"%>
<script src="/js/view.js"></script>
<link rel="stylesheet" href="/css/view.css">


<div class="container">
	<input type="text" hidden name="id" id="id" value="${board.id}">
	<input type="text" hidden name="id" id="user-id" value="${board.userId}">
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
				<span id="like-heart" class="empty like-heart" >🤍</span>
			</c:if>
			<c:if test="${like == true}">
				<span id="like-heart" class="has like-heart" >❤</span>
			</c:if>
			<p id="like-count">${board.likeCount}</p>
		</div>
	</div>
	<div class="form-group content">
		<h5>${board.boardContent}</h5>
	</div>
	
	
	<a href="/blog/${board.userId}/board/update/${board.id}" class="btn btn-warning">수정하기</a>
	<button type="button" id="delete" class="btn btn-info">삭제</button>
	<button class="btn btn-secondary" onclick="history.back()">돌아가기</button>

	<%-- <%@ include file="/WEB-INF/view/comment/commentList.jsp"%> --%>
</div>


<%@ include file="/WEB-INF/view/layout/category-footer.jsp"%>