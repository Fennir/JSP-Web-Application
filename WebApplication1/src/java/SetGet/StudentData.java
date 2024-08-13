/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package SetGet;

/**
 *
 * @author Kiy
 */
public class StudentData {
    private int id; // PK unique identifier
    private String name;
    private String matrixNum;
    private String course;
    private String mentor;
    private String address;
    private int age;
    private String phoneNum;
    private String faculty;

    public StudentData() {
        // Default constructor
    }

    public StudentData(int id, String name, String matrixNum, String course, String mentor, String address, int age, String phoneNum, String faculty) {
        this.id = id;
        this.name = name;
        this.matrixNum = matrixNum;
        this.course = course;
        this.mentor = mentor;
        this.address = address;
        this.age = age;
        this.phoneNum = phoneNum;
        this.faculty = faculty;
    }

    public StudentData(String name, String matrixNum, String course, String mentor, String address, int age, String phoneNum, String faculty) {
        this.name = name;
        this.matrixNum = matrixNum;
        this.course = course;
        this.mentor = mentor;
        this.address = address;
        this.age = age;
        this.phoneNum = phoneNum;
        this.faculty = faculty;
    }

    // Add getters and setters for each field

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getMatrixNum() {
        return matrixNum;
    }

    public void setMatrixNum(String matrixNum) {
        this.matrixNum = matrixNum;
    }

    public String getCourse() {
        return course;
    }

    public void setCourse(String course) {
        this.course = course;
    }

    public String getMentor() {
        return mentor;
    }

    public void setMentor(String mentor) {
        this.mentor = mentor;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public String getPhoneNum() {
        return phoneNum;
    }

    public void setPhoneNum(String phoneNum) {
        this.phoneNum = phoneNum;
    }

    public String getFaculty() {
        return faculty;
    }

    public void setFaculty(String faculty) {
        this.faculty = faculty;
    }

}
