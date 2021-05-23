package com.example.rent.db;

import com.example.rent.commands.RegistrationUserCommand;
import com.example.rent.model.User;
import com.sun.istack.internal.logging.Logger;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;

public class UserDao {
    private static final Logger LOGGER = Logger.getLogger(RegistrationUserCommand.class);

    public static boolean registerUser(User user) {
        String sql = "INSERT INTO users(login, password, email, role_id, is_blocked) VALUES(?,?,?,?,?)";
        try (Connection conn = DBManager.getInstance().getConnection();
             PreparedStatement preparedStatement = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            preparedStatement.setString(1, user.getLogin());
            preparedStatement.setString(2, user.getPass());
            preparedStatement.setString(3, user.getEmail());
            preparedStatement.setInt(4, user.getRoleId());
            preparedStatement.setBoolean(5, user.getIsBlocked());
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

    public static User findUser(User user) {
        String sql = "SELECT * FROM users WHERE login=? and password=?";
        try (Connection conn = DBManager.getInstance().getConnection();
             PreparedStatement preparedStatement = conn.prepareStatement(sql)) {
            preparedStatement.setString(1, user.getLogin());
            preparedStatement.setString(2, user.getPass());
            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                if (resultSet.next()) {
                    user.setRoleId(resultSet.getInt("role_id"));
                    return user;
                }
            }
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, e.getMessage());
        }
        return null;
    }

    public static boolean blockUnblockUser(int userId) {
        String sql = "UPDATE users SET is_blocked = NOT is_blocked where id=?";
        try (Connection conn = DBManager.getInstance().getConnection();
             PreparedStatement preparedStatement = conn.prepareStatement(sql)) {
            preparedStatement.setInt(1, userId);
            int result = preparedStatement.executeUpdate();
            {
                if (result == 1) {
                    return true;
                }
            }
            return true;
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, e.getMessage());
        }
        return false;
    }

    public static List<User> findAllUsers() {
        List<User> users = new ArrayList<>();
        String sql = "SELECT * FROM users ORDER BY id";
        try (Connection conn = DBManager.getInstance().getConnection();
             PreparedStatement preparedStatement = conn.prepareStatement(sql)) {
            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                while (resultSet.next()) {
                    User user = new User();
                    user.setId(resultSet.getInt(1));
                    user.setLogin(resultSet.getString(2));
                    user.setPass(resultSet.getString(3));
                    user.setEmail(resultSet.getString(4));
                    user.setRoleId(resultSet.getInt(5));
                    user.setIsBlocked(resultSet.getBoolean(6));
                    users.add(user);
                }
            }
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, e.getMessage());
        }
        return users;
    }

    public static boolean appointManager(int userId) {
        String sql = "UPDATE users set role_id=1 where id=?";
        try (Connection conn = DBManager.getInstance().getConnection();
             PreparedStatement preparedStatement = conn.prepareStatement(sql)) {
            preparedStatement.setInt(1, userId);
            if (preparedStatement.executeUpdate() > 0) {
                return true;
            }
            return true;
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, e.getMessage());
        }
        return false;
    }
}
