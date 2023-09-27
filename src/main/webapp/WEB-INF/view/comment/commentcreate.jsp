<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/layout/header.jsp"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
    <link rel="stylesheet" href="/css/bootstrap.css">
   <link rel = "stylesheet" href="/css/comment.css">
 
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
<div class="container">
<div class="be-comment-block">
	<h1 class="comments-title">댓글작성</h1>
	<div class="be-comment">
		<div class="be-img-comment">	
			<a href="blog-detail-2.html">
				<img src="https://bootdey.com/img/Content/avatar/avatar1.png" alt="" class="be-ava-comment">
			</a>
		</div>
		<div class="be-comment-content">
			
				<span class="be-comment-name">
					<a href="blog-detail-2.html">Ravi Sah</a>
					</span>
				<span class="be-comment-time">
					<i class="fa fa-clock-o"></i>
					May 27, 2015 at 3:14am
				</span>

			<p class="be-comment-text">
				Pellentesque gravida tristique ultrices. 
				Sed blandit varius mauris, vel volutpat urna hendrerit id. 
				Curabitur rutrum dolor gravida turpis tristique efficitur.
			</p>
		</div>
	</div>
	<div class="be-comment">
		<div class="be-img-comment">	
			<a href="blog-detail-2.html">
				<img src="https://bootdey.com/img/Content/avatar/avatar2.png" alt="" class="be-ava-comment">
			</a>
		</div>
		<div class="be-comment-content">
			<span class="be-comment-name">
				<a href="comment_name">Phoenix, the Creative Studio</a>
			</span>
			<span class="be-comment-time">
				<i class="clock"></i>
				May 27, 2015 at 3:14am
			</span>
			<p class="be-comment-text">
			
			</p>
		</div>
	</div>
	<div class="be-comment">
		<div class="be-img-comment">	
			<a href="blog-detail-2.html">
				<img src="https://bootdey.com/img/Content/avatar/avatar3.png" alt="" class="be-ava-comment">
			</a>
		</div>
		<div class="be-comment-content">
			<span class="be-comment-name">
				<a href="detail.html"></a>
			</span>
			<span class="be-comment-time">
				<i class="fa fa-clock-o"></i>
				May 27, 2015 at 3:14am
			</span>
			<p class="be-comment-text">
				
			</p>
		</div>
	</div>
	<form class="form-block">
		<div class="row">
			<div class="col-xs-12 col-sm-6">
				<div class="form-group fl_icon">
					<div class="icon"><i class="fa fa-user"></i></div>
					<input class="form-input" type="text" placeholder="ID를 입력해주세요">
				</div>
			</div>
			<div class="col-xs-12 col-sm-6 fl_icon">
				<div class="form-group fl_icon">
					<div class="icon"><i class="fa fa-envelope-o"></i></div>
					<input class="form-input" type="text" placeholder="이메일을 입력해주세요">
				</div>
			</div>
			<div class="col-xs-12">									
				<div class="form-group">
					<textarea class="form-input" required="" placeholder="글을 작성해주세요"></textarea>
					<br>					
					<a class="btn btn-primary pull-right">댓글 작성</a>
				</div>
			</div>		
			<br>
		</div>
	</form>
</div>
</div>
<%@ include file="/WEB-INF/view/layout/footer.jsp"%>



