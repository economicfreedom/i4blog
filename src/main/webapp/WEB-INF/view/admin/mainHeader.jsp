<%--
  Created by IntelliJ IDEA.
  User: GGG
  Date: 2023-09-25
  Time: 오후 5:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/view/layout/header.jsp" %>
<%--Admin Header--%>
<link rel="stylesheet" href="/css/admin.css">
<script>
    $(document).ready(function () {
        $('.nav li a').hover(
            function () {
                // 마우스가 영역 안에 들어왔을 때
                $(this).css("background-color", "#f5f5f5"); // 원하는 색상 코드로 변경
            },
            function () {
                // 마우스가 영역에서 나갔을 때
                $(this).css("background-color", ""); // 초기 색상으로 되돌림
            }
            ).css("cursor", "pointer")

            .click(function (e) {
                var url = '/admin/';
                var text = $(this).text();

                if (text === '블로그 동향'){
                    url += 'main';
                }
                if (text === '신고 목록'){
                    url += 'report';
                }

                location.href= url;


            })
        // end of logo


    }); // end of ready
</script>
<header class="navbar navbar-expand navbar-dark bg-dark bd-navbar">
    <span class="navbar-brand">님 반갑습니다.</span>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav"
            aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
</header>

<div class="container-fluid">
    <div class="row flex-nowrap">
        <div class="col-3 bd-sidebar">
            <ul class="nav">
                <li><a>블로그 동향</a></li>
                <hr>
                <li><a>신고 목록</a></li>
                <hr>
            </ul>
            <br>
        </div>
