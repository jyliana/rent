package com.example.rent.db;

import com.example.rent.commands.RegistrationUserCommand;
import com.example.rent.model.User;
import com.sun.istack.internal.logging.Logger;

import java.sql.*;
import java.util.logging.Level;

public class UserDao {
    private static final Logger LOGGER = Logger.getLogger(RegistrationUserCommand.class);

    public static boolean registerUser(User user) {
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

    public static boolean findUser(User user) {
        String sql = "SELECT login FROM users WHERE login=? and password=?";
        String name = "";
        try (Connection conn = DBManager.getInstance().getConnection();
             PreparedStatement preparedStatement = conn.prepareStatement(sql)) {
            preparedStatement.setString(1, user.getLogin());
            preparedStatement.setString(2, user.getPass());

            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                if (resultSet.next()) {
                    name = resultSet.getString(1);
                }
//                    return "There was a problem logging in. Check your email and password or create an account.";
            }
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, e.getMessage());
//            return "User was not registered";
        }
        return name.equals(user.getLogin());
    }
}
