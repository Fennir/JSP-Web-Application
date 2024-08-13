<%-- 
    Document   : admin_index
    Created on : 2 Dec 2023, 2:25:59 pm
    Author     : Kiy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="jakarta.servlet.http.HttpSession" %>

<%
    HttpSession sessions = request.getSession();
    Boolean isAdmin = (Boolean) sessions.getAttribute("isAdmin");
    if (isAdmin != null && isAdmin) {
        // Admin is authenticated, display admin module content
%>
        <!-- Admin module content goes here -->
<html>
<head>
    <title>Welcome Admin</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            background-image: url('3334708.jpg'); /* Replace 'your-background-image.jpg' with your actual background image URL */
            background-size: cover;
            background-position: center;
            font-family: Arial, sans-serif;
            color: white;
        }

        .container {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            text-align: center;
            background-color: rgba(0, 0, 0, 0.7);
            padding: 60px;
            border-radius: 10px;
        }

        .container h1 {
            font-size: 36px;
            margin: 0;
        }

        .container p {
            font-size: 24px;
            margin: 20px 0;
        }

        .btn {
            display: inline-block;
            padding: 10px 20px;
            background-color: #3498db;
            border: none;
            color: white;
            font-size: 18px;
            text-decoration: none;
            margin: 10px;
            border-radius: 5px;
        }

        .btn:hover {
            background-color: #2980b9;
        }

        .logout-btn {
            position: absolute;
            top: 10px;
            right: 10px; /* Position to the top right corner */
        }
    </style>
</head>
<body>
    <a href="LogoutServlet" class="logout-btn btn">Logout</a>
    <div class="container">
        <h1>WELCOME ADMIN</h1><br>
        <p>Manage Students Portals</p><br>
        <a href="StudentServlet" class="btn">View Students</a>
        <a href="addStudentForm.jsp" class="btn">Add Students</a>
    </div>
</body>
</html>


<%
    } else {
        // Redirect to login page or display an error message
        response.sendRedirect("index.html?error=2");
    }
%>