<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/view/layout/header.jsp"%>
<script>
$(document).ready(function (){
	$("#btn-1").on("click",function(){
		let board_id = $("#board_id").val();
		let user_id = $("#user_id").val();
		
		
		({
			
			user_id:1,
			board_id:2
		})
		console.log("아ㅏ아ㅏㅏ");
		console.log(user_id);
		console.log(board_id);
		$.ajax({
			url:""
		})
		
		
	});
	
	
})
</script>

<input id="board_id" type="text">
<input id="user_id" type="text">

<button type="button" id="btn-1">전송</button>

<input type="text"  readonly id="text" value="1"> 
  
<%@ include file="/WEB-INF/view/layout/footer.jsp"%>
