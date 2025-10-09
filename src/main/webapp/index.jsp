<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <link href="${pageContext.request.contextPath}/assets/css/output.css" rel="stylesheet">
</head>
<body>
<%--<%@include file="views/layout/footer.jsp" %>--%>
<%--<jsp:include page="/views/layout/sidebar.jsp">--%>
<%--    <jsp:param name="active" value="dashboard" />--%>
<%--</jsp:include>--%>

<%@include file="views/component/header.jsp" %>
</body>
</html>