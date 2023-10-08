<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/view/layout/header.jsp" %>
<link rel="stylesheet" href="/css/profile.css">
<script src="/js/profile-setting.js"></script>
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
                    <a class="list-group-item list-group-item-action" data-toggle="list" href="#account-connections">회원 탈퇴</a>

                </div>
            </div>
            <div class="col-md-9">
                <div class="tab-content">
                    <div class="tab-pane fade active show" id="account-general">

                        <div class="card-body media align-items-center">


                            <c:choose>
                                <c:when test="${profile.imgThumbnail==null}">

                                    <img src="https://bootdey.com/img/Content/avatar/avatar1.png" alt=""
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
                    <div class="tab-pane fade" id="account-social-links">
                        <div class="card-body pb-2">

                            <div class="form-group">
                                <label class="form-label">Twitter</label>
                                <input type="text" class="form-control" value="https://twitter.com/user">
                            </div>
                            <div class="form-group">
                                <label class="form-label">Facebook</label>
                                <input type="text" class="form-control" value="https://www.facebook.com/user">
                            </div>
                            <div class="form-group">
                                <label class="form-label">Google+</label>
                                <input type="text" class="form-control" value="">
                            </div>
                            <div class="form-group">
                                <label class="form-label">LinkedIn</label>
                                <input type="text" class="form-control" value="">
                            </div>
                            <div class="form-group">
                                <label class="form-label">Instagram</label>
                                <input type="text" class="form-control" value="https://www.instagram.com/user">
                            </div>

                        </div>
                    </div>
                    <div class="tab-pane fade" id="account-connections">

                        <h5 class="mb-3 py-3">
                            회원 탈퇴
                        </h5>

                        <div class="form-group">
                            <label class="form-label">비밀번호 입력</label>
                            <input type="password" class="form-control" id="resign-pwd" placeholder="비밀번호 재확인">
                            <br>

                        </div>

                        <button type="button" class="btn btn-danger mb-3" id="resign-btn">회원탈퇴
                        </button>


                    </div>
                    <div class="tab-pane fade" id="account-notifications">
                        <div class="card-body pb-2">

                            <h6 class="mb-4">Activity</h6>

                            <div class="form-group">
                                <label class="switcher">
                                    <input type="checkbox" class="switcher-input" checked="">
                                    <span class="switcher-indicator">
                      <span class="switcher-yes"></span>
                      <span class="switcher-no"></span>
                    </span>
                                    <span class="switcher-label">Email me when someone comments on my article</span>
                                </label>
                            </div>
                            <div class="form-group">
                                <label class="switcher">
                                    <input type="checkbox" class="switcher-input" checked="">
                                    <span class="switcher-indicator">
                      <span class="switcher-yes"></span>
                      <span class="switcher-no"></span>
                    </span>
                                    <span class="switcher-label">Email me when someone answers on my forum thread</span>
                                </label>
                            </div>
                            <div class="form-group">
                                <label class="switcher">
                                    <input type="checkbox" class="switcher-input">
                                    <span class="switcher-indicator">
                      <span class="switcher-yes"></span>
                      <span class="switcher-no"></span>
                    </span>
                                    <span class="switcher-label">Email me when someone follows me</span>
                                </label>
                            </div>
                        </div>
                        <hr class="border-light m-0">
                        <div class="card-body pb-2">

                            <h6 class="mb-4">Application</h6>

                            <div class="form-group">
                                <label class="switcher">
                                    <input type="checkbox" class="switcher-input" checked="">
                                    <span class="switcher-indicator">
                      <span class="switcher-yes"></span>
                      <span class="switcher-no"></span>
                    </span>
                                    <span class="switcher-label">News and announcements</span>
                                </label>
                            </div>
                            <div class="form-group">
                                <label class="switcher">
                                    <input type="checkbox" class="switcher-input">
                                    <span class="switcher-indicator">
                      <span class="switcher-yes"></span>
                      <span class="switcher-no"></span>
                    </span>
                                    <span class="switcher-label">Weekly product updates</span>
                                </label>
                            </div>
                            <div class="form-group">
                                <label class="switcher">
                                    <input type="checkbox" class="switcher-input" checked="">
                                    <span class="switcher-indicator">
                      <span class="switcher-yes"></span>
                      <span class="switcher-no"></span>
                    </span>
                                    <span class="switcher-label">Weekly blog digest</span>
                                </label>
                            </div>

                        </div>
                    </div>
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
