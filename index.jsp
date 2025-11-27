<%@ include file="db_config.jsp" %>
<%
    // Security Guard
    String currentUser = (String) session.getAttribute("user");
    String currentDept = (String) session.getAttribute("dept");
    String currentRole = (String) session.getAttribute("role");

    if(currentUser == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Company Dashboard</title>
    <style>
        body { font-family: 'Segoe UI', sans-serif; padding: 0; margin: 0; background-color: #f8f9fa; }
        .navbar { background-color: #34495e; color: white; padding: 15px 30px; display: flex; justify-content: space-between; align-items: center; }
        .logo { font-size: 24px; font-weight: bold; }
        .user-info { font-size: 14px; }
        .logout-btn { background-color: #e74c3c; color: white; padding: 8px 15px; text-decoration: none; border-radius: 4px; font-weight: bold; }
        
        .container { padding: 30px; max-width: 1000px; margin: 0 auto; }
        .card { background: white; padding: 20px; border-radius: 8px; box-shadow: 0 2px 5px rgba(0,0,0,0.05); margin-bottom: 20px; }
        
        table { width: 100%; border-collapse: collapse; margin-top: 15px; }
        th, td { padding: 15px; text-align: left; border-bottom: 1px solid #eee; }
        th { background-color: #f1f2f6; color: #333; }
        tr:hover { background-color: #fafafa; }
    </style>
</head>
<body>
    <div class="navbar">
        <div class="logo">Company<span style="color:#3498db">Sys</span></div>
        <div class="user-info">
            Welcome, <strong><%= currentUser %></strong> | <%= currentRole %> (<%= currentDept %>)
        </div>
        <a href="logout.jsp" class="logout-btn">Logout</a>
    </div>

    <div class="container">
        <div class="card">
            <h3>Employee Directory</h3>
            <table>
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Email</th>
                        <th>Department</th>
                        <th>Designation</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        loadDriver();
                        try (Connection con = DriverManager.getConnection(url, dbUser, dbPass);
                             Statement stmt = con.createStatement();
                             ResultSet rs = stmt.executeQuery("SELECT * FROM employees ORDER BY id DESC")) {

                            while(rs.next()) {
                    %>
                                <tr>
                                    <td>#<%= rs.getInt("id") %></td>
                                    <td><%= rs.getString("username") %></td>
                                    <td><%= rs.getString("email") %></td>
                                    <td><%= rs.getString("department") %></td>
                                    <td><%= rs.getString("designation") %></td>
                                </tr>
                    <%
                            }
                        } catch(Exception e) {
                            out.println("<tr><td colspan='5'>Error loading data: " + e.getMessage() + "</td></tr>");
                        }
                    %>
                </tbody>
            </table>
        </div>
    </div>
</body>
</html>