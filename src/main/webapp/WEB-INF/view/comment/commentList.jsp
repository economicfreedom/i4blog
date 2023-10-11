<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<link href="/css/comment.css" rel="stylesheet">

<script>

// 댓글 리스트 불러오기 ajax
function commentList(){
    console.log($("#comment-list").val())
    $.ajax({
        type: "get",
        url: "/comment/api/comment/list",
        contentType: "application/json; charset=utf-8",
        data: JSON.stringify({
        	user_id: 1,
            board_id: 1, //$("#board_id").val()
        	comment_content: $("#comment-content").val(),
           	comment_public : 1, // 체크박스로 여부 변경 예정
        	
        }),

        //댓글 목록을 불러오는 함수 
        success : function(data){
            var commentList = $('#commentlist')            
            let html = "";
            if(data === "불러오기 성공"){
                console.log(data);
                data : $("#data").val('');
                
            }
            
        },
        //댓글 목록 불러오기 실패시 
        error: function (){
            alert("요청 실패");
        }
    });

}
<!-- 댓글 등록  ajax -->
function commentCreate(){
    
	console.log($("#comment-content").val())
    $.ajax({
        type: "post",
        url: "/comment/api/comment/list",
        //data: {"comment": $("#comment").val(),"board_id": $("#board_id").val()},
        contentType: "application/json; charset=utf-8",
        data: JSON.stringify({
        	user_id: 1,
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

     
// 댓글 수정 이벤트 
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
                        user_id: 1,
                        board_id: 1, // $("#board_id").val()
                        comment_content: $("#comment-content").val(),
                        comment_public: 1 // 체크박스로 여부 변경 예정
                    }),
                    dataType: 'text',
                    success: function(data) {
                        console.log("통신성공" + data);
                        if (data === 'comment-update') {
                            alert("댓글 수정 완료");
                            // 수정이 완료되면 사용자가 작성한 값 비워줘야함
                            $("#comment-content").val(''); // 수정된 부분
                        }
                    },
                    error: function(request, status, error) {
                        console.log("error");
                    }
                });
            }
        });
    });
}

//이벤트 
 $(document).ready(function() {
    // 생성 버튼 클릭 시 수행할 메소드 커낵트
    $('#comment-create-btn').on('click', function() {
        console.log('작성');
        // 작성한 댓글 저장 
        let commentContent = $("#comment-content").val();
        if (commentContent === "") {
            alert("댓글을 입력해주세요");
        } else {
            commentCreate();
        }
    });

    // 수정 버튼 지정
    const updateBtns = document.querySelectorAll('#comment-update-btn');

    // 모든 수정 버튼 이벤트 등록
    updateBtns.forEach(function(item) {
        item.addEventListener('click', function() {
            // 수정 버튼 클릭 시 수정할 댓글 내용을 어떻게 가져올 것인지 정의
            // 여기에서 commentUpdate() 함수 호출하거나 수정에 필요한 작업 수행
            commentUpdate(); // 수정 함수 호출 예시
        });
    });
});
</script>

