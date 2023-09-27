<%--
  Created by IntelliJ IDEA.
  User: GGG
  Date: 2023-09-25
  Time: 오후 5:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<link rel="stylesheet" href="/css/admin.css">
<script>
    $(document).ready(function () {
        $('.nav li a').css("cursor", "pointer")

            .click(function () {

            }) // end of logo


    }); // end of ready
</script>
<header class="navbar navbar-expand navbar-dark bg-dark bd-navbar">
  <span class="navbar-brand">님 반갑습니다.</span>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
</header>

<div class="container-fluid">
  <div class="row flex-nowrap">
    <div class="col-3 bd-sidebar">
      <ul class="nav">
        <li><a>전체 보기</a></li>
        <li><a>신고된 게시글 보기</a></li>
        <li><a>신고된 댓글 보기</a></li>
      </ul>
      <br>
    </div>
