/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.StudentAssessmentDBContext;
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
public class gradeSemesterController extends HttpServlet {

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
        StudyDBContext StudyDB = new StudyDBContext();
        StudentAssessmentDBContext sa= new StudentAssessmentDBContext();        
        HttpSession session = request.getSession();
        String userName = ((Account) session.getAttribute("acc")).getUsername();
        ArrayList<Study> studyList = StudyDB.getListByUserName(userName);
        session.setAttribute("studyList", studyList);
        String term = request.getParameter("term");
        if (term != null) {
            ArrayList<Study> studyListToShowCourseID = StudyDB.getListByUserNameAndTerm(userName, term);
            request.setAttribute("studyListToShowCourseID", studyListToShowCourseID);
        }
        String courseID = request.getParameter("courseID");

        if (courseID != null) {
            ArrayList<Student_Assessment> sta = sa.listValueScore(userName, courseID);
            float grade = 0;
            int status =0;
            for (Student_Assessment stua : sta) {
                grade += stua.getTotal();
                
            }
            grade=(float) (Math.round(grade*100.0)/100.0);
            if(grade >=5) status=1;
            else if (grade<5 && grade >=0) status=0;
            else status=-1;
            request.setAttribute("listValueScore", sta);
            request.setAttribute("grade", grade);
            request.setAttribute("status", status);
        }

        request.getRequestDispatcher("gradeSemester.jsp").forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

}
