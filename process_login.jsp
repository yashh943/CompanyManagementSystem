<%@ include file="db_config.jsp" %>
<%
    String u = request.getParameter("username");
    String p = request.getParameter("password");

    loadDriver();

    try (Connection con = DriverManager.getConnection(url, dbUser, dbPass);
         PreparedStatement pst = con.prepareStatement("SELECT * FROM employees WHERE username=? AND password=?")) {
        
        pst.setString(1, u);
        pst.setString(2, p);
        
        ResultSet rs = pst.executeQuery();
        
        if(rs.next()) {
            // Store user details in session
            session.setAttribute("user", u);
            session.setAttribute("dept", rs.getString("department"));
            session.setAttribute("role", rs.getString("designation"));
            
            response.sendRedirect("index.jsp");
        } else {
            response.sendRedirect("index.jsp?msg=error");
        }
    } catch(Exception e) {
        out.println("System Error: " + e.getMessage());
    }
%>