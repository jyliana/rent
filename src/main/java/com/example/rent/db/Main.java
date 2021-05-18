package com.example.rent.db;

import com.example.rent.db.dao.UserDao;
import com.example.rent.db.entity.User;
import com.sun.istack.internal.logging.Logger;
import jdk.nashorn.internal.objects.NativeMath;

import java.sql.*;
import java.util.logging.Level;

public class Main {


    public static void main(String[] args) throws SQLException {
        DBManager dbManager = DBManager.getInstance();
        dbManager.getConnection();
        User user = new User();
        String sql = "INSERT INTO users(login, password, email, role_id) VALUES(?,?,?, 2)";
        try (Connection conn = DBManager.getInstance().getConnection();
             PreparedStatement preparedStatement = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            preparedStatement.setString(1, "Fia");
            preparedStatement.setString(2, "psfsfwef23");
            preparedStatement.setString(3, "ua@gmail.com");
            preparedStatement.executeUpdate();
            try (ResultSet generatedKeys = preparedStatement.getGeneratedKeys()) {
                if (generatedKeys.next()) {
                    user.setId(generatedKeys.getInt(1));
                }
            }
            user.toString();

        } catch (SQLException e) {
            System.out.println("no " + e.getMessage());

        }


//        if (dbManager.getConnection().isClosed())
//            System.out.println("not connected");
//        else
//            System.out.println("connected");
    }
}
