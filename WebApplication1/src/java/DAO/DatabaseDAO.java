/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

/**
 *
 * @author Kiy
 */
import SetGet.StudentData;

import java.sql.DriverManager;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class DatabaseDAO {

    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/csc?zeroDateTimeBehavior=CONVERT_TO_NULL";
    private static final String JDBC_USER = "root";
    private static final String JDBC_PASSWORD = "admin";

    static {
        // Load the JDBC driver when the class is loaded
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    public static Connection getConnection() throws SQLException {
        return DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD);
    }

   public static List<StudentData> getAllStudents() {
    List<StudentData> students = new ArrayList<>();

    try (Connection con = DatabaseDAO.getConnection();
         Statement stmt = con.createStatement();
         ResultSet resultSet = stmt.executeQuery("SELECT * FROM student")) {

        while (resultSet.next()) {
            StudentData student = new StudentData();
            student.setId(resultSet.getInt("student_id"));
            student.setName(resultSet.getString("student_name"));
            student.setMatrixNum(resultSet.getString("student_matrixNum"));
            student.setCourse(resultSet.getString("student_course"));
            student.setMentor(resultSet.getString("student_mentor"));
            student.setAddress(resultSet.getString("student_address"));
            student.setAge(resultSet.getInt("student_age"));
            student.setPhoneNum(resultSet.getString("student_phoneNum"));
            student.setFaculty(resultSet.getString("student_faculty"));

            students.add(student);
        }

    } catch (SQLException e) {
        e.printStackTrace();
    }

    return students;
}

   public static StudentData getStudentById(int studentId) {
    StudentData student = new StudentData();

    try (Connection con = DatabaseDAO.getConnection();
         PreparedStatement stmt = con.prepareStatement("SELECT * FROM student WHERE student_id = ?")) {

        stmt.setInt(1, studentId);

        try (ResultSet resultSet = stmt.executeQuery()) {
            if (resultSet.next()) {
                student.setId(resultSet.getInt("student_id"));
                student.setName(resultSet.getString("student_name"));
                student.setMatrixNum(resultSet.getString("student_matrixNum"));
                student.setCourse(resultSet.getString("student_course"));
                student.setMentor(resultSet.getString("student_mentor"));
                student.setAddress(resultSet.getString("student_address"));
                student.setAge(resultSet.getInt("student_age"));
                student.setPhoneNum(resultSet.getString("student_phoneNum"));
                student.setFaculty(resultSet.getString("student_faculty"));
            }
        }

    } catch (SQLException e) {
        e.printStackTrace();
    }

    return student;
}
   
   public static List<StudentData> getStudentByQuery(String searchQuery) {
    List<StudentData> students = new ArrayList<>();

    try (Connection con = DatabaseDAO.getConnection();
         PreparedStatement stmt = con.prepareStatement("SELECT * FROM student WHERE student_name LIKE ? or student_matrixNum LIKE ? or student_course LIKE ?"
                 +"ORDER BY student_id ASC")) {

        stmt.setString(1, "%" + searchQuery + "%");
        stmt.setString(2, "%" + searchQuery + "%");
        stmt.setString(3, "%" + searchQuery + "%");

        try (ResultSet resultSet = stmt.executeQuery()) {
            while (resultSet.next()) {
                StudentData student = new StudentData();
                student.setId(resultSet.getInt("student_id"));
                student.setName(resultSet.getString("student_name"));
                student.setMatrixNum(resultSet.getString("student_matrixNum"));
                student.setCourse(resultSet.getString("student_course"));
                student.setMentor(resultSet.getString("student_mentor"));
                student.setAddress(resultSet.getString("student_address"));
                student.setAge(resultSet.getInt("student_age"));
                student.setPhoneNum(resultSet.getString("student_phoneNum"));
                student.setFaculty(resultSet.getString("student_faculty"));

                students.add(student);
            }
        }

    } catch (SQLException e) {
        e.printStackTrace();
    }

    return students;
}


    public static int insertStudent(String studentName, String studentMatrixNum, String studentCourse, String studentMentor,
                                String studentAddress, int studentAge, String studentPhoneNum, String studentFaculty) {
    try (Connection con = DatabaseDAO.getConnection();
         PreparedStatement stmt = con.prepareStatement("INSERT INTO student (student_name, student_matrixNum, student_course, " +
                 "student_mentor, student_address, student_age, student_phoneNum, student_faculty) " +
                 "VALUES (?, ?, ?, ?, ?, ?, ?, ?)", Statement.RETURN_GENERATED_KEYS)) {

        stmt.setString(1, studentName);
        stmt.setString(2, studentMatrixNum);
        stmt.setString(3, studentCourse);
        stmt.setString(4, studentMentor);
        stmt.setString(5, studentAddress);
        stmt.setInt(6, studentAge);
        stmt.setString(7, studentPhoneNum);
        stmt.setString(8, studentFaculty);

        int affectedRows = stmt.executeUpdate();

        if (affectedRows > 0) {
            try (ResultSet generatedKeys = stmt.getGeneratedKeys()) {
                if (generatedKeys.next()) {
                    return generatedKeys.getInt(1);
                }
            }
        }

    } catch (SQLException e) {
        e.printStackTrace();
    }

    return -1;
}

    public static boolean updateStudentById(int studentId, String name, String matrixNum, String course, String mentor,
                                            String address, int age, String phoneNum, String faculty) {
        try (Connection con = DatabaseDAO.getConnection();
             PreparedStatement stmt = con.prepareStatement("UPDATE student SET student_name=?, student_matrixNum=?, student_course=?, " +
                     "student_mentor=?, student_address=?, student_age=?, student_phoneNum=?, student_faculty=?" +
                     "WHERE student_id=?")) {

            stmt.setString(1, name);
            stmt.setString(2, matrixNum);
            stmt.setString(3, course);
            stmt.setString(4, mentor);
            stmt.setString(5, address);
            stmt.setInt(6, age);
            stmt.setString(7, phoneNum);
            stmt.setString(8, faculty);
            stmt.setInt(9, studentId);

            return stmt.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return false;
    }

    public static boolean deleteStudentById(int studentId) {
        try (Connection con = DatabaseDAO.getConnection();
             PreparedStatement stmt = con.prepareStatement("DELETE FROM student WHERE student_id=?")) {

            stmt.setInt(1, studentId);

            return stmt.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return false;
    }
    
    public static StudentData verifyStudentLogin(String username, String password) {
    StudentData student = null;

    try (Connection con = getConnection();
         PreparedStatement stmt = con.prepareStatement("SELECT * FROM student WHERE student_matrixNum = ? AND student_matrixNum = ?")) {

        stmt.setString(1, username);
        stmt.setString(2, password);

        try (ResultSet resultSet = stmt.executeQuery()) {
            if (resultSet.next()) {
                student = new StudentData();
                student.setId(resultSet.getInt("student_id"));
                student.setName(resultSet.getString("student_name"));
                student.setMatrixNum(resultSet.getString("student_matrixNum"));
                student.setCourse(resultSet.getString("student_course"));
                student.setMentor(resultSet.getString("student_mentor"));
                student.setAddress(resultSet.getString("student_address"));
                student.setAge(resultSet.getInt("student_age"));
                student.setPhoneNum(resultSet.getString("student_phoneNum"));
                student.setFaculty(resultSet.getString("student_faculty"));
            }
        }

    } catch (SQLException e) {
        e.printStackTrace();
    }

    return student;
}

}//main class end
