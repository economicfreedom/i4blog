<%@ page contentType="text/html; charset=UTF-8" language="java"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/layout/header.jsp"%>
<link href="/css/category.css" rel="stylesheet">

<div class="container">
	<div class="d-flex flex-row">
		<div class="d-flex flex-column">
			<div class="align-self-start category-list card">
			<c:choose>
				<c:when test="${empty categoryList}">
					<div class="p-2">카테고리가 없습니다.</div>					
				</c:when>
				<c:otherwise>
					<c:forEach var="category" items="${categoryList}">
						<a href="#">
							<div class="p-2">${category.categoryName}</div>
						</a>
					</c:forEach>
				</c:otherwise>
			</c:choose>
			</div>
        	<sec:authorize access="isAuthenticated()">
		    	<c:if test="${blogUser.userId eq principal.userId}">
					<div class="d-fles flex-column">
						<a href="#">관리</a>
					</div>
		    	</c:if>
			</sec:authorize>
		</div>
		<div class="d-flex flex-fill category-other card">
