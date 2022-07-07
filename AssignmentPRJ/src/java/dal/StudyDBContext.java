/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Account;
import model.Assessment;
import model.Course;
import model.Student_Assessment;
import model.Study;

/**
 *
 * @author minh huong
 */
public class StudyDBContext extends DBContext<Study> {

    //get courseID
    public ArrayList<Study> getListByUserNameAndTerm(String userName, String term) {
        ArrayList<Study> studyList = new ArrayList<>();
        try {

            String sql = "select s.courseID, courseName from Study s inner join Course c\n"
                    + "on s.courseID=c.courseID\n"
                    + "where s.semester=? and  username=?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, term);
            stm.setString(2, userName);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Account student = new Account();
                student.setUsername(userName);
                Course c = new Course();
                c.setCourseID(rs.getString("courseID"));
                c.setCourseName(rs.getString("courseName"));
                Study s = new Study();
                s.setStudent(student);
                s.setCourse(c);
                s.setSemester(term);
                studyList.add(s);
            }
        } catch (SQLException ex) {
            Logger.getLogger(StudyDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return studyList;
    }

    // get term order by asc
    public ArrayList<Study> getListByUserName(String userName) {
        ArrayList<Study> studyList = new ArrayList<>();
        try {
            String sql = "Select distinct semester,dateStart from Study \n"
                    + "where username=?\n"
                    + "order by dateStart asc";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, userName);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Account student = new Account();
                student.setUsername(userName);
                Study s = new Study();
                s.setStudent(student);
                s.setSemester(rs.getString("semester"));
                studyList.add(s);
            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return studyList;
    }

    public ArrayList<Study> getListForTranscript(String userName) {
        ArrayList<Study> studyList = new ArrayList<>();
        try {
            String sql = "with aa as (SELECT s.userName,s.courseID,courseName,s.dateStart,credit,a.gradeCategory,Weight,value ,(Weight *value)/100 as total \n"
                    + "FROM Course c\n"
                    + "left join Study s\n"
                    + "on s.courseID=c.courseID\n"
                    + "left join Assessment a \n"
                    + "on s.courseID=a.courseID\n"
                    + "left join Student_Assessment sa\n"
                    + "on s.courseID=sa.courseID and s.userName=sa.userName and a.gradeCategory=sa.gradeCategory\n"
                    + "where s.userName=?) \n"
                    + "select courseID,courseName,dateStart,credit,isnull(SUM(total),-1) as Grade from aa\n"
                    + "group by courseID,courseName,dateStart,credit\n"
                    + "order by dateStart asc";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, userName);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Account student = new Account();
                student.setUsername(userName);
                Course c= new Course();
                c.setCourseID(rs.getString(1));
                c.setCourseName(rs.getString(2));
                c.setCredit(rs.getInt(4));
                Study s = new Study();
                s.setStudent(student);
                s.setCourse(c);
                Date date= rs.getDate(3);
                // neu no chua hoc den mon nay -> startDate sau ngay hom nay -> Grade=-2
                if(date.after(Date.valueOf(LocalDate.now())))
                {
                    s.setGrade(-2);
                    s.setStatus(-2);
                }
                else
                {
                    //no dang hoc -> chua co diem tong ket -> Grade =-1
                    if(rs.getFloat("Grade")<0)
                    {
                        s.setGrade(-1);
                        s.setStatus(-1);
                    }
                    else 
                    {
                        s.setGrade(rs.getFloat("Grade"));
                        if(rs.getFloat("Grade")>=5) s.setStatus(1);
                        else s.setStatus(0);
                    }
                }
                studyList.add(s);
            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return studyList;
    }

    @Override
    public ArrayList<Study> list() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public Study get(int id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void insert(Study model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void update(Study model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(Study model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}
