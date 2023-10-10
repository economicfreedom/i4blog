<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/layout/header.jsp"%>
<link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<link href="/css/comment.css" rel="stylesheet">
<!-- 댓글 등록  ajax -->
<script>

function commentCreate(){
	console.log($("#comment_content").val())
    $.ajax({
        type: "post",
        url: "/comment/api/comment/list",
        //data: {"comment": $("#comment").val(),"board_id": $("#board_id").val()},
        contentType: "application/json; charset=utf-8",
        data: JSON.stringify({
        	user_id: $("#user_id").val();
        	comment_content: $("#comment_content").val(),
            board_id: $("#board_id").val()
        	
        }),
        success: function(data){
        	// 1. 컨트롤러에 보낼 데이터 확인. (맵핑)
        	// 2. 넘어간 데이터로 DB에 저장. 	(DB 저장 )
        	// 3. result = 0  -> 저장 실패, result = 1 -> 저장 성공
        	//    저장 성공이 확인 되면 댓글 화면에 추가 (아래의 html 작성)
        	//    댓글에 나오는 데이터들은 이미 화면 또는 세션에 있기 때문에 컨트롤러에서 데이터를 받아올 필요가 없다.
            let html = "";

            if(data.list.length > 0){
                for(let i = 0; i<data.list.length; i++){
                    html += "<div class='form-group'>";
                    html += "<input type = 'hidden' id='comment_autor_"+ data.list[i].board_id + "'value>";
                    html += "<input type = 'text' id='board_id'>" + $("#comment").val() + "</input>";
                    
              
                }if(data.list[i].commentWriter === $('#sessionBoard_id').val()){
                    
                }else{

                }
               
            }
        },
        error: function (request,status,eror){
            alert("code:" + request.status + "\n" + "error" + error);
        }
    });

}
<!-- 댓글 리스트 스크립트  --> 
  	$(document).ready(function(){

  	            //생성 버튼 지정
  	            const createBtn = document.querySelector('#comment_create_btn');

  	            //생성 버튼 클릭시 수행할 메소드 커낵트
  	            createBtn.addEventListener('click',function(){
  	            	console.log('작성');
  	            	commentCreate();
  	            });

  	            //수정 버튼 지정
  	            const updateBtns = document.querySelectorAll('.comment_update_btn');
  	            
  	            //모든 수정 버튼 이벤트 등록
  	            updateBtns.forEach(function(item){
  	                item.addEventListener('click',function(){
  	                    var form = this.closest('form');
  	                });
  	            });
    });
  	
</script>
<!-- 댓글 작성  -->
<div class="container">
	<div class="form-group">
	<h1>댓글 작성</h1>
	<div class"></div>
				<form action="/comment/List"  method="post" > 
				
				<table class="table table-striped" style="text-align: center; border: 2px solid #dddddd"></table>
                    <table class="table table-striped" style="text-align: center; border: 2px solid #dddddd">
                        <tr>
                            <td style="border-bottom:none;" valign="baseline">								                                                                         			
                            <textarea id="comment_content" style="height:100px;" class="form-control" placeholder="댓글을 작성해주세요." name = "comment_content"></textarea>
                            </td>										
                        <td>
                                                                                    
                            <td>
                            
                            <input type="hidden" id=comment_autor value="익명" >	
                            <button type="button" class="custom-btn btn-6" id="comment_create_btn" >작성</button>
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
                <ul class="list-group">
                    <li class="list-group-item">
                        <div class="row">
                            <div class="col-xs-2 col-md-1">
                                <img src="http://placehold.it/80" class="img-square img-responsive" alt="" /></div>
                            <div class="col-xs-10 col-md-11">
                                <div>
                                    ${principal.userId}
                                    <div class="mic-info">
                                
                                        By: <a href="#">Bhaumik Patel</a> on 2 Aug 2013
                                    </div>
                                </div>
                                <div class="comment-content">
                                    좋아요!
                                </div>
                                
                                <div class="action">
                                    
                                    <button type="button" id="comment_update_btn" class="btn btn-primary btn-xs" title="Update">
                                        <span class="glyphicon glyphicon-pencil">수정</span>
                                    </button>                                  
                                    
                                    <button type="button" id="comment_delete_btn" class="btn btn-danger btn-xs" title="Delete">
                                        <span class="glyphicon glyphicon-trash">삭제</span>
                                    </button>
                                </div>
                            </div>
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
                                   
                                    <button type="button" id="comment_update_btn" class="btn btn-primary btn-xs" title="Update">
                                        <span class="glyphicon glyphicon-pencil">수정</span>
                                    </button>                                  
                                    
                                    <button type="button" id="comment_delete_btn" class="btn btn-danger btn-xs" title="Delete">
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
                                    
                                    <button type="button" id="comment_update_btn" class="btn btn-primary btn-xs" title="Update">
                                        <span class="glyphicon glyphicon-pencil">수정</span>
                                    </button>                                  
                                    
                                    <button type="button" id="comment_delete_btn" class="btn btn-danger btn-xs" title="Delete">
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


<%@ include file="/WEB-INF/view/layout/footer.jsp"%>