<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<link href="https://fonts.googleapis.com/css2?family=Lato&display=swap" rel="stylesheet">
<link href="/css/comment.css" rel="stylesheet">


<script>
// 버튼 이벤트 (모든 버튼을 처리하는 이벤트)
$(document).ready(function() {
	
    // 생성 버튼 클릭 시 작성한 댓글을 저장하는 메소드 커낵트
    $('#comment-create-btn').on('click', function() {
       console.log('작성');
       // 작성한 댓글 생성하고 저장 
       let commentContent = $("#comment-content").val();
       if (commentContent === "") {
           alert("댓글을 작성해주세요");
       } else {
           commentCreate();
       }
   });
    
   <!-- 댓글 등록  ajax -->
function commentCreate(){
    
	console.log($("#comment-content").val())
    $.ajax({
        type: "post",
        url: "/comment/api/comment/list",       
        contentType: "application/json; charset=utf-8",
        data: JSON.stringify({
        	user_id: userId,
            board_id: 1, //$("#board_id").val()
        	comment_content: $("#comment-content").val(),
           	comment_public : 1, // 체크박스로 여부 변경 예정        	
        }),
    
        success: function(data){
        	        	
        	// 1. 컨트롤러에 보낼 데이터 확인. (맵핑)
        	// 2. 넘어간 데이터로 DB에 저장. 	(DB 저장 )
        	// 3. result = 0  -> 저장 실패, result = 1 -> 저장 성공
        	//    저장 성공이 확인 되면 댓글 화면에 추가 (아래의 html 작성)
        	//    댓글에 나오는 데이터들은 이미 화면 또는 세션에 있기 때문에 컨트롤러에서 데이터를 받아올 필요가 없다.
            let html = "";
			for(const i in data){
				let id = data[i].id;
			
				let comment = data[i].commentContent;
				
			
				if(data === "작성 성공") {
						html += '<li class="list-group-item">';
						html += '<div class="row">';
						html += '<div class="col-xs-2 col-md-1">';
						html += '<img src="http://placehold.it/80" class="img-square img-responsive" alt="" /></div>';
						html += '<div class="col-xs-10 col-md-11">';
						html += '<div>';
						html += '<a href="">';
						html += '${principal.userId}</a>';
						html += '<div class="mic-info">';
						html += 'By: <a href="#">Bhaumik Patel</a> on 2 Aug 2013';
						html += '</div>';
						html += '</div>';
						html +='<div class="comment-content">';
						html += $("#comment-content").val();
						html += '</div>';
						html += '<div class="action">'
						html += '<button type="button" id="comment-update-btn" class="btn btn-primary btn-xs" title="Update">';
						html += '<span class="glyphicon glyphicon-pencil">수정</span>';
						html += '</button>';                                  
						html += '<button type="button" id="comment-delete-btn" class="btn btn-danger btn-xs" title="Delete">';
						html += '<span class="glyphicon glyphicon-trash">삭제</span>';
						html += '</button>';
						html += '</div>';                                                             
						html += '</div>';
						html += '</div>';
						html += '</li>';
					// html 입력 완료
					$("#comment-list").append(html);
					$("#comment-content").val("");
				}
			}
        },

        error: function (request,status,error){
            alert("code:" + request.status + "\n" + "error" + error);
            alert("저장에 실패하였습니다");
            
        }
    });     
}

    
   // 수정 버튼 지정
   const updateBtns = document.querySelectorAll('#comment-update-btn');

   // 모든 수정 버튼 이벤트 등록
   updateBtns.forEach(function(item) {
       $(item).on('click', function() {
           
           console.log();
           
           //수정버튼 클릭시 commentupdate 변수를담는다 silbling을 사용해서 다중처리 
           const commentContent = $(this).siblings('#comment-update');
           //히든 태그를 삭제
           commentContent.removeAttr("hidden");
           //활성화
           commentContent.focus();
           $(this).siblings("#comment-update").slideToggle();
           
       });
   });
   
   // 저장 버튼을 지정
   const updateSaveBtns = document.querySelectorAll("#comment-update-btn-done"); 

   // 저장 버튼 이벤트 등록 
   updateSaveBtns.forEach(function(item){
       $(item).on('click',function(){
           console.log("저장버튼 클릭");
           const commentSaveTarget = $(this).siblings("#comment-update");
           commentSave(commentSaveTarget);
       });
   });
   
   //삭제 버튼을 지정 - ajax 라 부분 렌더링이라 새로 생성후에 이벤트를 사용할 수 없음 !!
   const deleteDelBtns = document.querySelectorAll("#comment-delete-btn");

   deleteDelBtns.forEach(function(item){
       $(item).on('click',function(){
           console.log("삭제버튼 클릭");
           const commentDeleteTarget = $(this).siblings("#comment-delete");
           commentDelete(commentDeleteTarget);
       });
   }); 

});


