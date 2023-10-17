<%@ page contentType="text/html; charset=UTF-8" language="java"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/layout/category-header.jsp"%>
<style>
.type {
	height: calc(1.5em + 0.75rem + 2px);
	border: 1px solid #ced4da;
	border-radius: 0.25rem;
}
.like {
	display: flex;
}
.item {
	margin: 50px 0;
	border-bottom: 1px solid #ced4da;
}
.item img {
	border: 1px solid #ced4da;
}
.list-top {
	display: flex;
	justify-content: space-between;
	margin-bottom: 30px;
}
.list-top span {
	font-weight: 500;
}

</style>


<div class="container">
	<div class="input-group mt-3">
		<select id="type" class="type">
			<option ${sessionScope.type == 'title' ? 'selected':''} value="title">제목</option>
			<option ${sessionScope.type == 'content' ? 'selected':''}
				value="content">내용</option>
		</select> <input type="text" id="keyword" value="${sessionScope.keyword}"
			class="form-control rounded" placeholder="검색어를 입력해주세요"
			aria-label="Search" aria-describedby="search-addon" /> <input
			type="hidden" id="user-id" name="user-id" value="${list.strUserId}">
		<input type="image" id="search" src="/img/search.jpg" width="50"
			height="50">
	</div>

	<div class="container">
		<div class="row mt-3 list-top">
			<span> ${count} 개의 글 </span>
			<sec:authorize access="isAuthenticated()">
				<c:if test="${blogUser.userId eq principal.userId}">
					<a href="/blog/${principal.userId}/board/write"
						class="btn btn-primary">게시글 작성</a>
				</c:if>
			</sec:authorize>
		</div>

		<div class="container">
			<c:choose>
				<c:when test="${boardList != null}">
					<c:forEach var="list" items="${boardList}">
						<div class="item">
							<a style="text-decoration: none; color: black;"
								href="/blog/${list.strUserId}/board/view/${list.id}"
								class="card-list">
								<div class="d-flex justify-content-center">
									<c:if
										test="${list.boardImgOriginal == null || list.boardImgOriginal == ''}">
										<img src="/img/default-board.jpg" width="500px" height="350"
											alt="...">
									</c:if>
									<c:if test="${list.boardImgOriginal != null }">
										<img src="${list.boardImgOriginal}" width="500px" height="350"
											alt="...">
									</c:if>
								</div>
								<div class="d-flex justify-content-center mt-4 mb-4">
									<h4>${list.boardTitle}</h4>
								</div> <%-- <div class="d-flex justify-content-start mb-3">
								<small> ${list.boardContent} </small>
							</div> --%>
								<div class="border-none d-flex">
									<div class="border-none">
										<small>${list.boardCreatedAt} </small>
									</div>
									<div class="border-none flex-fill">
										<small>&nbsp;· 댓글 3개</small>
									</div>
									<div class="border-none like">
										<span style="color: red"> ❤ </span>
										<p>${list.likeCount}</p>
									</div>
								</div>
							</a>
						</div>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<div class="col">
						<p>작성된 게시글이 없습니다.</p>
					</div>
				</c:otherwise>
			</c:choose>
		</div>
	</div>




	<%@ include file="/WEB-INF/view/layout/category-footer.jsp"%>