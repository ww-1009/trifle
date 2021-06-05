package com.ls.common;
import java.sql.*;
import com.ls.DButils.DBConnection;
import com.ls.common.Teacher;
import java.util.ArrayList;

public class TeacherHandle {
    public ArrayList<Teacher> getAllTeacher() {
        Connection con = DBConnection.getConnection();
        Statement stmt;
        ResultSet rs;
        ArrayList<Teacher> teachers = new ArrayList<Teacher>();
        try{
            stmt = con.createStatement();
            rs = stmt.executeQuery("select * from teacher");
            while (rs.next())
            {
                Teacher teacher = new Teacher();
                teacher.setId(rs.getInt("id"));
                teacher.setName(rs.getString("name"));
                teacher.setTel(rs.getInt("tel"));
                teachers.add(teacher);
            }
        }
        catch (SQLException e){
            e.printStackTrace();
        }
        return teachers;
        //返回user列表
    }
    public void addTeacher(Teacher teacher){
        Connection con = DBConnection.getConnection();
        try {
            String sql ="INSERT INTO teacher values(?,?,?)";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, teacher.getId());
            ps.setString(2, teacher.getName());
            ps.setInt(3,teacher.getTel());
            ps.executeUpdate();

        }
        catch (SQLException e)
        {
            e.printStackTrace();
        }
    }
    public void deleteTeacher(int id){
        try{
            Connection con = DBConnection.getConnection();
            String sql = "DELETE FROM teacher where id = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            ps.executeUpdate();
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
    }
    public void updateTeacher(Teacher teacher)
    {
        try{
            Connection con = DBConnection.getConnection();
            String sql = "UPDATE teacher SET name=?,tel=? where id=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, teacher.getName());
            ps.setInt(2, teacher.getTel());
            ps.setInt(3,teacher.getId());
            ps.executeUpdate();

        }
        catch (Exception e){
            e.printStackTrace();
        }
    }
    public Teacher getTeacher(int id)
    {
        Teacher teacher = null;
        try{
            Connection con = DBConnection.getConnection();
            String sql = "SELECT * FROM teacher where id=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1,id);
            ResultSet rs = ps.executeQuery();
            while (rs.next())
            {
                teacher = new Teacher();
                teacher .setId(rs.getInt("id"));
                teacher .setName(rs.getString("name"));
                teacher .setTel(rs.getInt("tel"));
            }
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }

        return teacher;
    }
    public static void main(String[] args) {
        UserHandle userhandle  = new UserHandle();
        ArrayList<User> users  = userhandle.getAllUsers();
        for (Object obj : users) {
            System.out.println(obj);
        }

    }
}
