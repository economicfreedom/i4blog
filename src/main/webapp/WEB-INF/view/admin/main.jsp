<%@ page contentType="text/html; charset=UTF-8" language="java" %>

<script src="/cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>


<%@include file="/WEB-INF/view/admin/mainHeader.jsp" %>
<main class="col-9 py-md-3 pl-md-5 bd-content" role="main">
    <div class="container">
        <div class="row">
            <div class="col">
                <div class="card text-center mb-3" style="width: 18rem;">
                    <div class="card-body">
                        <h5 class="card-title"><b>오늘 가입한 회원</b></h5>
                        <p class="card-text">${dateCountDTO.getYJoinedUser()}</p>
                        <a href="#" class="btn btn-primary">Go somewhere</a>
                    </div>
                </div>
            </div>
            <div class="col-6">
                <div class="card text-center mb-3 " style="width: 18rem;">
                    <div class="card-body">
                        <h5 class="card-title"><b>어제 가입한 회원</b></h5>
                        <p class="card-text">${dateCountDTO.getYJoinedUser()}</p>
                        <a href="#" class="btn btn-primary">Go somewhere</a>
                    </div>
                </div>
            </div>
        </div>
                <div class="row">
            <div class="col">
                <div class="card text-center mb-3" style="width: 18rem;">
                    <div class="card-body">
                        <h5 class="card-title"><b>오늘 작성된 글</b></h5>
                        <p class="card-text">${dateCountDTO.getTCreatedBoard()}</p>
                        <a href="#" class="btn btn-primary">Go somewhere</a>
                    </div>
                </div>
            </div>
            <div class="col-6">
                <div class="card text-center mb-3 " style="width: 18rem;">
                    <div class="card-body">
                        <h5 class="card-title"><b>어제 작성된 글</b></h5>
                        <p class="card-text">${dateCountDTO.getYCreatedBoard()}</p>
                        <a href="#" class="btn btn-primary">Go somewhere</a>
                    </div>
                </div>
            </div>
        </div>
                <div class="row">
            <div class="col">
                <div class="card text-center mb-3" style="width: 18rem;">
                    <div class="card-body">
                        <h5 class="card-title"><b>오늘 작성된 댓글</b></h5>
                        <p class="card-text">${dateCountDTO.getTCreatedComment()}</p>
                        <a href="#" class="btn btn-primary">Go somewhere</a>
                    </div>
                </div>
            </div>
            <div class="col-6">
                <div class="card text-center mb-3 " style="width: 18rem;">
                    <div class="card-body">
                        <h5 class="card-title"><b>어제 작성된 댓글</b></h5>
                        <p class="card-text">${dateCountDTO.getYCreatedComment()}</p>
                        <a href="#" class="btn btn-primary">Go somewhere</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</main>
</div>
</div>
<%@ include file="/WEB-INF/view/admin/mainFooter.jsp" %>
