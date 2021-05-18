package com.example.rent.commands;

import com.example.rent.db.DBManager;
import com.example.rent.db.entity.User;
import com.sun.istack.internal.logging.Logger;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import java.util.logging.Level;

public class RegistrationUserCommand implements Command {
    private static final Logger LOGGER = Logger.getLogger(RegistrationUserCommand.class);

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {
        response.setContentType("text/plain");
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String pass = request.getParameter("pass");

        String sql = "INSERT INTO users(login, password, email, role_id) VALUES(?,?,?, 2)";
        try (Connection conn = DBManager.getInstance().getConnection();
             PreparedStatement preparedStatement = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            preparedStatement.setString(1, name);
            preparedStatement.setString(2, pass);
            preparedStatement.setString(3, email);
            preparedStatement.executeUpdate();
            return "result.jsp";
//            try (ResultSet generatedKeys = preparedStatement.getGeneratedKeys()) {
//                if (generatedKeys.next()) {
////                    user.setId(generatedKeys.getInt(1));
//                }
//            }
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, e.getMessage());
            return "User was not registered";
        }
    }
}
