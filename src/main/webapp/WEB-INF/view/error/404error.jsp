<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/view/layout/header.jsp" %>
<head>
    <link href="https://fonts.googleapis.com/css2?family=Nunito+Sans:wght@600;900&display=swap" rel="stylesheet">
    <script src="https://kit.fontawesome.com/4b9ba14b0f.js" crossorigin="anonymous"></script>
</head>
<style>

    /*body {*/
    /*  background-color: #95c2de;*/
    /*}*/

    .mainbox {
        background-color: white;
        margin: auto;
        height: 600px;
        width: 600px;
        position: relative;
    }

    .err {
        color: black;
        font-family: 'Nunito Sans', sans-serif;
        font-size: 11rem;
        position: absolute;
        left: 20%;
        top: 8%;
    }

    .far {
        position: absolute;
        font-size: 8.5rem;
        left: 42%;
        top: 15%;
        color: black;
    }

    .err2 {
        color: black;
        font-family: 'Nunito Sans', sans-serif;
        font-size: 11rem;
        position: absolute;
        left: 68%;
        top: 8%;
    }

    .msg {
        text-align: center;
        font-family: 'Nunito Sans', sans-serif;
        font-size: 1.6rem;
        position: absolute;
        left: 16%;
        top: 45%;
        width: 75%;
    }

    a {
        text-decoration: none;
        color: orangered;
    }

    a:hover {
        text-decoration: underline;
    }
</style>
<body>
<div class="mainbox">
    <div class="err">4</div>
    <i class="far fa-question-circle fa-spin"></i>
    <div class="err2">4</div>
    <div class="msg">해당 페이지가 존재 하지 않아요!
        <br>
        <p>이전 페이지로 가고 싶으시다면 <a href="#" id="back">여기</a>를 클릭해주세요.</p></div>
</div>
<script>
    $(document).ready(function () {
        $("#back").click(function () {
            history.back();
        })
    })
</script>
<%@ include file="/WEB-INF/view/layout/footer.jsp" %>
