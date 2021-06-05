package com.ls.common;

import com.ls.DButils.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import com.ls.common.Score;
public class ScoreHandle {
    public void Insert(Score score)
    {
        Connection con = DBConnection.getConnection();
        try {
            String sql ="INSERT INTO c values(?,?,?,?,?,?)";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, score.getId());
            ps.setString(2, score.getName());
            ps.setString(3,score.getAccuracy());
            ps.setString(4,score.getPrecision());
            ps.setString(5,score.getRecall());
            ps.setString(6,score.getF1());
            ps.executeUpdate();

        }
        catch (SQLException e)
        {
            e.printStackTrace();
        }
    }
}
