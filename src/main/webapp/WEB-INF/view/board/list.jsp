<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/view/layout/category-header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<h1>게시글 리스트 페이지</h1>

<div class="row">
	<c:choose>
		<c:when test="${boardList != null}">
			<c:forEach var="list" items="${boardList}">
				<div class="col">
					<div class="card" style="width: 14rem;">
					  <img src="/img/blog-icon.png" class="card-img-top" alt="...">
					  <div class="card-body">
					    <h5 class="card-title">Card title</h5>
					    <p class="card-text">${list.boardTitle}</p>
					    <%-- <a href="/board/view/${list.id}" class="btn btn-primary">내용 보기</a> --%>
					    <a href="/blog/aaaa/board/view/${list.id}" class="btn btn-primary">내용 보기</a>
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