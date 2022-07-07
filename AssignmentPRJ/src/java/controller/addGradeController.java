/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.AccountDBContext;
import dal.AssessmentDBContext;
import dal.GroupDBContext;
import dal.StudentAssessmentDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Arrays;
import model.Account;
import model.Assessment;
import model.Course;
import model.Group;
import model.Student_Assessment;

/**
 *
 * @author minh huong
 */
public class addGradeController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Account teacher = (Account) session.getAttribute("teacher");
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
            AssessmentDBContext assDB = new AssessmentDBContext();
            ArrayList<Student_Assessment> listValueScore = saDB.listAssessmentOfGroup(courseID, groupName);
            ArrayList<Account> stus = accDB.listStudentInGroup(groupName, courseID);
            ArrayList<Assessment> asses = assDB.listAssByCourseID(courseID);
            request.setAttribute("listValueScore", listValueScore);
            request.setAttribute("stus", stus);
            request.setAttribute("asses", asses);
        }
        request.getRequestDispatcher("addGrade.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String groupName = request.getParameter("name");
        StudentAssessmentDBContext saDB = new StudentAssessmentDBContext();
        String courseID = request.getParameter("courseID");
        String[] components = request.getParameterValues("component");
        if (components != null) {
            ArrayList<Student_Assessment> exams = new ArrayList<>();
            for (String component : components) {
                String sid = component.split("_")[0];
                String aid = component.split("_")[1];
                Student_Assessment e = new Student_Assessment();
                String eid = request.getParameter("eid" + sid + "_" + aid);
                e.setSaid(Integer.parseInt(eid));
                String score = request.getParameter("score" + sid + "_" + aid);
                if (score.length() > 0) {
                    e.setValue(Float.parseFloat(score));
                } else {
                    e.setValue(-100);
                }
                Account s = new Account();
                s.setUsername(sid);
                Assessment a = new Assessment();
                a.setGradeCategory(aid);
                e.setAssessment(a);
                e.setStudent(s);
                exams.add(e);
            }
            for (Student_Assessment exam : exams) {
                response.getWriter().println("said: "+exam.getSaid()+" value: "+exam.getValue());
            }
            saDB.saveChanges(exams);
//            response.getWriter().print("addGrade?groupName="+groupName+"&courseID="+courseID);
            response.sendRedirect("addGrade?groupName="+groupName+"&courseID="+courseID);
        }
    }

}
