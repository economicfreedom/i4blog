<%@ page contentType="text/html; charset=UTF-8" language="java"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/layout/header.jsp"%>
<script src="/js/pw-change.js"></script>
<link href="/css/join.css" rel="stylesheet">
<div class="container">
	<div class="py-5 text-center">
		<img class="d-block mx-auto mb-4" src="/img/blog-icon.png" width="75px"
			height="75px">
		<h2>비밀번호 변경</h2>
	</div>
	<div class="form-join">
		<input type="hidden" id="user_id" value="${userId}">
		<input type="hidden" id="user_password" value="${userPassword}">
		<div class="col">
			<label for="new_user_password">변경할 비밀번호</label>
				<input type="password" id="new_user_password" name="new_user_password" class="form-control"
					placeholder="비밀번호" >
			<div><small id="new_user_password_check"></small></div>
		</div>
		<div class="col">
			<label for="new_user_password2">변경할 비밀번호 확인</label>
				<input type="password" id="new_user_password2" name="new_user_password2" class="form-control"
					placeholder="비밀번호 확인" >
			<div><small id="new_user_password2_check"></small></div>
		</div>
		<button class="btn btn-lg btn-primary btn-block" type="button" id="pw-change">비밀번호 변경</button>
	</div>
</div>
<%@ include file="/WEB-INF/view/layout/footer.jsp"%>
