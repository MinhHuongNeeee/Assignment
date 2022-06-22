/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import com.oracle.wls.shaded.org.apache.bcel.generic.AALOAD;
import dal.StudentDBContext;
import dal.StudyDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import model.Student;
import model.Study;

/**
 *
 * @author minh huong
 */
public class gradeSemesterController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
//        PrintWriter out = response.getWriter();
//        out.print("test");
        StudentDBContext DBStudent = new StudentDBContext();
        // username nay la cua con student login dzo
        Student stu = DBStudent.getStudentByUserName("huonglmhe160632");
        request.setAttribute("student", stu);
        StudyDBContext DBStudy= new StudyDBContext();
        ArrayList<Study> studyList= DBStudy.getListByUserName("huonglmhe160632");
        request.setAttribute("studyList", studyList);
        request.getRequestDispatcher("gradeSemester.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

}
