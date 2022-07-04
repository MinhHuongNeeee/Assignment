/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
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

    // show diem thanh phan 1 mon 
    public ArrayList<Student_Assessment> listValueScore(String userName, String courseID) {
        ArrayList<Student_Assessment> listValueScore = new ArrayList<>();
        try {

            String sql = "select Assessment.gradeCategory,Weight,isnull(value,-1) as value ,[index],isnull(SUM(Weight*value)/100,-1) as total \n"
                    + "                    from Assessment left join Student_Assessment\n"
                    + "                    on Assessment.courseID= Student_Assessment.courseID and Assessment.gradeCategory=Student_Assessment.gradeCategory\n"
                    + "                    where Assessment.courseID=? and username=?\n"
                    + "                    group by Assessment.courseID,Assessment.gradeCategory,Weight,value,[index]\n"
                    + "                    order by [index] asc";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, courseID);
            stm.setString(2, userName);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Account student = new Account();
                student.setUsername(userName);
                Course c = new Course();
                c.setCourseID(courseID);
                Assessment ass = new Assessment();
                ass.setCourse(c);
                ass.setGradeCategory(rs.getString("gradeCategory"));
                ass.setWeight(rs.getFloat("Weight"));
                Student_Assessment sta = new Student_Assessment();
                sta.setAssessment(ass);
                sta.setValue(rs.getFloat("value"));
                sta.setTotal(rs.getFloat("total"));

                listValueScore.add(sta);
            }
        } catch (SQLException ex) {
            Logger.getLogger(StudyDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return listValueScore;
    }

    public static void main(String[] args) {
        StudyDBContext db = new StudyDBContext();
        ArrayList<Student_Assessment> listValueScore = db.listValueScore("huonglmhe160632", "PRJ301");
        for (Student_Assessment s : listValueScore) {
            System.out.println(s.getAssessment().getGradeCategory() + " " + s.getValue());
        }

    }

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
            Logger.getLogger(LoginDBContext.class.getName()).log(Level.SEVERE, null, ex);
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
