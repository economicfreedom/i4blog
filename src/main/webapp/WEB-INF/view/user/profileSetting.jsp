<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/view/layout/header.jsp" %>
<link rel="stylesheet" href="/css/profile.css">
<script>


    $(document).ready(function () {

        console.log($('#nickname').css('border-color'));

        function remove_nick_check() {
            $("#nick-check-succeed").remove();
            $("#nick-check-failed").remove();
            $("#nick-br").remove();
            $("#nickname").css('border-color', 'rgb(206, 212, 218)');
        }


        const width = 80;
        const height = 80;
        const original_nickname = $("#nickname").val();
        let timeout;


        console.log(original_nickname);
        $("#image-input").change(function () {
            console.log("동작함");
            readURL(this);

        })
        $("#nick-change").click(function () {
            $("#nick-done").removeAttr("hidden");
            $("#nick-cancel").removeAttr("hidden");
            $("#nick-change").attr("hidden", true);
            $("#nickname").removeAttr("readonly");
            remove_nick_check();

        });

        $("#nick-cancel").click(function () {

            $("#nick-done").attr("hidden", true);
            $("#nick-cancel").attr("hidden", true);
            $("#nick-change").removeAttr("hidden");
            $("#nickname").attr("readonly", true);
            $("#nickname").val(original_nickname);
            remove_nick_check();
        });
        $("#nick-done").click(function () {
            const nickname = $("#nickname").val();
            $.ajax({

                url: "/user/saveProfile",
                type: "post",
                contentType: "application/json",
                data: JSON.stringify({
                    nickname: nickname
                }),
                success: function () {
                    alert("성공")
                    $("#nick-done").attr("hidden", true);
                    $("#nick-cancel").attr("hidden", true);
                    $("#nick-change").removeAttr("hidden");
                    $("#nickname").attr("readonly", true);
                    remove_nick_check();

                },
                error: function () {
                    alert("실패")
                    location.reload();
                    remove_nick_check();

                }

            })
        })


        $("#nickname").on('keyup', function () {

            if ($('#nickname').prop('readonly')) {
                return;
            }

            clearTimeout(timeout);
            let nick_succeed = '<br id="nick-br">' + '<small id="nick-check-succeed" style="color: skyblue">성공</small>'
            let nick_failed = '<br id="nick-br">' + '<small id="nick-check-failed" style="color: red">실패</small>'
            timeout = setTimeout(function () {
                let nickname = $("#nickname").val();
                let formData = new FormData();
                formData.append("nickname", nickname);
                $.ajax({
                    url: "/user/nick-check?&nickname="+nickname,
                    type: "get",
                    success: function () {
                        remove_nick_check();
                        $("#nickname")
                            .css("border-color", "skyblue")
                            .before(nick_succeed)
                            .focus();

                    },
                    error: function () {
                        remove_nick_check();
                        $("#nickname")
                            .css("border-color", "red")
                            .before(nick_failed)
                            .focus();


                    }
                })

            }, 200);
        });


        function readURL(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();

                reader.onload = function (e) {
                    $('#image-preview').attr('src', e.target.result)
                        .css('height', height + 'px')
                        .css('width', width + 'px')
                }

                reader.readAsDataURL(input.files[0]); // convert to base64 string
            }
        }
    })
    ;

