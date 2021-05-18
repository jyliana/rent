package com.example.rent.db.dao;

import com.example.rent.db.DBManager;
import com.example.rent.db.entity.User;
import com.sun.istack.internal.logging.Logger;

import java.sql.*;
import java.util.logging.Level;

public class UserDao {
    private static final Logger LOGGER = Logger.getLogger(UserDao.class);

    public static boolean register(User user) {
        String sql = "INSERT INTO users(login, password, email, role_id) VALUES(?,?,?, 2)";
        try (Connection conn = DBManager.getInstance().getConnection();
             PreparedStatement preparedStatement = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            preparedStatement.setString(1, user.getLogin());
            preparedStatement.setString(2, user.getPass());
            preparedStatement.setString(3, user.getEmail());
            preparedStatement.executeUpdate();
            try (ResultSet generatedKeys = preparedStatement.getGeneratedKeys()) {
                if (generatedKeys.next()) {
                    user.setId(generatedKeys.getInt(1));
                }
            }
            return true;
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, e.getMessage());
            return false;
        }
    }
}
