<%@ page import="java.util.List" %>
<%@ page import="SetGet.StudentData" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>

<%
    HttpSession sessions = request.getSession();
    Boolean isAdmin = (Boolean) sessions.getAttribute("isAdmin");
    if (isAdmin != null && isAdmin) {
        // Admin is authenticated, display admin module content
%>
        <!-- Admin module content goes here -->
<!DOCTYPE html>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Students</title>
    <style>
        body {
            background-image: url('3334708.jpg'); /* 'background.jpg'  */
            background-size: cover;
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }

        .header-container {
            background-color: rgba(0, 0, 0, 0.6); /* Black transparent square */
            color: #fff;
            padding: 20px;
            text-align: center;
            position: relative;
        }

        .header-text {
            font-size: 24px;
            margin: 0;
            padding: 0;
        }

        h2 {
            margin: 0;
        }

        a {
            float: right;
            margin-right: 20px;
            margin-top: 10px; 
            text-decoration: none;
            color: #fff;
            background-color: #0074cc;
            padding: 5px 15px;
            border-radius: 5px;
        }

        a:hover {
            background-color: #0056b3;
        }

        form {
            text-align: left; /* Align search to the left */
            margin-top: 20px;
            margin-left: 20px; /* margin to the left */
        }

        label {
            color: #fff;
        }

        input[type="text"] {
            padding: 5px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        input[type="submit"] {
            background-color: #0074cc;
            color: #fff;
            border: none;
            padding: 5px 15px;
            border-radius: 5px;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #0056b3;
        }

        table {
            margin: 20px auto;
            background-color: rgba(255, 255, 255, 0.8);
            border-collapse: collapse;
            width: 90%;
            border: 1px solid black; /* border black */
        }

        th, td {
            padding: 10px;
            text-align: left;
        }

        th {
            background-color: #0074cc;
            color: #fff;
        }

        .table-border-bottom {
            border-bottom: 1px solid black; /* border below the table */
        }

        
        tr:nth-child(odd) {
            background-color: #FCAEDA;
        }

       
        tr:nth-child(even) {
            background-color: #FFFFFF;
        }

        tr:hover {
            background-color: #E1EABE;
        }

        .edit-btn, .delete-btn {
            padding: 10px 15px; 
            border: none;
            border-radius: 5px;
            cursor: pointer;
            margin-right: 10px; /* margin between buttons */
        }

        /* Inline CSS to change button colors */
        .edit-btn {
            background-color: blue; /* update blue */
            color: #fff;
        }

        .delete-btn {
            background-color: red; /* delete red */
            color: #fff;
        }
    </style>
</head>
<body>
    <div class="header-container">
        <h2 class="header-text">LIST OF STUDENTS</h2>
    </div>
    
    <a href="admin_index.jsp">Back to Home</a>
    
    <!-- search by by name -->
    <form action="ViewStudentServlet" method="post">
        <label for="searchQuery">Search:</label>
        <input type="text" id="searchQuery" name="searchQuery">
        <input type="submit" value="Search">
    </form>
    
    <% List<StudentData> students = (List<StudentData>) request.getAttribute("students");
       if (students != null && !students.isEmpty()) { %>
        <div class="table-container">
            <table border="1" class="table-border-bottom">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Matrix Number</th>
                        <th>Course</th>
                        <th>Mentor</th>
                        <th>Address</th>
                        <th>Age</th>
                        <th>Phone Number</th>
                        <th>Faculty</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <% for (StudentData student : students) { %>
                        <tr>
                            <td><%= student.getId() %></td>
                            <td><%= student.getName() %></td>
                            <td><%= student.getMatrixNum() %></td>
                            <td><%= student.getCourse() %></td>
                            <td><%= student.getMentor() %></td>
                            <td><%= student.getAddress() %></td>
                            <td><%= student.getAge() %></td>
                            <td><%= student.getPhoneNum() %></td>
                            <td><%= student.getFaculty() %></td>
                            <td>
                                <button class="edit-btn" onclick="location.href='updateStudentForm.jsp?id=<%= student.getId()%>'">Update</button><br><br>
                                <button class="delete-btn" onclick="confirmDeletion(<%= student.getId()%>)">Delete</button>
                            </td>
                        </tr>
                    <% } %>
                </tbody>
            </table>
        </div>
    <% } else { %>
        <p>No students found.</p>
    <% } %>
    
    <script>
        function confirmDeletion(studentId) {
            var confirmation = confirm("Are you sure you want to delete this student?");
            if (confirmation) {
                // Proceed with deletion
                location.href = 'DeleteStudentServlet?id=' + studentId + '&delete=true';
            } else {
                
            }
        }
    </script>
</body>
</html>


<%
    } else {
        // Redirect to login page or display an error message
        response.sendRedirect("index.html?error=2");
    }
%>
