<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/view/layout/header.jsp"%>
   <link href="/css/login.css" rel="stylesheet">
<form class="form-login" method="post">
	<div align="center">
		<img class="mb-4" src="/img/blog-icon.png" width="100px" height="100px">
	</div>
	<h1 class="h3 mb-3 font-weight-normal">i4blog 로그인</h1>
	<label for="userId" class="sr-only">아이디</label>
		<input type="text" id="userId" name="userId" class="form-control" placeholder="아이디" required autofocus>
	<label for="userPassword" class="sr-only">비밀번호</label>
		<input type="password" id="userPassword" name="userPassword" class="form-control" placeholder="비밀번호" required>
	<button class="btn btn-lg btn-primary btn-block" type="submit">로그인</button>
	<br>
	<span style="float:left; width:45%;"><a href="/user/join">회원가입</a></span>
	<span style="text-align:right; width:54%;"><a href="/user/forgot">아이디/비밀번호 찾기</a></span>
</form>
<%@ include file="/WEB-INF/view/layout/footer.jsp"%>
