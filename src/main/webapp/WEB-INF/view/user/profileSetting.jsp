<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/view/layout/header.jsp" %>
<link rel="stylesheet" href="/css/profile.css">
<script src="/js/profile-setting.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<div class="container light-style flex-grow-1 container-p-y">


    <div class="card overflow-hidden">
        <div class="row no-gutters row-bordered row-border-light">
            <div class="col-md-3 pt-0">
                <div class="list-group list-group-flush account-settings-links">
                    <a class="list-group-item list-group-item-action active" data-toggle="list" href="#account-general">이미지
                        및 닉네임 변경</a>
                    <a class="list-group-item list-group-item-action" data-toggle="list"
                       href="#account-change-password">비밀번호 변경</a>
                    <a class="list-group-item list-group-item-action" data-toggle="list" href="#account-info">소개글 변경</a>
                    <a class="list-group-item list-group-item-action" data-toggle="list" href="#account-category">카테고리 관리</a>
                    <a class="list-group-item list-group-item-action" data-toggle="list" href="#account-connections">회원 탈퇴</a>

                </div>
            </div>
            <div class="col-md-9">
                <div class="tab-content">
                	<!-- 이미지 및 닉네임 변경 시작 -->
                    <div class="tab-pane fade active show" id="account-general">

                        <div class="card-body media align-items-center">


                            <c:choose>
                                <c:when test="${profile.imgThumbnail==null}">

                                    <img src="/img/default-profile" alt=""
                                         class="d-block ui-w-80" id="image-preview">
                                </c:when>
                                <c:otherwise>
                                    <img src="${profile.imgThumbnail}" alt=""
                                         class="d-block ui-w-80" id="image-preview">
                                </c:otherwise>
                            </c:choose>


                            <div class="media-body ml-4">
                                <label class="btn btn-outline-primary">
                                    Upload new photo
                                    <input type="file" class="account-settings-fileinput" id="image-input">
                                </label> &nbsp;
                                <button type="button" class="btn btn-default md-btn-flat"
                                        id="uploadBtn">이미지 등록
                                </button>

                                <div class="text-light small mt-1">jpg 또는 png 파일만 가능합니다 파일의 최대 크기는 800K</div>
                            </div>
                        </div>
                        <hr class="border-light m-0">

                        <div class="card-body">
                            <div class="form-group">
                                <label class="form-label">닉네임</label>
                                <input type="text" class="form-control mb-1" value="${profile.userNickname}"
                                       readonly
                                       id="nickname">
                                <button class="btn btn-outline-primary" id="nick-change">닉네임 변경</button>
                                <button class="btn btn-outline-success" id="nick-done" hidden>변경</button>
                                <button class="btn btn-outline-secondary" id="nick-cancel" hidden>취소</button>
                                <input type="reset" value="테스트">
                            </div>
                            <div class="form-group">
                                <label class="form-label">등록된 이메일</label>
                                <input type="text" class="form-control mb-1" value="${profile.userEmail}" readonly>
                            </div>
                        </div>

                    </div>
                	<!-- 이미지 및 닉네임 변경 끝 -->
                	
                	<!-- 비밀번호 변경 시작 -->
                    <div class="tab-pane fade" id="account-change-password">
                        <div class="card-body pb-2">

                            <div class="form-group">
                                <label class="form-label">비밀번호 입력</label>
                                <input type="password" class="form-control" id="original-pw" placeholder="기존 비밀번호">
                            </div>

                            <div class="form-group">
                                <label class="form-label">새로운 비밀번호 입력</label>
                                <input type="password" class="form-control" id="new-pw"
                                       placeholder="비밀번호는 4~16글자만 가능합니다.">
                            </div>

                            <div class="form-group">
                                <label class="form-label">비밀번호 재확인</label>
                                <input type="password" class="form-control" id="new-pw2" placeholder="비밀번호 재확인">
                                <br>
                                <button class="btn btn-outline-primary" id="pw-change">비밀번호 변경</button>
                            </div>

                        </div>
                    </div>
                	<!-- 비밀번호 변경 끝 -->
                	
                	<!-- 소개글 변경 시작 -->
                    <div class="tab-pane fade" id="account-info">
                        <div class="card-body pb-2">

                            <div class="form-group">
                                <label class="form-label">블로그 제목</label>
                                <input type="text" class="form-control" id="title" value=
                                        "${profile.profileTitle == null ? "":profile.profileTitle}">
                            </div>
                            <div class="form-group">
                                <label class="form-label">소개글</label>
                                <textarea class="form-control" rows="5" id="info">
                                    ${profile.profileContent == null ? "":profile.profileContent}
                                </textarea>
                            </div>
                            <button class="btn btn-outline-primary" id="save-info-title">비밀번호 변경</button>
                        </div>
                    </div>
                	<!-- 소개글 변경 끝 -->
                    
                	<!-- 카테고리 관리 시작 -->
                    <div class="tab-pane fade" id="account-category">
                        <div class="card-body pb-2">
	                        <h5 class="mb-3 py-3">카테고리 추가</h5>
					        <div class="row">
					        	<div class="col-12">
					            	<button type="button" id="category_add" class="btn btn-outline-secondary btn-sm">추가</button>
					        	</div>
					        	<!-- 카테고리 리스트 -->
					            <div class="col-md-6">
									<ul class="list-group" id="category_list">
										<c:forEach var="category" items="${categoryList}">
						                	<li class="list-group-item card category-item" id="category_item" onclick="category_item(this)" style="border-top-width: 1px">
						                		<span id="category_name">${category.categoryName}</span>
						                		<input type="hidden" id="category_id" value="${category.id}">
						                		<input type="hidden" id="category_state" value="R">

						                		<span class="float-right" id="category_delete_span">
						                			<span id="category_state_text"></span>
							                		<button type="button" class="btn btn-outline-danger btn-sm" onclick="category_delete(this)" id="category_delete_btn" value="N">삭제</button>
						                		</span>
						                	</li>
										</c:forEach>
					                </ul>
					            </div>
					            
					            <!-- 카테고리 item 수정 -->
					            <div class="col-md-6">
					            	<div class="card">
					            		<form>
											<div class="row form-group category-value" style="padding-top: 20px">
												<div class="col-md-3 text-right"><label class="form-label">이름</label></div>
												<div class="col-md-5">
													<input type="hidden" id="category_update_idx" value="">	
													<input type="text" id="category_update_name" class="form-control mb-2">
												</div>
												<div class="col-md-4">
													<button type="submit" id="category_update_save" class="btn btn-outline-primary">저장</button>
												</div>
											</div>
					            		</form>
					            	</div>
					            	<br>
							        <button type="button" class="btn btn-outline-primary" id="category_list_save">저장</button>
					            </div>
					        </div>
                        </div>
                    </div>
                	<!-- 카테고리 관리 끝 -->
                    
                	<!-- 회원탈퇴 시작 -->
                    <div class="tab-pane fade" id="account-connections">

                        <h5 class="mb-3 py-3">
                            회원 탈퇴
                        </h5>

                        <div class="form-group">
                            <label class="form-label">비밀번호 입력</label>
                            <input type="password" class="form-control" id="resign-pwd" placeholder="비밀번호 재확인">
                            <br>
                        </div>

                        <button type="button" class="btn btn-danger mb-3" id="resign-btn">회원탈퇴</button>
                    </div>
                	<!-- 회원탈퇴 끝 -->
                </div>
            </div>
        </div>
    </div>

    <%--    <div class="text-right mt-3">--%>
    <%--        <button type="button" class="btn btn-primary">저장</button>&nbsp;--%>
    <%--        <button type="button" class="btn btn-default" onclick="history.back()">취소</button>--%>
    <%--    </div>--%>

</div>
<%@ include file="/WEB-INF/view/layout/footer.jsp" %>
