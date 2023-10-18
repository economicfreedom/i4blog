<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/view/layout/header.jsp" %>
<style>
    a:link {
        text-decoration-line: none;

        color: black;


    }

    a {
        color: black;
    }

    a:hover {
        color: gray;
    }

    .card {
        transition: all 0.3s ease;
        transform: translateY(0);
        box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
    }

    .card:hover {
        transform: translateY(-5px);
        box-shadow: 0 5px 15px rgba(0, 0, 0, 0.3);
    }

</style>
<script src="/js/main-page.js">

</script>
<section id="gallery">
    <div class="container">
        <div class="container">
            <div class="row">
                <div class="col">
                    <h1>Hello, I4-B</h1>
                </div>
                <div class="col-2">
                    <select class="form-control " id="order-by">
                        <option class="order-by-select" value="" selected>최신순</option>
                        <option class="order-by-select" value="like">좋아요</option>
                        <option class="order-by-select" value="week">일주일 간</option>
                        <option class="order-by-select" value="month">한달 간</option>
                    </select>
                </div>

            </div>
            <div class="row" id="main-page">
                <c:forEach items="${mainList}" var="main">
                    <a href="/blog/${main.userId}/board/view/${main.boardId}">
                        <div class="col-lg-4 mb-3">
                            <div class="card">
                                <c:if test="${main.boardThumbnail == null}">
                                    <img src="/img/default-board.jpg"
                                         alt="" class="card-img-top">
                                </c:if>
                                <c:if test="${main.boardThumbnail != null}">
                                    <img src="${main.boardThumbnail }" class="card-img-top">
                                </c:if>
                                <div class="card-body">
                                    <h5 class="card-title">${main.boardTitle}</h5>
                                    <p class="card-text">${main.boardContent}</p>
                                    <small style="font-size: 11px; color: #42515f">
                                            ${main.boardCreatedAt} · ${main.commentCount} 개의 댓글
                                    </small>
                                    <a href=""></a>

                                    <hr>
                                    <a href="/blog/${main.userId}/board/list">
                                        <c:if test="${main.imgThumbnail == null}">
                                            <img src="/img/default-profile.png"
                                                 style="border-radius: 70%;"
                                                 width="30px"
                                                 height="30px">

                                        </c:if>
                                        <span class="small" style="color:gray">by</span>
                                        <span style="font-size: 14px">${main.userNickname}</span>
                                    </a>
                                    <div style="float:right">

                                        <small style="vertical-align: -1.5px; border: none;background-color: white; font-size: 10px;color: gray;">

                                            좋아요
                                        </small>


                                        <small style=" font-size: 10px "> ${main.likeCount}</small>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </a>
                </c:forEach>


            </div>
            <div align="center" id="loading" hidden>
                <img src="/img/loading.gif" style="height: 100px">
            </div>
        </div>

        <%@ include file="/WEB-INF/view/layout/footer.jsp" %>

