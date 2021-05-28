package com.example.rent.commands;

import com.example.rent.DBException;
import com.example.rent.db.CarDao;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class BookCarCommand implements Command {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws DBException {
        int id = Integer.parseInt(request.getParameter("id"));


//        if (CarDao.registerCar(car)) {
//            return "result.jsp";
//        } else {
            return "error.jsp";
//        }
    }
}
