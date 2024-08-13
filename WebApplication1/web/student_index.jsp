<%-- 
    Document   : student_index
    Created on : 2 Dec 2023, 4:27:58 pm
    Author     : Kiy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<%@ page import="SetGet.StudentData" %>

<%
    HttpSession sessions = request.getSession();
    StudentData student = (StudentData) sessions.getAttribute("student");

    if (student != null) {
%>
        <!DOCTYPE html>
        <html>
<head>
    <title>Student Index</title>
    <style>
        /* Global Styles */
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-image: url('3334708.jpg'); /* Replace with your background image URL */
            background-size: cover;
            background-repeat: no-repeat;
            background-attachment: fixed;
        }

        /* Header Styles */
        .header-container {
            background-color: #ffe4e1; /* Light pink background for the header */
            padding: 20px;
            text-align: center;
            position: relative;
        }

        .logout-button {
            position: absolute;
            top: 40px; /* Adjust this value to move the button up or down */
            right: 20px; /* Adjust this value to move the button left or right */
            text-decoration: none;
            background-color: #0073e6; /* Blue background for the button */
            color: #fff; /* White text color for the button */
            padding: 10px 20px;
            border-radius: 5px;
        }
        .student-title {
    font-size: 28px; /* Adjust the font size as needed */
    color: #950353; 
    font-style: italic;
}

        /* Student Profile Styles */
        .student-container {
            background-color: #fff; /* White background for student container */
            padding: 30px;
            margin: 90px auto;
            max-width: 600px; /* Maximum width for the student container */
            border-radius: 10px;
        }

        .student-profile {
            background-color: #ffe4e1; /* Light pink background for student profile boxes */
            padding: 20px;
            margin: 10px 0;
            border-radius: 5px;
        }

        /* Center-align the Student Profile title */
        .student-title {
            text-align: center;
        }

        /* Responsive Styles */
        @media screen and (max-width: 768px) {
            .student-container {
                width: 90%;
                padding: 10px;
            }
        }
    </style>
</head>
<body>
    <div class="header-container">
        <h1 style="background-color: #ffe4e1;">Welcome, <%= student.getMatrixNum() %></h1>
        <a class="logout-button" href="LogoutServlet">Logout</a>
    </div>
    <div class="student-container">
        <h3 class="student-title">Student Profile</h3>
        <div class="student-profile">
            <strong>ID:</strong> <%= student.getId() %>
        </div>
        <div class="student-profile">
            <strong>Name:</strong> <%= student.getName() %>
        </div>
        <div class="student-profile">
            <strong>Age:</strong> <%= student.getAge() %>
        </div>
        <div class="student-profile">
            <strong>Matrix Number:</strong> <%= student.getMatrixNum() %>
        </div>
        <div class="student-profile">
            <strong>Course:</strong> <%= student.getCourse() %>
        </div>
         <div class="student-profile">
            <strong>Faculty:</strong> <%= student.getFaculty() %>
        </div>
        <div class="student-profile">
            <strong>Mentor:</strong> <%= student.getMentor() %>
        </div>
        <div class="student-profile">
            <strong>Address:</strong> <%= student.getAddress() %>
        </div>
        <div class="student-profile">
            <strong>Phone Number:</strong> <%= student.getPhoneNum() %>
        </div>
        <!-- Add more profile details here -->
    </div>
</body>
</html>


<%
    } else {
        // Redirect to login page or display an error message
        response.sendRedirect("index.html?error=2");
    }
%>

