<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@include file="/WEB-INF/view/admin/mainHeader.jsp" %>
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
                    <div class="form-check-inline">
                        <label class="form-check-label">
                            <input type="radio" class="form-check-input" name="optradio"
                                   value="date" ${pageDTO.cri.orderBy == 'date' ? 'checked' : ''}><b>가입일자</b>
                        </label>
                    </div>
                    <div class="form-check-inline">
                        <label class="form-check-label">
                            <input type="radio" class="form-check-input" name="optradio"
                                   value="count" ${pageDTO.cri.orderBy == 'board-count' ? 'checked' : ''}><b>게시글 갯수</b>
                        </label>
                    </div>
                    <div class="form-check-inline">
                        <label class="form-check-label">
                            <input type="radio" class="form-check-input" name="optradio"
                                   value="count" ${pageDTO.cri.orderBy == 'comment-count' ? 'checked' : ''}><b>댓글 갯수</b>
                        </label>
                    </div>

                    <div class="input-group mb-3">
                        <div class="input-group-prepend">
                            <span class="input-group-text" id="basic-addon1">@</span>
                        </div>
                        <input type="text" class="form-control" placeholder="" aria-label="Username"
                               aria-describedby="basic-addon1">
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

                <%--                <c:forEach var="report" items="${reportList}">--%>
                <tr>

                    <th scope="row">유저 아이디</th>


                    <%--                        <td><a href="/blog/${report.strUserId}//board/view/${report.boardId}">${report.boardTitle}</a>--%>
<%--                    </td>--%>
                    <td>테스트1</td>
                    <td>2</td>
                    <td>3</td>
                    <td>4</td>
                    <td>5</td>
                    <%--                        <c:choose>--%>
                    <%--                            <c:when test="${report.state == '존재하는 게시글'||report.state == '존재하는 댓글'}">--%>
                    <%--                                <td>--%>
                    <%--                                    <button type="button" class="btn btn-outline-danger delete"--%>
                    <%--                                            value="${report.reportType == '게시글' ? report.boardId : report.commentId}">--%>
                    <%--                                        삭제--%>
                    <%--                                    </button>--%>
                    <%--                                </td>--%>
                    <%--                            </c:when>--%>
                    <%--                            <c:otherwise>--%>

                    <%--                            </c:otherwise>--%>
                    <%--                        </c:choose>--%>
                    <%--                    </tr>--%>
                    <%--                </c:forEach>--%>
                    <td>
                        <button>테스트</button>
                    </td>
                </tr>
                </tbody>
            </table>

        </div>
    </div>
</main>
<%@ include file="/WEB-INF/view/admin/mainFooter.jsp" %>

