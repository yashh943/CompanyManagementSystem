<!DOCTYPE html>
<html>
<head>
    <title>Company Login</title>
    <style>
        body { font-family: 'Segoe UI', sans-serif; background-color: #e9ecef; display: flex; justify-content: center; align-items: center; height: 100vh; margin: 0; }
        .login-box { background: white; padding: 40px; border-radius: 10px; box-shadow: 0 4px 15px rgba(0,0,0,0.1); width: 320px; }
        h2 { text-align: center; color: #2c3e50; margin-bottom: 25px; }
        input { width: 100%; padding: 12px; margin: 10px 0; border: 1px solid #ddd; border-radius: 5px; box-sizing: border-box; }
        button { width: 100%; padding: 12px; background: #34495e; color: white; border: none; border-radius: 5px; cursor: pointer; font-size: 16px; transition: 0.3s; }
        button:hover { background: #2c3e50; }
        .alert { text-align: center; margin-bottom: 15px; font-size: 14px; }
        .error { color: #e74c3c; }
        .success { color: #27ae60; }
        .link { text-align: center; display: block; margin-top: 15px; text-decoration: none; color: #3498db; }
    </style>
</head>
<body>
    <div class="login-box">
        <h2>Company Portal</h2>
        
        <% 
            String msg = request.getParameter("msg");
            if("error".equals(msg)) out.println("<p class='alert error'>Invalid Username or Password</p>");
            if("success".equals(msg)) out.println("<p class='alert success'>Registration Successful! Login now.</p>");
        %>

        <form action="process_login.jsp" method="post">
            <input type="text" name="username" placeholder="Employee ID / Username" required>
            <input type="password" name="password" placeholder="Password" required>
            <button type="submit">Secure Login</button>
        </form>
        
        <a href="register.jsp" class="link">New Employee? Register Here</a>
    </div>
</body>
</html>