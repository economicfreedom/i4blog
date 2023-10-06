<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/layout/header.jsp"%>
<link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<link href="https://fonts.googleapis.com/css2?family=Lato&display=swap" rel="stylesheet">
<link href="/css/comment.css" rel="stylesheet">
<!------ Include the above in your HEAD tag ---------->


<div class="container">
	<div class="form-group">
	<h1>작성</h1>
		<form method="post"  action="/comment/List">
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
					<span>댓글 작성</span>
					</button>
					</td>
				</tr>
				<tr>
					<td colspan="4"><input type="file" name="fileName"></td>
				</tr>
			</table>
		</form>
	</div>

</div>
<%@ include file="/WEB-INF/view/layout/footer.jsp"%>