package com.ls.common;
import java.sql.*;
import com.ls.DButils.DBConnection;
import com.ls.common.Student;
import java.util.ArrayList;

public class StudentHandle {
    public ArrayList<Student> getAllStudent() {
        Connection con = DBConnection.getConnection();
        Statement stmt;
        ResultSet rs;
        ArrayList<Student> students = new ArrayList<Student>();
        try{
            stmt = con.createStatement();
            rs = stmt.executeQuery("select * from student");
            while (rs.next())
            {
                Student student = new Student();
                student.setId(rs.getInt("id"));
                student.setName(rs.getString("name"));
                student.setTel(rs.getInt("tel"));
                students.add(student);
            }
        }
        catch (SQLException e){
            e.printStackTrace();
        }
        return students;
    }
    public void addStudent(Student student){
        Connection con = DBConnection.getConnection();
        try {
            String sql ="INSERT INTO student values(?,?,?)";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, student.getId());
            ps.setString(2, student.getName());
            ps.setInt(3,student.getTel());
            ps.executeUpdate();

        }
        catch (SQLException e)
        {
            e.printStackTrace();
        }
    }
    public void deleteStudent(int id){
        try{
            Connection con = DBConnection.getConnection();
            String sql = "DELETE FROM student where id = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            ps.executeUpdate();
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
    }
    public void updateStudent(Student student)
    {
        try{
            Connection con = DBConnection.getConnection();
            String sql = "UPDATE student SET name=?,tel=? where id=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, student.getName());
            ps.setInt(2, student.getTel());
            ps.setInt(3,student.getId());
            ps.executeUpdate();

        }
        catch (Exception e){
            e.printStackTrace();
        }
    }
    public Student getStudent(int id)
    {
        Student student = null;
        try{
            Connection con = DBConnection.getConnection();
            String sql = "SELECT * FROM student where id=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1,id);
            ResultSet rs = ps.executeQuery();
            while (rs.next())
            {
                student = new Student();
                student.setId(rs.getInt("id"));
                student.setName(rs.getString("name"));
                student.setTel(rs.getInt("tel"));
            }
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }

        return student;
    }


    public static void main(String[] args) {
        UserHandle userhandle  = new UserHandle();
        ArrayList<User> users  = userhandle.getAllUsers();
        for (Object obj : users) {
            System.out.println(obj);
        }

    }
}
