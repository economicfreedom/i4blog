<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/view/layout/category-header.jsp"%>
<style>
    .card-list:link {
        text-decoration-line: none;
        color: black;
    }

    .card-list {
        color: black;
    }

    .card-list:hover {
        color: gray;
    }

    .card-list .card {
        transition: all 0.3s ease;
        transform: translateY(0);
        box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
    }

    .card-list .card:hover {
        transform: translateY(-5px);
        box-shadow: 0 5px 15px rgba(0, 0, 0, 0.3);
    }
</style>

<!-- 본인 리스트 페이지에서만 작성 버튼 노출되도록 변경 필요 -->
<a href="/blog/${principal.userId}/board/write/${list.id}" class="btn btn-primary">게시글 작성</a>
<br>

<div class="row">
	<c:choose>
		<c:when test="${boardList != null}">
			<c:forEach var="list" items="${boardList}">
				<a href="/blog/${list.userId}/board/view/${list.id}" class="card-list">
					<div class="col">
						<div class="card" style="width: 14rem; margin-bottom: 15px">
							<c:if test="${list.boardThumbnail == null || list.boardThumbnail == ''}">
								<img src="/img/default-board.jpg" class="card-img-top" alt="...">
							</c:if>
							<c:if test="${list.boardThumbnail != null }">
								<img src="${list.boardThumbnail}" class="card-img-top" alt="...">
							</c:if>
							<div class="card-body">
								<h5 class="card-title">${list.boardTitle}</h5>
							</div>
						</div>
					</div>
			</a>
			</c:forEach>
		</c:when>
		<c:otherwise>
			<p>작성된 게시글이 없습니다.</p>
		</c:otherwise>
	</c:choose>
</div>


<%@ include file="/WEB-INF/view/layout/category-footer.jsp"%>