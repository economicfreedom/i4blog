<%@ page contentType="text/html; charset=UTF-8" language="java"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/layout/header.jsp"%>
<link href="/css/category.css" rel="stylesheet">

<div class="container">
	<div class="d-flex flex-row">
		<div class="d-flex flex-column">
			<div class="align-self-start category-list card">
				<a href="/blog/${blogUser.userId}/board/list">
					<div class="p-2">전체</div>
				</a>
				<c:forEach var="category" items="${categoryList}">
					<a href="/blog/${blogUser.userId}/board/list?category=${category.categoryName}">
						<div class="p-2">${category.categoryName}</div>
					</a>
				</c:forEach>
			</div>
		</div>
		<div class="d-flex flex-fill category-other card">