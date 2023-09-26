<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>   
<%@ include file="/WEB-INF/view/layout/header.jsp"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">




<html>
<head>
    <link rel="stylesheet" href="/css/bootstrap.css">
</head>
<body>
<!--  <textarea style="width: 1100px" rows="3" cols="30" id="id_1" name="comment_name" ></textarea> -->
     <textarea style="width: 1100px" rows="3" cols="30" id="id_1" name="comment_name" ></textarea>                      
                                                   
<div class="container">
    <form id="comment_id" name="comment_name"></form>
    <br><br>
        <div>
           
                <table class="table">                    
                    <tr>
                        <td>
                            <textarea style="width: 800px" rows="3" cols="25" id="id" name="comment_name" placeholder="댓글을 입력하세요"></textarea>
                            <br>
                            <div>
                            <button class="btn pull-right btn-success" onclick ="" >등록</button>
                            </div>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
        <input type="hidden" id="b_code" name="b_code" value="" />        
    </form>
</div>
<div class="container">
    <form id="commentListForm" name="commentListForm" method="post">
        <div id="commentList">
        </div>
    </form>
</div>



<!-- 검색 기능-->





 
<br>
<%@ include file="/WEB-INF/view/layout/footer.jsp"%>

