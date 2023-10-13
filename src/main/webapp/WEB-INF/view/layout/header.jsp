<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
<head>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
          integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <%--    <script async defer src="https://maps.googleapis.com/maps/api/js?key={APP_KEY}"></script>--%>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct"
            crossorigin="anonymous"></script>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.101.0">
    <sec:authorize access="isAuthenticated()">
        <sec:authentication property="principal.user" var="principal"/>
    </sec:authorize>
    <title>Pricing example · Bootstrap v4.6</title>

    <link rel="canonical" href="https://getbootstrap.com/docs/4.6/examples/pricing/">

    <!-- Bootstrap core CSS -->
    <link href="/css/pricing.css" rel="stylesheet">

    <link href="/css/header.css" rel="stylesheet">


    <script src="/js/header.js"></script>
</head>

<body>

<div class="d-flex flex-column flex-md-row align-items-center p-3 px-md-4 mb-3 bg-white border-bottom shadow-sm">

    <img class="logo" src="/img/blog-icon.png" width="5%" height="5%">
    <h3 class="my-0 mr-md-auto font-weight-normal logo"><strong>I4-B</strong></h3>
    <nav class="my-2 my-md-0 mr-md-5">
        <%--        <input class="p-2" type="text" id="search-txt">--%>
        <%--        <button class="search-button"  style="background-color: white;--%>
        <%--                        width: 8%;--%>
        <%--                        height: 40%">--%>
        <%--            <img src="serach.jpg" style="width:10%;height:10%;">--%>
        <%--        </button>--%>


        <select id="type" class="form-select" aria-label="Default select example" style="margin-right: 0px">
            <option selected value="title">제목</option>
            <option value="content">내용</option>
            <option value="2">유저</option>
        </select>

        <input style="width: 150px; height: 25px" id="keyword" value="${'test'}" type="text" placeholder="검색">
        <sec:authorize access="isAnonymous()">
            <a class="p-2 text-dark font-weight-bolder" href="/user/login">로그인</a>
            <a class="btn btn-outline-dark " href="/user/join">회원가입</a>
        </sec:authorize>
        <sec:authorize access="isAuthenticated()">

            <a class="p-2 text-dark" href="/blog/${principal.userId}/board/list">

                <span class="font-weight-bolder">${principal.userId}</span>블로그</a>
            <a class="p-2 text-dark" href="/user/profile-setting">

                <c:if test="${imgProfilePath != null}">
                    <img src="${imgProfilePath}" style="border-radius: 100%;overflow: hidden;">
                </c:if>
                <c:if test="${imgProfilePath == null}">
                    <img src="/img/default-profile" style="border-radius: 100%;overflow: hidden; ">
                </c:if>

            </a>
            <a class="btn btn-outline-dark " href="/logout">로그아웃</a>


        </sec:authorize>
    </nav>
</div>
