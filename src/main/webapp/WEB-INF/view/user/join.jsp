<%@ page contentType="text/html; charset=UTF-8" language="java"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/layout/header.jsp"%>
<link href="/css/join.css" rel="stylesheet">
<div class="container">
	<div class="py-5 text-center">
		<img class="d-block mx-auto mb-4" src="/img/blog-icon.png" width="75px"
			height="75px">
		<h2>i4blog 회원가입</h2>
	</div>

	<form class="form-join" action="/user/join" method="post">
			<h1 class="h3 mb-3 font-weight-normal">회원 정보</h1>
			<div class="col">
				<label for="userId">아이디</label>
					<input type="text" id="userId" name="userId" class="form-control"
						placeholder="아이디" required autofocus>
			</div>
			<div class="col">
				<label for="userPassword">비밀번호</label>
					<input type="password" id="userPassword" name="userPassword" class="form-control"
						placeholder="비밀번호" required>
			</div>
			<div class="col">
				<label for="userName">이름</label>
					<input type="text" id="userName" name="userName" class="form-control"
						placeholder="이름" required>
			</div>
			<div class="col">
				<label for="userNickname">닉네임</label>
					<input type="text" id="userNickname" name="userNickname" class="form-control"
						placeholder="닉네임" required>
			</div>
			<div class="col">
				<label for="userPhone">휴대전화</label>
					<input type="text" id="userPhone" name="userPhone" class="form-control"
						placeholder="휴대전화" required>
			</div>
			<div class="col">
				<label for="userEmail">이메일</label>
					<input type="email" id="userEmail" name="userEmail" class="form-control"
						placeholder="이메일" required>
			</div>
			<button class="btn btn-lg btn-primary btn-block" type="submit">회원가입</button>
			<p class="mt-5 mb-3 text-muted"></p>
	</form>
</div>

<%@ include file="/WEB-INF/view/layout/footer.jsp"%>
