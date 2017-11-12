package com.list.servlet;

/**
 * Created by Akash on 05-09-2017.
 */
public class Staff {

    private String staffName,  subjectName, subjectCode;

    public Staff(String staffName, String subjectName, String subjectCode) {
        this.staffName = staffName;
        this.subjectName = subjectName;
        this.subjectCode = subjectCode;
    }

    public Staff() {
    }

    public String getStaffName() {
        return staffName;
    }

    public void setStaffName(String staffName) {
        this.staffName = staffName;
    }

    public String getSubjectName() {
        return subjectName;
    }

    public void setSubjectName(String subjectName) {
        this.subjectName = subjectName;
    }

    public String getSubjectCode() {
        return subjectCode;
    }

    public void setSubjectCode(String subjectCode) {
        this.subjectCode = subjectCode;
    }
}
