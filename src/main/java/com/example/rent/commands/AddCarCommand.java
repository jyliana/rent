package com.example.rent.commands;

import com.example.rent.db.CarDao;
import com.example.rent.model.Car;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.math.BigDecimal;

public class AddCarCommand implements Command {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {
        String brand = request.getParameter("brand");
        String model = request.getParameter("model");
        int carClass = Integer.parseInt(request.getParameter("carclass"));
        BigDecimal price = BigDecimal.valueOf(Double.valueOf(request.getParameter("price")));
        Car car = Car.createCar(brand, model, carClass, price);
        if (CarDao.registerCar(car))
            return "result.jsp";
        else return "error.jsp";
    }
}
