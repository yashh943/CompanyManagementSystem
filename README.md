# CompanyManagementSystem
Company Management System

This is a web-based application built using JSP (JavaServer Pages) and MySQL.
It serves as a portal for company employees and administrators to manage registration, authentication, and view the company directory.

🚀 Features

1. User Authentication (Login)

File: index.jsp

Provides a secure login interface for employees.

Validates credentials against the MySQL database.

Redirects successful logins to the Dashboard and failed attempts back to login with an error message.

2. Employee Registration

File: register.jsp

Allows new employees to create an account.

Fields: Username, Password, Email, Department, Designation.

Prevents duplicate username registration.

3. Employee Dashboard (Directory)

File: dashboard.jsp

Acts as the main homepage after login.

Displays a tabular list of all registered employees.

Shows: ID, Name, Email, Department, and Designation.

Protected page: Redirects to login if a user tries to access it without logging in.

4. Database Connection

File: db_config.jsp

Centralized database configuration.

Handles JDBC connection, MySQL credentials, and driver loading.

🛠️ Technologies Used

Frontend: HTML, CSS, JSP

Backend: Java (JSP Scriptlets), JDBC

Database: MySQL 8.0

Server: Apache Tomcat 9.0 (compatible with 10.x with adjustments)

IDE: Notepad / VS Code / IntelliJ (No build tools required)

📂 Project Structure

When deploying to Tomcat, the folder structure inside apache-tomcat/webapps/ must look like this:

CompanyApp/
├── WEB-INF/
│   └── lib/
│       └── mysql-connector-j-8.x.x.jar  <-- JDBC Driver here
├── index.jsp           (Login Page)
├── register.jsp        (Registration Form)
├── dashboard.jsp       (Main View)
├── process_login.jsp   (Backend Logic)
├── process_register.jsp(Backend Logic)
├── logout.jsp          (Session Cleanup)
├── db_config.jsp       (DB Settings)
└── README.md


⚙️ Database Schema

Run the following SQL commands in your MySQL Workbench or Command Line Client to set up the database before running the app.

-- 1. Create the Database
CREATE DATABASE IF NOT EXISTS company_db;

-- 2. Select the Database
USE company_db;

-- 3. Create the Employees Table
CREATE TABLE IF NOT EXISTS employees (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(50) NOT NULL,
    email VARCHAR(100),
    department VARCHAR(100),
    designation VARCHAR(100)
);

-- 4. Insert a Demo Admin User
INSERT INTO employees (username, password, email, department, designation) 
VALUES ('admin', 'admin123', 'admin@company.com', 'Management', 'HR Manager');


🚀 How to Run

Database Setup: Execute the SQL script above in your MySQL environment.

Tomcat Setup:

Download and Install Apache Tomcat 9.

Navigate to the webapps folder inside the Tomcat installation.

Create a folder named CompanyApp.

Deploy Code:

Copy all .jsp files into the CompanyApp folder.

Create a folder path WEB-INF/lib/ inside CompanyApp.

Paste the mysql-connector-j-8.x.x.jar into WEB-INF/lib/.

Start Server:

Go to apache-tomcat/bin in your terminal.

Run startup.bat (Windows) or ./startup.sh (Mac/Linux).

Tip: Use catalina.bat run to see logs in the console.

Access Application:

Open browser and visit: http://localhost:8080/CompanyApp

🔧 Troubleshooting

Error: "Address already in use"

Change the port in conf/server.xml from 8080 to 8081.

Error: "Class Not Found com.mysql.cj.jdbc.Driver"

Ensure the MySQL JAR file is correctly placed in CompanyApp/WEB-INF/lib/.

Restart the Tomcat server after adding the JAR.
