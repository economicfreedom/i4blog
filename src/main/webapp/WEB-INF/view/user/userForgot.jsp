<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/view/layout/header.jsp"%>
   <link href="/css/login.css" rel="stylesheet">
<div class="form-login">
	<div align="center">
		<img class="mb-4" src="/img/blog-icon.png" width="100px" height="100px">
	</div>
	<h1 class="h3 mb-3 font-weight-normal">아이디 찾기</h1>
	<label for="user_email_id" class="sr-only">이메일</label>
		<input type="text" id="user_email_id" name="user_email_id" class="form-control" placeholder="이메일">
		<div><small id="user_email_id_check"></small></div>
	<button class="btn btn-primary btn-block" type="button" id="forgot-id">아이디 찾기</button>
	<br>
	<h1 class="h3 mb-3 font-weight-normal">비밀번호 찾기</h1>
	<label for="user_id" class="sr-only">아이디</label>
		<input type="text" id="user_id" name="user_id" class="form-control" placeholder="아이디">
		<div style="padding-bottom: 8px"><small id="user_id_check"></small></div>
	<label for="user_email" class="sr-only">이메일</label>
	<div class="d-flex flex-row email">
		<input type="email" id="user_email" name="user_email" class="form-control"
			placeholder="이메일" maxlength="100">
		<button type="button" id="email_auth_send_btn" class="form-control" style="width: 25%">전송</button>
	</div>
	<div><small id="user_email_check"></small></div>
	<div class="d-flex flex-row email">
		<input type="text" id="user_email_auth" name="user_email_auth" class="form-control"
			placeholder="인증 번호" maxlength="8" disabled="disabled">
	</div>
	<div><small id="user_email_auth_check"></small></div>
	<button class="btn btn-primary btn-block" type="button" id="forgot-pw">비밀번호 찾기</button>
	<br>
</div>
<%@ include file="/WEB-INF/view/layout/footer.jsp"%>
