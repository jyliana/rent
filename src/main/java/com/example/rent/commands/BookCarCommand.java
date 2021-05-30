package com.example.rent.commands;

import com.example.rent.DBException;
import com.example.rent.db.CarDao;
import com.example.rent.db.OrderDao;
import com.example.rent.db.UserDao;
import com.example.rent.model.Order;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.math.BigDecimal;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.Period;

public class BookCarCommand implements Command {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws DBException {
        response.setContentType("text/plain");
        int carId = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        int userId = UserDao.findUserIdByName(name);
        String passDetails = request.getParameter("passDetails");
        String driver = request.getParameter("hasDriver");
        boolean hasDriver = false;
        if (driver != null && driver.equals("on")) {
            hasDriver = true;
        }
        String startDate = request.getParameter("startDate");
        String endDate = request.getParameter("endDate");
        Date sDate = null;
        Date eDate = null;
        try {
            sDate = new Date(new SimpleDateFormat("MMM dd, yyyy").parse(startDate).getTime());
            eDate = new Date(new SimpleDateFormat("MMM dd, yyyy").parse(endDate).getTime());

        } catch (ParseException e) {
            e.printStackTrace();
        }
        int days = 0;
        if (sDate != null && eDate != null) {
            days = Period.between(sDate.toLocalDate(), eDate.toLocalDate()).getDays();
        }
        BigDecimal totalSum = CarDao.getCarById(carId).getPriceForDay().multiply(BigDecimal.valueOf(days));
        Order order = Order.createOrder(carId, userId, passDetails, hasDriver, sDate, eDate);
        order.setDays(days);
        order.setTotalSum(totalSum);
        if (OrderDao.createOrder(order))
            return "orders.jsp";
        else return "error.jsp";
    }
}
