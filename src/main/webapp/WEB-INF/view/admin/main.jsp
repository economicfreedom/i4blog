<%@ page contentType="text/html; charset=UTF-8" language="java" %>

<script src="/cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>


<%@include file="/WEB-INF/view/admin/mainHeader.jsp" %>
<script src="/js/admin-main.js"></script>
<style>
    /*.container {*/
    /*    width: 100vw;*/
    /*    height: 100vh;*/
    /*    padding: 20px;*/
    /*    box-sizing: border-box;*/
    /*}*/

    /*.chart-container {*/
    /*    display: grid;*/
    /*    grid-template-columns: 1fr 1fr;*/
    /*    grid-gap: 20px;*/
    /*}*/

    /*.chart-item canvas {*/
    /*    width: 100% !important;*/
    /*    height: auto !important;*/
    /*    max-height: 40vh;*/
    /*}*/
</style>
<main class="col-9 py-md-3 pl-md-5 bd-content" role="main">

    <div class="container">
        <%--        <div class="chart-container">--%>

        <div>
            <%--                        <div class="chart-item">--%>

            <h3 align="center">회원가입 건수</h3>
            <canvas style="height:30vh; width:50vw" id="user-chart"></canvas>
        </div>
        <%--                <div class="chart-item">--%>

        <div>
            <h3 align="center">게시글작성 건수</h3>

            <canvas style="height:30vh; width:50vw" id="board-chart"></canvas>
        </div>

        <%--            <div class="chart-item">--%>
        <div>
            <h3 align="center">댓글작성 건수</h3>
            <canvas style="height:30vh; width:50vw" id="comment-chart"></canvas>
        </div>
        <%--            <div class="chart-item">--%>
        <div>
            <h3 align="center">신고 건수</h3>
            <canvas style="height:30vh; width:50vw" id="report-chart"></canvas>
            <%--            </div>--%>
        </div>
<%--        <div class="row">--%>
<%--            <div class="col">--%>
<%--                <div class="card text-center mb-3" style="width: 18rem;">--%>
<%--                    <div class="card-body">--%>
<%--                        <h5 class="card-title"><b>오늘 가입한 회원</b></h5>--%>
<%--                        <p class="card-text">${dateCountDTO.getYJoinedUser()}</p>--%>
<%--                        <a href="#" class="btn btn-primary">Go somewhere</a>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--            <div class="col-6">--%>
<%--                <div class="card text-center mb-3 " style="width: 18rem;">--%>
<%--                    <div class="card-body">--%>
<%--                        <h5 class="card-title"><b>어제 가입한 회원</b></h5>--%>
<%--                        <p class="card-text">${dateCountDTO.getYJoinedUser()}</p>--%>
<%--                        <a href="#" class="btn btn-primary">Go somewhere</a>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--        <div class="row">--%>
<%--            <div class="col">--%>
<%--                <div class="card text-center mb-3" style="width: 18rem;">--%>
<%--                    <div class="card-body">--%>
<%--                        <h5 class="card-title"><b>오늘 작성된 글</b></h5>--%>
<%--                        <p class="card-text">${dateCountDTO.getTCreatedBoard()}</p>--%>
<%--                        <a href="#" class="btn btn-primary">Go somewhere</a>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--            <div class="col-6">--%>
<%--                <div class="card text-center mb-3 " style="width: 18rem;">--%>
<%--                    <div class="card-body">--%>
<%--                        <h5 class="card-title"><b>어제 작성된 글</b></h5>--%>
<%--                        <p class="card-text">${dateCountDTO.getYCreatedBoard()}</p>--%>
<%--                        <a href="#" class="btn btn-primary">Go somewhere</a>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--        <div class="row">--%>
<%--            <div class="col">--%>
<%--                <div class="card text-center mb-3" style="width: 18rem;">--%>
<%--                    <div class="card-body">--%>
<%--                        <h5 class="card-title"><b>오늘 작성된 댓글</b></h5>--%>
<%--                        <p class="card-text">${dateCountDTO.getTCreatedComment()}</p>--%>
<%--                        <a href="#" class="btn btn-primary">Go somewhere</a>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--            <div class="col-6">--%>
<%--                <div class="card text-center mb-3 " style="width: 18rem;">--%>
<%--                    <div class="card-body">--%>
<%--                        <h5 class="card-title"><b>어제 작성된 댓글</b></h5>--%>
<%--                        <p class="card-text">${dateCountDTO.getYCreatedComment()}</p>--%>
<%--                        <a href="#" class="btn btn-primary">Go somewhere</a>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>
</main>
</div>
</div>
<%@ include file="/WEB-INF/view/admin/mainFooter.jsp" %>
