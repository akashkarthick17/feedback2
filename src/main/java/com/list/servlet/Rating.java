package com.list.servlet;

/**
 * Created by Akash on 11-09-2017.
 */
public class Rating {


   private int qno;
    private String question;
    private int sa,a,n,d,sd;
    private int total;
    private double rating;

    public Rating(int qno, String question, int sa, int a, int n, int d, int sd, int total, double rating) {
        this.qno = qno;
        this.question = question;
        this.sa = sa;
        this.a = a;
        this.n = n;
        this.d = d;
        this.sd = sd;
        this.total = total;
        this.rating = rating;
    }

    public Rating() {
    }

    public int getQno() {
        return qno;
    }

    public void setQno(int qno) {
        this.qno = qno;
    }

    public String getQuestion() {
        return question;
    }

    public void setQuestion(String question) {
        this.question = question;
    }

    public int getSa() {
        return sa;
    }

    public void setSa(int sa) {
        this.sa = sa;
    }

    public int getA() {
        return a;
    }

    public void setA(int a) {
        this.a = a;
    }

    public int getN() {
        return n;
    }

    public void setN(int n) {
        this.n = n;
    }

    public int getD() {
        return d;
    }

    public void setD(int d) {
        this.d = d;
    }

    public int getSd() {
        return sd;
    }

    public void setSd(int sd) {
        this.sd = sd;
    }

    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
    }

    public double getRating() {
        return rating;
    }

    public void setRating(int rating) {
        this.rating = rating;
    }
}
