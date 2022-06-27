/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.StudyDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Account;
import model.Student_Assessment;
import model.Study;
import org.apache.tomcat.jni.SSLContext;

/**
 *
 * @author minh huong
 */
public class viewGradeController extends HttpServlet {

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
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet viewGradeController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet viewGradeController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        StudyDBContext StudyDB = new StudyDBContext();
        HttpSession session = request.getSession();
        String userName = ((Account) session.getAttribute("student")).getUsername();
        ArrayList<Study> studyList = StudyDB.getListByUserName(userName);
        session.setAttribute("studyList", studyList);
        String term = request.getParameter("term");
        if (term != null) {
            ArrayList<Study> studyListToShowCourseID = StudyDB.getListByUserNameAndTerm(userName, term);
            request.setAttribute("studyListToShowCourseID", studyListToShowCourseID);
        }
        String courseID = request.getParameter("courseID");
        if (courseID != null) {            
            ArrayList<Student_Assessment> sta = StudyDB.listValueScore(userName, courseID);
            float grade=0;
            String status="";
            for (Student_Assessment stua : sta) {
                grade += stua.getTotal();
            }
            if (grade>=5 ) status="PASSED";
            else status="notpass";
            request.setAttribute("listValueScore", sta);
            request.setAttribute("status", status);
            request.setAttribute("grade", grade);
        }
        request.getRequestDispatcher("gradeSemester.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

}
