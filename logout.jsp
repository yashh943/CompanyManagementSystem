<%
    session.invalidate(); // Destroy session
    response.sendRedirect("index.jsp");
%>