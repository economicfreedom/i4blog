<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/layout/header.jsp"%>
<link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<link href="/css/comment.css" rel="stylesheet">
<!------ Include the above in your HEAD tag ---------->

<div class="container">
	<div class="form-group">
	<h1>댓글 작성</h1>
		<form method="get"  action="comment/commentList">
			<table class="table table-striped" style="text-align: center; border: 2px solid #dddddd">
				<tr>
					<td style="border-bottom:none;" valign="baseline">
					<br><br>
					</td>
					<td>
					<input type="text" id = "user_id" style="height:100px;" class="form-control" placeholder="댓글을 작성해주세요." name = "comment_content"></td>
					<td>
					<br><br>
					<button class="custom-btn btn-6">
					<span>등록</span>
					</button>
					</td>
				</tr>
				<tr>
					<td colspan="4"><input type="file" name="fileName"></td>
				</tr>
			</table>
		</form>
	</div>
        <div class="panel panel-default widget">
            <div class="panel-heading">
                <span class="glyphicon glyphicon-comment"></span>
                <h1 class="panel-title">댓글 목록</h1>
                <span class="label label-info">
                </span>
            </div>
            <div class="panel-body">
                <ul class="list-group">
                    <li class="list-group-item">
                        <div class="row">
                            <div class="col-xs-2 col-md-1">
                                <img src="http://placehold.it/80" class="img-circle img-responsive" alt="" /></div>
                            <div class="col-xs-10 col-md-11">
                                <div>
                                    <a href="">
                                      123 </a>
                                    <div class="mic-info">
                                        By: <a href="#">Bhaumik Patel</a> on 2 Aug 2013
                                    </div>
                                </div>
                                <div class="comment-text">
                                    좋아요!
                                </div>
                                
                                <div class="action">
                                    <button type="button" class="btn btn-primary btn-xs" title="Edit">
                                        <span class="glyphicon glyphicon-pencil">수정</span>
                                    </button>
                                    
                                    <button type="button" class="btn btn-success btn-xs" title="Approved">
                                        <span class="glyphicon glyphicon-ok">작성</span>
                                    </button>
                                    
                                    <button type="button" class="btn btn-danger btn-xs" title="Delete">
                                        <span class="glyphicon glyphicon-trash">삭제</span>
                                    </button>
                                </div>
                            </div>
                        </div>
                    </li>          
                    <li class="list-group-item">
                        <div class="row">
                            <div class="col-xs-2 col-md-1">
                                <img src="http://placehold.it/80" class="img-circle img-responsive" alt="" /></div>
                            <div class="col-xs-10 col-md-11">
                                <div>
                                    <a href="">
                                      123 </a>
                                    <div class="mic-info">
                                        By: <a href="#">Bhaumik Patel</a> on 2 Aug 2013
                                    </div>
                                </div>
                                <div class="comment-text">
                                    좋아요!
                                </div>
                                
                                <div class="action">
                                    <button type="button" class="btn btn-primary btn-xs" title="Edit">
                                        <span class="glyphicon glyphicon-pencil">수정</span>
                                    </button>
                                    
                                    <button type="button" class="btn btn-success btn-xs" title="Approved">
                                        <span class="glyphicon glyphicon-ok">작성</span>
                                    </button>
                                    
                                    <button type="button" class="btn btn-danger btn-xs" title="Delete">
                                        <span class="glyphicon glyphicon-trash">삭제</span>
                                    </button>
                                </div>
                            </div>
                        </div>
                    </li>  
                    <li class="list-group-item">
                        <div class="row">
                            <div class="col-xs-2 col-md-1">
                                <img src="http://placehold.it/80" class="img-circle img-responsive" alt="" /></div>
                            <div class="col-xs-10 col-md-11">
                                <div>
                                    <a href="">
                                      123 </a>
                                    <div class="mic-info">
                                        By: <a href="#">Bhaumik Patel</a> on 2 Aug 2013
                                    </div>
                                </div>
                                <div class="comment-text">
                                    좋아요!
                                </div>
                                
                                <div class="action">
                                    <button type="button" class="btn btn-primary btn-xs" title="Edit">
                                        <span class="glyphicon glyphicon-pencil">수정</span>
                                    </button>
                                    
                                    <button type="button" class="btn btn-success btn-xs" title="Approved">
                                        <span class="glyphicon glyphicon-ok">작성</span>
                                    </button>
                                    
                                    <button type="button" class="btn btn-danger btn-xs" title="Delete">
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