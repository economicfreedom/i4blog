<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/view/layout/header.jsp" %>
<script src="/js/category-config.js"></script>
<style>
    .category-list {
        list-style: none;
        width: 150px;
        height: 25px;
        font-size: 16px;
        margin: 5px;
        padding-left: 3px;
    }
    
    .category-config {
        margin: 10px;
    }
</style>
<script>
</script>
<div class="container light-style flex-grow-1 container-p-y">

    <h4 class="font-weight-bold py-3 mb-4">
        카테고리 설정
    </h4>

    <div class="overflow-hidden">
        <div class="row no-gutters row-bordered row-border-light">
            <div class="col-md-4">
				<ul id="category">
					<c:forEach var="category" items="${categoryList}">
	                	<li class="ui-state-default category-list" value="${category.id}">
	                		${category.categoryName}
						</li>
					</c:forEach>
                </ul>
            </div>
            <div class="col-md-8 card">
				<div class="form-group category-config">
					<label class="form-label">카테고리 이름</label>
					<input type="text" class="form-control mb-1">
				</div>
            </div>
        </div>
    </div>

    <div class="text-right mb-3">
        <button type="button" class="btn btn-primary" onclick="categoryListSave()">저장</button>&nbsp;
        <button type="button" class="btn btn-default" onclick="history.back()">취소</button>
    </div>

</div>


<%@ include file="/WEB-INF/view/layout/footer.jsp" %>
