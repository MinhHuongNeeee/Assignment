/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.AccountDBContext;
import dal.AssessmentDBContext;
import dal.GroupDBContext;
import dal.StudentAssessmentDBContext;
import dal.StudyDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import model.Account;
import model.Assessment;
import model.Group;
import model.Student_Assessment;
import model.Study;

/**
 *
 * @author minh huong
 */
public class viewGradeController extends BaseAuthenticationController {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Account teacher = (Account) session.getAttribute("acc");
        GroupDBContext GroupDB = new GroupDBContext();
        ArrayList<Group> groups = GroupDB.list(teacher.getUsername());
        request.setAttribute("groupName", groups);
        String groupName = request.getParameter("groupName");
        request.setAttribute("name", groupName);
        if (groupName != null) {
            ArrayList<Group> groupList = GroupDB.listCourseByGroup(teacher.getUsername(), groupName);
            request.setAttribute("groupList", groupList);
        }
        String courseID = request.getParameter("courseID");
        request.setAttribute("courseID", courseID);
        StudentAssessmentDBContext saDB = new StudentAssessmentDBContext();
        if (courseID != null) {
            AccountDBContext accDB = new AccountDBContext();
            StudyDBContext studyDB = new StudyDBContext();
            AssessmentDBContext assDB = new AssessmentDBContext();
            ArrayList<Student_Assessment> listValueScore = saDB.listAssessmentOfGroup(courseID, groupName);
            ArrayList<Account> stus = accDB.listStudentInGroup(groupName, courseID);
            ArrayList<Assessment> asses = assDB.listAssByCourseID(courseID);
            ArrayList<Study> listGrade = studyDB.listGrade();
            request.setAttribute("listValueScore", listValueScore);
            request.setAttribute("stus", stus);
            request.setAttribute("asses", asses);
            request.setAttribute("listGrade", listGrade);
        }
        request.getRequestDispatcher("viewGrade.jsp").forward(request, response);

    }


    @Override
    protected void processGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void processPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

}
