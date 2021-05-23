package com.example.rent.commands;

import com.example.rent.DBException;
import com.example.rent.db.UserDao;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class BlockUnblockUserCommand implements Command {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {
        int userId = Integer.parseInt(request.getParameter("userId"));
        if (UserDao.blockUnblockUser(userId)) {
            return "result.jsp";
        }
        return "error.jsp";
    }
}
