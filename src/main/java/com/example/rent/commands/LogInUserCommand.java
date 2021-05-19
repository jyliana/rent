package com.example.rent.commands;

import com.example.rent.db.DBManager;
import com.sun.istack.internal.logging.Logger;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import java.util.logging.Level;

public class LogInUserCommand implements Command {
    private static final Logger LOGGER = Logger.getLogger(RegistrationUserCommand.class);

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {
        response.setContentType("text/plain");
        String name = request.getParameter("name");
        String pass = request.getParameter("pass");

        String sql = "SELECT login FROM users WHERE login=? and password=?";
        try (Connection conn = DBManager.getInstance().getConnection();
             PreparedStatement preparedStatement = conn.prepareStatement(sql)) {
            preparedStatement.setString(1, name);
            preparedStatement.setString(2, pass);
            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                if (resultSet.next()) {
                    name = resultSet.getString(1);
                    return "Hi, " + name + "! You have been successfully authorized.";
                } else
                    return "There was a problem logging in. Check your email and password or create an account.";
            }
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, e.getMessage());
            return "User was not registered";
        }
    }
}

