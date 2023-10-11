<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/view/layout/category-header.jsp"%>
<link rel="stylesheet" href="/css/view.css">


<div class="container">
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
			<span class="like-heart" onclick="likeToggle(this)">&#10084;</span>
		</div>
	</div>
	<div class="form-group content">
		<h5>${board.boardContent}</h5>
	</div>
	
	<a href="/blog/${board.userId}/board/update/${board.id}" class="btn btn-warning">수정하기</a>
	<button class="btn btn-secondary" onclick="history.back()">돌아가기</button>

	<%@ include file="/WEB-INF/view/comment/commentList.jsp"%>
</div>


<%@ include file="/WEB-INF/view/layout/category-footer.jsp"%>