<!-- 댓글 작성  -->
<div class="container">
	<div class="form-group">    
	<h1>댓글 작성</h1>	
				<form action="/comment/List"  method="post" > 				
				<table class="table table-striped" style="text-align: center; border: 2px solid #dddddd"></table>
                    <table class="table table-striped" style="text-align: center; border: 2px solid #dddddd">
                        <tr>

                            <td style="border-bottom:none;" valign="baseline">								                                                                         			
                            <textarea id="comment-content" style="height:100px;" class="form-control" placeholder="댓글을 작성해주세요." name = "comment-content"></textarea>
                            </td>										                                                                                              
                            <td>                          
                            <input type="hidden" id="comment-autor" value="익명" >	
                            <button type="button" class="custom-btn btn-6" id="comment-create-btn" >작성</button>
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
                <form action="/comment/List" method="get">
                </form>
                <span class="label label-info">
                </span>
            </div>    
            <div class="panel-body">
                <ul class="list-group" id="comment-list">
                    <li class="list-group-item">                   
                        <div class="row">    
                         <c:forEach items="${commentList}" var="list" >                      	                                                                                   
                            <div class="col-xs-2 col-md-1">
                                <img src="http://placehold.it/80" class="img-square img-responsive" alt="" /></div>
                            <div class="col-xs-10 col-md-11">
                                <div>
                                    ${list.userId}
                                    <div class="mic-info">                                
                                        By: <a href="#">Bhaumik Patel</a> on 2 Aug 2013
                                    </div>
                                </div>
                                <div class="comment-content">
                                	${list.commentContent}
                                </div>                        
                                <div class="action">
                                    <textarea type = "hidden" id="comment-update" style="height:100px;" class="form-control" placeholder="글을 수정해주세요." name = "comment-update" hidden="true">{content.update}</textarea>
                                    <button type="button" id="comment-update-btn" class="btn btn-primary btn-xs" title="Update">
                                        <span class="glyphicon glyphicon-pencil">수정</span>
                                    </button>     
                                                     
                                    <button type="button" id="comment-delete-btn" class="btn btn-danger btn-xs" title="Delete" >
                                        <span class="glyphicon glyphicon-trash">삭제</span>
                                    </button>                                  
                                      <button type="button" id="comment-update-btn-done" class="btn btn-primary btn-xs" title="Update" hidden="true">
                                        <span class="glyphicon glyphicon-folder">저장</span>
                                    </button>                                                                     
                                </div> 
                            </div>
                        	</c:forEach >      
                        </div>
                    </li>
                  
                        
                    <li class="list-group-item">
                        <div class="row">
                            <div class="col-xs-2 col-md-1">
                                <img src="http://placehold.it/80" class="img-square img-responsive" alt="" /></div>
                            <div class="col-xs-10 col-md-11">
                                <div>
                                    <a href="">
                                      123 </a>
                                    <div class="mic-info">
                                        By: <a href="#">Bhaumik Patel</a> on 2 Aug 2013
                                    </div>
                                </div>
                                <div class="comment-content">
                                    좋아요!
                                </div>                                
                                <div class="action">                                   
                                    <button type="button" id="comment-update-btn" class="btn btn-primary btn-xs" title="Update">
                                        <span class="glyphicon glyphicon-pencil">수정</span>
                                    </button>                                  
                                    
                                    <button type="button" id="comment-delete-btn" class="btn btn-danger btn-xs" title="Delete">
                                        <span class="glyphicon glyphicon-trash">삭제</span>
                                    </button>
                                </div>
                            </div>
                        </div>
                    </li>  
                    <li class="list-group-item">
                        <div class="row">
                            <div class="col-xs-2 col-md-1">
                                <img src="http://placehold.it/80" class="img-square img-responsive" alt="" />
                            
                            
                            </div>
                            <div class="col-xs-10 col-md-11">
                                <div>
                                    <a href="">
                                      123 </a>
                                    <div class="mic-info">
                                        By: <a href="#">Bhaumik Patel</a> on 2 Aug 2013
                                    </div>
                                </div>
                                <div class="comment-content">
                                    좋아요!
                                </div>
                                <div class="action">
                                    
                                    <button type="button" id="comment-update-btn" class="btn btn-primary btn-xs" title="Update">
                                        <span class="glyphicon glyphicon-pencil">수정</span>
                                    </button>                                  
                                    
                                    <button type="button" id="comment-delete-btn" class="btn btn-danger btn-xs" title="Delete">
                                        <span class="glyphicon glyphicon-trash">삭제</span>
                                    </button>
                                </div>                                                              
                            </div>
                        </div>
                    </li>
                </ul>
                <a href="#" class="btn btn-primary btn-sm btn-block" role="button">
                <span class="glyphicon glyphicon-refresh"></span> 더보기</a>
            </div>
        </div>
      
</div>

