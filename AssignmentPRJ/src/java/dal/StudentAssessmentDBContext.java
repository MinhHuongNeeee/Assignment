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

/**
 *
 * @author minh huong
 */
public class StudentAssessmentDBContext extends DBContext<Student_Assessment> {

    // show bang diem than phan 1 group sv
    public ArrayList<Student_Assessment> listAssessmentOfGroup(String courseID, String groupName) {
        ArrayList<Student_Assessment> listValueScore = new ArrayList<>();
        try {

            String sql = "select said,sa.username,displayName,sa.courseID,sa.gradeCategory,weight,[value],(weight*value)/100 as total, [index] from student_assessment sa\n"
                    + "                    inner join Account_Group ag\n"
                    + "                    on sa.username= ag.username and sa.courseID=ag.courseID\n"
                    + "                    inner join Account aa on aa.userName=sa.userName\n"
                    + "                    inner join Assessment a on a.courseID=sa.courseID and a.gradeCategory=sa.gradeCategory\n"
                    + "                    where sa.courseID= ? and groupName=?\n"
                    + "                    order by sa.username asc,[index] asc";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, courseID);
            stm.setString(2, groupName);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Account student = new Account();
                student.setDisplayName(rs.getString(3));
                student.setUsername(rs.getString(2));
                Course c = new Course();
                c.setCourseID(courseID);
                Assessment ass = new Assessment();
                ass.setCourse(c);
                ass.setGradeCategory(rs.getString("gradeCategory"));
                ass.setWeight(rs.getFloat("Weight"));
                Student_Assessment sta = new Student_Assessment();
                sta.setAssessment(ass);
                sta.setStudent(student);
                sta.setSaid(rs.getInt(1));
                sta.setValue(rs.getFloat("value"));
                sta.setTotal(rs.getFloat("total"));
                listValueScore.add(sta);
            }
        } catch (SQLException ex) {
            Logger.getLogger(StudyDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return listValueScore;
    }

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

    }

    @Override
    public ArrayList<Student_Assessment> list() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public Student_Assessment get(int id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void insert(Student_Assessment model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void update(Student_Assessment model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(Student_Assessment model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public void saveChanges(ArrayList<Student_Assessment> exams) {
        try {
            //connection.setAutoCommit(false);
            for (Student_Assessment exam : exams) {
                System.out.println(exam.getValue());
                //UPDATE
                if (exam.getValue() != -100) {
                    String sql_update = "UPDATE Student_Assessment\n"
                            + "   SET [value] = ?\n"
                            + " WHERE said=?";
                    PreparedStatement stm = connection.prepareStatement(sql_update);
                    stm.setInt(2, exam.getSaid());
                    stm.setFloat(1, exam.getValue());
                    stm.executeUpdate();
                }
            }
            //connection.commit();
        } catch (SQLException ex) {
            System.out.println(ex);
        }

    }

}
