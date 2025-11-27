<!DOCTYPE html>
<html>
<head>
    <title>Employee Registration</title>
    <style>
        body { font-family: 'Segoe UI', sans-serif; background-color: #e9ecef; display: flex; justify-content: center; align-items: center; height: 100vh; margin: 0; }
        .reg-box { background: white; padding: 40px; border-radius: 10px; box-shadow: 0 4px 15px rgba(0,0,0,0.1); width: 350px; }
        h2 { text-align: center; color: #2c3e50; margin-bottom: 25px; }
        input, select { width: 100%; padding: 12px; margin: 8px 0; border: 1px solid #ddd; border-radius: 5px; box-sizing: border-box; }
        button { width: 100%; padding: 12px; background: #27ae60; color: white; border: none; border-radius: 5px; cursor: pointer; font-size: 16px; margin-top: 10px; }
        button:hover { background: #219150; }
        .link { text-align: center; display: block; margin-top: 15px; text-decoration: none; color: #7f8c8d; }
    </style>
</head>
<body>
    <div class="reg-box">
        <h2>Employee Onboarding</h2>
        <form action="process_register.jsp" method="post">
            <input type="text" name="username" placeholder="Username" required>
            <input type="password" name="password" placeholder="Password" required>
            <input type="email" name="email" placeholder="Company Email" required>
            <input type="text" name="department" placeholder="Department (e.g., IT, HR)" required>
            <input type="text" name="designation" placeholder="Designation (e.g., Developer)" required>
            <button type="submit">Complete Registration</button>
        </form>
        <a href="index.jsp" class="link">Back to Login</a>
    </div>
</body>
</html>