<%--
  Created by IntelliJ IDEA.
  User: dungm
  Date: 10/7/2025
  Time: 1:06 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link href="assets/css/tailwind.output.css" rel="stylesheet">

<c:set var="text" value="${param.text != null ? param.text : 'Reserve'}" />
<c:set var="href" value="${param.href != null ? param.href : '#'}" />

<a href="${href}"
   class="inline-block px-8 py-3 rounded-md text-lg font-serif
          bg-white text-black border border-gray-300
          hover:bg-[#CCBDA3] hover:text-black hover:border-transparent
          transition-all duration-300 text-center">
    ${text}
</a>