//리스트 전체 불러오기
function commentList() {
    console.log($("#comment-list").val());
    $.ajax({
        type: "get",
        url: "/comment/api/comment/list",
        contentType: "application/json; charset=utf-8",
        data: {
            user_id: userId,
            board_id: 1, // $("#board_id").val()
            comment_content: $("#comment-content").val(),
            comment_public: 1,
        },
        success: function (data) {
            var commentList = $('#commentlist');
            let html = "";
            //배열에 담아서 데이터를 다 조회한다.
            if (Array.isArray(data)) {
                for (var i = 0; i < data.length; i++) {
                    var comment = data[i];
                    var commentHtml = '<div class="comment">' + comment.text + '</div>';
                    html += commentHtml;
                }
            } else {
                html = "데이터 불러오기 실패.";
            }
            commentList.html(html);
        },
        error: function () {
            alert("요청 실패");
        }
    });
    
}


     
// 댓글 수정 하는 기능 
function commentUpdate() {
    $(document).Update(function() {
        $("#comment-update-btn").on("click", function() {
            // 댓글 수정
            var user_id = $(this).attr("user_id");
            var board_id = $(this).attr("board_id");

            if ($("#" + user_id).val().trim() === "") {
                alert("아이디를 입력해주세요");
                $("#" + user_id).focus();
                return false;
            }

            // 아이디를 넘겨받아서 아이디확인
            var idtake = {
                user_id: $("#" + user_id).val(),
                board_id: $("#" + board_id).val()
            };

            // 아이디가 맞다면 넘겨주기 (check 변수는 여기서 설정해야 합니다)
            var check = true;

            // 호출
            if (check) {
                $.ajax({
                    type: 'PUT', // 수정된 부분
                    url: "/comment/api/comment/list",
                    contentType: "application/json; charset=utf-8",
                    data: JSON.stringify({
                        user_id: userId,
                        board_id: 1, // $("#board_id").val()
                        comment_content: $("#comment-content").val(),
                        comment_public: 1 // 체크박스로 여부 변경 예정
                    }),
                    dataType: 'text',
                    success: function(data) {
                    	 
                        console.log("통신성공" + data);
                        if (data === 'comment-update-btm') {
                            alert("댓글 수정 완료");
                            location.reload;
                            // 수정이 완료되면 사용자가 작성한 값 비워줘야함
                            
                            if(data === "수정 성공") {
								html += '<li class="list-group-item">';
        		   				html += '<div class="row">';
        		    			html += '<div class="col-xs-2 col-md-1">';
        		    			html += '<img src="http://placehold.it/80" class="img-square img-responsive" alt="" /></div>';
                				html += '<div class="col-xs-10 col-md-11">';
                				html += '<div>';
                				html += '<a href="">';
                				html += '${principal.userId}</a>';
                				html += '<div class="mic-info">';
                				html += 'By: <a href="#">Bhaumik Patel</a> on 2 Aug 2013';
                				html += '</div>';
                				html += '</div>';
                                html +='<div class="comment-content">';
                                html += $("#comment-content").val();
                                html += '</div>';
                                html += '<button type="button" id="comment-delete-btn" class="btn btn-danger btn-xs" title="Delete">';
                                html += '<span class="glyphicon glyphicon-trash">삭제</span>';
                   	            html += '</button>'
								html +='<button type="button" id="comment-update-btn-done" class="btn btn-primary btn-xs" title="Delete">';
	       						html +='<span class="glyphicon glyphicon-pencil">저장</span>'
	        					html +='</button>'
                            }
                            $("#comment-content").val(''); // 수정된 부분
                        }
                    },
                    error: function(request, status, error) {
                        console.log("error");
                        alert("업데이트에 실패하였습니다");
                    }
                });
            }
        });
    });
}





