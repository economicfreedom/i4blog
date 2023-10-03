<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/view/layout/header.jsp"%>

  <body>
    <form name="form" method="post" action="http://localhost:8080/board" enctype="multipart/form-data">
      <input name="user" value="Pyo"/>
      <input name="content" value="Content"/>
      <input type="file" name="files" multiple="multiple"/>
      <input type="submit" id="submit" value="전송"/>
    </form>

<%@ include file="/WEB-INF/view/layout/footer.jsp"%>
