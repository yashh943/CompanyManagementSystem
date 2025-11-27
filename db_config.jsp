<%@ page import="java.sql.*" %>
<%! 
    // Database credentials
    String url = "jdbc:mysql://localhost:3306/company_db?useSSL=false&serverTimezone=UTC&allowPublicKeyRetrieval=true";
    String dbUser = "root";
    String dbPass = "kiet@270"; 
    
    // Helper to load driver
    public void loadDriver() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }
%>