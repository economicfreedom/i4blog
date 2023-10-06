<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/view/layout/category-header.jsp"%>

<h1>게시글 리스트 페이지</h1>
<!-- 본인 리스트 페이지에서만 작성 버튼 노출되도록 변경 필요 -->
<a href="/blog/${principal.userId}/board/write/${list.id}" class="btn btn-primary">게시글 작성</a>
<br>

<div class="row">
	<c:choose>
		<c:when test="${boardList != null}">
			<c:forEach var="list" items="${boardList}">
				<div class="col">
					<div class="card" style="width: 14rem;">
					  <img src="/img/blog-icon.png" class="card-img-top" alt="..."  width="230px" height="230px">
					  <div class="card-body">
					    <h5 class="card-title">Card title</h5>
					    <p class="card-text">${list.boardTitle}</p>
					    <a href="/blog/${list.userId}/board/view/${list.id}" class="btn btn-primary">내용 보기</a>
					  </div>
					</div>
				</div>
			</c:forEach>
		</c:when>
		<c:otherwise>
			<p>작성된 게시글이 없습니다.</p>
		</c:otherwise>
	</c:choose>
</div>



<%@ include file="/WEB-INF/view/layout/category-footer.jsp"%>