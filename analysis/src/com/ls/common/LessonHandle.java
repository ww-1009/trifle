package com.ls.common;

import com.ls.DButils.DBConnection;

import java.sql.*;
import java.util.ArrayList;

public class LessonHandle {
    public ArrayList<Lesson> getAllLesson() {
        Connection con = DBConnection.getConnection();
        Statement stmt;
        ResultSet rs;
        ArrayList<Lesson> lessons = new ArrayList<Lesson>();
        try{
            stmt = con.createStatement();
            rs = stmt.executeQuery("select * from lesson");
            while (rs.next())
            {
                Lesson lesson = new Lesson();
                lesson.setL_id(rs.getInt("l_id"));
                lesson.setL_name(rs.getString("l_name"));
                lesson.setL_teacher_name(rs.getString("l_teacher_name"));
                lessons.add(lesson);
            }
        }
        catch (SQLException e){
            e.printStackTrace();
        }
        return lessons;
    }
    public void addLesson(Lesson lesson){
        Connection con = DBConnection.getConnection();
        try {
            String sql ="INSERT INTO lesson values(?,?,?)";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, lesson.getL_id());
            ps.setString(2, lesson.getL_name());
            ps.setString(3,lesson.getL_teacher_name());
            ps.executeUpdate();

        }
        catch (SQLException e)
        {
            e.printStackTrace();
        }
    }
    public void deleteLesson(int l_id){
        try{
            Connection con = DBConnection.getConnection();
            String sql = "DELETE FROM lesson where l_id = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, l_id);
            ps.executeUpdate();
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
    }
    public void updateLesson(Lesson lesson)
    {
        try{
            Connection con = DBConnection.getConnection();
            String sql = "UPDATE lesson SET l_name=?,l_teacher_name=? where l_id=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, lesson.getL_name());
            ps.setString(2, lesson.getL_teacher_name());
            ps.setInt(3, lesson.getL_id());
            ps.executeUpdate();

        }
        catch (Exception e){
            e.printStackTrace();
        }
    }
    public Lesson getLesson(int l_id)
    {
        Lesson lesson = null;
        try{
            Connection con = DBConnection.getConnection();
            String sql = "SELECT * FROM lesson where l_id=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1,l_id);
            ResultSet rs = ps.executeQuery();
            while (rs.next())
            {
                lesson = new Lesson();
                lesson.setL_id(rs.getInt("l_id"));
                lesson.setL_name(rs.getString("l_name"));
                lesson.setL_teacher_name(rs.getString("l_teacher_name"));
            }
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }

        return lesson;
    }

}
