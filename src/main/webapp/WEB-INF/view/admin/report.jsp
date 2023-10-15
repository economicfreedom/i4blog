<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@include file="/WEB-INF/view/admin/mainHeader.jsp" %>

<main class="col-9 py-md-3 pl-md-5 bd-content" role="main">
    <div class="container">

        <!-- 헤더: 오늘 신고된 글의 수 -->
        <div class="row-4">
            <div class="col mb-3">
                <h3>신고된
                    <c:choose>
                        <c:when test="${pageDTO.cri.type == 'board'}">
                            글
                        </c:when>
                        <c:otherwise>
                            댓글
                        </c:otherwise>
                    </c:choose>
                    ${pageDTO.articleTotalCount}개</h3>
            </div>
        </div>

        <!-- 검색 폼 -->
        <div class="row-5">
            <form action="">
                <div class="search-wrap clearfix">
                    <div class="form-check-inline">
                        <label class="form-check-label">
                            <input type="radio" class="form-check-input" name="optradio"
                                   value="date" ${pageDTO.cri.orderBy == 'date' ? 'checked' : ''}><b>최신순</b>
                        </label>
                    </div>
                    <div class="form-check-inline">
                        <label class="form-check-label">
                            <input type="radio" class="form-check-input" name="optradio"
                                   value="count" ${pageDTO.cri.orderBy == 'count' ? 'checked' : ''}><b>누적순</b>
                        </label>
                    </div>
                    <select class="form-control" name="type">
                        <option value="board" ${pageDTO.cri.type == 'board' ? 'selected' : ''}>게시글</option>
                        <option value="comment" ${pageDTO.cri.type == 'comment' ? 'selected' : ''}>댓글</option>
                    </select>
                    <%--                                        <div class="form-check form-check-inline">--%>
                    <%--                                            <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio1"--%>
                    <%--                                                   value="board" ${pageDTO.cri.type == 'freeboard_title' ? 'selected' : ''}>--%>
                    <%--                                            <label class="form-check-label" for="inlineRadio1">게시글</label>--%>
                    <%--                                        </div>--%>
                    <%--                    <div class="form-check form-check-inline">--%>
                    <%--                        <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio2"--%>
                    <%--                               value="comment" ${pageDTO.cri.type == 'freeboard_content' ? 'selected' : ''}>--%>
                    <%--                        <label class="form-check-label" for="inlineRadio2">댓글</label>--%>

                    <%--                    </div>--%>


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
                    <th scope="col">유형</th>
                    <th scope="col">상태</th>
                    <th scope="col">누적 횟수</th>


                </tr>
                </thead>
                <tbody>

                <c:forEach var="report" items="${reportList}">
                    <tr>

                        <th scope="row">${report.id}</th>

                        <td><a href="/blog/${report.strUserId}//board/view/${report.boardId}">${report.boardTitle}</a></td>
                        <td>${report.userId}</td>
                        <td>${report.reportContent}</td>
                        <td>${report.reportType}</td>
                        <td>${report.state}</td>
                        <td>${report.count}</td>
                        <c:choose>
                            <c:when test="${report.state == '존재하는 게시글'||report.state == '존재하는 댓글'}">
                                <td>
                                    <button type="button" class="btn btn-outline-danger delete"
                                            value="${report.reportType == '게시글' ? report.boardId : report.commentId}">
                                        삭제
                                    </button>
                                </td>
                            </c:when>
                            <c:otherwise>

                            </c:otherwise>
                        </c:choose>
                    </tr>
                </c:forEach>
                </tbody>
            </table>

            <!-- 페이징 -->
            <div class="cri">
                <form action="<c:url value='/admin/report' />" name="page-form">
                    <div class="text-center clearfix">
                        <ul class="pagination" id="pagination">
                            <c:if test="${pageDTO.prev}">
                                <li class="page-item "><a class="page-link" href="#"
                                                          data-page-num="${pageDTO.beginPage-1}">이전</a>
                                </li>
                            </c:if>

                            <c:forEach var="num" begin="${pageDTO.beginPage}" end="${pageDTO.endPage}">
                                <li class="${pageDTO.cri.pageNum == num ? 'age-item active' : ''}" page-item>
                                    <a class="page-link" href="#" data-page-num="${num}"
                                       style="${pageDTO.cri.pageNum == num ? 'background-color:#e0ecef' : ''}">${num}</a>
                                </li>
                            </c:forEach>

                            <c:if test="${pageDTO.next}">
                                <li class="page-item"><a class="page-link" href="#"
                                                         data-page-num="${pageDTO.endPage+1}">다음</a></li>
                            </c:if>
                        </ul>

                        <!-- 페이지 관련 버튼을 클릭 시 같이 숨겨서 보낼 값 -->
                        <input type="hidden" name="page-num" value="${pageDTO.cri.pageNum}">
                        <input type="hidden" name="countPerPage" value="${pageDTO.cri.countPerPage}">
                        <input type="hidden" name="keyword" value="${pageDTO.cri.keyword}">
                        <input type="hidden" name="type" value="${pageDTO.cri.type}">
                        <input type="hidden" name="order-by" value="${pageDTO.cri.orderBy}">

                    </div>
                </form>
            </div>
        </div>
    </div>
</main>


</main>


<script src="/js/admin-report.js"></script>
</div>
</div>
<%@ include file="/WEB-INF/view/admin/mainFooter.jsp" %>