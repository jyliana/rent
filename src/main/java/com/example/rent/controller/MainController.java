package com.example.rent.controller;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/MainController")
public class MainController extends HttpServlet {
    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws IOException {
        System.out.println("Hi#service");
        response.setContentType("text/plain");
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String pass = request.getParameter("pass");

        PrintWriter out = response.getWriter();
        out.append("name: " + name + System.lineSeparator())
                .append("email: " + email + System.lineSeparator())
                .append("pass: " + pass + System.lineSeparator());

    }
//    @Override
//    public void service(ServletRequest request, ServletResponse response) throws IOException {
//        System.out.println("Hi#service");
//        response.setContentType("text/plain");
//        String name = request.getParameter("name");
//        String email = request.getParameter("email");
//        String pass = request.getParameter("pass");
//
//        PrintWriter out = response.getWriter();
//        out.append("name: " + name + System.lineSeparator())
//                .append("email: " + email + System.lineSeparator())
//                .append("pass: " + pass + System.lineSeparator());
//

//        PrintWriter out = response.getWriter();
//        out.append("Get parameters: " + System.lineSeparator());
//        Enumeration<String> names = request.getParameterNames();
//
//        while (names.hasMoreElements()) {
//            String name = names.nextElement();
//            out.append(name + " = " + request.getParameter(name) + System.lineSeparator());
//        }


//        // (1) obtain an input info!
//        String name = request.getParameter("login");
//
//        // (2) generate a result
//        String greeting = "Hi, " + name;
//        // (3) save a result as an attribute in a appropriate container
//        request.setAttribute("responce", greeting);
//
//        // (4) forwarded to view layer (MVC)
//        request.getRequestDispatcher("result.jsp").forward(request, response);

//    }

    @Override
    public void destroy() {
        System.out.println("Hi#destroy");
    }
}
