<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@include file="/WEB-INF/view/admin/mainHeader.jsp" %>

<main class="col-9 py-md-3 pl-md-5 bd-content" role="main">
    <div class="container">

        <!-- 헤더: 오늘 신고된 글의 수 -->
        <div class="row-4">
            <div class="col mb-3">
                <h3>신고된 글 ${pageDTO.articleTotalCount}개</h3>
            </div>
        </div>

        <!-- 검색 폼 -->
        <div class="row-5">
            <form action="">
                <div class="search-wrap clearfix">
                    <select class="form-control" name="type">
                        <option value="board" ${pageDTO.cri.type == 'freeboard_title' ? 'selected' : ''}>게시글</option>
                        <option value="comment" ${pageDTO.cri.type == 'freeboard_content' ? 'selected' : ''}>댓글</option>
                    </select>
                </div>
            </form>
        </div>

        <!-- 게시글 목록 -->
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
                <c:forEach var="report" items="${reportList}">
                    <tr>

                        <th scope="row">${report.getUserId()}</th>
                        <td>dl tlqkf</td>
                        <td><a href="<c:url value=''/>">${report.boardTitle} dl tlqkf</a></td>
                        <td>${report.userId}</td>
                        <td>${report.reportContent}</td>
                        <td>${report.count}</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>

            <!-- 페이징 -->
            <nav aria-label="Page navigation example">
                <ul class="pagination">
                    <c:if test="${pageDTO.prev}">
                        <li class="page-item"><a class="page-link" href="#" data-pageNum="${pageDTO.beginPage-1}">Previous</a></li>
                    </c:if>

                    <c:forEach var="num" begin="${pageDTO.beginPage}" end="${pageDTO.endPage}">
                        <li class="${pageDTO.cri.pageNum == num ? 'page-item active' : ''}"><a class="page-link" href="#" data-pageNum="${num}">${num}</a></li>
                    </c:forEach>

                    <c:if test="${pageDTO.next}">
                        <li class="page-item"><a class="page-link" href="#" data-pageNum="${pageDTO.endPage+1}">Next</a></li>
                    </c:if>
                </ul>
            </nav>
        </div>

    </div>
</main>

<script>
    $(function() {
        $('#pagination').on('click', 'a', function(e) {
            e.preventDefault();
            const value = $(this).data('pagenum');
            document.pageForm.pageNum.value = value;
            document.pageForm.submit();
        });
    });
</script>

</div>
</div>
<%@ include file="/WEB-INF/view/admin/mainFooter.jsp" %>