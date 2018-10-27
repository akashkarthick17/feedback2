package com.list.servlet;

/**
 * Created by Akash on 04-09-2017.
 */
public class CreateYear {

  private  String degree,branch,section,subjectCode,staffName, subjectName,year,semtype;
   private double semester;


    public CreateYear(String degree, String branch, String section, String subjectCode, String staffName, String subjectName, String year, String semtype, double semester) {
        this.degree = degree;
        this.branch = branch;
        this.section = section;
        this.subjectCode = subjectCode;
        this.staffName = staffName;
        this.subjectName = subjectName;
        this.year = year;
        this.semtype = semtype;
        this.semester = semester;
    }

    public CreateYear() {
    }

    public String getDegree() {
        return degree;
    }

    public void setDegree(String degree) {
        this.degree = degree;
    }

    public String getBranch() {
        return branch;
    }

    public void setBranch(String branch) {
        this.branch = branch;
    }

    public String getSection() {
        return section;
    }

    public void setSection(String section) {
        this.section = section;
    }

    public String getSubjectCode() {
        return subjectCode;
    }

    public void setSubjectCode(String subjectCode) {
        this.subjectCode = subjectCode;
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

    public String getYear() {
        return year;
    }

    public void setYear(String year) {
        this.year = year;
    }

    public String getSemtype() {
        return semtype;
    }

    public void setSemtype(String semtype) {
        this.semtype = semtype;
    }

    public double getSemester() {
        return semester;
    }

    public void setSemester(double semester) {
        this.semester = semester;
    }
}
