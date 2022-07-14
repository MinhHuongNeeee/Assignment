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
import model.Feature;
import model.Role;

/**
 *
 * @author minh huong
 */
public class AccountDBContext extends DBContext<Account> {

    public ArrayList<Account> listStudentInGroup(String groupName, String CourseID) {
        ArrayList<Account> accounts = new ArrayList<>();
        try {
            String sql = "select a.rid, a.displayName,a.userName,a.address,a.dob,a.gender from Account_Group ag inner join Account a\n"
                    + "on a.userName=ag.userName\n"
                    + "where GroupName=? and courseID=?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, groupName);
            stm.setString(2, CourseID);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Role r = new Role();
                r.setId(1);
                Account account = new Account();
                account.setUsername(rs.getString("userName"));
                account.setDisplayName(rs.getString("displayname"));
                account.setDob(rs.getDate("dob"));
                account.setAddress(rs.getString("address"));
                account.setGender(rs.getBoolean("gender"));
                account.setRole(r);
                accounts.add(account);

            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return accounts;
    }

    public static void main(String[] args) {
        AccountDBContext adb = new AccountDBContext();
        Account a = adb.getAccountByUsernamePassword("sonnt5", "12345");
        System.out.println(a.toString());
    }

    public Account getAccountByUsernamePassword(String username, String password) {
        try {
            String sql = "SELECT userName,displayName,dob,address,gender,a.rid,r.rname, ISNULL(f.fid,-1) as fid,f.fname,f.url \n"
                    + "FROM Account a\n"
                    + "left join [Role] r on r.rid=a.rid\n"
                    + "left join Role_Feature rf ON rf.rid = r.rid\n"
                    + "LEFT JOIN Feature f ON f.fid = rf.fid\n"
                    + "WHERE username = ? AND password = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, username);
            stm.setString(2, password);
            ResultSet rs = stm.executeQuery();
            Account account = null;
            Role currentRole = new Role();
            currentRole.setId(-1);
            Feature currentFeature = new Feature();
            currentFeature.setId(-1);
            while (rs.next()) {
                if (account == null) {
                    account = new Account();
                    account.setUsername(rs.getString("username"));
                    account.setDisplayName(rs.getString("displayname"));
                    account.setDob(rs.getDate("dob"));
                    account.setAddress(rs.getString("address"));
                }
                int rid = rs.getInt("rid");
                if (rid != -1) {
                    if (currentRole.getId() != rid) {
                        currentRole = new Role();
                        currentRole.setId(rid);
                        currentRole.setName(rs.getString("rname"));
                        account.setRole(currentRole);
                    }
                }
                int fid = rs.getInt("fid");
                if (fid != -1) {
                    if (currentFeature.getId() != fid) {
                        currentFeature = new Feature();
                        currentFeature.setId(fid);
                        currentFeature.setName(rs.getString("fname"));
                        currentFeature.setUrl(rs.getString("url"));
                        currentRole.getFeatures().add(currentFeature);
                    }
                }

            }
            return account;
        } catch (SQLException ex) {
            Logger.getLogger(AccountDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public Account getAccountByUsername(String username) {
        try {
            String sql = "SELECT userName,displayName,dob,address,gender,rid FROM Account\n"
                    + "WHERE username = ? ";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, username);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                Role r = new Role();
                r.setId(rs.getInt("rid"));
                Account account = new Account();
                account.setUsername(rs.getString("userName"));
                account.setDisplayName(rs.getString("displayname"));
                account.setDob(rs.getDate("dob"));
                account.setAddress(rs.getString("address"));
                account.setGender(rs.getBoolean("gender"));
                account.setRole(r);
                return account;
            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    @Override
    public ArrayList<Account> list() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public Account get(int id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void insert(Account model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void update(Account model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(Account model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}
