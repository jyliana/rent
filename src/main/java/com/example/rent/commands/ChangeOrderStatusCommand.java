package com.example.rent.commands;

import com.example.rent.DBException;
import com.example.rent.db.OrderDao;
import com.example.rent.db.UserDao;
import com.example.rent.model.Bill;
import com.example.rent.model.Order;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ChangeOrderStatusCommand implements Command {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws DBException {
        response.setContentType("text/plain");
        int orderId = Integer.parseInt(request.getParameter("orderId"));
        int statusId = Integer.parseInt(request.getParameter("status"));
        String comment = request.getParameter("comment");

        Order order = new Order();
        order.setId(orderId);
        order.setStatusId(statusId);
        order.setComment(comment);

        if (OrderDao.updateOrder(order)) {
//            int days = OrderDao.returnAmountOfBookedDays(order);
//            if (days > 0) {
////                Bill bill = Bill.createBill(orderId, days, );
//            }
            return "mngOrders.jsp";
        } else {
            return "error.jsp";
        }
    }
}
