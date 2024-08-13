<%-- 
    Document   : updateStudentForm
    Created on : 2 Dec 2023, 12:42:19 am
    Author     : Kiy
--%>

<%@ page import="java.util.List" %>
<%@ page import="SetGet.StudentData" %>
<%@ page import="DAO.DatabaseDAO" %>

<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>


<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ page import="jakarta.servlet.http.HttpSession" %>

<%
    HttpSession sessions = request.getSession();
    Boolean isAdmin = (Boolean) sessions.getAttribute("isAdmin");
    if (isAdmin != null && isAdmin) {
        // Admin is authenticated, display admin module content
%>
        <!-- Admin module content goes here -->

<%
    int studentId = Integer.parseInt(request.getParameter("id")); 
    // Get student data by ID
    StudentData student = DatabaseDAO.getStudentById(studentId);
    // Get student data by ID
%>    

<!DOCTYPE html>
<html>
<head>
    <title>Update Student</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            background-image: url('3334708.jpg'); /* Replace 'your-background-image.jpg' with your actual background image URL */
            background-size: cover;
            background-position: center;
            font-family: Arial, sans-serif;
            color: #333; /* Text color */
        }

        .container {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            flex-direction: column;
        }

        .square {
            background-color: white;
            border-radius: 10px;
            padding: 50px;
            text-align: center;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
        }

        h2 {
            margin: 0;
            font-size: 28px;
            color: #FF9633;
        }

        form {
            display: flex;
            flex-direction: column;
            align-items: flex-start; /* Labels on the left, input fields on the right */
        }

        label {
            margin-bottom: 5px;
            font-size: 18px;
        }

        input[type="text"],
        input[type="number"],
        select {
            width: 350px;
            padding: 10px;
            border: 1px solid #FB028A;
            border-radius: 5px;
            margin-bottom: 10px; /* Add some spacing between fields */
        }

        select {
            appearance: none;
            background: #f7f7f7;
            padding: 10px 20px;
            border: 1px solid #000000;
            border-radius: 5px;
            cursor: pointer;
        }

        .button-container {
            display: flex;
            justify-content: space-between;
            width: 100%;
            margin-top: 20px;
        }

        input[type="submit"] {
            background-color: #3498db;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            font-size: 18px;
            cursor: pointer;
            margin-right: 10px; /* Add margin to the right */
        }

        input[type="submit"]:hover {
            background-color: #2980b9;
        }

        .back-to-home-button {
            display: inline-block;
            background-color: #3498db;
            color: white;
            padding: 10px 20px; /* Adjust padding */
            border: none;
            border-radius: 5px;
            font-size: 18px;
            cursor: pointer;
            text-decoration: none;
            margin-top: 0; /* Remove extra margin */
        }

        .back-to-home-button:hover {
            background-color: #2980b9;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="square">
            <h2><b><i>Update Student<i><b></h2><br><br>
            <form action="UpdateStudentServlet" method="post">
                <label for="studentId">Student ID:</label>
                <input type="text" id="studentId" name="studentId" value="<%= student.getId() %>" readonly>

                <!-- Add other form fields -->
                <br>

                <label for="studentName">Student Name:</label>
                <input type="text" id="studentName" name="studentName" value="<%= student.getName() %>">
                <br>

                <label for="studentMatrixNum">Matrix Number:</label>
                <input type="text" id="studentMatrixNum" name="studentMatrixNum" value="<%= student.getMatrixNum() %>">
                <br>

                <label for="studentFaculty">Student Faculty:</label>
                <select id="studentFaculty" name="studentFaculty">
                    <option value="<%= student.getFaculty() %>"><%= student.getFaculty() %></option>
                    <option value="INFORMATION SCIENCE AND COMPUTING">INFORMATION SCIENCE AND COMPUTING</option>
                    <option value="MEDIA SCIENCE AND GRAPHIC">MEDIA SCIENCE AND GRAPHIC</option>
                    <option value="ENGINEERING AND TECHNOLOGY">ENGINEERING AND TECHNOLOGY</option>
                </select>
                <br>

                <label for="studentCourse">Student Course:</label>
                <select id="studentCourse" name="studentCourse">
                    <option value="<%= student.getCourse() %>"><%= student.getCourse() %></option>
                    <option value="BACHELOR IN COMPUTER SCIENCE">BACHELOR IN COMPUTER SCIENCE</option>
                    <option value="BACHELOR IN INFORMATION AND COMMUNICATION TECHNOLOGY">BACHELOR IN INFORMATION AND COMMUNICATION TECHNOLOGY</option>
                    <option value="BACHELOR IN COMPUTER FORENSIC">BACHELOR IN COMPUTER FORENSIC</option>
                    <option value="BACHELOR IN GRAPHIC DESIGN">BACHELOR IN GRAPHIC DESIGN</option>
                    <option value="BACHELOR IN GAMES DESIGN AND ANIMATION">BACHELOR IN GAMES DESIGN AND ANIMATION</option>
                    <option value="BACHELOR IN COMPUTER ENGINEERING">BACHELOR IN COMPUTER ENGINEERING</option>
                    <option value="BACHELOR IN TECHNOLOGY (ELECTRICAL AND ELECTRONIC)">BACHELOR IN TECHNOLOGY (ELECTRICAL AND ELECTRONIC)</option>
                </select>
                <br>

                <label for="studentMentor">Mentor:</label>
                <input type="text" id="studentMentor" name="studentMentor" value="<%= student.getMentor() %>">
                <br>

                <label for="studentAddress">Address:</label>
                <input type="text" id="studentAddress" name="studentAddress" value="<%= student.getAddress() %>">
                <br>

                <label for="studentAge">Age:</label>
                <input type="number" id="studentAge" name="studentAge" value="<%= student.getAge() %>">
                <br>

                <label for="studentPhoneNum">Phone Number:</label>
                <input type="text" id="studentPhoneNum" name="studentPhoneNum" value="<%= student.getPhoneNum() %>">
                <br>

                <div class="button-container">
                    <input type="submit" value="Update Student">
                    <a class="back-to-home-button" href="StudentServlet">Back</a>
                </div>
            </form>
        </div>
    </div>
</body>
</html>
<%
    } else {
        // Redirect to login page or display an error message
        response.sendRedirect("index.html?error=2");
    }
%>