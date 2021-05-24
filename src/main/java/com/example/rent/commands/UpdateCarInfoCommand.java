package com.example.rent.commands;

import com.example.rent.DBException;
import com.example.rent.db.CarDao;
import com.example.rent.model.Car;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.IOException;
import java.io.InputStream;
import java.math.BigDecimal;

public class UpdateCarInfoCommand implements Command {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws DBException {
        int id = Integer.parseInt(request.getParameter("id"));
        String brand = request.getParameter("brand");
        String model = request.getParameter("model");
        int carClass = Integer.parseInt(request.getParameter("carclass"));
        BigDecimal price = BigDecimal.valueOf(Double.valueOf(request.getParameter("price")));
//        InputStream photo = null;
//        try {
//            Part filePart = request.getPart("photo");
//            if (filePart != null) {
//                photo = filePart.getInputStream();
//            }
//        } catch (ServletException e) {
//            e.printStackTrace();
//        } catch (IOException e) {
//            e.printStackTrace();
//        }
        Car car = Car.createCar(brand, model, carClass, price);
        car.setId(id);
//        car.setPhoto(photo);
        if (CarDao.updateCar(car)) {
            return "result.jsp";
        } else {
            return "error.jsp";
        }
    }
}
