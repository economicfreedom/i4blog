<%@ page contentType="text/html; charset=UTF-8" language="java"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/layout/header.jsp"%>
<link href="/css/category.css" rel="stylesheet">

<div class="container">
	<div class="d-flex flex-row">
		<div class="d-flex flex-column align-self-start category-list card">
			<c:forEach var="category" items="${categoryList}">
				<a href="#">
					<div class="p-2">${category.categoryName}</div>
				</a>
			</c:forEach>
		</div>
		<div class="d-flex flex-fill category-other card">
