<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<link href="https://fonts.googleapis.com/css2?family=Lato&display=swap" rel="stylesheet">
<link href="/css/comment.css" rel="stylesheet">

<script>
let index ={
    //댓글 작성 
    init: function(){
        $("#comment-create-btn").on("click", ()=>{
            this.commentSave()
        });


    },

    commentSave: function(){
			let data = {
					userId : $("userId").val(),
                    boardId : $("userId").val(),
                    commentContent : $("comment-content").val(),
			};
			
			$.ajax({ 
				type: "POST",
				url: `/api/comment/${data.board_id}`,
				data: JSON.stringify(data),
				contentType: "application/json; charset=utf-8",
				dataType: "json"
			}).done(function(Save){
				alert("댓글쓰기가 완료되었습니다.");
				location.href = `/board/${data.board_id}`;
			}).fail(function(error){				
                alert(JSON.stringify(error));
			
            }); 
		},
    //댓글 저장

    //댓글 수정

    //댓글 삭제

}



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
           commentSave();
       }
   });
    
    
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
   
   //삭제 버튼을 지정 
   const deleteDelBtns = document.querySelectorAll("#comment-delete-btn");

   deleteDelBtns.forEach(function(item){
       $(item).on('click',function(){
           console.log("삭제버튼 클릭");
           const commentDeleteTarget = $(this).siblings("#comment-delete");
           commentDelete(commentDeleteTarget);
       });
   });

});

</script>

<!-- 댓글 작성  -->
<div class="container">
	<div class="form-group">
		<h1>댓글 작성</h1>
		<form action="/comment/List" method="post">
			<table class="table table-striped"
				style="text-align: center; border: 2px solid #dddddd"></table>
			<table class="table table-striped"
				style="text-align: center; border: 2px solid #dddddd">
				<tr>
					<td style="border-bottom: none;" valign="baseline"><textarea
							id="comment-content" style="height: 100px;" class="form-control"
							placeholder="댓글을 작성해주세요." name="comment-content"></textarea></td>
					<td><input type="hidden" id="comment-autor" value="익명">
						<button type="button" class="custom-btn btn-6"
							id="comment-create-btn">작성</button></td>
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
									<textarea id="comment-update" style="height: 100px;"
										class="form-control" placeholder="글을 수정해주세요."
										name="comment-update" hidden="true">${list.commentContent}</textarea>
									
									<button type="button" id="comment-update-btn"
										class="btn btn-primary btn-xs" class="slideToggle"
										title="Update"hidden = "true">
										<span class="glyphicon glyphicon-pencil">수정</span>
									
									</button>
									
									<button type="button" id="comment-delete-btn"
										class="btn btn-danger btn-xs" title="Delete"hidden = "false">
										<span class="glyphicon glyphicon-trash">삭제</span>
									
									</button>
									
									<button type="button" id="comment-update-btn-done"
										class="btn btn-primary btn-xs" title="Delete"hidden="true">
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
