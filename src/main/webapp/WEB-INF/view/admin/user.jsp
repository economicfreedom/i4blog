<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@include file="/WEB-INF/view/admin/mainHeader.jsp" %>
<script src="/js/admin-user.js"></script>
<main class="col-9 py-md-3 pl-md-5 bd-content" role="main">
    <div class="container">
        <div class="row-4">
            <div class="col mb-3">
                <h3>유저</h3>
            </div>
        </div>
        <div class="row-5">
            <form action="">
                <div class="search-wrap clearfix">
                    <div class="form-check-inline admin-user">
                        <label class="form-check-label">
                            <input type="radio" class="form-check-input" name="optradio"
                                   value="date" ${pageDTO.cri.orderBy == 'date' ? 'checked' : ''}><b>가입일자</b>
                        </label>
                    </div>
                    <div class="form-check-inline admin-user">
                        <label class="form-check-label">
                            <input type="radio" class="form-check-input" name="optradio"
                                   value="board-count" ${pageDTO.cri.orderBy == 'board-count' ? 'checked' : ''}><b>게시글
                            갯수</b>
                        </label>
                    </div>
                    <div class="form-check-inline admin-user">
                        <label class="form-check-label">
                            <input type="radio" class="form-check-input" name="optradio"
                                   value="comment-count" ${pageDTO.cri.orderBy == 'comment-count' ? 'checked' : ''}><b>댓글
                            갯수</b>
                        </label>
                    </div>

                    <div class="input-group mb-3">
                        <input type="text" class="form-control" value="${pageDTO.cri.keyword}" placeholder=""
                               aria-label="Username"
                               aria-describedby="basic-addon1"
                               id="user-search">
                        <div class="input-group-prepend" id="user-search-icon">
                            <span class="input-group-text" id="basic-addon1">🔍</span>
                        </div>
                    </div>

                </div>

            </form>
        </div>
        <div class="row-2">
            <table class="table note-icon-align-center">
                <thead>
                <tr>
                    <th scope="col">유저 번호</th>
                    <th scope="col">유저 닉네임</th>
                    <th scope="col">유저 이메일</th>
                    <th scope="col">작성한 게시글 수</th>
                    <th scope="col">작성한 댓글 수</th>
                    <th scope="col">가입일자</th>
                    <th scope="col">관리자 권한</th>
                </tr>
                </thead>
                <tbody>

                <c:forEach var="user" items="${userManages}">
                <tr>


                        <%--                    <td>${user.userId}</td>--%>

                        <%--                        <td><a href="/blog/${report.strUserId}//board/view/${report.boardId}">${report.boardTitle}</a>--%>
                        <%--                    </td>--%>
                    <td>${user.id}</td>
                    <td>${user.userNickname}</td>
                    <td>${user.userEmail}</td>
                    <td>${user.boardCount}</td>
                    <td>${user.commentCount}</td>
                    <th>${user.userCreatedAt}</th>


                    <td>
                        <button type="button" class="btn btn-outline-danger delete" onclick="role_up(${user.id})">
                            삭제
                        </button>
                    </td>


                    </c:forEach>
                </tr>
                </tbody>
            </table>


            <div class="cri">
                <form action="<c:url value='/admin/user' />" name="page-form">
                    <div class="text-center clearfix">
                        <ul class="pagination" id="pagination">
                            <c:if test="${pageDTO.prev}">
                                <li class="page-item "><a class="page-link" href="#"
                                                          data-page-num="${pageDTO.beginPage-1}">Prev</a>
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
                                                         data-page-num="${pageDTO.endPage+1}">Next</a></li>
                            </c:if>
                        </ul>

                        <!-- 페이지 관련 버튼을 클릭 시 같이 숨겨서 보낼 값 -->
                        <input type="hidden" name="page-num" value="${pageDTO.cri.pageNum}">
                        <input type="hidden" name="count-per-page" value="${pageDTO.cri.countPerPage}">
                        <input type="hidden" name="keyword" value="${pageDTO.cri.keyword}">
                        <input type="hidden" name="type" value="${pageDTO.cri.type}">
                        <input type="hidden" name="order-by" value="${pageDTO.cri.orderBy}">

                    </div>
                </form>
            </div>

        </div>
    </div>
</main>
<%@ include file="/WEB-INF/view/admin/mainFooter.jsp" %>