</script>
<div class="container light-style flex-grow-1 container-p-y">


    <div class="card overflow-hidden">
        <div class="row no-gutters row-bordered row-border-light">
            <div class="col-md-3 pt-0">
                <div class="list-group list-group-flush account-settings-links">
                    <a class="list-group-item list-group-item-action active" data-toggle="list" href="#account-general">General</a>
                    <a class="list-group-item list-group-item-action" data-toggle="list"
                       href="#account-change-password">Change password</a>
                    <a class="list-group-item list-group-item-action" data-toggle="list" href="#account-info">Info</a>
                    <a class="list-group-item list-group-item-action" data-toggle="list" href="#account-connections">Connections</a>
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
                                <button type="button" class="btn btn-default md-btn-flat">Reset</button>

                                <div class="text-light small mt-1">Allowed JPG, GIF or PNG. Max size of 800K</div>
                            </div>
                        </div>
                        <hr class="border-light m-0">

                        <div class="card-body">
                            <div class="form-group">
                                <label class="form-label">닉네임</label>

                                <input type="text" class="form-control mb-1" value="${profile.profileContent}" readonly
                                       id="nickname">
                                <button class="btn btn-outline-primary" id="nick-change">닉네임 변경</button>
                                <button class="btn btn-outline-success" id="nick-done" hidden>변경</button>
                                <button class="btn btn-outline-secondary" id="nick-cancel" hidden>취소</button>
                                <input type="reset" value="테스트">
                            </div>
                            <div class="form-group">
                                <label class="form-label">등록된 이메일</label>
                                <input type="text" class="form-control mb-1" value="nmaxwell@mail.com" readonly>
                            </div>
                        </div>

                    </div>
                    <div class="tab-pane fade" id="account-change-password">
                        <div class="card-body pb-2">

                            <div class="form-group">
                                <label class="form-label">Current password</label>
                                <input type="password" class="form-control">
                            </div>

                            <div class="form-group">
                                <label class="form-label">New password</label>
                                <input type="password" class="form-control">
                            </div>

                            <div class="form-group">
                                <label class="form-label">Repeat new password</label>
                                <input type="password" class="form-control">
                            </div>

                        </div>
                    </div>
                    <div class="tab-pane fade" id="account-info">
                        <div class="card-body pb-2">

                            <div class="form-group">
                                <label class="form-label">Bio</label>
                                <textarea class="form-control" rows="5">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris nunc arcu, dignissim sit amet sollicitudin iaculis, vehicula id urna. Sed luctus urna nunc. Donec fermentum, magna sit amet rutrum pretium, turpis dolor molestie diam, ut lacinia diam risus eleifend sapien. Curabitur ac nibh nulla. Maecenas nec augue placerat, viverra tellus non, pulvinar risus.</textarea>
                            </div>
                            <div class="form-group">
                                <label class="form-label">Birthday</label>
                                <input type="text" class="form-control" value="May 3, 1995">
                            </div>
                            <div class="form-group">
                                <label class="form-label">Country</label>
                                <select class="custom-select">
                                    <option>USA</option>
                                    <option selected="">Canada</option>
                                    <option>UK</option>
                                    <option>Germany</option>
                                    <option>France</option>
                                </select>
                            </div>


                        </div>
                        <hr class="border-light m-0">
                        <div class="card-body pb-2">

                            <h6 class="mb-4">Contacts</h6>
                            <div class="form-group">
                                <label class="form-label">Phone</label>
                                <input type="text" class="form-control" value="+0 (123) 456 7891">
                            </div>
                            <div class="form-group">
                                <label class="form-label">Website</label>
                                <input type="text" class="form-control" value="">
                            </div>

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
                        <div class="card-body">
                            <button type="button" class="btn btn-twitter">Connect to <strong>Twitter</strong></button>
                        </div>
                        <hr class="border-light m-0">
                        <div class="card-body">
                            <h5 class="mb-2">
                                <a href="javascript:void(0)" class="float-right text-muted text-tiny"><i
                                        class="ion ion-md-close"></i> Remove</a>
                                <i class="ion ion-logo-google text-google"></i>
                                You are connected to Google:
                            </h5>
                            nmaxwell@mail.com
                        </div>
                        <hr class="border-light m-0">
                        <div class="card-body">
                            <button type="button" class="btn btn-facebook">Connect to <strong>Facebook</strong></button>
                        </div>
                        <hr class="border-light m-0">
                        <div class="card-body">
                            <button type="button" class="btn btn-instagram">Connect to <strong>Instagram</strong>
                            </button>
                        </div>
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

    <div class="text-right mt-3">
        <button type="button" class="btn btn-primary">저장</button>&nbsp;
        <button type="button" class="btn btn-default" onclick="history.back()">취소</button>
    </div>

</div>
<%@ include file="/WEB-INF/view/layout/footer.jsp" %>
