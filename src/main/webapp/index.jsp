<%@include file="views/layout/header.jsp" %>
<%@include file="views/layout/newsPage.jsp" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
</head>
<body>
<%--<%@include file="views/layout/footer.jsp" %>--%>
<jsp:include page="/views/layout/sidebar.jsp">
    <jsp:param name="active" value="dashboard" />
</jsp:include>
</body>
</html>

