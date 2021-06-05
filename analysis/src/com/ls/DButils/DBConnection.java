package com.ls.DButils;
import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {
    private static final String DBDRIVER = "com.mysql.jdbc.Driver";
    private static final String DBURL = "jdbc:mysql://127.0.0.1:3306/analysis?useUnicode=true&characterEncoding=utf-8";
    private static final String DBUSER = "root";
    private static final String DBPASSWORD = "1234";

    public static Connection getConnection() {
        Connection conn = null;
        try {
            Class.forName(DBDRIVER);
            conn = DriverManager.getConnection(DBURL, DBUSER, DBPASSWORD);
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return conn;
    }

}
