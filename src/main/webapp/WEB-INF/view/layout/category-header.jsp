<%@ page contentType="text/html; charset=UTF-8" language="java"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/layout/header.jsp"%>
<link href="/css/category.css" rel="stylesheet">

<div class="container">
	<div class="d-flex flex-row">
		<div class="d-flex flex-column">

			<div class="list-profile card">
				<a href="/blog/${blogProfile.userId}/board/list"> <c:if
						test="${blogProfile.imgThumbnail == null}">
						<img src="/img/default-board.jpg" alt="" class="card-img-top">
					</c:if> <c:if test="${blogProfile.imgThumbnail != null}">
						<img src="${blogProfile.imgThumbnail }" class="card-img-top">
					</c:if>
					<div class="card-body">
						<h5 class="card-title">${blogProfile.userNickname}</h5>
						<p class="card-text">${blogProfile.profileTitle}</p>
					</div>
				</a>
			</div>

			<div class="align-self-start category-list card">
				<a href="/blog/${blogProfile.userId}/board/list">
					<div class="p-2">전체</div>
				</a>
				<c:forEach var="category" items="${categoryList}">
					<a
						href="/blog/${blogProfile.userId}/board/list?category=${category.id}">
						<div class="p-2">${category.categoryName}</div>
					</a>
				</c:forEach>
			</div>
		</div>
		<div class="d-flex flex-fill category-other card">