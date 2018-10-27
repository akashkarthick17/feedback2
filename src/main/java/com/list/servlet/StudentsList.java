package com.list.servlet;

public class StudentsList {

    String reg,branch,sem,sec;


    public StudentsList(String reg, String branch, String sem, String sec) {
        this.reg = reg;
        this.branch = branch;
        this.sem = sem;
        this.sec = sec;
    }

    public StudentsList(String reg) {
        this.reg = reg;
    }

    public String getReg() {
        return reg;
    }

    public void setReg(String reg) {
        this.reg = reg;
    }

    public String getBranch() {
        return branch;
    }

    public void setBranch(String branch) {
        this.branch = branch;
    }

    public String getSem() {
        return sem;
    }

    public void setSem(String sem) {
        this.sem = sem;
    }

    public String getSec() {
        return sec;
    }

    public void setSec(String sec) {
        this.sec = sec;
    }
}
