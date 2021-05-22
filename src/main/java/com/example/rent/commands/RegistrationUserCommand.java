package com.example.rent.commands;

import com.example.rent.db.DBManager;
import com.example.rent.db.UserDao;
import com.example.rent.model.User;
import com.sun.istack.internal.logging.Logger;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import java.util.logging.Level;

public class RegistrationUserCommand implements Command {

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {
        response.setContentType("text/plain");
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String pass = request.getParameter("pass");
        User user = User.createUser(name, pass, email);
        if (UserDao.registerUser(user))
            return "result.jsp";
        else return "error.jsp";
    }
}
