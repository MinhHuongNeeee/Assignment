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
import model.Study;

/**
 *
 * @author minh huong
 */
public class StudyDBContext extends DBContext<Study> {

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

    public static void main(String[] args) {
        StudyDBContext sdb = new StudyDBContext();
        ArrayList<Study> listByUserName = sdb.getListByUserName("huonglmhe160632");
        for (Study study : listByUserName) {
            System.out.println(study.getSemester());
        }
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
