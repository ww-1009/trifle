package com.ls.common;

public class Lesson {

    public int getL_id() {
        return l_id;
    }

    public void setL_id(int l_id) {
        this.l_id = l_id;
    }

    public String getL_name() {
        return l_name;
    }

    public void setL_name(String l_name) {
        this.l_name = l_name;
    }

    public String getL_teacher_name() {
        return l_teacher_name;
    }

    public void setL_teacher_name(String l_teacher_name) {
        this.l_teacher_name = l_teacher_name;
    }
    private int l_id;

    @Override
    public String toString() {
        return "Lesson{" +
                "l_id=" + l_id +
                ", l_name='" + l_name + '\'' +
                ", l_teacher_name='" + l_teacher_name + '\'' +
                '}';
    }

    private String l_name;
    private String l_teacher_name;
}