//수정된 댓글을 저장 하는 기능 
function commentSave(target){
	console.log("함수에서 확인");
	console.log("target " + target);
	console.log("내용" + target.val());
    $.ajax({
        type: "put",
        url: "/comment/api/comment/list",
        //data: {"comment": $("#comment").val(),"board_id": $("#board_id").val()},
        contentType: "application/json; charset=utf-8",
        data: JSON.stringify({
        	id: 1,
        	user_id: userId,
            board_id: 1, //$("#board_id").val()
        	comment_content: target.val(),
           	comment_public : 1, // 체크박스로 여부 변경 예정
        }),
    
        success: function(data){
        	
            console.log(data);           
            if(data === "comment-update-btn"){
            	alert("댓글 수정 완료");
            }
            location.reload;
        	// 1. 컨트롤러에 보낼 데이터 확인. (맵핑)
        	// 2. 넘어간 데이터로 DB에 저장. 	(DB 저장 )
        	// 3. result = 0  -> 저장 실패, result = 1 -> 저장 성공
        	//    저장 성공이 확인 되면 댓글 화면에 추가 (아래의 html 작성)
        	//    댓글에 나오는 데이터들은 이미 화면 또는 세션에 있기 때문에 컨트롤러에서 데이터를 받아올 필요가 없다.
            let html = "";
			
        	if(data === "저장 성공") {
        		    html += '<li class="list-group-item">';
        		    html += '<div class="row">';
        		    html += '<div class="col-xs-2 col-md-1">';
        		    html += '<img src="http://placehold.it/80" class="img-square img-responsive" alt="" /></div>';
                	html += '<div class="col-xs-10 col-md-11">';
                	html += '<div>';
                	html += '<a href="">';
                	html += '${principal.userId}</a>';
                	html += '<div class="mic-info">';
                	html += 'By: <a href="#">Bhaumik Patel</a> on 2 Aug 2013';
                	html += '</div>';
                	html += '</div>';
                    html +='<div class="comment-content">';
                    html += $("#comment-content").val();
                    html += '</div>';
                    html += '<div class="action">'
                   	html += '<button type="button" id="comment-update-btn" class="btn btn-primary btn-xs" title="Update">';
                   	html += '<span class="glyphicon glyphicon-pencil">수정</span>';
                    html += '</button>';                                  
                    html += '<button type="button" id="comment-delete-btn" class="btn btn-danger btn-xs" title="Delete">';
                    html += '<span class="glyphicon glyphicon-trash">삭제</span>';
                   	html += '</button>';
                    html += '</div>';                                                             
                    html += '</div>';
                    html += '</div>';
                    html += '</li>';
                // html 입력 완료
                console.log(html);
                $("#comment-list").append(html);
                $("#comment-content").val("");
        	}
        },
        error: function (request,status,error){
            alert("code:" + request.status + "\n" + "error" + error);
            alert("저장에 실패하였습니다");
            
        }
    });
}

//댓글을 생성하고 저장할때 (list에 뿌림 )
function commentCreate(){
    
	console.log($("#comment-content").val())
    $.ajax({
        type: "post",
        url: "/comment/api/comment/list",
        //data: {"comment": $("#comment").val(),"board_id": $("#board_id").val()},
        contentType: "application/json; charset=utf-8",
        data: JSON.stringify({
        	user_id: userId,
            board_id: 1, //$("#board_id").val()
        	comment_content: $("#comment-content").val(),
           	comment_public : 1, // 체크박스로 여부 변경 예정        	
        }),
    
        success: function(data){
        	console.log("11111111111111111111"); //여기서 데이터를 탑니다
            console.log(data.id);        	
            let html = "";
			
			html += '<li class="list-group-item">';
			html += '<div class="row">';
			html += '<div class="col-xs-2 col-md-1">';
			html += '<img src="http://placehold.it/80" class="img-square img-responsive" alt="" /></div>';
			html += '<div class="col-xs-10 col-md-11">';
		   	html += '<div>';
			html += '<a href="">';
			html += '${principal.userId}</a>';
			html += '<div class="mic-info">';
			html += 'By: <a href="#">Bhaumik Patel</a> on 2 Aug 2013';
			html += '</div>';
			html += '</div>';
			html +='<div class="comment-content">';
			html += $("#comment-content").val();
			html += '</div>';
			html += ' <textarea id="comment-update" style="height:100px;" class="form-control" placeholder="글을 수정해주세요." name = "comment-update" hidden="true">${list.commentContent}</textarea>';
			html += '<div class="action">'
			html += '<button type="button" id="comment-update-btn" class="btn btn-primary btn-xs" title="Update">';
	        html += '<span class="glyphicon glyphicon-pencil">수정</span>';
	        html += '</button>';                                  
	        html += '<button type="button" id="comment-delete-btn" onclick="commentDelete('+data.id+')"  class="btn btn-danger btn-xs" title="Delete">';
	        html += '<span class="glyphicon glyphicon-trash">삭제</span>';
	        html += '</button>';
	        html +='<button type="button" id="comment-update-btn-done" class="btn btn-primary btn-xs" title="Delete">';
	        html +='<span class="glyphicon glyphicon-pencil">저장</span>'
	        html +='</button>';
	        html += '</div>';                                                             
	        html += '</div>';
	        html += '</div>';
	        html += '</li>';
	        // html 입력 완료
	        console.log(html);
	        $("#comment-list").append(html);
			$("#comment-content").val("");
        },
        error: function (status,error){
            alert("code:" + status + "\n" + "error" + error);
            alert("저장에 실패하였습니다");
            
        }
    });     
}


