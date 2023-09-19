<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!doctype html>
<html lang="en">
<head>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
          integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct"
            crossorigin="anonymous"></script>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.101.0">
    <title>Pricing example · Bootstrap v4.6</title>

    <link rel="canonical" href="https://getbootstrap.com/docs/4.6/examples/pricing/">


    <!-- Bootstrap core CSS -->
    <link href="/pricing.css" rel="stylesheet">


    <style>
        .bd-placeholder-img {
            font-size: 1.125rem;
            text-anchor: middle;
            -webkit-user-select: none;
            -moz-user-select: none;
            -ms-user-select: none;
            user-select: none;
        }

        @media (min-width: 768px) {
            .bd-placeholder-img-lg {
                font-size: 3.5rem;
            }
        }

        .search-button {
            border: none;
        }
    </style>


    <!-- Custom styles for this template -->
    <link rel="stylesheet" href="/static/pricing.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<%--    <script async defer src="https://maps.googleapis.com/maps/api/js?key={APP_KEY}"></script>--%>

    <script>
        $(document).ready(function () {
            $('.logo').
            css("cursor","pointer")

                .click(function () {
                    location.href = "/";
                }) // end of logo


        }) // end of logo


    </script>
</head>

<body>

<div class="d-flex flex-column flex-md-row align-items-center p-3 px-md-4 mb-3 bg-white border-bottom shadow-sm">

    <img class="logo" src="/blog-icon.png" width="5%" height="5%">
    <h3 class="my-0 mr-md-auto font-weight-normal logo"><strong>I4-B</strong></h3>
    <nav class="my-2 my-md-0 mr-md-5">
        <a class="p-2 text-dark font-weight-bolder" href="#">Features</a>
        <a class="p-2 text-dark font-weight-bolder" href="#">Enterprise</a>
        <a class="p-2 text-dark font-weight-bolder" href="#">Support</a>
        <a class="p-2 text-dark font-weight-bolder" href="#">Pricing</a>
        <%--        <input class="p-2" type="text" id="search-txt">--%>
        <%--        <button class="search-button"  style="background-color: white;--%>
        <%--                        width: 8%;--%>
        <%--                        height: 40%">--%>
        <%--            <img src="serach.jpg" style="width:10%;height:10%;">--%>
        <%--        </button>--%>
        <a class="btn btn-outline-primary" href="#">Sign up</a>
    </nav>
</div>
