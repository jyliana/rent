package com.example.rent.commands;

import com.example.rent.db.DBManager;
import com.example.rent.db.UserDao;
import com.example.rent.model.Role;
import com.example.rent.model.User;
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
        User user = new User();
        user.setLogin(name);
        user.setPass(pass);
        if (UserDao.findUser(user) != null) {
            if (Role.getRole(user).equals(Role.ADMIN))
                return "adminpanel.jsp";
            else
                return "main.jsp";
        }
        return "error.jsp";
    }
}
