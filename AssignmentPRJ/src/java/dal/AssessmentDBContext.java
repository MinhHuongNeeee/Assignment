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

/**
 *
 * @author minh huong
 */
public class AssessmentDBContext extends DBContext<Assessment> {

    public ArrayList<Assessment> listAssByCourseID(String courseID) {
        ArrayList<Assessment> assessments = new ArrayList<>();
        String sql = "select gradeCategory, Weight,[index] from Assessment\n"
                + "where courseID=?\n"
                + "order by [index] asc";
        try {
            PreparedStatement stm= connection.prepareStatement(sql);
            stm.setString(1, courseID);
            ResultSet rs= stm.executeQuery();
            while(rs.next())
            {
                Assessment a= new Assessment();
                a.setGradeCategory(rs.getString("gradeCategory"));
                a.setWeight(rs.getFloat("Weight"));
                assessments.add(a);
            }
        } catch (SQLException ex) {
            Logger.getLogger(AssessmentDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return assessments;
    }
    public static void main(String[] args) {
        AssessmentDBContext adb= new AssessmentDBContext();
        ArrayList<Assessment> listAssByCourseID = adb.listAssByCourseID("PRJ301");
        for (Assessment assessment : listAssByCourseID) {
            System.out.println(assessment.getGradeCategory());
        }
    }
    @Override
    public ArrayList<Assessment> list() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public Assessment get(int id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void insert(Assessment model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void update(Assessment model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(Assessment model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}
