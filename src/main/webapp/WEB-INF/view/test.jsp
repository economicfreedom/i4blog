<%--
  Created by IntelliJ IDEA.
  User: GGG
  Date: 2023-09-15
  Time: 오후 3:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<%--스프링 시큐리티 태그 사용시 필요--%>
<script>
    var  asd = d
</script>

<html>
<head>
    <title>Title</title>
</head>
<body>
    test
<%--시큐리티 jsp에서 활용 하는 방법--%>


<%--    회원이면 안 보임--%>
<sec:authorize access="isAnonymous()">
    <h1>보임</h1>
</sec:authorize>
<%--    회원이면 보임--%>
<sec:authorize access="isAuthenticated()">
    <h1>안 보임</h1>
</sec:authorize>

</body>
</html>
