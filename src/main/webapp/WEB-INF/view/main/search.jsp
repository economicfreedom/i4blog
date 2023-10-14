<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/view/layout/header.jsp" %>
<script src="/js/search.js">

</script>
<style>
    a {

    }
</style>


<div class="container">
    <div>
        <span class="h4">${pageDTO.cri.keyword}</span> <span class="h4" style="color: red">(${pageDTO.articleTotalCount})</span>
        <hr style="border: solid 1px black;">
        <c:forEach var="result" items="${results}">

            <ul style="list-style-type: none; padding: 0;">
                <li style="display: flex; align-items: center;">
                    <c:choose>

                        <c:when test="${result.imgPath ==null}">
                            <c:if test="${typeIsTitleOrContent}">
                                <img src="/img/default-boarder.png" alt="" style="margin-right: 10px;">
                            </c:if>
                            <c:if test="${!typeIsTitleOrContent}">
                                <img src="/img/default-profile.png" alt="" style="margin-right: 10px;">
                            </c:if>
                        </c:when>
                        <c:otherwise>
                            <img src="${result.imgPath}" alt="" style="margin-right: 10px;">
                        </c:otherwise>
                    </c:choose>
                    <div>
                        <h3>${result.title}</h3>
                        <small>${result.info}</small>
                        <br>
                        <small style="margin-top: 500px; margin-bottom: 0px; color: gray">${result.createdAt}</small>
                    </div>
                </li>
            </ul>
            <hr>
        </c:forEach>
    </div>
    <!-- 페이징 -->
    <div class="cri">
        <form action="<c:url value='/search' />" name="page-form">
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
                <%--                        <input type="hidden" name="order-by" value="${pageDTO.cri.orderBy}">--%>

            </div>
        </form>
    </div>
</div>
<%@ include file="/WEB-INF/view/layout/footer.jsp" %>
