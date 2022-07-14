/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.Date;
import java.util.ArrayList;

/**
 *
 * @author minh huong
 */
public class Account {
    private String username;
    private String password;
    private String displayName;
    private Role role;
    private boolean gender;
    private Date dob;
    private String address;
    private ArrayList<Group> listGroup; // moi sv thuoc ve nhieu (lop-mon)

    
    public ArrayList<Group> getListGroup() {
        return listGroup;
    }

    public void setListGroup(ArrayList<Group> listGroup) {
        this.listGroup = listGroup;
    }
    
    public Role getRole() {
        return role;
    }

    public boolean isGender() {
        return gender;
    }

    public void setGender(boolean gender) {
        this.gender = gender;
    }

    public Date getDob() {
        return dob;
    }

    public void setDob(Date dob) {
        this.dob = dob;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public void setRole(Role role) {
        this.role = role;
    }
    
    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getDisplayName() {
        return displayName;
    }

    public void setDisplayName(String displayName) {
        this.displayName = displayName;
    }

    @Override
    public String toString() {
        return "Account{" + "username=" + username + ", password=" + password + ", displayName=" + displayName + ", role=" + role + ", gender=" + gender + ", dob=" + dob + ", address=" + address + ", listGroup=" + listGroup + '}';
    }
    
    
}
