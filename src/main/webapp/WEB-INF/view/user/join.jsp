<%@ page contentType="text/html; charset=UTF-8" language="java"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/layout/header.jsp"%>
<script src="/js/join.js"></script>
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
				<label for="user_id">*아이디</label>
					<input type="text" id="user_id" name="user_id" class="form-control"
						placeholder="아이디" maxlength="20" autofocus>
				<div><small id="user_id_check"></small></div>
			</div>
			<div class="col">
				<label for="user_password">*비밀번호</label>
					<input type="password" id="user_password" name="user_password" class="form-control"
						placeholder="비밀번호" >
				<div><small id="user_password_check"></small></div>
			</div>
			<div class="col">
				<label for="user_password2">*비밀번호 확인</label>
					<input type="password" id="user_password2" name="user_password2" class="form-control"
						placeholder="비밀번호 확인" >
				<div><small id="user_password2_check"></small></div>
			</div>
			<div class="col">
				<label for="user_name">*이름</label>
					<input type="text" id="user_name" name="user_name" class="form-control"
						placeholder="이름" maxlength="20">
				<div><small id="user_name_check"></small></div>
			</div>
			<div class="col">
				<label for="user_nickname">*닉네임</label>
					<input type="text" id="user_nickname" name="user_nickname" class="form-control"
						placeholder="닉네임" maxlength="30">
				<div><small id="user_nickname_check"></small></div>
			</div>
			<div class="col">
				<label for="user_phone">*휴대전화</label>
					<input type="text" id="user_phone" name="user_phone" class="form-control"
						placeholder="휴대전화" maxlength="13">
				<div><small id="user_phone_check"></small></div>
			</div>
			<div class="col">
				<label for="user_email">*이메일</label>
				<div class="d-flex flex-row email">
					<input type="email" id="user_email" name="user_email" class="form-control"
						placeholder="이메일" maxlength="100">
					<button type="button" id="user_email_send_btn" class="form-control" style="width: 25%">코드 전송</button>
				</div>
				<div><small id="user_email_check"></small></div>
				<div class="d-flex flex-row email">
					<input type="text" id="user_email_auth" name="user_email_auth" class="form-control"
						placeholder="인증 번호" maxlength="8" disabled="disabled" width="30%">
					<button type="button" id="user_email_auth_btn" class="form-control" style="width: 20%" disabled="disabled">확인</button>
				</div>
				<div><small id="user_email_auth_check"></small></div>
			</div>
			<button class="btn btn-lg btn-primary btn-block" type="button" id="join">회원가입</button>
			<p class="mt-5 mb-3 text-muted"></p>
	</form>
</div>
<%@ include file="/WEB-INF/view/layout/footer.jsp"%>
