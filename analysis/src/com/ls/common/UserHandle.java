package com.ls.common;
import java.sql.*;
import com.ls.DButils.DBConnection;
import com.ls.common.User;
import java.util.ArrayList;

public class UserHandle {
    public ArrayList<User> getAllUsers() {
        Connection con = DBConnection.getConnection();
        Statement stmt;
        ResultSet rs;
        ArrayList<User> users = new ArrayList<User>();
        try {
            stmt = con.createStatement();
            rs = stmt.executeQuery("select * from user");
            while (rs.next()) {
                User user = new User();
                user.setId(rs.getInt("id"));
                user.setName(rs.getString("name"));
                user.setPassword(rs.getString("password"));
                user.setTel(rs.getInt("tel"));
                user.setCategory(rs.getString("category"));
                users.add(user);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return users;
        //返回user列表
    }

    public void addUser(User user) {
        Connection con = DBConnection.getConnection();
        try {
            String sql = "INSERT INTO user values(?,?,?,?,?)";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, user.getId());
            ps.setString(2, user.getName());
            ps.setString(3, user.getPassword());
            ps.setInt(4, user.getTel());
            ps.setString(5, user.getCategory());
            ps.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void deleteUser(int id) {
        try {
            Connection con = DBConnection.getConnection();
            String sql = "DELETE FROM user where id = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void updateUser(User user) {
        try {
            Connection con = DBConnection.getConnection();
            String sql = "UPDATE user SET name=?,password=?,tel=?,category=? where id=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, user.getName());
            ps.setString(2, user.getPassword());
            ps.setInt(3, user.getTel());
            ps.setString(4, user.getCategory());
            ps.setInt(5, user.getId());
            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public User getUser(int id) {
        User user = null;
        try {
            Connection con = DBConnection.getConnection();
            String sql = "SELECT * FROM user where id=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                user = new User();
                user.setId(rs.getInt("id"));
                user.setName(rs.getString("name"));
                user.setPassword(rs.getString("password"));
                user.setTel(rs.getInt("tel"));
                user.setCategory(rs.getString("category"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return user;
    }

    public User getUserByName(String name, String pwd) {
        User user = null;
        try {
            Connection con = DBConnection.getConnection();
            String sql = "SELECT * FROM user where name=? and password=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, name);
            ps.setString(2, pwd);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                user = new User();
                user.setId(rs.getInt("id"));
                user.setName(rs.getString("name"));
                user.setPassword(rs.getString("password"));
                user.setTel(rs.getInt("tel"));
                user.setCategory(rs.getString("category"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return user;
    }

    public boolean login(User user) {
        Connection con = DBConnection.getConnection();
        PreparedStatement ps;
        ResultSet rs;
        boolean result = false;
        try {
            String sql = "select * from user where name=? and password=?";
            ps = con.prepareStatement(sql);
            ps.setString(1, user.getName());
            ps.setString(2, user.getPassword());
            rs = ps.executeQuery();
            result = rs.next();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }


    public static void main(String[] args) {
        UserHandle userhandle = new UserHandle();
        ArrayList<User> users = userhandle.getAllUsers();
        for (Object obj : users) {
            System.out.println(obj);
        }

    }
}



