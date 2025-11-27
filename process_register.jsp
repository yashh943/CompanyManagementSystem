<%@ include file="db_config.jsp" %>
<%
    String u = request.getParameter("username");
    String p = request.getParameter("password");
    String e = request.getParameter("email");
    String d = request.getParameter("department");
    String des = request.getParameter("designation");

    loadDriver();

    try (Connection con = DriverManager.getConnection(url, dbUser, dbPass);
         PreparedStatement pst = con.prepareStatement("INSERT INTO employees (username, password, email, department, designation) VALUES (?, ?, ?, ?, ?)")) {
        
        pst.setString(1, u);
        pst.setString(2, p);
        pst.setString(3, e);
        pst.setString(4, d);
        pst.setString(5, des);
        
        pst.executeUpdate();
        response.sendRedirect("index.jsp?msg=success");
        
    } catch(SQLIntegrityConstraintViolationException ex) {
        // Handle duplicate username
        out.println("<h3>Error: Username already exists. <a href='register.jsp'>Try again</a></h3>");
    } catch(Exception ex) {
        out.println("Database Error: " + ex.getMessage());
    }
%>