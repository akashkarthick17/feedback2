package com.list.servlet;

/**
 * Created by Akash on 10-09-2017.
 */
public class FeedbackQuestion {

    private int qno;
    private String question;

    public FeedbackQuestion(int qno, String question) {
        this.qno = qno;
        this.question = question;
    }

    public FeedbackQuestion() {
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
}
