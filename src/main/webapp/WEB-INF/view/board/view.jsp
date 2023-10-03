<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/view/layout/header.jsp"%>


<div class="container">
	<div class="py-5 text-center">
		<h1>게시글 상세보기 페이지</h1>
	</div>
	<div class="form-group">
		<p>${board.boardCategory}</p>
	</div>
	<div class="form-group">
		<p>${board.boardCreated}</p>
	</div>
	<div class="form-group">
		<h3>${board.boardTitle}</h3>
	</div>
	<div class="form-group">
		<h5>${board.boardContent}</h5>
	</div>
	
	<button class="btn btn-secondary" onclick="history.back()">돌아가기</button>
</div>


<%@ include file="/WEB-INF/view/layout/footer.jsp"%>