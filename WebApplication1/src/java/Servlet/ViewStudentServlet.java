/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Servlet;

import DAO.DatabaseDAO;
import SetGet.StudentData;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;

/**
 *
 * @author Kiy
 */
public class ViewStudentServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
        
        HttpSession sessions = request.getSession();
        Boolean isAdmin = (Boolean) sessions.getAttribute("isAdmin");
        if (isAdmin != null && isAdmin) {
        // Admin is authenticated, display admin module content  
        
             // Retrieve the search query from the form
            String searchQuery = request.getParameter("searchQuery");

            // Call the DAO method to search for students
            List<StudentData> students = DatabaseDAO.getStudentByQuery(searchQuery);

            if (!students.isEmpty()) {
                // Connection successful, proceed with other actions
                request.setAttribute("students", students);
                request.getRequestDispatcher("/viewStudent.jsp").forward(request, response);
            } else {
                // Handle the case where no students are found
                // Display a pop-up alert
                out.println("<script>");
                out.println("alert('No student were found');");
                out.println("window.location.replace('StudentServlet');");
                out.println("</script>");
            }
            
        } else {
        // Redirect to login page or display an error message
        response.sendRedirect("index.html?error=2");
        }      
            
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
