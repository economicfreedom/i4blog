<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<%@include file="/WEB-INF/view/admin/mainHeader.jsp" %>
<main class="col-9 py-md-3 pl-md-5 bd-content" role="main">
    <div class="container">
        <div class="row-4">
            <div class="col mb-3">
                <h3>오늘 신고된 글 00개</h3>

            </div>
        </div>

        <div class="row-2">

            <table class="table note-icon-align-center">
                <thead>
                <tr>
                    <th scope="col">#</th>
                    <th scope="col">글 제목</th>
                    <th scope="col">신고자</th>
                    <th scope="col">신고내용</th>
                    <th scope="col">누적 횟수</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <th scope="row">1</th>
                    <td>Mark</td>
                    <td>Otto</td>
                    <td>@mdo</td>
                    <td>@mdo</td>
                </tr>
                <tr>
                    <th scope="row">2</th>
                    <td>Jacob</td>
                    <td>Thornton</td>
                    <td>@fat</td>
                    <td>@fat</td>
                </tr>
                <tr>
                    <th scope="row">3</th>
                    <td colspan="2">Larry the Bird</td>
                    <td>@twitter</td>
                    <td>@twitter</td>
                </tr>
                </tbody>
            </table>
            <nav aria-label="Page navigation example">
                <ul class="pagination">
                    <li class="page-item"><a class="page-link" href="#">Previous</a></li>
                    <li class="page-item"><a class="page-link" href="#">1</a></li>
                    <li class="page-item"><a class="page-link" href="#">2</a></li>
                    <li class="page-item"><a class="page-link" href="#">3</a></li>
                    <li class="page-item"><a class="page-link" href="#">Next</a></li>
                </ul>
            </nav>
        </div>
    </div>

</main>
</div>
</div>
<%@ include file="/WEB-INF/view/admin/mainFooter.jsp" %>