function commentDelete(){
    $.ajax({
        type : put,
        url:  "/comment/api/comment/list",
        contentType: "application/json; charset=utf-8",
        data: JSON.stringify({
        	user_id: userId,
            board_id: 1, //$("#board_id").val()
        	comment_content: $("#comment-content").val(),
           	comment_public : 1, // 체크박스로 여부 변경 예정        	
        }),

        success: function(data){
             
        }   
    })
        
}

</script>

<!-- 댓글 작성  -->
<div class="container">
	<div class="form-group">
		<h1>댓글 작성</h1>
		<form action="/comment/list" method="post">
			<table class="table table-striped"
				style="text-align: center; border: 2px solid #dddddd"></table>
			<table class="table table-striped"
				style="text-align: center; border: 2px solid #dddddd">
				<tr>
					<td style="border-bottom: none;" valign="baseline">
						<textarea id="comment-content" 
						style="height: 100px;" 
						class="form-control"
						placeholder="댓글을 작성해주세요." 
						name="comment-content">
					</textarea>
					</td>
					<td>
						<input type="hidden" 
						id="comment-autor" 
						value="익명">
						<button type="button" 
						class="custom-btn btn-6"
						id="comment-create-btn">작성</button>
					</td>
				</tr>
				<tr>
					<td colspan="4"><input type="file" name="fileName"></td>
				</tr>
			</table>
		</form>
	</div>

	
	<!-- 댓글 리스트~~~~  -->
	<div class="panel panel-default widget">
		<div class="panel-heading">
			<span class="glyphicon glyphicon-comment"></span>
			<h1 class="panel-title">댓글 목록</h1>
			<form action="/comment/List" method="get"></form>
			<span class="label label-info"> </span>
		</div>
		<div class="panel-body">
			<ul class="list-group" id="comment-list">
				<li class="list-group-item">
					<div class="row">
						<c:forEach items="${commentList}" var="list">
							<div class="col-xs-2 col-md-1">
								<img src="http://placehold.it/80"
									class="img-square img-responsive" alt="" />
							</div>

							<div class="col-xs-10 col-md-11">
								<div>
									${list.userId}
									<div class="mic-info">
										By: <a href="#">Bhaumik Patel</a> on 2 Aug 2013
									</div>
								</div>
								<div class="comment-content">${list.commentContent}</div>
								<div class="action">
									<textarea id="comment-update" 
									style="height: 100px;"
									class="form-control" 
									placeholder="글을 수정해주세요."
									name="comment-update" 
									hidden="true">${list.commentContent}</textarea>
									
									<form action = ""></form>
									<button type="button" 
										id="comment-update-btn"
										class="btn btn-primary btn-xs" 
										class="slideToggle"
										title="Update"
										hidden = "true"
										onclick="">
										<span class="glyphicon glyphicon-pencil">수정</span>
									
									</button>
									
									<button type="button" 
									id="comment-delete-btn"
									class="btn btn-danger btn-xs" 
									title="Delete"
									hidden = "false">
									<span class="glyphicon glyphicon-trash">삭제</span>									
									</button>
									
									<button type="button" 
									id="comment-update-btn-done"
									class="btn btn-primary btn-xs" 
									title="Delete"hidden="true">
									<span class="glyphicon glyphicon-pencil">저장</span>
									</button>                               
								</div>
							</div>
						</c:forEach>
					</div>
				</li>
			</ul>
		</div>
		<div>
			<a href="#" class="btn btn-primary btn-sm btn-block" role="button">
				<span class="glyphicon glyphicon-refresh"></span> 더보기
			</a>
		</div>
	</div>
</div>
<%@ include file="/WEB-INF/view/layout/footer.jsp"%>
