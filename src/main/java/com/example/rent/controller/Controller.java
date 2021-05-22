package com.example.rent.controller;

import com.example.rent.DBException;
import com.example.rent.commands.Command;
import com.example.rent.commands.CommandContainer;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/Controller")
public class Controller extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String address = "error.jsp";
        String commandName = request.getParameter("command");
        Command command = CommandContainer.getCommand(commandName);
        try {
            address = command.execute(request, response);
        } catch (DBException e) {
            request.setAttribute("error", e);
            System.out.println(e.getMessage() + e.getStackTrace());
        }
        request.getRequestDispatcher(address).forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String address = "error.jsp";
        String commandName = request.getParameter("command");
        Command command = CommandContainer.getCommand(commandName);
        try {
            address = command.execute(request, response);
        } catch (DBException e) {
            request.getSession().setAttribute("error", e);
            System.out.println(e.getMessage() + e.getStackTrace());
        }
        if (request.getParameter("name") != null) {
            request.getSession().setAttribute("name", request.getParameter("name"));
        }
        request.getSession().setAttribute("command", request.getParameter("command"));
        response.sendRedirect(address);
    }
}
