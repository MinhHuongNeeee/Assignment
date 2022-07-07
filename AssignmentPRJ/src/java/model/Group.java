/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.ArrayList;

/**
 *
 * @author minh huong
 */
public class Group {
    private String groupName;
    private String courseID;
    private Account teacher; // mỗi (lớp-môn) ứng với 1 teacher duy nhất
    private ArrayList<Account> listStudent; // moi (lop-mon) co 1 danh sach sv

    public ArrayList<Account> getListStudent() {
        return listStudent;
    }

    public void setListStudent(ArrayList<Account> listStudent) {
        this.listStudent = listStudent;
    }

    
    public String getGroupName() {
        return groupName;
    }

    public void setGroupName(String groupName) {
        this.groupName = groupName;
    }

    public String getCourseID() {
        return courseID;
    }

    public void setCourseID(String courseID) {
        this.courseID = courseID;
    }

    public Account getTeacher() {
        return teacher;
    }

    public void setTeacher(Account teacher) {
        this.teacher = teacher;
    }




}
